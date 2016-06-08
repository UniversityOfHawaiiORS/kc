
-- KC-1447 Extend Federal Award Project Description field in Subaward to 4000 character length

spool KC-1447.sql.log

ALTER TABLE SUBAWARD MODIFY FED_AWARD_PROJ_DESC VARCHAR2(4000 CHAR);
