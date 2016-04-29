set define off
set sqlblanklines on

spool KC-1363.sql.log

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','core_auth_users_group_name',sys_guid(),1,'CONFG'
        ,'UH KC Users','Group to be used to limit users pushed to Core Auth','A','KC');

