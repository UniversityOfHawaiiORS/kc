
-- KC-1403 Allow Subaward F&A rate to accept greater than or equal to 100

spool KC-1403.sql.log

ALTER TABLE SUBAWARD MODIFY F_AND_A_RATE NUMBER(5, 2);
