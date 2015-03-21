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

-- Update the document type name for IACUC committee View, Modify and Actions permissions attributes 

UPDATE KRIM_PERM_ATTR_DATA_T SET ATTR_VAL = 'CommonCommitteeDocument'
WHERE PERM_ID = (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View IACUCCommittee' AND NMSPC_CD='KC-IACUC')
	AND KIM_TYP_ID = (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Document Section')
	AND KIM_ATTR_DEFN_ID = (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName')
/

UPDATE KRIM_PERM_ATTR_DATA_T SET ATTR_VAL = 'CommonCommitteeDocument'
WHERE PERM_ID = (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Modify IACUCCommittee' AND NMSPC_CD='KC-IACUC')
	AND KIM_TYP_ID = (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Document Section')
	AND KIM_ATTR_DEFN_ID = (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName')
/

UPDATE KRIM_PERM_ATTR_DATA_T SET ATTR_VAL = 'CommonCommitteeDocument'
WHERE PERM_ID = (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Perform IACUCCommittee Actions' AND NMSPC_CD='KC-IACUC')
	AND KIM_TYP_ID = (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Document Type (Permission)')
	AND KIM_ATTR_DEFN_ID = (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName')
/

-- Update the derived role service bean ids to use the common service name

UPDATE KRIM_TYP_T SET SRVC_NM = 'activeCommitteeMemberDerivedRoleTypeService'
WHERE NM = 'Derived Role: Active IACUC Committee Member' AND SRVC_NM = 'activeIacucCommitteeMemberDerivedRoleTypeService'
/

UPDATE KRIM_TYP_T SET SRVC_NM = 'activeCommitteeMemberOnScheduledDateDerivedRoleTypeService'
WHERE NM = 'Derived Role: Active IACUC Committee Member on Scheduled Date' AND SRVC_NM = 'activeIacucCommitteeMemberOnScheduledDateDerivedRoleTypeService'
/


-- New create IACUC committee permission

INSERT INTO KRIM_PERM_T (PERM_ID, PERM_TMPL_ID, NMSPC_CD, NM, DESC_TXT, ACTV_IND, OBJ_ID) 
    VALUES (KRIM_PERM_ID_BS_S.NEXTVAL, (SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Initiate Document'), 'KC-IACUC', 'Create IACUCCommitteeDocument', 'Add new IACUC committees in a unit', 'Y', SYS_GUID())
/

INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID, PERM_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID) 
    VALUES (KRIM_ATTR_DATA_ID_BS_S.NEXTVAL, KRIM_PERM_ID_BS_S.CURRVAL, (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-SYS' AND NM = 'Document Type (Permission)'), (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'documentTypeName'), 'CommonCommitteeDocument', SYS_GUID())
/

-- Assign the create IACUC committe permission to IACUC admin 

INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, ROLE_ID, PERM_ID, ACTV_IND, OBJ_ID, VER_NBR) 
    VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-UNT' AND ROLE_NM = 'IACUC Administrator'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-IACUC' AND NM = 'Create IACUCCommitteeDocument'), 'Y', SYS_GUID(), '1')
/

-- Assign the view IACUC committee permission to the active IACUC committee member derived role and the IACUC reviewer

INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, ROLE_ID, PERM_ID, ACTV_IND, OBJ_ID, VER_NBR) 
    VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-IACUC' AND ROLE_NM = 'Active IACUC Committee Member'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-IACUC' AND NM = 'View IACUCCommittee'), 'Y', SYS_GUID(), '1')
/

INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, ROLE_ID, PERM_ID, ACTV_IND, OBJ_ID, VER_NBR) 
    VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-UNT' AND ROLE_NM = 'IACUC Reviewer'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-IACUC' AND NM = 'View IACUCCommittee'), 'Y', SYS_GUID(), '1')
/

-- New view IACUC schedule permission

INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR) 
    VALUES (KRIM_PERM_ID_BS_S.NEXTVAL,(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KC-IDM' AND NM = 'View Document Section'), 'KC-IACUC', 'View IACUC Schedule', 'View schedule details of IACUC committees in a unit', 'Y', SYS_GUID(), 1)
/

INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID, PERM_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID) VALUES (KRIM_ATTR_DATA_ID_BS_S.NEXTVAL, KRIM_PERM_ID_BS_S.CURRVAL, (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Document Section'), (SELECT KIM_ATTR_DEFN_ID from KRIM_ATTR_DEFN_T WHERE NM = 'sectionName'), 'schedule', SYS_GUID())
/

INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID, PERM_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID) VALUES (KRIM_ATTR_DATA_ID_BS_S.NEXTVAL, KRIM_PERM_ID_BS_S.CURRVAL, (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Document Section'), (SELECT KIM_ATTR_DEFN_ID from KRIM_ATTR_DEFN_T WHERE NM = 'documentTypeName'), 'CommonCommitteeDocument', SYS_GUID())
/

-- Assign the view IACUC schedule permission to the active IACUC committee member on schedule date derived role, the IACUC admin role and the IACUC reviewer role

INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, ROLE_ID, PERM_ID, ACTV_IND, OBJ_ID, VER_NBR) 
    VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-IACUC' AND ROLE_NM = 'Active IACUC Committee Member on Scheduled Date'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-IACUC' AND NM = 'View IACUC Schedule'), 'Y', SYS_GUID(), '1')
/

INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, ROLE_ID, PERM_ID, ACTV_IND, OBJ_ID, VER_NBR) 
    VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-UNT' AND ROLE_NM = 'IACUC Reviewer'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-IACUC' AND NM = 'View IACUC Schedule'), 'Y', SYS_GUID(), '1')
/

INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, ROLE_ID, PERM_ID, ACTV_IND, OBJ_ID, VER_NBR) 
    VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-UNT' AND ROLE_NM = 'IACUC Administrator'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-IACUC' AND NM = 'View IACUC Schedule'), 'Y', SYS_GUID(), '1')
/

-- New modify IACUC schedule permission

INSERT INTO KRIM_PERM_T (PERM_ID,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR) 
    VALUES (KRIM_PERM_ID_BS_S.NEXTVAL,(SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NMSPC_CD = 'KC-IDM' AND NM = 'Edit Document Section'), 'KC-IACUC', 'Modify IACUC Schedule', 'Modify schedule details for IACUC committees in a unit', 'Y', SYS_GUID(), 1)
/

INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID, PERM_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID) VALUES (KRIM_ATTR_DATA_ID_BS_S.NEXTVAL, KRIM_PERM_ID_BS_S.CURRVAL, (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Document Section'), (SELECT KIM_ATTR_DEFN_ID from KRIM_ATTR_DEFN_T WHERE NM = 'sectionName'), 'schedule', SYS_GUID())
/

INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID, PERM_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID) VALUES (KRIM_ATTR_DATA_ID_BS_S.NEXTVAL, KRIM_PERM_ID_BS_S.CURRVAL, (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Document Section'), (SELECT KIM_ATTR_DEFN_ID from KRIM_ATTR_DEFN_T WHERE NM = 'documentTypeName'), 'CommonCommitteeDocument', SYS_GUID())
/

-- Assign the modify IACUC schedule permission to the IACUC admin

INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, ROLE_ID, PERM_ID, ACTV_IND, OBJ_ID, VER_NBR) 
    VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-UNT' AND ROLE_NM = 'IACUC Administrator'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NMSPC_CD = 'KC-IACUC' AND NM = 'Modify IACUC Schedule'), 'Y', SYS_GUID(), '1')
/
