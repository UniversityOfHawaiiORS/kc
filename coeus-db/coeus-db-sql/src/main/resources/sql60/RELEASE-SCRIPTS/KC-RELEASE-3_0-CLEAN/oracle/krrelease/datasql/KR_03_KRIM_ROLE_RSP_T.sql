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

INSERT INTO KRIM_ROLE_RSP_T (ROLE_RSP_ID,ROLE_ID,RSP_ID,ACTV_IND,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ID_BS_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-WKFLW' AND ROLE_NM = 'IRBApprover'),(SELECT RSP_ID FROM KRIM_RSP_T WHERE NMSPC_CD = 'KC-WKFLW' AND NM = 'IRB Approve'),'Y',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_RSP_ACTN_T (ROLE_RSP_ACTN_ID,ROLE_RSP_ID,ROLE_MBR_ID,ACTN_TYP_CD,ACTN_PLCY_CD,FRC_ACTN,PRIORITY_NBR,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ACTN_ID_BS_S.NEXTVAL,KRIM_ROLE_RSP_ID_BS_S.CURRVAL,'*','A','F','Y',1,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_RSP_T (ROLE_RSP_ID,ROLE_ID,RSP_ID,ACTV_IND,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ID_BS_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-WKFLW' AND ROLE_NM = 'IRBApprover'),(SELECT RSP_ID FROM KRIM_RSP_T WHERE NMSPC_CD = 'KC-WKFLW' AND NM = 'IRB AssignedToCommittee'),'Y',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_RSP_ACTN_T (ROLE_RSP_ACTN_ID,ROLE_RSP_ID,ROLE_MBR_ID,ACTN_TYP_CD,ACTN_PLCY_CD,FRC_ACTN,PRIORITY_NBR,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ACTN_ID_BS_S.NEXTVAL,KRIM_ROLE_RSP_ID_BS_S.CURRVAL,'*','A','F','Y',1,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_RSP_T (ROLE_RSP_ID,ROLE_ID,RSP_ID,ACTV_IND,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ID_BS_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-WKFLW' AND ROLE_NM = 'IRBApprover'),(SELECT RSP_ID FROM KRIM_RSP_T WHERE NMSPC_CD = 'KC-WKFLW' AND NM = 'IRB AssignedToAgenda'),'Y',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_RSP_ACTN_T (ROLE_RSP_ACTN_ID,ROLE_RSP_ID,ROLE_MBR_ID,ACTN_TYP_CD,ACTN_PLCY_CD,FRC_ACTN,PRIORITY_NBR,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ACTN_ID_BS_S.NEXTVAL,KRIM_ROLE_RSP_ID_BS_S.CURRVAL,'*','A','F','Y',1,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_RSP_T (ROLE_RSP_ID,ROLE_ID,RSP_ID,ACTV_IND,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ID_BS_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-WKFLW' AND ROLE_NM = 'IRBApprover'),(SELECT RSP_ID FROM KRIM_RSP_T WHERE NMSPC_CD = 'KC-WKFLW' AND NM = 'IRB Review'),'Y',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_RSP_ACTN_T (ROLE_RSP_ACTN_ID,ROLE_RSP_ID,ROLE_MBR_ID,ACTN_TYP_CD,ACTN_PLCY_CD,FRC_ACTN,PRIORITY_NBR,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ACTN_ID_BS_S.NEXTVAL,KRIM_ROLE_RSP_ID_BS_S.CURRVAL,'*','A','F','Y',1,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_RSP_T (ROLE_RSP_ID,ROLE_ID,RSP_ID,ACTV_IND,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ID_BS_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-WKFLW' AND ROLE_NM = 'OSPApprover'),(SELECT RSP_ID FROM KRIM_RSP_T WHERE NMSPC_CD = 'KC-WKFLW' AND NM = 'Proposal Initial Approval'),'Y',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_RSP_ACTN_T (ROLE_RSP_ACTN_ID,ROLE_RSP_ID,ROLE_MBR_ID,ACTN_TYP_CD,ACTN_PLCY_CD,FRC_ACTN,PRIORITY_NBR,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ACTN_ID_BS_S.NEXTVAL,KRIM_ROLE_RSP_ID_BS_S.CURRVAL,'*','A','F','N',1,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_RSP_T (ROLE_RSP_ID,ROLE_ID,RSP_ID,ACTV_IND,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ID_BS_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-WKFLW' AND ROLE_NM = 'OSPApprover'),(SELECT RSP_ID FROM KRIM_RSP_T WHERE NMSPC_CD = 'KC-WKFLW' AND NM = 'Proposal OSP Office Approval'),'Y',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_RSP_ACTN_T (ROLE_RSP_ACTN_ID,ROLE_RSP_ID,ROLE_MBR_ID,ACTN_TYP_CD,ACTN_PLCY_CD,FRC_ACTN,PRIORITY_NBR,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ACTN_ID_BS_S.NEXTVAL,KRIM_ROLE_RSP_ID_BS_S.CURRVAL,'*','A','F','N',1,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_RSP_T (ROLE_RSP_ID,ROLE_ID,RSP_ID,ACTV_IND,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ID_BS_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-AB' AND ROLE_NM = 'Award Budget Approver'),(SELECT RSP_ID FROM KRIM_RSP_T WHERE NMSPC_CD = 'KC-WKFLW' AND NM = 'Award Budget InitialApproval'),'Y',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_RSP_ACTN_T (ROLE_RSP_ACTN_ID,ROLE_RSP_ID,ROLE_MBR_ID,ACTN_TYP_CD,ACTN_PLCY_CD,FRC_ACTN,PRIORITY_NBR,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ACTN_ID_BS_S.NEXTVAL,KRIM_ROLE_RSP_ID_BS_S.CURRVAL,'*','A','F','N',1,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_RSP_T (ROLE_RSP_ID,ROLE_ID,RSP_ID,ACTV_IND,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ID_BS_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-AB' AND ROLE_NM = 'Award Budget Approver'),(SELECT RSP_ID FROM KRIM_RSP_T WHERE NMSPC_CD = 'KC-WKFLW' AND NM = 'Award Budget OSPApproval'),'Y',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_RSP_ACTN_T (ROLE_RSP_ACTN_ID,ROLE_RSP_ID,ROLE_MBR_ID,ACTN_TYP_CD,ACTN_PLCY_CD,FRC_ACTN,PRIORITY_NBR,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ACTN_ID_BS_S.NEXTVAL,KRIM_ROLE_RSP_ID_BS_S.CURRVAL,'*','A','F','N',1,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_RSP_T (ROLE_RSP_ID,ROLE_ID,RSP_ID,ACTV_IND,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ID_BS_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-UNT' AND ROLE_NM = 'IRB Administrator'),(SELECT RSP_ID FROM KRIM_RSP_T WHERE NMSPC_CD = 'KC-WKFLW' AND NM = 'IRB Admin Approve Online Review'),'Y',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_RSP_ACTN_T (ROLE_RSP_ACTN_ID,ROLE_RSP_ID,ROLE_MBR_ID,ACTN_TYP_CD,ACTN_PLCY_CD,FRC_ACTN,PRIORITY_NBR,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ACTN_ID_BS_S.NEXTVAL,KRIM_ROLE_RSP_ID_BS_S.CURRVAL,'*','A','F','Y',1,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_RSP_T (ROLE_RSP_ID,ROLE_ID,RSP_ID,ACTV_IND,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ID_BS_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-UNT' AND ROLE_NM = 'IRB Administrator'),(SELECT RSP_ID FROM KRIM_RSP_T WHERE NMSPC_CD = 'KC-WKFLW' AND NM = 'IRB Admin Approve Review Request'),'Y',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_RSP_ACTN_T (ROLE_RSP_ACTN_ID,ROLE_RSP_ID,ROLE_MBR_ID,ACTN_TYP_CD,ACTN_PLCY_CD,FRC_ACTN,PRIORITY_NBR,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ACTN_ID_BS_S.NEXTVAL,KRIM_ROLE_RSP_ID_BS_S.CURRVAL,'*','A','F','N',1,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_RSP_T (ROLE_RSP_ID,ROLE_ID,RSP_ID,ACTV_IND,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ID_BS_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-WKFLW' AND ROLE_NM = 'PI'),(SELECT RSP_ID FROM KRIM_RSP_T WHERE NMSPC_CD = 'KC-WKFLW' AND NM = 'Proposal Persons Approval'),'Y',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_RSP_ACTN_T (ROLE_RSP_ACTN_ID,ROLE_RSP_ID,ROLE_MBR_ID,ACTN_TYP_CD,ACTN_PLCY_CD,FRC_ACTN,PRIORITY_NBR,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ACTN_ID_BS_S.NEXTVAL,KRIM_ROLE_RSP_ID_BS_S.CURRVAL,'*','A','A','N',1,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_RSP_T (ROLE_RSP_ID,ROLE_ID,RSP_ID,ACTV_IND,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ID_BS_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-WKFLW' AND ROLE_NM = 'COI'),(SELECT RSP_ID FROM KRIM_RSP_T WHERE NMSPC_CD = 'KC-WKFLW' AND NM = 'Proposal Persons Approval'),'Y',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_RSP_ACTN_T (ROLE_RSP_ACTN_ID,ROLE_RSP_ID,ROLE_MBR_ID,ACTN_TYP_CD,ACTN_PLCY_CD,FRC_ACTN,PRIORITY_NBR,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ACTN_ID_BS_S.NEXTVAL,KRIM_ROLE_RSP_ID_BS_S.CURRVAL,'*','A','A','N',1,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_RSP_T (ROLE_RSP_ID,ROLE_ID,RSP_ID,ACTV_IND,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ID_BS_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-WKFLW' AND ROLE_NM = 'DepartmentReviewer'),(SELECT RSP_ID FROM KRIM_RSP_T WHERE NMSPC_CD = 'KC-WKFLW' AND NM = 'Proposal Departmental Approval'),'Y',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_RSP_ACTN_T (ROLE_RSP_ACTN_ID,ROLE_RSP_ID,ROLE_MBR_ID,ACTN_TYP_CD,ACTN_PLCY_CD,FRC_ACTN,PRIORITY_NBR,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ACTN_ID_BS_S.NEXTVAL,KRIM_ROLE_RSP_ID_BS_S.CURRVAL,'*','A','F','N',1,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_RSP_T (ROLE_RSP_ID,ROLE_ID,RSP_ID,ACTV_IND,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ID_BS_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-WKFLW' AND ROLE_NM = 'CustomReviewer'),(SELECT RSP_ID FROM KRIM_RSP_T WHERE NMSPC_CD = 'KC-WKFLW' AND NM = 'Proposal Custom Approval'),'Y',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_RSP_ACTN_T (ROLE_RSP_ACTN_ID,ROLE_RSP_ID,ROLE_MBR_ID,ACTN_TYP_CD,ACTN_PLCY_CD,FRC_ACTN,PRIORITY_NBR,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ACTN_ID_BS_S.NEXTVAL,KRIM_ROLE_RSP_ID_BS_S.CURRVAL,'*','A','F','N',1,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_RSP_T (ROLE_RSP_ID,ROLE_ID,RSP_ID,ACTV_IND,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ID_BS_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-WKFLW' AND ROLE_NM = 'KP'),(SELECT RSP_ID FROM KRIM_RSP_T WHERE NMSPC_CD = 'KC-WKFLW' AND NM = 'Proposal Persons Approval'),'Y',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_RSP_ACTN_T (ROLE_RSP_ACTN_ID,ROLE_RSP_ID,ROLE_MBR_ID,ACTN_TYP_CD,ACTN_PLCY_CD,FRC_ACTN,PRIORITY_NBR,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ACTN_ID_BS_S.NEXTVAL,KRIM_ROLE_RSP_ID_BS_S.CURRVAL,'*','A','A','N',1,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_RSP_T (ROLE_RSP_ID,ROLE_ID,RSP_ID,ACTV_IND,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ID_BS_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-WKFLW' AND ROLE_NM = 'Unit Administrator'),(SELECT RSP_ID FROM KRIM_RSP_T WHERE NMSPC_CD = 'KC-WKFLW' AND NM = 'ProtocolUnitApprovalResponsibility'),'Y',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_RSP_ACTN_T (ROLE_RSP_ACTN_ID,ROLE_RSP_ID,ROLE_MBR_ID,ACTN_TYP_CD,ACTN_PLCY_CD,FRC_ACTN,PRIORITY_NBR,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ACTN_ID_BS_S.NEXTVAL,KRIM_ROLE_RSP_ID_BS_S.CURRVAL,'*','A','F','N',1,SYS_GUID(),1)
/

INSERT INTO KRIM_ROLE_RSP_T (ROLE_RSP_ID,ROLE_ID,RSP_ID,ACTV_IND,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ID_BS_S.NEXTVAL,(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-PROTOCOL' AND ROLE_NM = 'IRB Online Reviewer'),(SELECT RSP_ID FROM KRIM_RSP_T WHERE NMSPC_CD = 'KC-WKFLW' AND NM = 'IRB Reviewer Approve Online Review'),'Y',SYS_GUID(),1)
/
INSERT INTO KRIM_ROLE_RSP_ACTN_T (ROLE_RSP_ACTN_ID,ROLE_RSP_ID,ROLE_MBR_ID,ACTN_TYP_CD,ACTN_PLCY_CD,FRC_ACTN,PRIORITY_NBR,OBJ_ID,VER_NBR) 
    VALUES (KRIM_ROLE_RSP_ACTN_ID_BS_S.NEXTVAL,KRIM_ROLE_RSP_ID_BS_S.CURRVAL,'*','A','F','N',1,SYS_GUID(),1)
/