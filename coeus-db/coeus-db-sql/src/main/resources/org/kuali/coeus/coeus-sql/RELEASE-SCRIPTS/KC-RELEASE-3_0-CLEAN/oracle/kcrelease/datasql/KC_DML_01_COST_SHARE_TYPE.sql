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

TRUNCATE TABLE COST_SHARE_TYPE DROP STORAGE
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (1,'funded','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (2,'Mandatory - Specified Amount/Percent','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (3,'Required - Non-Specified Amount/Percent','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (4,'Voluntary Commitment from Investigator','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (5,'OH Mandatory','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (6,'OH Required ','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (7,'OH Voluntary','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (8,'Other','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (9,'MF-Direct','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (10,'RF-Direct','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (11,'VF-Direct','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (12,'MNF-Outside Sources','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (13,'RNF-OutsiSourcesde','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (14,'VNF-Outside Sources','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (15,'MF-F&A','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (16,'RF-F&A','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (17,'VF-F&A','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (18,'MF-NonSalary','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (19,'RF-NonSalary','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (20,'VF-NonSalary','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (21,'MF-Tuition Subsidy','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (22,'RF-Tuition Subsidy','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (23,'VF-Tuition Subsidy','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (24,'MF-UROP','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (25,'RF-UROP','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (26,'VF-UROP','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (27,'MF-Unrecovered F&A','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (28,'RF-Unrecovered F&A','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (29,'VF-Unrecovered F&A','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (30,'MNF-Subrecipient','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (31,'RNF-Subrecipient','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (32,'VNF-Subrecipient','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (33,'MNF-NonFederal Sponsored Support','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (34,'RNF-NonFederal Sponsored Support','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (35,'VNF-NonFederal Sponsored Support','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (36,'MNF-Equipment','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (37,'RNF-Equipment','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (38,'VNF-Equipment','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (39,'MNF-Other','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (40,'RNF-Other','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (41,'VNF-Other','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (42,'RF-Salary & EB','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (43,'VF-Salary & EB','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (44,'MNF-Volunteer Services','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (45,'MF-Salary & EB','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (46,'RNF-Volunteer Services','admin',SYSDATE,SYS_GUID())
/
INSERT INTO COST_SHARE_TYPE (COST_SHARE_TYPE_CODE,DESCRIPTION,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
    VALUES (47,'VNF-Volunteer Services','admin',SYSDATE,SYS_GUID())
/
