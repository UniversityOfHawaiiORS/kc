set define off
set sqlblanklines on
spool uh_fixes.log

-- KC-972 STE When accessing Questionnaire after Unrecovered F&A is added to the budget
update question set lookup_class = 'org.kuali.coeus.common.framework.custom.arg.ArgValueLookup'
where lookup_class = 'org.kuali.kra.bo.ArgValueLookup';

commit;
