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

DELIMITER /
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Long' AND SEQUENCE_NUMBER = 1),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'Does this project involve human subjects?' AND SEQUENCE_NUMBER = 1),1,0,1,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Long' AND SEQUENCE_NUMBER = 1),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'Please indicate the name of the drug, device, vaccine or procedure.' AND SEQUENCE_NUMBER = 1),2,0,2,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Long' AND SEQUENCE_NUMBER = 1),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'Please indicate the total percentage of equity held in this entity.' AND SEQUENCE_NUMBER = 1),3,0,3,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Long' AND SEQUENCE_NUMBER = 1),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'For non-governmental sponsored projects, is the entity supporting full direct and indirect costs of this project? If a gift or Material Transfer Agreement indicate "Not Applicable."' AND SEQUENCE_NUMBER = 1),4,0,4,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Long' AND SEQUENCE_NUMBER = 1),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'State:' AND SEQUENCE_NUMBER = 1),5,0,5,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Long' AND SEQUENCE_NUMBER = 1),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'Start Date:' AND SEQUENCE_NUMBER = 1),6,0,6,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Long' AND SEQUENCE_NUMBER = 1),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'Are you involved in recruiting and/or obtaining consent of human subjects to participate in this study?' AND SEQUENCE_NUMBER = 1),7,1,1,'N','4','Y','admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Long' AND SEQUENCE_NUMBER = 1),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'Please indicate the name of the drug, device, vaccine or procedure.' AND SEQUENCE_NUMBER = 1),8,1,2,'N','4','Y','admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Long' AND SEQUENCE_NUMBER = 1),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'Are you a consultant with this entity?' AND SEQUENCE_NUMBER = 1),9,3,1,'N','8','5','admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Long' AND SEQUENCE_NUMBER = 1),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'End Date:' AND SEQUENCE_NUMBER = 1),10,6,1,'N','11','01/01/2010','admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Long' AND SEQUENCE_NUMBER = 1),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'Please indicate the type of equity interest that you, your spouse, registered domestic partner, or any dependent child(ren) have in this entity.' AND SEQUENCE_NUMBER = 1),11,7,1,'N','1','N','admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Long' AND SEQUENCE_NUMBER = 2),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'Does this project involve human subjects?' AND SEQUENCE_NUMBER = 1),1,0,1,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Long' AND SEQUENCE_NUMBER = 2),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'Please indicate the name of the drug, device, vaccine or procedure.' AND SEQUENCE_NUMBER = 1),2,0,2,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Long' AND SEQUENCE_NUMBER = 2),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'Please indicate the total percentage of equity held in this entity.' AND SEQUENCE_NUMBER = 1),3,0,3,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Long' AND SEQUENCE_NUMBER = 2),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'For non-governmental sponsored projects, is the entity supporting full direct and indirect costs of this project? If a gift or Material Transfer Agreement indicate "Not Applicable."' AND SEQUENCE_NUMBER = 1),4,0,4,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Long' AND SEQUENCE_NUMBER = 2),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'State:' AND SEQUENCE_NUMBER = 1),5,0,5,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Long' AND SEQUENCE_NUMBER = 2),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'Start Date:' AND SEQUENCE_NUMBER = 1),6,0,6,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Long' AND SEQUENCE_NUMBER = 2),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'Are you involved in recruiting and/or obtaining consent of human subjects to participate in this study?' AND SEQUENCE_NUMBER = 1),7,1,1,'N','4','Y','admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Long' AND SEQUENCE_NUMBER = 2),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'Please indicate the name of the drug, device, vaccine or procedure.' AND SEQUENCE_NUMBER = 1),8,1,2,'N','4','Y','admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Long' AND SEQUENCE_NUMBER = 2),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'Are you a consultant with this entity?' AND SEQUENCE_NUMBER = 1),9,3,1,'N','8','5','admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Long' AND SEQUENCE_NUMBER = 2),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'Country:' AND SEQUENCE_NUMBER = 1),10,5,1,'Y','4','Arizona','admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Long' AND SEQUENCE_NUMBER = 2),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'End Date:' AND SEQUENCE_NUMBER = 1),11,6,1,'N','11','01/01/2010','admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Long' AND SEQUENCE_NUMBER = 2),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'Please indicate the type of equity interest that you, your spouse, registered domestic partner, or any dependent child(ren) have in this entity.' AND SEQUENCE_NUMBER = 1),12,7,1,'N','1','N','admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Short' AND SEQUENCE_NUMBER = 1),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'Does this project involve human subjects?' AND SEQUENCE_NUMBER = 1),1,0,1,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Short' AND SEQUENCE_NUMBER = 1),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'Please indicate the type of equity interest that you, your spouse, registered domestic partner, or any dependent child(ren) have in this entity.' AND SEQUENCE_NUMBER = 1),2,0,2,'N',null,null,'admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_QUESTIONNAIRE_REF_ID VALUES(NULL)
/
INSERT INTO QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,QUESTION_SEQ_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM SEQ_QUESTIONNAIRE_REF_ID),(SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'IRB Short' AND SEQUENCE_NUMBER = 1),(SELECT QUESTION_REF_ID FROM QUESTION WHERE QUESTION = 'Are you the inventor of any drug, device, vaccine or procedure associated with this protocol?' AND SEQUENCE_NUMBER = 1),3,2,1,'Y','1','GOOG','admin',NOW(),UUID(),1)
/
DELIMITER ;