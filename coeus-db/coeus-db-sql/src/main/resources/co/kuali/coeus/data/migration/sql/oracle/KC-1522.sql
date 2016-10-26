-- KC-1500 Validation rule to stop PD from submitting to workflow

SET DEFINE OFF
SET SQLBLANKLINES ON

spool KC-1522.sql.log

INSERT INTO KRCR_PARM_T
       (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD,
        VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
VALUES ('KC-GEN','All','uh_pd_questionnaire_require_specific_answer',sys_guid(),1,'CONFG',
        '12115:Y:97',
        'Comma separated list of questionId:requiredAnswer:displayLength config values.  When set question with questionId will require requiredAnswer(Y/N) during submit validation.  If it fails the error message will display the first displayLength characters of the question in the error message.  Example 12115:Y:96 question with ID 12115 will require Yes answer or display 96 chars of the question in an error message asking to correction.  If displayLength is longer then text length the words "starting with" are removed from the error message and the entire question is contained in the error message.',
        'A','KC');

