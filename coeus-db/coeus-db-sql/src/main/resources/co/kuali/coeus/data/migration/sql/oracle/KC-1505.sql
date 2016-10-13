set define off
set sqlblanklines on

spool KC-1505.sql.log

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh_award_project_push_transaction_type_codes',sys_guid(),1,'CONFG' ,'1,2,4,6,9,10,11,13,19','Comma delimited list of Award Transaction Type Codes that we want to have pushed to coi for possbile SFI disclosure reset example (1,2,4,6,9,10,11,13,19).','A','KC');
