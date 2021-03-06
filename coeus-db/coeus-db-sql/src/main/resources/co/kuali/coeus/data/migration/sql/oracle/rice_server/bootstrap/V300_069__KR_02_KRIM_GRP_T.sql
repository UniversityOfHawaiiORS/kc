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

INSERT INTO KRIM_GRP_T (GRP_ID,KIM_TYP_ID,NMSPC_CD,GRP_NM,GRP_DESC,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_GRP_ID_S.NEXTVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KUALI' AND NM = 'Default'),'KC-WKFLW','KcAdmin','Kuali Coeus Administrator','Y',SYSDATE,SYS_GUID(),1);
INSERT INTO KRIM_GRP_T (GRP_ID,KIM_TYP_ID,NMSPC_CD,GRP_NM,GRP_DESC,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_GRP_ID_S.NEXTVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KUALI' AND NM = 'Default'),'KC-WKFLW','OSP Superuser','Kuali Coeus Administrator','Y',SYSDATE,SYS_GUID(),1);
INSERT INTO KRIM_GRP_T (GRP_ID,KIM_TYP_ID,NMSPC_CD,GRP_NM,GRP_DESC,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_GRP_ID_S.NEXTVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KUALI' AND NM = 'Default'),'KC-WKFLW','ProposalAdmin','Proposal Workflow Administrator','Y',SYSDATE,SYS_GUID(),1);
INSERT INTO KRIM_GRP_T (GRP_ID,KIM_TYP_ID,NMSPC_CD,GRP_NM,GRP_DESC,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_GRP_ID_S.NEXTVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KUALI' AND NM = 'Default'),'KC-WKFLW','IRBAdmin','IRB Administrator','Y',SYSDATE,SYS_GUID(),1);
INSERT INTO KRIM_GRP_T (GRP_ID,KIM_TYP_ID,NMSPC_CD,GRP_NM,GRP_DESC,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_GRP_ID_S.NEXTVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KUALI' AND NM = 'Default'),'KC-WKFLW','Proposal Development - Department Reviewers','Reviewes for DepartmentalReview route node.','Y',SYSDATE,SYS_GUID(),1);
INSERT INTO KRIM_GRP_T (GRP_ID,KIM_TYP_ID,NMSPC_CD,GRP_NM,GRP_DESC,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR) 
    VALUES (KRIM_GRP_ID_S.NEXTVAL,(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KUALI' AND NM = 'Default'),'KC-WKFLW','Proposal Development - Custom Approval Reviewers','Reviewes for CustomApproval route node.','Y',SYSDATE,SYS_GUID(),1);
