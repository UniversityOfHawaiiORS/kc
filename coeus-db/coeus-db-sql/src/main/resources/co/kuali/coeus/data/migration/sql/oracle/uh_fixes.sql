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
	,'http://www.ors.hawaii.edu/index.php/apply/83-quick-links/302','URL for User Guides help button','A','KC');

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.helpbutton.routing.url',sys_guid(),1,'CONFG'
	,'https://apps.ors.hawaii.edu/routing','URL for Routing help button','A','KC');

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.helpbutton.delegation.url',sys_guid(),1,'CONFG'
	,'https://apps.ors.hawaii.edu/delegation','URL for Delegation help button','A','KC');

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.helpbutton.award.status.url',sys_guid(),1,'CONFG'
	,'https://cognos.reports.hawaii.edu/ibmcognos/cgi-bin/cognos.cgi?b_action=cognosViewer\&ui.action=run\&ui.object=%2fcontent%2ffolder%5b%40name%3d%27ORS%27%5d%2ffolder%5b%40name%3d%27ORS%20Reports%20Authenticated%27%5d%2freport%5b%40name%3d%27Award%20Status%20DWH%27%5d\&ui.name=Award%20Status%20DWH\&run.outputFormat=\&run.prompt=true','URL for Award Status help button','A','KC');


-- KC-1183 Incident report - Do you want to receive future approval requests?
update KREW_RTE_NODE_CFG_PARM_T
set val = '<requests name="PeopleFlows"><activationType>R</activationType><rulesEngine executorClass="org.kuali.coeus.propdev.impl.core.ProposalDevelopmentRulesEngineExecutorImpl"/></requests>'
where VAL like '%ProposalDevelopmentRulesEngineExecutorImpl%';

-- KC-955 Remove menu items from Researcher and Unit Tab
-- Add Central admin tab view permission
insert into krim_perm_t (PERM_ID,OBJ_ID,VER_NBR,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND)
                 values (KRIM_PERM_ID_S.nextval, sys_guid(), 1, 1,'KC-GEN','uh-view-central-admin-tab','View Central Admin Tab in KRAD portal permission','Y');

-- Add Central admin tab view permission to role
insert into krim_role_perm_t (role_perm_id, OBJ_ID,VER_NBR,ROLE_ID,PERM_ID,ACTV_IND)
                  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1,
                  (select role_id from krim_role_t where ROLE_NM = 'UH Central Admin Tab Viewer'),
                  (select perm_id from krim_perm_t where nm = 'uh-view-central-admin-tab'),
                  'Y');

-- Add System Admin Portal permission
insert into krim_perm_t (PERM_ID,OBJ_ID,VER_NBR,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND)
                 values (KRIM_PERM_ID_S.nextval, sys_guid(), 1, 1,'KC-GEN','uh-view-sys-admin-portal','View sys admin krns portal from KRAD portal permission','Y');

-- Add System Admin Portal permission to role
insert into krim_role_perm_t (role_perm_id, OBJ_ID,VER_NBR,ROLE_ID,PERM_ID,ACTV_IND)
                  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1,
                  (select role_id from krim_role_t where ROLE_NM = 'Technical Administrator'),
                  (select perm_id from krim_perm_t where nm = 'uh-view-sys-admin-portal'),
                  'Y');

-- Add View All Links permission
insert into krim_perm_t (PERM_ID,OBJ_ID,VER_NBR,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND)
                 values (KRIM_PERM_ID_S.nextval, sys_guid(), 1, 1,'KC-GEN','uh-view-all-links','View irb links in KRAD portal permission','Y');

-- Add View All Links permission to role
insert into krim_role_perm_t (role_perm_id, OBJ_ID,VER_NBR,ROLE_ID,PERM_ID,ACTV_IND)
                  values (KRIM_ROLE_PERM_ID_S.nextval, sys_guid(), 1,
                  (select role_id from krim_role_t where ROLE_NM = 'UH VIEW ALL LINKS ROLE'),
                  (select perm_id from krim_perm_t where nm = 'uh-view-all-links'),
                  'Y');

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.change.my.info.helpline.url',sys_guid(),1,'CONFG'
	,'http://www.ors.hawaii.edu/helpline/index.php?/Tickets/Submit/RenderForm/4','URL for Change My Info on Researcher Tab','A','KC');
-- KC-955 End

-- KC-1174 notifyAggregatorWhenAllCertificationsComplete parameter does not appear to be working
update KRCR_PARM_T
set val = 'N' where PARM_NM = 'KEY_PERSON_CERTIFICATION_SELF_CERTIFY_ONLY';
-- KC-1174 End


insert into narrative_type (narrative_type_code, description, system_generated, allow_multiple, narrative_type_group, update_timestamp, update_user, ver_nbr, obj_id)
values ('996', 'FCOI Disclosure', 'N', 'Y', 'O', sysdate, user, 1, sys_guid());

-- KC-988 STE When assigning Personnel to Budget
update KRCR_PARM_T
set val = 'AA000' where PARM_NM = 'budgetPersonDefaultJobCode';
-- KC-988 End

-- KC-1048 Certification Questionnaire Rule behavior only works on save
-- While fixing this JIRA I discovered that this question was not displaying correctly because this flag was set wrong
update QUESTIONNAIRE_QUESTIONS set condition_flag = 'Y' where questionnaire_questions_id = '300002';
-- KC-1048 END

-- KC-1269 Change wording of questions to fit with new section names
update QUESTION set question = replace(question,'Special Review','Compliance') where question like '%Special Review%';
update QUESTION set question = replace(question,'Abstracts and Attachments','Attachments') where question like '%Abstracts and Attachments%';
-- KC-1269 END

-- KC-1281 Add data validation warning for keywords field
insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh_enable_keyword_audit',sys_guid(),1,'CONFG' ,'W','enable Keyword audit rule. N=No, W=Warn, E=Error','A','KC');

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh_keyword_audit_message',sys_guid(),1,'CONFG' ,'You have not included any Keywords for this proposal, keywords help UH identify possible field experts for future funding opportunities.','Keyword Audit message if enabled.','A','KC');
-- KC-1281 END

-- KC-1088 Remove unnecessary PD permissions
insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh_pd_access_roles',sys_guid(),1,'CONFG' ,':KC12106:KC12103:KC12104:KC12105:','Roll Ids of roles to be offered by PD Access Page for granting to individuals while document is in saved mode.','A','KC');
-- KC-1088 END

-- KC-1294 Make PD Help dropdown configurable
insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.pd.help.proposal.details.url',sys_guid(),1,'CONFG' ,'https://mygrant.ors.hawaii.edu:443/mygrant/static/help/default.htm?turl=Documents/proposaldetails.htm',
        'PD Proposal Details Help Page URL.','A','KC');

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.pd.help.s2s.opportunity.search.url',sys_guid(),1,'CONFG' ,'https://mygrant.ors.hawaii.edu:443/mygrant/static/help/default.htm?turl=Documents/s2sopportunitysearch.htm',
        'PD S2S Opportunity Search Help Page URL.','A','KC');

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.pd.help.delivery.information.url',sys_guid(),1,'CONFG' ,'https://mygrant.ors.hawaii.edu:443/mygrant/static/help/default.htm?turl=Documents/deliveryinfo.htm',
        'PD Delivery Information Help Page URL.','A','KC');

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.pd.help.sponsor.and.program.information.url',sys_guid(),1,'CONFG' ,'https://mygrant.ors.hawaii.edu:443/mygrant/static/help/default.htm?turl=Documents/sponsorprograminformation.htm',
        'PD Sponsor and Program Information Help Page URL.','A','KC');

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.pd.help.organization.and.location.url',sys_guid(),1,'CONFG' ,'https://mygrant.ors.hawaii.edu:443/mygrant/static/help/default.htm?turl=Documents/organizationslocations.htm',
        'PD Organization and Location Help Page URL.','A','KC');

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.pd.help.personnel.url',sys_guid(),1,'CONFG' ,'https://mygrant.ors.hawaii.edu:443/mygrant/static/help/default.htm?turl=Documents/keypersonnel.htm',
        'PD Key Personnel Help Page URL.','A','KC');

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.pd.help.credit.allocation.url',sys_guid(),1,'CONFG' ,'https://mygrant.ors.hawaii.edu:443/mygrant/static/help/default.htm?turl=Documents/creditallocation.htm',
        'PD Credit Allocation Help Page URL.','A','KC');

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.pd.help.compliance.url',sys_guid(),1,'CONFG' ,'https://mygrant.ors.hawaii.edu:443/mygrant/static/help/default.htm?turl=Documents/compliance1.htm',
        'PD Compliance Help Page URL.','A','KC');

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.pd.help.attachments.url',sys_guid(),1,'CONFG' ,'https://mygrant.ors.hawaii.edu:443/mygrant/static/help/default.htm?turl=Documents/proposalattachmentstab.htm',
        'PD Attachments Help Page URL.','A','KC');

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.pd.help.questionnaire.url',sys_guid(),1,'CONFG' ,'https://mygrant.ors.hawaii.edu:443/mygrant/static/help/default.htm?turl=Documents/questionnaire.htm',
        'PD Questionnaire Help Page URL.','A','KC');

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.pd.help.budget.url',sys_guid(),1,'CONFG' ,'https://mygrant.ors.hawaii.edu:443/mygrant/static/help/default.htm?turl=Documents/budgetversionsscreen.htm',
        'PD Budget Help Page URL.','A','KC');

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.pd.help.access.url',sys_guid(),1,'CONFG' ,'https://mygrant.ors.hawaii.edu:443/mygrant/static/help/default.htm?turl=Documents/access1.htm',
        'PD Access Help Page URL.','A','KC');

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.pd.help.supplemental.information.url',sys_guid(),1,'CONFG' ,'https://mygrant.ors.hawaii.edu:443/mygrant/static/help/default.htm?turl=Documents/supplementalinformation.htm',
        'PD Supplemental Information Help Page URL.','A','KC');

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.pd.help.summary.submit.url',sys_guid(),1,'CONFG' ,'https://mygrant.ors.hawaii.edu:443/mygrant/static/help/default.htm?turl=Documents/summarysubmit.htm',
        'PD Summary Submit Help Page URL.','A','KC');

insert into KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
values ('KC-GEN','All','uh.pd.help.glossary.of.terms.url',sys_guid(),1,'CONFG' ,'https://mygrant.ors.hawaii.edu:443/mygrant/static/help/default.htm?turl=Documents/glossaryofterms.htm',
        'PD Glossary of Terms Help Page URL.','A','KC');
-- KC-1294 END

commit;
