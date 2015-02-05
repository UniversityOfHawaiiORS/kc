--
-- Kuali Coeus, a comprehensive research administration system for higher education.
-- 
-- Copyright 2005-2015 Kuali, Inc.
-- 
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Affero General Public License as
-- published by the Free Software Foundation, either version 3 of the
-- License, or (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Affero General Public License for more details.
-- 
-- You should have received a copy of the GNU Affero General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--

INSERT INTO KRIM_ROLE_T (ROLE_ID,NMSPC_CD,ROLE_NM,DESC_TXT,KIM_TYP_ID,ACTV_IND,LAST_UPDT_DT,VER_NBR,OBJ_ID)
VALUES (KRIM_ROLE_ID_BS_S.NEXTVAL,'KC-UNT','Modify all IACUC Protocols','Modify all IACUC Protocols',
(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'UnitHierarchy'),
'Y',sysdate,1,sys_guid())
/
Insert into KRIM_PERM_T (PERM_ID,NMSPC_CD,NM,DESC_TXT,PERM_TMPL_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_PERM_ID_BS_S.NEXTVAL,'KC-IACUC','Create Any IACUC Amendment','Create Amendments on any IACUC Protocol',
(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KC-IDM' AND NM = 'Perform Document Action'),'Y',1,SYS_GUID())
/
Insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL,KRIM_ROLE_ID_BS_S.currval,KRIM_PERM_ID_BS_S.CURRVAL,'Y',1,SYS_GUID())
/
Insert into KRIM_PERM_T (PERM_ID,NMSPC_CD,NM,DESC_TXT,PERM_TMPL_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_PERM_ID_BS_S.NEXTVAL,'KC-IACUC','Create Any IACUC Renewal','Create renewals for any IACUC Protocol',
(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KC-IDM' AND NM = 'Perform Document Action'),'Y',1,SYS_GUID())
/
Insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL,KRIM_ROLE_ID_BS_S.currval,KRIM_PERM_ID_BS_S.CURRVAL,'Y',1,SYS_GUID())
/
Insert into KRIM_PERM_T (PERM_ID,NMSPC_CD,NM,DESC_TXT,PERM_TMPL_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_PERM_ID_BS_S.NEXTVAL,'KC-IACUC','Create Any IACUC Renewal with Amendment','Create Renewal with Amendment for any IACUC Protocol',
(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KC-IDM' AND NM = 'Perform Document Action'),'Y',1,SYS_GUID())
/
Insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL,KRIM_ROLE_ID_BS_S.currval,KRIM_PERM_ID_BS_S.CURRVAL,'Y',1,SYS_GUID())
/
Insert into KRIM_PERM_T (PERM_ID,NMSPC_CD,NM,DESC_TXT,PERM_TMPL_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_PERM_ID_BS_S.NEXTVAL,'KC-IACUC','Submit Any IACUC Protocol','Submit Any IACUC Protocol',
(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KC-IDM' AND NM = 'Perform Document Action'),'Y',1,SYS_GUID())
/
Insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL,KRIM_ROLE_ID_BS_S.currval,KRIM_PERM_ID_BS_S.CURRVAL,'Y',1,SYS_GUID())
/
Insert into KRIM_PERM_T (PERM_ID,NMSPC_CD,NM,DESC_TXT,PERM_TMPL_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_PERM_ID_BS_S.NEXTVAL,'KC-IACUC','Review IACUC Protocol','Review IACUC Protocol',
(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KC-IDM' AND NM = 'Perform Document Action'),'Y',1,SYS_GUID())
/
Insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL,KRIM_ROLE_ID_BS_S.currval,KRIM_PERM_ID_BS_S.CURRVAL,'Y',1,SYS_GUID())
/
Insert into KRIM_PERM_T (PERM_ID,NMSPC_CD,NM,DESC_TXT,PERM_TMPL_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_PERM_ID_BS_S.NEXTVAL,'KC-IACUC','IACUC Administrative Corrections','Perform Administrative Corrections on IACUC Protocols',
(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KC-IDM' AND NM = 'Perform Document Action'),'Y',1,SYS_GUID())
/
Insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL,KRIM_ROLE_ID_BS_S.currval,KRIM_PERM_ID_BS_S.CURRVAL,'Y',1,SYS_GUID())
/
Insert into KRIM_PERM_T (PERM_ID,NMSPC_CD,NM,DESC_TXT,PERM_TMPL_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_PERM_ID_BS_S.NEXTVAL,'KC-IACUC','Maintain IACUC Protocol Review Comments','Maintain IACUC Protocol Review Comments',
(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KC-IDM' AND NM = 'Edit Document Section'),'Y',1,SYS_GUID())
/
Insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL,KRIM_ROLE_ID_BS_S.currval,KRIM_PERM_ID_BS_S.CURRVAL,'Y',1,SYS_GUID())
/
Insert into KRIM_PERM_T (PERM_ID,NMSPC_CD,NM,DESC_TXT,PERM_TMPL_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_PERM_ID_BS_S.NEXTVAL,'KC-IACUC','Maintain IACUC Protocol Related Proj','Maintain IACUC Protocols link to award and proposal',
(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KC-IDM' AND NM = 'Edit Document Section'),'Y',1,SYS_GUID())
/
Insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL,KRIM_ROLE_ID_BS_S.currval,KRIM_PERM_ID_BS_S.CURRVAL,'Y',1,SYS_GUID())
/
Insert into KRIM_PERM_T (PERM_ID,NMSPC_CD,NM,DESC_TXT,PERM_TMPL_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_PERM_ID_BS_S.NEXTVAL,'KC-IACUC','Maintain Any IACUC Protocol Access','Maintain Any IACUC Protocol Access',
(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KC-IDM' AND NM = 'Edit Document Section'),'Y',1,SYS_GUID())
/
Insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL,KRIM_ROLE_ID_BS_S.currval,KRIM_PERM_ID_BS_S.CURRVAL,'Y',1,SYS_GUID())
/
Insert into KRIM_PERM_T (PERM_ID,NMSPC_CD,NM,DESC_TXT,PERM_TMPL_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_PERM_ID_BS_S.NEXTVAL,'KC-IACUC','Add Any IACUC Protocol Notes','Add Any IACUC Protocol Notes',
(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KC-IDM' AND NM = 'Edit Document Section'),'Y',1,SYS_GUID())
/
Insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL,KRIM_ROLE_ID_BS_S.currval,KRIM_PERM_ID_BS_S.CURRVAL,'Y',1,SYS_GUID())
/
Insert into KRIM_PERM_T (PERM_ID,NMSPC_CD,NM,DESC_TXT,PERM_TMPL_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_PERM_ID_BS_S.NEXTVAL,'KC-IACUC','Maintain IACUC Research Areas','Maintain IACUC Research Areas',
(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KC-IDM' AND NM = 'Edit Document Section'),'Y',1,SYS_GUID())
/
Insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL,KRIM_ROLE_ID_BS_S.currval,KRIM_PERM_ID_BS_S.CURRVAL,'Y',1,SYS_GUID())
/

INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR) 
    VALUES (KRIM_PERM_ID_BS_S.NEXTVAL,(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KC-IDM' AND NM = 'Perform Any Document Action'),'KC-IACUC','Perform IACUC Actions on Protocol','Perform any IRB action on a protocol submitted to a committee','Y',SYS_GUID(),1)
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_BS_S.NEXTVAL,KRIM_PERM_ID_BS_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Document Action'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'),'IacucProtocolDocument',SYS_GUID(),1)
/
Insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL,KRIM_ROLE_ID_BS_S.currval,KRIM_PERM_ID_BS_S.CURRVAL,'Y',1,SYS_GUID())
/
Insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-UNT' AND ROLE_NM = 'IACUC Administrator'),
KRIM_PERM_ID_BS_S.CURRVAL,'Y',1,SYS_GUID())
/
INSERT INTO KRIM_ROLE_T (ROLE_ID,NMSPC_CD,ROLE_NM,DESC_TXT,KIM_TYP_ID,ACTV_IND,LAST_UPDT_DT,VER_NBR,OBJ_ID)
VALUES (KRIM_ROLE_ID_BS_S.NEXTVAL,'KC-UNT','View all IACUC Protocols','View all IACUC Protocols',
(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'UnitHierarchy'),'Y',sysdate,1,sys_guid())
/
Insert into KRIM_PERM_T (PERM_ID,NMSPC_CD,NM,DESC_TXT,PERM_TMPL_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_PERM_ID_BS_S.NEXTVAL,'KC-IACUC','View Any IACUC Protocol','View Any IACUC Protocol',
(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KC-IDM' AND NM = 'Perform Document Action'),'Y',1,SYS_GUID())
/
Insert into KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL,KRIM_ROLE_ID_BS_S.currval,KRIM_PERM_ID_BS_S.CURRVAL,'Y',1,SYS_GUID())
/
-- delete any has no role associate with it
Insert into KRIM_PERM_T (PERM_ID,NMSPC_CD,NM,DESC_TXT,PERM_TMPL_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_PERM_ID_BS_S.NEXTVAL,'KC-IACUC','Delete Any IACUC Protocol','Delete Any IACUC Protocol',
(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KC-IDM' AND NM = 'Perform Document Action'),'Y',1,SYS_GUID())
/
-- delete iacuc protocol
Insert into KRIM_PERM_T (PERM_ID,NMSPC_CD,NM,DESC_TXT,PERM_TMPL_ID,ACTV_IND,VER_NBR,OBJ_ID)
VALUES (KRIM_PERM_ID_BS_S.NEXTVAL,'KC-IACUC','Delete IACUC Protocol','Delete IACUC Protocol',
(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KC-IDM' AND NM = 'Edit Document Section'),'Y',1,SYS_GUID())
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID, PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL, OBJ_ID) VALUES 
(KRIM_ATTR_DATA_ID_BS_S.NEXTVAL,KRIM_PERM_ID_BS_S.CURRVAL, 
    (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Document Section'),
    (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'sectionName'),
    'iacucProtocol', SYS_GUID())
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID, PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL, OBJ_ID) VALUES 
(KRIM_ATTR_DATA_ID_BS_S.NEXTVAL,KRIM_PERM_ID_BS_S.CURRVAL,
    (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Document Section'), 
    (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'), 
    'IacucProtocolDocument', SYS_GUID()
)
/
INSERT INTO KRIM_ROLE_T 
(ROLE_ID,NMSPC_CD,ROLE_NM,DESC_TXT,KIM_TYP_ID,ACTV_IND,LAST_UPDT_DT,VER_NBR,OBJ_ID)VALUES 
(KRIM_ROLE_ID_BS_S.NEXTVAL,'KC-IACUC','IACUC Protocol Deleter','IACUC Protocol Deleter',
    (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Unit'),
    'Y',sysdate,1,SYS_GUID())
/
INSERT INTO KRIM_ROLE_PERM_T 
(ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,VER_NBR,OBJ_ID) VALUES 
(KRIM_ROLE_PERM_ID_BS_S.NEXTVAL,KRIM_ROLE_ID_BS_S.CURRVAL,KRIM_PERM_ID_BS_S.CURRVAL,'Y',1,SYS_GUID())
/
INSERT INTO KRIM_ROLE_PERM_T 
(ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,VER_NBR,OBJ_ID) VALUES 
(KRIM_ROLE_PERM_ID_BS_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'IACUC Protocol Aggregator' AND NMSPC_CD='KC-IACUC'),
    KRIM_PERM_ID_BS_S.CURRVAL,'Y',1,SYS_GUID())
/
INSERT INTO KRIM_ROLE_PERM_T 
(ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,VER_NBR,OBJ_ID) VALUES 
(KRIM_ROLE_PERM_ID_BS_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'IACUC Administrator' AND NMSPC_CD='KC-UNT'),
    KRIM_PERM_ID_BS_S.CURRVAL,'Y',1,SYS_GUID())
/
-- corr template
INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR) 
    VALUES (KRIM_PERM_ID_BS_S.NEXTVAL,(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KR-NS' AND NM = 'Edit Document'),'KC-IACUC','Modify IACUC Correspondence Template',null,'Y',SYS_GUID(),1)
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_BS_S.NEXTVAL,KRIM_PERM_ID_BS_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Document Type (Permission)'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'),'ProtocolCorrespondenceTemplateMaintenanceDocument',SYS_GUID(),1)
/
INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR) 
    VALUES (KRIM_PERM_ID_BS_S.NEXTVAL,(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KR-NS' AND NM = 'Open Document'),'KC-IACUC','View IACUC Correspondence Template',null,'Y',SYS_GUID(),1)
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_BS_S.NEXTVAL,KRIM_PERM_ID_BS_S.CURRVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Document Type (Permission)'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'),'ProtocolCorrespondenceTemplateMaintenanceDocument',SYS_GUID(),1)
/
