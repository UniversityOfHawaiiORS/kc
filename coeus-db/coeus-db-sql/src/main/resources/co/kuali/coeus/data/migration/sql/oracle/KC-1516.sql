-- KC-1516 Automate configurations in COI and Monolith for COI Implementation

SET DEFINE OFF
SET SQLBLANKLINES ON

spool KC-1516.sql.log

update KRCR_PARM_T
set val = 'Y'
where PARM_NM = 'ENABLE_DISCLOSURE_STATUS_FROM_COI_MODULE'
  and NMSPC_CD in ('KC-PD','KC-AWARD');
