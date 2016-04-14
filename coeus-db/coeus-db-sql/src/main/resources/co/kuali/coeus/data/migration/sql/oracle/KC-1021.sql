set define off
set sqlblanklines on

spool KC-1021.sql.log

alter table subaward modify PURCHASE_ORDER_NUM varchar2(25);
