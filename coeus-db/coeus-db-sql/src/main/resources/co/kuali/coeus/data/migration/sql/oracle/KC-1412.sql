-- KC-1412 Make Service Center ID a dropdown

SET DEFINE OFF
SET SQLBLANKLINES ON

spool KC-1412.sql.log

INSERT INTO KRCR_PARM_T
       (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD,
        VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
VALUES ('KC-GEN','All','uh_service_center_ids',sys_guid(),1,'CONFG',
        'MA:Manoa Service Center,MU:Maui Service Center,KA:Kakaako Service Center,HI:Hilo Service Center,WO:West Oahu Service Center',
        'The list of ID and Name of Service Centers. Used to populate the dropdown list in Subaward form. FORMAT::= <ID>:<NAME>{,<ID>:<NAME>} e.g. MA:Manoa Service Center,MU:Maui Service Center,KA:Kakaako Service Center',
        'A','KC');

