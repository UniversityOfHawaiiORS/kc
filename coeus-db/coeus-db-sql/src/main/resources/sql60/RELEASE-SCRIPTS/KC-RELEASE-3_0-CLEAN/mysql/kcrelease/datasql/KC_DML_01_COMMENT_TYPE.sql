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
TRUNCATE TABLE COMMENT_TYPE
/
INSERT INTO COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('1','Invoice Instructions','Y','N','N','admin',NOW(),UUID(),1)
/
INSERT INTO COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('2','General Comments','Y','N','Y','admin',NOW(),UUID(),1)
/
INSERT INTO COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('3','Fiscal Report Comments','Y','N','Y','admin',NOW(),UUID(),1)
/
INSERT INTO COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('4','Intellectual Property Comments','Y','N','Y','admin',NOW(),UUID(),1)
/
INSERT INTO COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('5','Procurement Comments','Y','N','Y','admin',NOW(),UUID(),1)
/
INSERT INTO COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('6','Property Comments','Y','N','Y','admin',NOW(),UUID(),1)
/
INSERT INTO COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('7','Special Rate','N','N','N','admin',NOW(),UUID(),1)
/
INSERT INTO COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('8','Indirect Cost Comments','N','N','N','admin',NOW(),UUID(),1)
/
INSERT INTO COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('9','Cost Sharing Comments','Y','N','N','admin',NOW(),UUID(),1)
/
INSERT INTO COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('10','Special Review Comments','N','N','N','admin',NOW(),UUID(),1)
/
INSERT INTO COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('12','Proposal Summary','N','N','N','admin',NOW(),UUID(),1)
/
INSERT INTO COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('13','Proposal Comments','N','N','N','admin',NOW(),UUID(),1)
/
INSERT INTO COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('16','Proposal IP Review Comment','N','N','N','admin',NOW(),UUID(),1)
/
INSERT INTO COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('17','Proposal IP Review Comment','N','N','N','admin',NOW(),UUID(),1)
/
INSERT INTO COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('18','Pre-Award Sponsor Auth Comments ','N','N','N','admin',NOW(),UUID(),1)
/
INSERT INTO COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('19','Pre-Award Institutional Auth Comments','N','N','N','admin',NOW(),UUID(),1)
/
INSERT INTO COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('20','Benefits Rates Comments','N','N','N','admin',NOW(),UUID(),1)
/
INSERT INTO COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('21','Current Action Comments','N','N','N','admin',NOW(),UUID(),1)
/
delimiter ;
