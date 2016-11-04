-- KC-1496 Rename COI Disclosure Status for "Disclosure Not Required"

SET DEFINE OFF
SET SQLBLANKLINES ON

spool KC-1496.sql.log

INSERT INTO KRCR_PARM_T
       (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD,
        VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
VALUES ('KC-GEN','All','uh_coi_disclosure_in_progress_message',sys_guid(),1,'CONFG',
        'May need update upon submission',
        'Message to display for disclosure status when PD is in progress.  HTML links work in the message so links are allowed.  NOTE: if empty or parameter deleted the out of the box responce will be displayed.',
        'A','KC');

INSERT INTO KRCR_PARM_T
       (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD,
        VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
VALUES ('KC-GEN','All','uh_coi_disclosure_revisions_message',sys_guid(),1,'CONFG',
        'May need update upon submission',
        'Message to display for disclosure status when PD is in revisions requested status.  HTML links work in the message so links are allowed.  NOTE: if empty or parameter deleted the out of the box responce will be displayed.',
        'A','KC');

INSERT INTO KRCR_PARM_T
       (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD,
        VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
VALUES ('KC-GEN','All','uh_coi_disclosure_final_message',sys_guid(),1,'CONFG',
        'Go to your <a href="https://kcdev3.ors.hawaii.edu/coi" target="_blank"> COI Dashboard</a> to check status',
        'Message to display for disclosure status when PD is final.  HTML links work in the message so links are allowed.  NOTE: if empty or parameter deleted the out of the box responce will be displayed.',
        'A','KC');

