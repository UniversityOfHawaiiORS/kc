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
TRUNCATE TABLE FREQUENCY
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('1','None',null,null,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('2','Monthly',0,1,'Y',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('3','Quarterly',0,3,'Y',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('4','Scheduled',null,null,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('5','One in advance',null,null,'N',null,1,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('6','Semi-annual',0,6,'Y',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('7','Annual',0,12,'Y',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('8','With renewal proposal',0,0,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('9','Bi-monthly',0,2,'Y',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('10','30 days after expiration',30,0,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('11','60 days after expiration',60,0,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('12','90 days after expiration',90,0,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('13','At expiration',0,0,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('14','As required',null,null,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('15','30 days prior to expiration date',null,null,'N',30,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('16','60 days prior to expiration date',null,null,'N',60,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('17','90 days prior to expiration date',null,null,'N',90,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('18','4 months prior to expiration date',null,null,'N',null,4,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('19','5 months prior to expiration date',null,null,'N',null,5,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('20','6 months prior to expiration date',null,null,'N',null,6,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('21','7 months prior to expiration date',null,null,'N',null,7,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('22','8 months prior to expiration date',null,null,'N',null,8,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('23','9 months prior to expiration date',null,null,'N',null,9,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('24','After each foreign trip',null,null,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('25','Unusual',null,null,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('26','Upon publication',null,null,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('27','30 days after effective date',30,null,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('28','4 months after expiration date',null,4,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('29','5 months after expiration date',null,5,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('30','6 months after expiration date',null,6,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('31','60 days after annual anniversary',60,12,'Y',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('32','30 days after annual anniversary',30,12,'Y',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('33','45 days after expiration',45,null,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('34','10 months prior to expiration date',null,null,'N',null,10,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('35','120 days prior to expiration',null,null,'N',120,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('36','45 days prior to expiration',null,null,'N',45,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('37','75 days prior to expiration date',null,null,'N',75,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('38','30 days after award effective date',30,null,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('39','6 months after award effective date',null,6,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('40','9 months after award effective date',null,9,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('41','Singular',null,null,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('42','1 Year after expiration',null,12,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('43','75 days after expiration',75,null,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('44','90 days after effective date',90,null,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('45','60 days after effective date',60,null,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('46','Quarterly - one month in advance',null,3,'Y',null,1,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('47','Quarterly - two months in advance',null,3,'Y',null,2,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('48','Quarterly - three months in advance',null,3,'Y',null,3,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('49','Annual - one month in advance',null,12,'Y',null,1,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('50','Annual - two months in advance',null,12,'Y',null,2,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('51','Annual - three months in advance',null,12,'Y',null,3,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('52','Semi-annual - one month in advance',null,6,'Y',null,1,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('53','Semi-annual - two months in advance',null,6,'Y',null,2,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('54','Semi-annual - three months in advance',null,6,'Y',null,3,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('55','90 days prior to anniversaries',null,12,'Y',90,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('56','15 Days After Each Quarter',15,3,'Y',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('57','10 months after effective date',null,null,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('58','15 days after expiration',null,0,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO FREQUENCY (FREQUENCY_CODE,DESCRIPTION,NUMBER_OF_DAYS,NUMBER_OF_MONTHS,REPEAT_FLAG,ADVANCE_NUMBER_OF_DAYS,ADVANCE_NUMBER_OF_MONTHS,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('59','60 days prior to anniversary date',null,null,'N',null,null,'admin',NOW(),UUID(),1)
/
delimiter ;