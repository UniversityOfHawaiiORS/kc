insert into KRIM_TYP_T (KIM_TYP_ID, OBJ_ID, VER_NBR, NM, SRVC_NM, ACTV_IND, NMSPC_CD)
values
(krim_typ_id_s.nextval, sys_guid(), 1, 'Derived Role - MPI', '{http://kc.kuali.org/core/v5_0}proposalRoleTypeService', 'Y', 'KC-WKFLW');

insert into krim_role_t 
(ROLE_ID, OBJ_ID,VER_NBR,ROLE_NM,NMSPC_CD,DESC_TXT,KIM_TYP_ID,ACTV_IND,LAST_UPDT_DT) 
values 
(krim_role_id_s.nextval,sys_guid(), 1, 'MPI', 'KC-WKFLW', 'Proposal Multi PI', (select kim_typ_id from  KRIM_TYP_T where nm = 'Derived Role - MPI'), 'Y', sysdate);

insert into krim_role_rsp_t 
(ROLE_RSP_ID,OBJ_ID,VER_NBR,ROLE_ID,RSP_ID,ACTV_IND)
values
(krim_role_rsp_id_s.nextval,sys_guid(),'1', (select role_id from krim_role_t where role_nm = 'MPI'), (select rsp_id from krim_rsp_t where nm = 'Proposal Persons Approval'), 'Y');

insert into krim_role_rsp_actn_t (role_rsp_actn_id,OBJ_ID,ver_nbr,actn_typ_cd,priority_nbr,actn_plcy_cd,role_mbr_id,role_rsp_id, frc_actn)
values
(krim_role_rsp_actn_id_s.nextval,sys_guid(),1,'A',1,'A','*',(select role_rsp_id from krim_role_rsp_t 
                                                            where RSP_ID in (select rsp_id from krim_rsp_t 
                                                                             where nm = 'Proposal Persons Approval')
                                                                             and role_id = (select role_id from krim_role_t where role_nm = 'MPI')), 'N');