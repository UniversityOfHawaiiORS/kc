set define off
set sqlblanklines on
spool uh_fixes.log

-- KC-972 STE When accessing Questionnaire after Unrecovered F&A is added to the budget
update question set lookup_class = 'org.kuali.coeus.common.framework.custom.arg.ArgValueLookup'
where lookup_class = 'org.kuali.kra.bo.ArgValueLookup';

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','JASPER_REPORTS_ENABLED',sys_guid(),1,'CONFG','N','Determines whether the Jasper Report links are available from the KC Application Header. Y to enable, N to disable','A','KC');

commit;
