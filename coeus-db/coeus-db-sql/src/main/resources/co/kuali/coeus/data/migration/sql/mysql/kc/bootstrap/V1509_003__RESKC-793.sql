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

INSERT INTO SEQ_S2S_ERROR_ID VALUES(NULL);

INSERT INTO S2S_ERROR (S2S_ERROR_ID, MESSAGE_KEY, MESSAGE, FIX_LINK, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
VALUES ((SELECT (MAX(ID)) FROM SEQ_S2S_ERROR_ID), '/GrantApplication/Forms/NSF_CoverPage_1_6/Data-Management-Plan', 'Please upload file using attachment type Data Management Plan within the Proposal Attachments section for the NSF_CoverPage_1_6-V1.6 form.', 'abstractsAttachments',NOW(),'admin',1,UUID());

INSERT INTO SEQ_S2S_ERROR_ID VALUES(NULL);

INSERT INTO S2S_ERROR (S2S_ERROR_ID, MESSAGE_KEY, MESSAGE, FIX_LINK, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
VALUES ((SELECT (MAX(ID)) FROM SEQ_S2S_ERROR_ID), '/GrantApplication/Forms/NSF_CoverPage_1_6/Mentoring-Plan', 'Please upload file using attachment type Mentoring Plan within the Proposal Attachments section for the NSF_CoverPage_1_6-V1.6 form.', 'abstractsAttachments',NOW(),'admin',1,UUID());
