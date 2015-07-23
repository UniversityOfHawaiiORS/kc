set define off
set escape on
set sqlblanklines on
spool uh_fixes.log

-- KC-972 STE When accessing Questionnaire after Unrecovered F&A is added to the budget
update question set lookup_class = 'org.kuali.coeus.common.framework.custom.arg.ArgValueLookup'
where lookup_class = 'org.kuali.kra.bo.ArgValueLookup';

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','JASPER_REPORTS_ENABLED',sys_guid(),1,'CONFG','N','Determines whether the Jasper Report links are available from the KC Application Header. Y to enable, N to disable','A','KC');


-- Added new help screen parameters
insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.helpbutton.add.performance.site.url',sys_guid(),1,'CONFG'
	,'http://www.ors.hawaii.edu/helpline/index.php?/Tickets/Submit/RenderForm/7','URL for Add Performance Site help button','A','KC');

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.helpbutton.add.sponsor.url',sys_guid(),1,'CONFG'
	,'http://www.ors.hawaii.edu/helpline/index.php?/Tickets/Submit/RenderForm/5','URL for Add Sponsor help button','A','KC');

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.helpbutton.helpline.request.url',sys_guid(),1,'CONFG'
	,'http://www.ors.hawaii.edu/helpline/index.php?/Tickets/Submit/RenderForm/4','URL for ORS Helpline Request button','A','KC');

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.helpbutton.user.guides.url',sys_guid(),1,'CONFG'
	,'http://www.ors.hawaii.edu/','URL for User Guides help button','A','KC');

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.helpbutton.routing.url',sys_guid(),1,'CONFG'
	,'https://kcdev.ors.hawaii.edu/apps/routing','URL for Routing help button','A','KC');

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.helpbutton.delegation.url',sys_guid(),1,'CONFG'
	,'https://kcdev.ors.hawaii.edu/apps/delegation','URL for Delegation help button','A','KC');

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.helpbutton.award.status.url',sys_guid(),1,'CONFG'
	,'https://cognos.reports.hawaii.edu/ibmcognos/cgi-bin/cognos.cgi?b_action=cognosViewer\&ui.action=run\&ui.object=%2fcontent%2ffolder%5b%40name%3d%27ORS%27%5d%2ffolder%5b%40name%3d%27ORS%20Reports%20Authenticated%27%5d%2freport%5b%40name%3d%27Award%20Status%20DWH%27%5d\&ui.name=Award%20Status%20DWH\&run.outputFormat=\&run.prompt=true','URL for Award Status help button','A','KC');

commit;
