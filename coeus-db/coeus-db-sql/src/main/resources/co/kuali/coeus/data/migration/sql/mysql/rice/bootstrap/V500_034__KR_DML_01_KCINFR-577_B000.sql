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

DELIMITER /
-- Correct workflow mistakes (reparent all Identity Management Document children)

DROP PROCEDURE IF EXISTS p
/
CREATE PROCEDURE p ()
BEGIN
    DECLARE docTypId VARCHAR(40);

    SELECT DOC_TYP_ID INTO docTypId FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'IdentityManagementDocument' AND VER_NBR = (SELECT MAX(VER_NBR) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'IdentityManagementDocument');
    UPDATE KREW_DOC_TYP_T SET PARNT_ID = docTypId WHERE DOC_TYP_NM = 'IdentityManagementGroupDocument' OR DOC_TYP_NM = 'IdentityManagementRoleDocument' OR DOC_TYP_NM = 'IdentityManagementGenericPermissionMaintenanceDocument';
END;
/
CALL p ()
/
DROP PROCEDURE IF EXISTS p
/

UPDATE KREW_DOC_TYP_T SET DOC_HDLR_URL = '${kim.url}/identityManagementRoleDocument.do?methodToCall=docHandler' WHERE DOC_TYP_NM = 'IdentityManagementRoleDocument'
/
UPDATE KREW_DOC_TYP_T SET DOC_HDLR_URL = '${kim.url}/identityManagementGroupDocument.do?methodToCall=docHandler' WHERE DOC_TYP_NM = 'IdentityManagementGroupDocument'
/
INSERT INTO KRIM_PERM_ID_S VALUES(NULL)
/

-- Add permissions for all children of RiceDocument

INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Initiate Document'),'KC-SYS','Create DocumentTypeDocument','Authorizes the initiation of Document Type Documents','Y',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_S),(SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Document Type (Permission)'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'),'DocumentTypeDocument',UUID(),1)
/
INSERT INTO KRIM_PERM_ID_S VALUES(NULL)
/

INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Initiate Document'),'KC-SYS','Create RoutingRuleDocument','Authorizes the initiation of Routing Rule Documents','Y',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_S),(SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Document Type (Permission)'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'),'RoutingRuleDocument',UUID(),1)
/
INSERT INTO KRIM_PERM_ID_S VALUES(NULL)
/

INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Initiate Document'),'KC-SYS','Create NamespaceMaintenanceDocument','Authorizes the initiation of Namespace Maintenance Documents','Y',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_S),(SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Document Type (Permission)'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'),'NamespaceMaintenanceDocument',UUID(),1)
/
INSERT INTO KRIM_PERM_ID_S VALUES(NULL)
/

INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Initiate Document'),'KC-SYS','Create ParameterTypeMaintenanceDocument','Authorizes the initiation of Parameter Type Maintenance Documents','Y',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_S),(SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Document Type (Permission)'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'),'ParameterTypeMaintenanceDocument',UUID(),1)
/
INSERT INTO KRIM_PERM_ID_S VALUES(NULL)
/

INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Initiate Document'),'KC-SYS','Create ParameterDetailTypeMaintenanceDocument','Authorizes the initiation of Parameter Detail Type Maintenance Documents','Y',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_S),(SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Document Type (Permission)'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'),'ParameterDetailTypeMaintenanceDocument',UUID(),1)
/
INSERT INTO KRIM_PERM_ID_S VALUES(NULL)
/

INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Initiate Document'),'KC-SYS','Create ParameterMaintenanceDocument','Authorizes the initiation of Parameter Maintenance Documents','Y',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_S),(SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Document Type (Permission)'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'),'ParameterMaintenanceDocument',UUID(),1)
/
INSERT INTO KRIM_PERM_ID_S VALUES(NULL)
/

INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Initiate Document'),'KC-SYS','Create RoutingRuleDelegationMaintenanceDocument','Authorizes the initiation of Routing Rule Delegation Maintenance Documents','Y',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_S),(SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Document Type (Permission)'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'),'RoutingRuleDelegationMaintenanceDocument',UUID(),1)
/
INSERT INTO KRIM_PERM_ID_S VALUES(NULL)
/

INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Initiate Document'),'KC-SYS','Create CampusMaintenanceDocument','Authorizes the initiation of Campus Maintenance Documents','Y',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_S),(SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Document Type (Permission)'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'),'CampusMaintenanceDocument',UUID(),1)
/
INSERT INTO KRIM_PERM_ID_S VALUES(NULL)
/

INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Initiate Document'),'KC-SYS','Create CampusTypeMaintenanceDocument','Authorizes the initiation of Campus Type Maintenance Documents','Y',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_S),(SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Document Type (Permission)'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'),'CampusTypeMaintenanceDocument',UUID(),1)
/
INSERT INTO KRIM_PERM_ID_S VALUES(NULL)
/

INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Initiate Document'),'KC-SYS','Create CountryMaintenanceDocument','Authorizes the initiation of Country Maintenance Documents','Y',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_S),(SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Document Type (Permission)'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'),'CountryMaintenanceDocument',UUID(),1)
/
INSERT INTO KRIM_PERM_ID_S VALUES(NULL)
/

INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Initiate Document'),'KC-SYS','Create CountyMaintenanceDocument','Authorizes the initiation of County Maintenance Documents','Y',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_S),(SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Document Type (Permission)'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'),'CountyMaintenanceDocument',UUID(),1)
/
INSERT INTO KRIM_PERM_ID_S VALUES(NULL)
/

INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Initiate Document'),'KC-SYS','Create PostalCodeMaintenanceDocument','Authorizes the initiation of Postal Code Maintenance Documents','Y',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_S),(SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Document Type (Permission)'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'),'PostalCodeMaintenanceDocument',UUID(),1)
/
INSERT INTO KRIM_PERM_ID_S VALUES(NULL)
/

INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Initiate Document'),'KC-SYS','Create StateMaintenanceDocument','Authorizes the initiation of State Maintenance Documents','Y',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_S),(SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Document Type (Permission)'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'),'StateMaintenanceDocument',UUID(),1)
/
INSERT INTO KRIM_PERM_ID_S VALUES(NULL)
/

INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Initiate Document'),'KC-SYS','Create IdentityManagementDocument','Authorizes the initiation of Identity Management Documents','Y',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_S),(SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Document Type (Permission)'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'),'IdentityManagementDocument',UUID(),1)
/
INSERT INTO KRIM_PERM_ID_S VALUES(NULL)
/

INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Initiate Document'),'KC-SYS','Create AgendaMaintenanceDocument','Authorizes the initiation of Agenda Maintenance Documents','Y',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_S),(SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Document Type (Permission)'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'),'AgendaMaintenanceDocument',UUID(),1)
/
INSERT INTO KRIM_PERM_ID_S VALUES(NULL)
/

INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Initiate Document'),'KC-SYS','Create ContextMaintenanceDocument','Authorizes the initiation of Context Maintenance Documents','Y',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_S),(SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Document Type (Permission)'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'),'ContextMaintenanceDocument',UUID(),1)
/
INSERT INTO KRIM_PERM_ID_S VALUES(NULL)
/

INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Initiate Document'),'KC-SYS','Create RuleMaintenanceDocument','Authorizes the initiation of Rule Maintenance Documents','Y',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_S),(SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Document Type (Permission)'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'),'RuleMaintenanceDocument',UUID(),1)
/
INSERT INTO KRIM_PERM_ID_S VALUES(NULL)
/

INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Initiate Document'),'KC-SYS','Create TermMaintenanceDocument','Authorizes the initiation of Term Maintenance Documents','Y',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_S),(SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Document Type (Permission)'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'),'TermMaintenanceDocument',UUID(),1)
/
INSERT INTO KRIM_PERM_ID_S VALUES(NULL)
/

INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Initiate Document'),'KC-SYS','Create TermSpecificationMaintenanceDocument','Authorizes the initiation of Term Specification Maintenance Documents','Y',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_S),(SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Document Type (Permission)'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'),'TermSpecificationMaintenanceDocument',UUID(),1)
/
INSERT INTO KRIM_PERM_ID_S VALUES(NULL)
/

INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Initiate Document'),'KC-SYS','Create PeopleFlowMaintenanceDocument','Authorizes the initiation of People Flow Maintenance Documents','Y',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_S),(SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Document Type (Permission)'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'),'PeopleFlowMaintenanceDocument',UUID(),1)
/
INSERT INTO KRIM_PERM_ID_S VALUES(NULL)
/

INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Initiate Document'),'KC-SYS','Create AgendaEditorMaintenanceDocument','Authorizes the initiation of Agenda Editor Maintenance Documents','Y',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID,PERM_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_S),(SELECT (MAX(ID)) FROM KRIM_PERM_ID_S),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Document Type (Permission)'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'),'AgendaEditorMaintenanceDocument',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/

-- Assigning all above permissions to Technical Administrator

INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KR-SYS' AND ROLE_NM = 'Technical Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create DocumentTypeDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KR-SYS' AND ROLE_NM = 'Technical Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create RoutingRuleDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KR-SYS' AND ROLE_NM = 'Technical Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create NamespaceMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KR-SYS' AND ROLE_NM = 'Technical Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create ParameterTypeMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KR-SYS' AND ROLE_NM = 'Technical Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create ParameterDetailTypeMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KR-SYS' AND ROLE_NM = 'Technical Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create ParameterMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KR-SYS' AND ROLE_NM = 'Technical Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create RoutingRuleDelegationMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KR-SYS' AND ROLE_NM = 'Technical Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create CampusMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KR-SYS' AND ROLE_NM = 'Technical Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create CampusTypeMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KR-SYS' AND ROLE_NM = 'Technical Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create CountryMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KR-SYS' AND ROLE_NM = 'Technical Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create CountyMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KR-SYS' AND ROLE_NM = 'Technical Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create PostalCodeMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KR-SYS' AND ROLE_NM = 'Technical Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create StateMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KR-SYS' AND ROLE_NM = 'Technical Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create IdentityManagementDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KR-SYS' AND ROLE_NM = 'Technical Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create AgendaMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KR-SYS' AND ROLE_NM = 'Technical Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create ContextMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KR-SYS' AND ROLE_NM = 'Technical Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create RuleMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KR-SYS' AND ROLE_NM = 'Technical Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create TermMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KR-SYS' AND ROLE_NM = 'Technical Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create TermSpecificationMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KR-SYS' AND ROLE_NM = 'Technical Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create PeopleFlowMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KR-SYS' AND ROLE_NM = 'Technical Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create AgendaEditorMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/

-- Assigning all above permissions to Application Administrator

INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SYS' AND ROLE_NM = 'Application Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create DocumentTypeDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SYS' AND ROLE_NM = 'Application Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create RoutingRuleDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SYS' AND ROLE_NM = 'Application Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create NamespaceMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SYS' AND ROLE_NM = 'Application Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create ParameterTypeMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SYS' AND ROLE_NM = 'Application Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create ParameterDetailTypeMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SYS' AND ROLE_NM = 'Application Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create ParameterMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SYS' AND ROLE_NM = 'Application Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create RoutingRuleDelegationMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SYS' AND ROLE_NM = 'Application Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create CampusMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SYS' AND ROLE_NM = 'Application Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create CampusTypeMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SYS' AND ROLE_NM = 'Application Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create CountryMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SYS' AND ROLE_NM = 'Application Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create CountyMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SYS' AND ROLE_NM = 'Application Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create PostalCodeMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SYS' AND ROLE_NM = 'Application Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create StateMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SYS' AND ROLE_NM = 'Application Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create IdentityManagementDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SYS' AND ROLE_NM = 'Application Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create AgendaMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SYS' AND ROLE_NM = 'Application Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create ContextMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SYS' AND ROLE_NM = 'Application Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create RuleMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SYS' AND ROLE_NM = 'Application Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create TermMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SYS' AND ROLE_NM = 'Application Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create TermSpecificationMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SYS' AND ROLE_NM = 'Application Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create PeopleFlowMaintenanceDocument'),'Y',UUID(),1)
/
INSERT INTO KRIM_ROLE_PERM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-SYS' AND ROLE_NM = 'Application Administrator'),(SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-SYS' AND NM = 'Create AgendaEditorMaintenanceDocument'),'Y',UUID(),1)
/
DELIMITER ;