set define off
set sqlblanklines on

spool KC-1364.sql.log


alter table SUBAWARD_AMOUNT_INFO 
add ( TRANSACTION_TYPE_CODE varchar2(4) );

update SUBAWARD_AMOUNT_INFO set TRANSACTION_TYPE_CODE = 1 where TRANSACTION_TYPE_CODE is null;

CREATE TABLE SUBAWARD_TRANSACTION_TYPE (
        TRANSACTION_TYPE_CODE VARCHAR2(3) NOT NULL,
        DESCRIPTION VARCHAR2(200) NOT NULL,
        UPDATE_TIMESTAMP DATE NOT NULL,
        UPDATE_USER VARCHAR2(60) NOT NULL,
        OBJ_ID VARCHAR2(36) NOT NULL);


ALTER TABLE SUBAWARD_TRANSACTION_TYPE
ADD CONSTRAINT TRANSACTION_TYPE_CODE_PK
PRIMARY KEY (TRANSACTION_TYPE_CODE) ;

insert into subaward_transaction_type 
(OBJ_ID,TRANSACTION_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER)
values
(sys_guid(),'1','Initial',sysdate,'gouldner');

insert into subaward_transaction_type 
(OBJ_ID,TRANSACTION_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER)
values
(sys_guid(),'2','Amendment $',sysdate,'gouldner');

insert into subaward_transaction_type 
(OBJ_ID,TRANSACTION_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER)
values
(sys_guid(),'3','Amendment',sysdate,'gouldner');

insert into subaward_transaction_type 
(OBJ_ID,TRANSACTION_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER)
values
(sys_guid(),'4','Rebuild',sysdate,'gouldner');

insert into subaward_transaction_type 
(OBJ_ID,TRANSACTION_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER)
values


