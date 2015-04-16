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

INSERT INTO COMM_MEMBER_ROLES (COMM_MEMBER_ROLES_ID,COMM_MEMBERSHIP_ID_FK,MEMBERSHIP_ROLE_CODE,START_DATE,END_DATE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_COMMITTEE_ID.NEXTVAL,(SELECT COMM_MEMBERSHIP_ID FROM COMM_MEMBERSHIPS WHERE PERSON_ID = '10000000005'),(SELECT MEMBERSHIP_ROLE_CODE FROM MEMBERSHIP_ROLE WHERE DESCRIPTION = 'Chair'),TO_DATE('20100701','YYYYMMDD'),TO_DATE('20150701','YYYYMMDD'),'quickstart',SYSDATE,SYS_GUID(),0)
/
INSERT INTO COMM_MEMBER_ROLES (COMM_MEMBER_ROLES_ID,COMM_MEMBERSHIP_ID_FK,MEMBERSHIP_ROLE_CODE,START_DATE,END_DATE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_COMMITTEE_ID.NEXTVAL,(SELECT COMM_MEMBERSHIP_ID FROM COMM_MEMBERSHIPS WHERE PERSON_ID = '10000000006'),(SELECT MEMBERSHIP_ROLE_CODE FROM MEMBERSHIP_ROLE WHERE DESCRIPTION = 'Member'),TO_DATE('20100701','YYYYMMDD'),TO_DATE('20150701','YYYYMMDD'),'quickstart',SYSDATE,SYS_GUID(),0)
/
INSERT INTO COMM_MEMBER_ROLES (COMM_MEMBER_ROLES_ID,COMM_MEMBERSHIP_ID_FK,MEMBERSHIP_ROLE_CODE,START_DATE,END_DATE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_COMMITTEE_ID.NEXTVAL,(SELECT COMM_MEMBERSHIP_ID FROM COMM_MEMBERSHIPS WHERE PERSON_ID = '10000000007'),(SELECT MEMBERSHIP_ROLE_CODE FROM MEMBERSHIP_ROLE WHERE DESCRIPTION = 'Alternate'),TO_DATE('20100701','YYYYMMDD'),TO_DATE('20150701','YYYYMMDD'),'quickstart',SYSDATE,SYS_GUID(),0)
/
INSERT INTO COMM_MEMBER_ROLES (COMM_MEMBER_ROLES_ID,COMM_MEMBERSHIP_ID_FK,MEMBERSHIP_ROLE_CODE,START_DATE,END_DATE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_COMMITTEE_ID.NEXTVAL,(SELECT COMM_MEMBERSHIP_ID FROM COMM_MEMBERSHIPS WHERE PERSON_ID = '10000000008'),(SELECT MEMBERSHIP_ROLE_CODE FROM MEMBERSHIP_ROLE WHERE DESCRIPTION = 'Member'),TO_DATE('20080101','YYYYMMDD'),TO_DATE('20100701','YYYYMMDD'),'quickstart',SYSDATE,SYS_GUID(),0)
/
INSERT INTO COMM_MEMBER_ROLES (COMM_MEMBER_ROLES_ID,COMM_MEMBERSHIP_ID_FK,MEMBERSHIP_ROLE_CODE,START_DATE,END_DATE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_COMMITTEE_ID.NEXTVAL,(SELECT COMM_MEMBERSHIP_ID FROM COMM_MEMBERSHIPS WHERE PERSON_ID = '10000000008'),(SELECT MEMBERSHIP_ROLE_CODE FROM MEMBERSHIP_ROLE WHERE DESCRIPTION = 'Inactive'),TO_DATE('20100702','YYYYMMDD'),TO_DATE('20120701','YYYYMMDD'),'quickstart',SYSDATE,SYS_GUID(),0)
/
INSERT INTO COMM_MEMBER_ROLES (COMM_MEMBER_ROLES_ID,COMM_MEMBERSHIP_ID_FK,MEMBERSHIP_ROLE_CODE,START_DATE,END_DATE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_COMMITTEE_ID.NEXTVAL,(SELECT COMM_MEMBERSHIP_ID FROM COMM_MEMBERSHIPS WHERE PERSON_ID = '10000000008'),(SELECT MEMBERSHIP_ROLE_CODE FROM MEMBERSHIP_ROLE WHERE DESCRIPTION = 'Member'),TO_DATE('20120702','YYYYMMDD'),TO_DATE('20150701','YYYYMMDD'),'quickstart',SYSDATE,SYS_GUID(),0)
/
INSERT INTO COMM_MEMBER_ROLES (COMM_MEMBER_ROLES_ID,COMM_MEMBERSHIP_ID_FK,MEMBERSHIP_ROLE_CODE,START_DATE,END_DATE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_COMMITTEE_ID.NEXTVAL,(SELECT COMM_MEMBERSHIP_ID FROM COMM_MEMBERSHIPS WHERE PERSON_ID = '10000000059'),(SELECT MEMBERSHIP_ROLE_CODE FROM MEMBERSHIP_ROLE WHERE DESCRIPTION = 'Member - Scientist'),TO_DATE('20010701','YYYYMMDD'),TO_DATE('20100701','YYYYMMDD'),'quickstart',SYSDATE,SYS_GUID(),0)
/
INSERT INTO COMM_MEMBER_ROLES (COMM_MEMBER_ROLES_ID,COMM_MEMBERSHIP_ID_FK,MEMBERSHIP_ROLE_CODE,START_DATE,END_DATE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_COMMITTEE_ID.NEXTVAL,(SELECT COMM_MEMBERSHIP_ID FROM COMM_MEMBERSHIPS WHERE PERSON_ID = '10000000004'),(SELECT MEMBERSHIP_ROLE_CODE FROM MEMBERSHIP_ROLE WHERE DESCRIPTION = 'Prisoner Representative'),TO_DATE('20100701','YYYYMMDD'),TO_DATE('20130701','YYYYMMDD'),'quickstart',SYSDATE,SYS_GUID(),0)
/
INSERT INTO COMM_MEMBER_ROLES (COMM_MEMBER_ROLES_ID,COMM_MEMBERSHIP_ID_FK,MEMBERSHIP_ROLE_CODE,START_DATE,END_DATE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_COMMITTEE_ID.NEXTVAL,(SELECT COMM_MEMBERSHIP_ID FROM COMM_MEMBERSHIPS WHERE PERSON_ID = '10000000002'),(SELECT MEMBERSHIP_ROLE_CODE FROM MEMBERSHIP_ROLE WHERE DESCRIPTION = 'Alternate'),TO_DATE('20100701','YYYYMMDD'),TO_DATE('20150701','YYYYMMDD'),'quickstart',SYSDATE,SYS_GUID(),0)
/
INSERT INTO COMM_MEMBER_ROLES (COMM_MEMBER_ROLES_ID,COMM_MEMBERSHIP_ID_FK,MEMBERSHIP_ROLE_CODE,START_DATE,END_DATE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_COMMITTEE_ID.NEXTVAL,(SELECT COMM_MEMBERSHIP_ID FROM COMM_MEMBERSHIPS WHERE PERSON_ID = '10000000002'),(SELECT MEMBERSHIP_ROLE_CODE FROM MEMBERSHIP_ROLE WHERE DESCRIPTION = 'Member'),TO_DATE('20100701','YYYYMMDD'),TO_DATE('20150701','YYYYMMDD'),'quickstart',SYSDATE,SYS_GUID(),0)
/
