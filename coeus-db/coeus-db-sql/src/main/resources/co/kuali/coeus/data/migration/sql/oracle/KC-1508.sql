set define off
set sqlblanklines on

spool KC-1508.sql.log

INSERT INTO KRIM_GRP_T (GRP_ID,KIM_TYP_ID,NMSPC_CD,GRP_NM,GRP_DESC,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR)
    VALUES (KRIM_GRP_ID_S.NEXTVAL,1,'KC-GEN','UH COI Users','COI ONLY user, not needed for users with "UH KC Users" group','Y',SYSDATE,SYS_GUID(),1);


