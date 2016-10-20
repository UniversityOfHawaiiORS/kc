-- KC-1500 Validation rule to stop PD from submitting to workflow

SET DEFINE OFF
SET SQLBLANKLINES ON

spool KC-1500.sql.log

INSERT INTO KRCR_PARM_T
       (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD,
        VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
VALUES ('KC-GEN','All','uh_pd_key_person_certification_must_be_yes_question_ids',sys_guid(),1,'CONFG',
        '298280',
        'Comma separated list of QUESTION Table QUESTION_REF_ID whose question must be answered with "Yes" to submit the proposal.',
        'A','KC');

