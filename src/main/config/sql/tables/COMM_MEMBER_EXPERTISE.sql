-- Table Script
CREATE TABLE COMM_MEMBER_EXPERTISE ( 
    COMM_MEMBER_EXPERTISE_ID_FK NUMBER(12,0) NOT NULL, 
    COMM_MEMBERSHIP_ID_FK NUMBER(12,0) NOT NULL, 
    MEMBERSHIP_ID VARCHAR2(10) NOT NULL, 
    SEQUENCE_NUMBER NUMBER(4,0) NOT NULL, 
    RESEARCH_AREA_CODE VARCHAR2(8) NOT NULL, 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2(60) NOT NULL, 
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2(36) DEFAULT SYS_GUID() NOT NULL);


-- Primary Key Constraint 
ALTER TABLE COMM_MEMBER_EXPERTISE 
ADD CONSTRAINT PK_COMM_MEMBER_EXPERTISE 
PRIMARY KEY (COMM_MEMBER_EXPERTISE_ID);

-- Foreign Key Constraint(s)
ALTER TABLE COMM_MEMBER_EXPERTISE 
ADD CONSTRAINT FK_COMM_MEMBER_EXPERTISE 
FOREIGN KEY (COMM_MEMBERSHIP_ID) 
REFERENCES COMM_MEMBERSHIPS (COMM_MEMBERSHIP_ID);

ALTER TABLE COMM_MEMBER_EXPERTISE 
ADD CONSTRAINT FK_COMM_MEMBER_EXPERTISE_2 
FOREIGN KEY (RESEARCH_AREA_CODE) 
REFERENCES RESEARCH_AREAS (RESEARCH_AREA_CODE); 