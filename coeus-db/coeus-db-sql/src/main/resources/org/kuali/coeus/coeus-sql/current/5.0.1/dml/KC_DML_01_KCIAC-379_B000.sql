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

INSERT INTO IACUC_BATCH_CORRESPONDENCE (BATCH_CORRESPONDENCE_TYPE_CODE, DESCRIPTION, DAYS_TO_EVENT_UI_TEXT, SEND_CORRESPONDENCE, FINAL_ACTION_DAY, FINAL_ACTION_TYPE_CODE, FINAL_ACTION_CORRESP_TYPE, UPDATE_USER, UPDATE_TIMESTAMP, OBJ_ID, VER_NBR) 
    VALUES ('1', 'Protocol Renewal Reminders', 'Days prior Protocol Expiration', 'BEFORE', 0, (SELECT PROTOCOL_ACTION_TYPE_CODE FROM IACUC_PROTOCOL_ACTION_TYPE WHERE DESCRIPTION = 'Expired'), null, 'admin', SYSDATE, SYS_GUID(), 1)
/

INSERT INTO IACUC_BATCH_CORRESPONDENCE (BATCH_CORRESPONDENCE_TYPE_CODE, DESCRIPTION, DAYS_TO_EVENT_UI_TEXT, SEND_CORRESPONDENCE, FINAL_ACTION_DAY, FINAL_ACTION_TYPE_CODE, FINAL_ACTION_CORRESP_TYPE, UPDATE_USER, UPDATE_TIMESTAMP, OBJ_ID, VER_NBR) 
    VALUES ('2', 'Reminder to IACUC Notifications', 'Days since Committee Action', 'AFTER', 30, null, (SELECT PROTO_CORRESP_TYPE_CODE FROM IACUC_PROTOCOL_CORRESP_TYPE WHERE DESCRIPTION = 'Notify IACUC Letter'), 'admin', SYSDATE, SYS_GUID(), 1)
/



INSERT INTO IACUC_BATCH_CORRESP_DETAIL (BATCH_CORRESPONDENCE_DETAIL_ID, BATCH_CORRESPONDENCE_TYPE_CODE, PROTO_CORRESP_TYPE_CODE, DAYS_TO_EVENT, UPDATE_USER, UPDATE_TIMESTAMP, OBJ_ID, VER_NBR) 
    VALUES (SEQ_IACUC_BAT_CORRESP_DET_ID.NEXTVAL, (SELECT BATCH_CORRESPONDENCE_TYPE_CODE FROM IACUC_BATCH_CORRESPONDENCE WHERE DESCRIPTION = 'Protocol Renewal Reminders'), (SELECT PROTO_CORRESP_TYPE_CODE FROM IACUC_PROTOCOL_CORRESP_TYPE WHERE DESCRIPTION = 'Renewal Reminder Notification'), 60, 'admin', SYSDATE,SYS_GUID(), 1)
/
INSERT INTO IACUC_BATCH_CORRESP_DETAIL (BATCH_CORRESPONDENCE_DETAIL_ID, BATCH_CORRESPONDENCE_TYPE_CODE, PROTO_CORRESP_TYPE_CODE, DAYS_TO_EVENT, UPDATE_USER, UPDATE_TIMESTAMP, OBJ_ID, VER_NBR) 
    VALUES (SEQ_IACUC_BAT_CORRESP_DET_ID.NEXTVAL, (SELECT BATCH_CORRESPONDENCE_TYPE_CODE FROM IACUC_BATCH_CORRESPONDENCE WHERE DESCRIPTION = 'Protocol Renewal Reminders'), (SELECT PROTO_CORRESP_TYPE_CODE FROM IACUC_PROTOCOL_CORRESP_TYPE WHERE DESCRIPTION = 'Renewal Reminder Notification'), 15, 'admin', SYSDATE,SYS_GUID(), 1)
/
INSERT INTO IACUC_BATCH_CORRESP_DETAIL (BATCH_CORRESPONDENCE_DETAIL_ID, BATCH_CORRESPONDENCE_TYPE_CODE, PROTO_CORRESP_TYPE_CODE, DAYS_TO_EVENT, UPDATE_USER, UPDATE_TIMESTAMP, OBJ_ID, VER_NBR) 
    VALUES (SEQ_IACUC_BAT_CORRESP_DET_ID.NEXTVAL, (SELECT BATCH_CORRESPONDENCE_TYPE_CODE FROM IACUC_BATCH_CORRESPONDENCE WHERE DESCRIPTION = 'Reminder to IACUC Notifications'), (SELECT PROTO_CORRESP_TYPE_CODE FROM IACUC_PROTOCOL_CORRESP_TYPE WHERE DESCRIPTION = 'Notify IACUC Letter'), 15, 'admin', SYSDATE,SYS_GUID(), 1)
/

