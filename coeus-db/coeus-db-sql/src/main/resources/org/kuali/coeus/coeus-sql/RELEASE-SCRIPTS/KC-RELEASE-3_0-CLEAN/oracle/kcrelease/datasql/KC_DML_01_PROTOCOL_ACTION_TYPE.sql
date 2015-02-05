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

TRUNCATE TABLE PROTOCOL_ACTION_TYPE DROP STORAGE
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('100','Protocol Created','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('101','Submitted to IRB','Y','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('102','Renewal Created','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('103','Amendment Created','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('104','Request For Termination','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('105','Request To Close','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('106','Request For Suspension','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('107','Request for Withdrawal','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('108','Request to Close Enrollment','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('109','Notified Committee','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('110','Correspondence Generated','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('111','Renewal Reminder Generated','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('112','Reminder to IRB Notification Generated','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('113','Administrative Correction','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('114','Request for Data Analysis Only','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('115','Request to Re-open Enrollment','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('116','Notify IRB','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('200','Assigned to Agenda','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('201','Deferred','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('202','Substantive Revisions Required','Y','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('203','Specific Minor Revisions Required','Y','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('204','Approved','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('205','Expedited Approval','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('206','Exemption Granted','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('207','Closed for Enrollment','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('208','Response Approval','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('209','IRB Acknowledgement','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('210','IRB review not required','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('211','Data Analysis Only','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('212','Re-open Enrollment','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('300','Closed (Administratively closed)','N','N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('301','Terminated','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('302','Suspended','N','N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('303','Withdrawn','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('304','Disapproved','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('305','Expired','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('306','Suspended by DSMB','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('308','Record Committee Decision','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PROTOCOL_ACTION_TYPE (PROTOCOL_ACTION_TYPE_CODE,DESCRIPTION,TRIGGER_SUBMISSION,TRIGGER_CORRESPONDENCE,FINAL_ACTION_FOR_BATCH_CORRESP,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('310','Manage Review Comments','N','N','N','admin',SYSDATE,SYS_GUID(),1)
/
