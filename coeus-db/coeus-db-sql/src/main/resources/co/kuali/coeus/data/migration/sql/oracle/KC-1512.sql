set define off
set sqlblanklines on

spool KC-1512.sql.log

update subaward_amount_info
set modification_type_code = transaction_type_code;

drop table SUBAWARD_TRANSACTION_TYPE;

ALTER TABLE subaward_amount_info
  DROP COLUMN TRANSACTION_TYPE_CODE;


