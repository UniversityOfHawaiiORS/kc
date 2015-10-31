set define off
spool PopulatePrimaryUnitFromProposalCreatorRole.log

-- output count of rows with null as prmry_dept_cd Before Update
select 'BEFORE UPDATE NULL PRIMARY DEPT COUNT:' || count(*) from krim_entity_emp_info_t where PRMRY_DEPT_CD is null;

-- make backup of table we are adjusting in case something goes horribly wrong
create table krim_entity_emp_info_bk as select * from krim_entity_emp_info_t;

-- Make working table to run the update against.
create table UH_TMP_POPULATE_PRIMARY_UNIT as
select prncpl_id, max(creator_unit) PRMY_UNIT, max(entity_emp_id) as entity_emp_id  from 
(
select p.prncpl_id, p.prncpl_nm, a.attr_val CREATOR_UNIT, c.unit_name CREATOR_UNIT_NAME, i.PRMRY_DEPT_CD, u.unit_name PRIMARY_UNIT_NAME, i.entity_emp_id
from krim_role_t r,
     krim_role_mbr_t m,
     krim_role_mbr_attr_data_t a,
     krim_entity_emp_info_t i,
     krim_prncpl_t p,
     unit c,
     unit u
where r.role_nm = 'Proposal Creator'
  and r.role_id = m.role_id
  and m.role_mbr_id = a.role_mbr_id
  and m.mbr_id = p.prncpl_id
  and m.ACTV_TO_DT is null
  and p.prncpl_id = i.entity_id
  and i.prmry_ind = 'Y'
  and i.ACTV_IND = 'Y'
  and c.unit_number = a.attr_val
  and u.unit_number(+) = i.PRMRY_DEPT_CD
  and a.attr_val in ( select unit_number from 
                      (
                      select unit_number,unit_name, sys_connect_by_path(unit_number,'/') unit_path,sys_connect_by_path(unit_name,'->')  org_cart
                      from unit 
                      start with unit_number = '000001'
                      connect by prior unit_number = parent_unit_number
                      order by unit_path
                    )
                   )
   and (i.PRMRY_DEPT_CD is null and a.attr_val is not null)
order by 2,3,4,5
)
group by prncpl_id
having count(creator_unit) = 1 and count(entity_emp_id) = 1
;

-- output count of the working table.   Number of updates should match this count
select 'Working Table count:' || count(*) from UH_TMP_POPULATE_PRIMARY_UNIT;

-- Update the primary units based on the working table
update krim_entity_emp_info_t ei
set ei.PRMRY_DEPT_CD = (select prmy_unit from 
                        UH_TMP_POPULATE_PRIMARY_UNIT uh
                        where uh.ENTITY_EMP_ID = ei.ENTITY_EMP_ID)
where ENTITY_EMP_ID in (select ENTITY_EMP_ID from UH_TMP_POPULATE_PRIMARY_UNIT);

-- output count of rows with null as prmry_dept_cd After Update
select 'AFTER UPDATE NULL PRIMARY DEPT COUNT:' || count(*) from krim_entity_emp_info_t where PRMRY_DEPT_CD is null;

