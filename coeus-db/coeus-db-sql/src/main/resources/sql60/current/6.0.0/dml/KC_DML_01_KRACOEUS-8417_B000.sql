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

INSERT INTO PERSON_EDITABLE_FIELDS (PERSON_EDITABLE_FIELD_ID,MODULE_CODE,FIELD_NAME,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
    VALUES (SEQ_PERSON_EDITABLE_FIELD.NEXTVAL,(SELECT MODULE_CODE FROM COEUS_MODULE WHERE DESCRIPTION = 'Development Proposal'),'ageByFiscalYear','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PERSON_EDITABLE_FIELDS (PERSON_EDITABLE_FIELD_ID,MODULE_CODE,FIELD_NAME,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
    VALUES (SEQ_PERSON_EDITABLE_FIELD.NEXTVAL,(SELECT MODULE_CODE FROM COEUS_MODULE WHERE DESCRIPTION = 'Development Proposal'),'race','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PERSON_EDITABLE_FIELDS (PERSON_EDITABLE_FIELD_ID,MODULE_CODE,FIELD_NAME,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
    VALUES (SEQ_PERSON_EDITABLE_FIELD.NEXTVAL,(SELECT MODULE_CODE FROM COEUS_MODULE WHERE DESCRIPTION = 'Development Proposal'),'handicappedFlag','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PERSON_EDITABLE_FIELDS (PERSON_EDITABLE_FIELD_ID,MODULE_CODE,FIELD_NAME,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
    VALUES (SEQ_PERSON_EDITABLE_FIELD.NEXTVAL,(SELECT MODULE_CODE FROM COEUS_MODULE WHERE DESCRIPTION = 'Development Proposal'),'handicapType','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PERSON_EDITABLE_FIELDS (PERSON_EDITABLE_FIELD_ID,MODULE_CODE,FIELD_NAME,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
    VALUES (SEQ_PERSON_EDITABLE_FIELD.NEXTVAL,(SELECT MODULE_CODE FROM COEUS_MODULE WHERE DESCRIPTION = 'Development Proposal'),'veteranFlag','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PERSON_EDITABLE_FIELDS (PERSON_EDITABLE_FIELD_ID,MODULE_CODE,FIELD_NAME,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
    VALUES (SEQ_PERSON_EDITABLE_FIELD.NEXTVAL,(SELECT MODULE_CODE FROM COEUS_MODULE WHERE DESCRIPTION = 'Development Proposal'),'veteranType','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PERSON_EDITABLE_FIELDS (PERSON_EDITABLE_FIELD_ID,MODULE_CODE,FIELD_NAME,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
    VALUES (SEQ_PERSON_EDITABLE_FIELD.NEXTVAL,(SELECT MODULE_CODE FROM COEUS_MODULE WHERE DESCRIPTION = 'Development Proposal'),'hasVisa','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PERSON_EDITABLE_FIELDS (PERSON_EDITABLE_FIELD_ID,MODULE_CODE,FIELD_NAME,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
    VALUES (SEQ_PERSON_EDITABLE_FIELD.NEXTVAL,(SELECT MODULE_CODE FROM COEUS_MODULE WHERE DESCRIPTION = 'Development Proposal'),'visaCode','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PERSON_EDITABLE_FIELDS (PERSON_EDITABLE_FIELD_ID,MODULE_CODE,FIELD_NAME,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
    VALUES (SEQ_PERSON_EDITABLE_FIELD.NEXTVAL,(SELECT MODULE_CODE FROM COEUS_MODULE WHERE DESCRIPTION = 'Development Proposal'),'visaType','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PERSON_EDITABLE_FIELDS (PERSON_EDITABLE_FIELD_ID,MODULE_CODE,FIELD_NAME,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
    VALUES (SEQ_PERSON_EDITABLE_FIELD.NEXTVAL,(SELECT MODULE_CODE FROM COEUS_MODULE WHERE DESCRIPTION = 'Development Proposal'),'visaRenewalDate','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PERSON_EDITABLE_FIELDS (PERSON_EDITABLE_FIELD_ID,MODULE_CODE,FIELD_NAME,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
    VALUES (SEQ_PERSON_EDITABLE_FIELD.NEXTVAL,(SELECT MODULE_CODE FROM COEUS_MODULE WHERE DESCRIPTION = 'Development Proposal'),'directoryDepartment','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PERSON_EDITABLE_FIELDS (PERSON_EDITABLE_FIELD_ID,MODULE_CODE,FIELD_NAME,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
    VALUES (SEQ_PERSON_EDITABLE_FIELD.NEXTVAL,(SELECT MODULE_CODE FROM COEUS_MODULE WHERE DESCRIPTION = 'Development Proposal'),'vacationAccrualFlag','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PERSON_EDITABLE_FIELDS (PERSON_EDITABLE_FIELD_ID,MODULE_CODE,FIELD_NAME,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
    VALUES (SEQ_PERSON_EDITABLE_FIELD.NEXTVAL,(SELECT MODULE_CODE FROM COEUS_MODULE WHERE DESCRIPTION = 'Development Proposal'),'onSabbaticalFlag','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PERSON_EDITABLE_FIELDS (PERSON_EDITABLE_FIELD_ID,MODULE_CODE,FIELD_NAME,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
    VALUES (SEQ_PERSON_EDITABLE_FIELD.NEXTVAL,(SELECT MODULE_CODE FROM COEUS_MODULE WHERE DESCRIPTION = 'Development Proposal'),'idProvided','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PERSON_EDITABLE_FIELDS (PERSON_EDITABLE_FIELD_ID,MODULE_CODE,FIELD_NAME,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
    VALUES (SEQ_PERSON_EDITABLE_FIELD.NEXTVAL,(SELECT MODULE_CODE FROM COEUS_MODULE WHERE DESCRIPTION = 'Development Proposal'),'idVerified','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PERSON_EDITABLE_FIELDS (PERSON_EDITABLE_FIELD_ID,MODULE_CODE,FIELD_NAME,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
    VALUES (SEQ_PERSON_EDITABLE_FIELD.NEXTVAL,(SELECT MODULE_CODE FROM COEUS_MODULE WHERE DESCRIPTION = 'Development Proposal'),'countryOfCitizenship','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PERSON_EDITABLE_FIELDS (PERSON_EDITABLE_FIELD_ID,MODULE_CODE,FIELD_NAME,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
    VALUES (SEQ_PERSON_EDITABLE_FIELD.NEXTVAL,(SELECT MODULE_CODE FROM COEUS_MODULE WHERE DESCRIPTION = 'Development Proposal'),'citizenshipTypeCode','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PERSON_EDITABLE_FIELDS (PERSON_EDITABLE_FIELD_ID,MODULE_CODE,FIELD_NAME,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
    VALUES (SEQ_PERSON_EDITABLE_FIELD.NEXTVAL,(SELECT MODULE_CODE FROM COEUS_MODULE WHERE DESCRIPTION = 'Development Proposal'),'educationLevel','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PERSON_EDITABLE_FIELDS (PERSON_EDITABLE_FIELD_ID,MODULE_CODE,FIELD_NAME,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
    VALUES (SEQ_PERSON_EDITABLE_FIELD.NEXTVAL,(SELECT MODULE_CODE FROM COEUS_MODULE WHERE DESCRIPTION = 'Development Proposal'),'yearGraduated','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PERSON_EDITABLE_FIELDS (PERSON_EDITABLE_FIELD_ID,MODULE_CODE,FIELD_NAME,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
    VALUES (SEQ_PERSON_EDITABLE_FIELD.NEXTVAL,(SELECT MODULE_CODE FROM COEUS_MODULE WHERE DESCRIPTION = 'Development Proposal'),'major','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PERSON_EDITABLE_FIELDS (PERSON_EDITABLE_FIELD_ID,MODULE_CODE,FIELD_NAME,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
    VALUES (SEQ_PERSON_EDITABLE_FIELD.NEXTVAL,(SELECT MODULE_CODE FROM COEUS_MODULE WHERE DESCRIPTION = 'Development Proposal'),'degree','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO PERSON_EDITABLE_FIELDS (PERSON_EDITABLE_FIELD_ID,MODULE_CODE,FIELD_NAME,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
    VALUES (SEQ_PERSON_EDITABLE_FIELD.NEXTVAL,(SELECT MODULE_CODE FROM COEUS_MODULE WHERE DESCRIPTION = 'Development Proposal'),'school','Y','admin',SYSDATE,SYS_GUID(),1)
/
