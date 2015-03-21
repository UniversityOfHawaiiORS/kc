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

delimiter /
TRUNCATE TABLE FP_DOC_TYPE_T
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('ABST','ABSTRACT TYPE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('ACTT','ACTIVITY TYPE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('ADST','AwardStatus','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('ADTM','AwardTemplate','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('ARTR',UUID(),'Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('ATCM','AwardTemplateComment','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('ATRT','AwardTemplateReportTerm','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('ATTR','AwardTemplateTerm','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('AWRD','AWARD','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('AWTC','AwardTemplateContact','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('BR','Biz Rules','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('BUCA','BUDGET CATEGORY','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('BUCG','BUDGET CATEGORY MAPPING','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('BUCM','BUDGET CATEGORY MAPS','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('BUCT','BUDGET CATEGORY TYPE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('BUDG','BUDGET','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('BUST','BUDGET STATUS','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('CADM','CUST ATTR DOC','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('CADT','CUST ATTR DATA TYPE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('CART','CARRIER TYPE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('COEL','COST ELEMENT','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('COMT','COMMITTEE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('CTYP','Committee Type','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('CUAT','CUST ATTR','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('DEGT','DEGREE TYPE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('DLTC','DEADLINE TYPE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('EMTP','EXEMPTION TYPE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('ERCK','EXPEDITED REVIEW CHECKLIST','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('ESCK','EXEMPT STUDIES CHECKLIST','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('INCT','INV CREDIT TYPE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('INLA','INSTITUTION LA RATE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('INPR','Institutional Proposal','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('INRA','INSTITUTION RATE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('KIMR','KIM ROLE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('KIRP','KIM ROLE-PERMISSION','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('KQRP','KRA QUALIFIED ROLE PERSON','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('MLBY','MAIL BY','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('MLTP','MAIL TYPE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('NAST','NARRATIVE STATUS','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('NOOT','NOTICE OF OPPORTUNITY','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('NRTP','NARRATIVE TYPE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('ORGA','ORGANIZATION','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('ORTL','ORGANIZATION TYPE LIST','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('PARM','System Parms','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('PCTA','EDITABLE PROPOSAL COLUMNS','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('PDEG','PERSON DEGREE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('PERS','PERSON','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('PERT','PERSON TRAINING','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('POSS','POST SUBMISSION STATUS CODE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('PPDT','PROPOSAL PERSON DOCUMENT TYPE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('PRDV','PROPOSAL DEVELOPMENT','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('PREF','PER EDITABLE FILED','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('PRET','PROTOCOL REFERENCE TYPE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('PRLO','PROP LOCATION','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('PROT','PROTOCOL','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('PRPT','PROPOSAL TYPE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('PRRS','PROP RESPONSE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('PRRT','PROTOCOL_REVIEWER_TYPE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('PRTD','PROPOSAL ROLE TEMPLATE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('PTRT','PROTOCOL REVIEW TYPE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('RACL','RATE CLASS','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('RACT','RATE CLASS TYPE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('RATY','RATE TYPE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('REAR','RESEARCH AREAS','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('RISK','RISK LEVEL','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('ROLO','ROLODEX','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('RUSR','RICE USR','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('S2RE','S2S REVISION TYPE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('SCIC','SCIENCE CODE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('SCKC','SCIENCE KEYWORD','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('SFTM','SPONSOR FORM TEMPLATES','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('SPFO','SPONSOR FORMS','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('SPHI','SPONSOR HIERARCHY','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('SPON','SPONSOR','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('SPRV','SPECIAL REVIEW','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('SPTT','SPONSOR TYPE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('SRAT','SPEC REVIEW APPROVAL TYPE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('SSTY','S2S SUBMISSION TYPE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('STMD','SponsorTerm','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('STTC','STATE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('STTD','SponsorTermType','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('TAMD','TIMEANDMONEY','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('TRAI','TRAINING','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('TRAV','TRAV ACCNT','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('TRD2','TRAV D2','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('TRFO','TRAV FO','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('TRVA','TRAV MAINT','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('UADT','UNIT ADMINISTRATOR TYPE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('UAED','UNIT ACL ENTRY','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('UNAD','UNIT ADMINISTRATOR','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('UNIT','UNIT','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('VACA','VALID CALCULATION TYPE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('VACE','VALID COST ELEMENT RATE TYPE','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('VRSA','VALID SPECIAL REVIEW APPROVAL','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('VSRA','VALID SPECIAL REVIEW APPROVAL','Y',UUID(),1)
/
INSERT INTO FP_DOC_TYPE_T (FDOC_TYP_CD,FDOC_NM,FDOC_TYP_ACTIVE_CD,OBJ_ID,VER_NBR) 
    VALUES ('YNQD','YES/NO QUESTIONS','Y',UUID(),1)
/
delimiter ;
