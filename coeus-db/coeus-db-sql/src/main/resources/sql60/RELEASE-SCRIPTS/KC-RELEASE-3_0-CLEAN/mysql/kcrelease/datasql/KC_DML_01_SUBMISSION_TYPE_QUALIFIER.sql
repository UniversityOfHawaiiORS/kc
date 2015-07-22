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
TRUNCATE TABLE SUBMISSION_TYPE_QUALIFIER
/
INSERT INTO SUBMISSION_TYPE_QUALIFIER (SUBMISSION_TYPE_QUAL_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('1','Modification/Amendment/Revisions/Significant New Finding','admin',NOW(),UUID(),1)
/
INSERT INTO SUBMISSION_TYPE_QUALIFIER (SUBMISSION_TYPE_QUAL_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('2','Annual Scheduled by IRB','admin',NOW(),UUID(),1)
/
INSERT INTO SUBMISSION_TYPE_QUALIFIER (SUBMISSION_TYPE_QUAL_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('3','Contingent/Conditional Approval/Deferred Approval/ Non-Approval','admin',NOW(),UUID(),1)
/
INSERT INTO SUBMISSION_TYPE_QUALIFIER (SUBMISSION_TYPE_QUAL_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('4','Eligibility Exceptions/Protocol Deviations','admin',NOW(),UUID(),1)
/
INSERT INTO SUBMISSION_TYPE_QUALIFIER (SUBMISSION_TYPE_QUAL_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('5','AE/UADE','admin',NOW(),UUID(),1)
/
INSERT INTO SUBMISSION_TYPE_QUALIFIER (SUBMISSION_TYPE_QUAL_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('6','Complaint','admin',NOW(),UUID(),1)
/
INSERT INTO SUBMISSION_TYPE_QUALIFIER (SUBMISSION_TYPE_QUAL_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('7','Deviation','admin',NOW(),UUID(),1)
/
INSERT INTO SUBMISSION_TYPE_QUALIFIER (SUBMISSION_TYPE_QUAL_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('8','Protocol-related COI Report','admin',NOW(),UUID(),1)
/
INSERT INTO SUBMISSION_TYPE_QUALIFIER (SUBMISSION_TYPE_QUAL_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('9','Self report for Noncompliance','admin',NOW(),UUID(),1)
/
INSERT INTO SUBMISSION_TYPE_QUALIFIER (SUBMISSION_TYPE_QUAL_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('10','Request for Eligibility Exception','admin',NOW(),UUID(),1)
/
INSERT INTO SUBMISSION_TYPE_QUALIFIER (SUBMISSION_TYPE_QUAL_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('11','Training Certification','admin',NOW(),UUID(),1)
/
INSERT INTO SUBMISSION_TYPE_QUALIFIER (SUBMISSION_TYPE_QUAL_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('12','Unanticipated Problems','admin',NOW(),UUID(),1)
/
INSERT INTO SUBMISSION_TYPE_QUALIFIER (SUBMISSION_TYPE_QUAL_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('13','DSMB Report','admin',NOW(),UUID(),1)
/
INSERT INTO SUBMISSION_TYPE_QUALIFIER (SUBMISSION_TYPE_QUAL_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('14','Annual Report','admin',NOW(),UUID(),1)
/
delimiter ;