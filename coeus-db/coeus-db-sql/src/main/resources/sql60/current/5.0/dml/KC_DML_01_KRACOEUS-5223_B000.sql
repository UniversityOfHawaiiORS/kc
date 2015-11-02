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

INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_TYPE_ID, MODULE_CODE, ACTION_CODE, DESCRIPTION, SUBJECT, MESSAGE, PROMPT_USER, SEND_NOTIFICATION, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, 1, '552','Sent when a protocol is added as a special review in  an award, that will result in IRB Linking.',
	'Special Review Inserted - {AWARD_NUMBER}',
	'Special Review Inserted - {AWARD_NUMBER}',  'Y', 'Y', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_TYPE_ID, MODULE_CODE, ACTION_CODE, DESCRIPTION, SUBJECT, MESSAGE, PROMPT_USER, SEND_NOTIFICATION, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, 1, '553','Sent when a linked award is removed from the award.',
	'Special Review Deleted - {AWARD_NUMBER}',
	'Special Review Deleted - {AWARD_NUMBER}',  'Y', 'Y', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 1 and ACTION_CODE = '552'), 'KC-WKFLW:Unit Administrator', 
		'2', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 1 and ACTION_CODE = '553'), 'KC-WKFLW:Unit Administrator', 
		'2', 'admin', SYSDATE, 1, SYS_GUID())
/

insert into NOTIFICATION_MODULE_ROLE (NOTIFICATION_MODULE_ROLE_ID, MODULE_CODE, ROLE_NAME, OBJ_ID, VER_NBR, UPDATE_TIMESTAMP, UPDATE_USER)
	VALUES (SEQ_NTFCTN_MODULE_ROLE_ID.NEXTVAL, 1, 'KC-WKFLW:Unit Administrator', sys_guid(), 1, sysdate, 'admin')
/

insert into NOTIFICATION_MDL_ROLE_QLFR (NOTIFICATION_MDL_ROLE_QLFR_ID, NOTIFICATION_MODULE_ROLE_ID, QUALIFIER, OBJ_ID, VER_NBR, UPDATE_TIMESTAMP, UPDATE_USER)
	VALUES (SEQ_NTFCTN_MDL_ROLE_QLFR_ID.NEXTVAL, SEQ_NTFCTN_MODULE_ROLE_ID.CURRVAL ,
			'unitNumber', sys_guid(), 1, sysdate, 'admin')
/

insert into NOTIFICATION_MODULE_ROLE (NOTIFICATION_MODULE_ROLE_ID, MODULE_CODE, ROLE_NAME, OBJ_ID, VER_NBR, UPDATE_TIMESTAMP, UPDATE_USER)
	VALUES (SEQ_NTFCTN_MODULE_ROLE_ID.NEXTVAL, 1, 'KC-AWARD:Investigators', sys_guid(), 1, sysdate, 'admin')
/

insert into NOTIFICATION_MDL_ROLE_QLFR (NOTIFICATION_MDL_ROLE_QLFR_ID, NOTIFICATION_MODULE_ROLE_ID, QUALIFIER, OBJ_ID, VER_NBR, UPDATE_TIMESTAMP, UPDATE_USER)
	VALUES (SEQ_NTFCTN_MDL_ROLE_QLFR_ID.NEXTVAL, (select NOTIFICATION_MODULE_ROLE_ID from NOTIFICATION_MODULE_ROLE where MODULE_CODE = 1 and ROLE_NAME = 'KC-AWARD:Investigators'),
			'award', sys_guid(), 1, sysdate, 'admin')
/

insert into NOTIFICATION_MODULE_ROLE (NOTIFICATION_MODULE_ROLE_ID, MODULE_CODE, ROLE_NAME, OBJ_ID, VER_NBR, UPDATE_TIMESTAMP, UPDATE_USER)
	VALUES (SEQ_NTFCTN_MODULE_ROLE_ID.NEXTVAL, 1, 'KC-AWARD:All Unit Administrators', sys_guid(), 1, sysdate, 'admin')
/

insert into NOTIFICATION_MDL_ROLE_QLFR (NOTIFICATION_MDL_ROLE_QLFR_ID, NOTIFICATION_MODULE_ROLE_ID, QUALIFIER, OBJ_ID, VER_NBR, UPDATE_TIMESTAMP, UPDATE_USER)
	VALUES (SEQ_NTFCTN_MDL_ROLE_QLFR_ID.NEXTVAL, (select NOTIFICATION_MODULE_ROLE_ID from NOTIFICATION_MODULE_ROLE where MODULE_CODE = 1 and ROLE_NAME = 'KC-AWARD:All Unit Administrators'),
			'award', sys_guid(), 1, sysdate, 'admin')
/

-- Report Tracking Notifications
INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_TYPE_ID, MODULE_CODE, ACTION_CODE, DESCRIPTION, SUBJECT, MESSAGE, PROMPT_USER, SEND_NOTIFICATION, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, 1, '401','Fiscal Report 90 days',
	'Fiscal Report 90 days',
	'<table><tr><th>Award Number</th><th>Sponsor</th><th>Sponsor Award Number</th><th>Award Title</th><th>PI</th><th>Unit</th><th>Account Number</th><th>Report Type</th><th>Due Date</th></tr>{BEGIN_REPEAT_SECTION}<tr><td>{AWARD_NUMBER}</td><td>{SPONSOR_NAME}</td><td>{SPONSOR_AWARD_NUMBER}</td><td>{AWARD_TITLE}</td><td>{PI_NAME}</td><td>{LEAD_UNIT_NAME}</td><td>{ACCOUNT_NUMBER}</td><td>{REPORT_TYPE}</td><td>{REPORT_DUE_DATE}</td></tr>{END_REPEAT_SECTION}</table>',  'N', 'Y', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 1 and ACTION_CODE = '401'), 'KC-WKFLW:Unit Administrator', 
		'2', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_TYPE_ID, MODULE_CODE, ACTION_CODE, DESCRIPTION, SUBJECT, MESSAGE, PROMPT_USER, SEND_NOTIFICATION, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, 1, '402','Fiscal Report 60 days',
	'Fiscal Report 60 days',
	'<table><tr><th>Award Number</th><th>Sponsor</th><th>Sponsor Award Number</th><th>Award Title</th><th>PI</th><th>Unit</th><th>Account Number</th><th>Report Type</th><th>Due Date</th></tr>{BEGIN_REPEAT_SECTION}<tr><td>{AWARD_NUMBER}</td><td>{SPONSOR_NAME}</td><td>{SPONSOR_AWARD_NUMBER}</td><td>{AWARD_TITLE}</td><td>{PI_NAME}</td><td>{LEAD_UNIT_NAME}</td><td>{ACCOUNT_NUMBER}</td><td>{REPORT_TYPE}</td><td>{REPORT_DUE_DATE}</td></tr>{END_REPEAT_SECTION}</table>',  'N', 'Y', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 1 and ACTION_CODE = '402'), 'KC-WKFLW:Unit Administrator', 
		'2', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_TYPE_ID, MODULE_CODE, ACTION_CODE, DESCRIPTION, SUBJECT, MESSAGE, PROMPT_USER, SEND_NOTIFICATION, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, 1, '403','Fiscal Report 30 days',
	'Fiscal Report 30 days',
	'<table><tr><th>Award Number</th><th>Sponsor</th><th>Sponsor Award Number</th><th>Award Title</th><th>PI</th><th>Unit</th><th>Account Number</th><th>Report Type</th><th>Due Date</th></tr>{BEGIN_REPEAT_SECTION}<tr><td>{AWARD_NUMBER}</td><td>{SPONSOR_NAME}</td><td>{SPONSOR_AWARD_NUMBER}</td><td>{AWARD_TITLE}</td><td>{PI_NAME}</td><td>{LEAD_UNIT_NAME}</td><td>{ACCOUNT_NUMBER}</td><td>{REPORT_TYPE}</td><td>{REPORT_DUE_DATE}</td></tr>{END_REPEAT_SECTION}</table>',  'N', 'Y', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 1 and ACTION_CODE = '403'), 'KC-WKFLW:Unit Administrator', 
		'2', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_TYPE_ID, MODULE_CODE, ACTION_CODE, DESCRIPTION, SUBJECT, MESSAGE, PROMPT_USER, SEND_NOTIFICATION, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, 1, '404','Fiscal Report Overdue',
	'Fiscal Report Overdue',
	'<table><tr><th>Award Number</th><th>Sponsor</th><th>Sponsor Award Number</th><th>Award Title</th><th>PI</th><th>Unit</th><th>Account Number</th><th>Report Type</th><th>Due Date</th></tr>{BEGIN_REPEAT_SECTION}<tr><td>{AWARD_NUMBER}</td><td>{SPONSOR_NAME}</td><td>{SPONSOR_AWARD_NUMBER}</td><td>{AWARD_TITLE}</td><td>{PI_NAME}</td><td>{LEAD_UNIT_NAME}</td><td>{ACCOUNT_NUMBER}</td><td>{REPORT_TYPE}</td><td>{REPORT_DUE_DATE}</td></tr>{END_REPEAT_SECTION}</table>',  'N', 'Y', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 1 and ACTION_CODE = '404'), 'KC-WKFLW:Unit Administrator', 
		'2', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_TYPE_ID, MODULE_CODE, ACTION_CODE, DESCRIPTION, SUBJECT, MESSAGE, PROMPT_USER, SEND_NOTIFICATION, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, 1, '405','Property report 90 days',
	'Property report 90 days',
	'<table><tr><th>Award Number</th><th>Sponsor</th><th>Sponsor Award Number</th><th>Award Title</th><th>PI</th><th>Unit</th><th>Account Number</th><th>Report Type</th><th>Due Date</th></tr>{BEGIN_REPEAT_SECTION}<tr><td>{AWARD_NUMBER}</td><td>{SPONSOR_NAME}</td><td>{SPONSOR_AWARD_NUMBER}</td><td>{AWARD_TITLE}</td><td>{PI_NAME}</td><td>{LEAD_UNIT_NAME}</td><td>{ACCOUNT_NUMBER}</td><td>{REPORT_TYPE}</td><td>{REPORT_DUE_DATE}</td></tr>{END_REPEAT_SECTION}</table>',  'N', 'Y', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 1 and ACTION_CODE = '405'), 'KC-WKFLW:Unit Administrator', 
		'2', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_TYPE_ID, MODULE_CODE, ACTION_CODE, DESCRIPTION, SUBJECT, MESSAGE, PROMPT_USER, SEND_NOTIFICATION, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, 1, '406','Property report 60 days',
	'Property report 60 days',
	'<table><tr><th>Award Number</th><th>Sponsor</th><th>Sponsor Award Number</th><th>Award Title</th><th>PI</th><th>Unit</th><th>Account Number</th><th>Report Type</th><th>Due Date</th></tr>{BEGIN_REPEAT_SECTION}<tr><td>{AWARD_NUMBER}</td><td>{SPONSOR_NAME}</td><td>{SPONSOR_AWARD_NUMBER}</td><td>{AWARD_TITLE}</td><td>{PI_NAME}</td><td>{LEAD_UNIT_NAME}</td><td>{ACCOUNT_NUMBER}</td><td>{REPORT_TYPE}</td><td>{REPORT_DUE_DATE}</td></tr>{END_REPEAT_SECTION}</table>',  'N', 'Y', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 1 and ACTION_CODE = '406'), 'KC-WKFLW:Unit Administrator', 
		'2', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_TYPE_ID, MODULE_CODE, ACTION_CODE, DESCRIPTION, SUBJECT, MESSAGE, PROMPT_USER, SEND_NOTIFICATION, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, 1, '407','Property report 30 days',
	'Property report 30 days',
	'<table><tr><th>Award Number</th><th>Sponsor</th><th>Sponsor Award Number</th><th>Award Title</th><th>PI</th><th>Unit</th><th>Account Number</th><th>Report Type</th><th>Due Date</th></tr>{BEGIN_REPEAT_SECTION}<tr><td>{AWARD_NUMBER}</td><td>{SPONSOR_NAME}</td><td>{SPONSOR_AWARD_NUMBER}</td><td>{AWARD_TITLE}</td><td>{PI_NAME}</td><td>{LEAD_UNIT_NAME}</td><td>{ACCOUNT_NUMBER}</td><td>{REPORT_TYPE}</td><td>{REPORT_DUE_DATE}</td></tr>{END_REPEAT_SECTION}</table>',  'N', 'Y', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 1 and ACTION_CODE = '407'), 'KC-WKFLW:Unit Administrator', 
		'2', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_TYPE_ID, MODULE_CODE, ACTION_CODE, DESCRIPTION, SUBJECT, MESSAGE, PROMPT_USER, SEND_NOTIFICATION, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, 1, '408','Property report Overdue',
	'Property report Overdue',
	'<table><tr><th>Award Number</th><th>Sponsor</th><th>Sponsor Award Number</th><th>Award Title</th><th>PI</th><th>Unit</th><th>Account Number</th><th>Report Type</th><th>Due Date</th></tr>{BEGIN_REPEAT_SECTION}<tr><td>{AWARD_NUMBER}</td><td>{SPONSOR_NAME}</td><td>{SPONSOR_AWARD_NUMBER}</td><td>{AWARD_TITLE}</td><td>{PI_NAME}</td><td>{LEAD_UNIT_NAME}</td><td>{ACCOUNT_NUMBER}</td><td>{REPORT_TYPE}</td><td>{REPORT_DUE_DATE}</td></tr>{END_REPEAT_SECTION}</table>',  'N', 'Y', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 1 and ACTION_CODE = '408'), 'KC-WKFLW:Unit Administrator', 
		'2', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_TYPE_ID, MODULE_CODE, ACTION_CODE, DESCRIPTION, SUBJECT, MESSAGE, PROMPT_USER, SEND_NOTIFICATION, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, 1, '409','Intellectual Property report 90 days',
	'Intellectual Property report 90 days',
	'<table><tr><th>Award Number</th><th>Sponsor</th><th>Sponsor Award Number</th><th>Award Title</th><th>PI</th><th>Unit</th><th>Account Number</th><th>Report Type</th><th>Due Date</th></tr>{BEGIN_REPEAT_SECTION}<tr><td>{AWARD_NUMBER}</td><td>{SPONSOR_NAME}</td><td>{SPONSOR_AWARD_NUMBER}</td><td>{AWARD_TITLE}</td><td>{PI_NAME}</td><td>{LEAD_UNIT_NAME}</td><td>{ACCOUNT_NUMBER}</td><td>{REPORT_TYPE}</td><td>{REPORT_DUE_DATE}</td></tr>{END_REPEAT_SECTION}</table>',  'N', 'Y', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 1 and ACTION_CODE = '409'), 'KC-WKFLW:Unit Administrator', 
		'2', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_TYPE_ID, MODULE_CODE, ACTION_CODE, DESCRIPTION, SUBJECT, MESSAGE, PROMPT_USER, SEND_NOTIFICATION, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, 1, '410','Intellectual Property report 60 days',
	'Intellectual Property report 60 days',
	'<table><tr><th>Award Number</th><th>Sponsor</th><th>Sponsor Award Number</th><th>Award Title</th><th>PI</th><th>Unit</th><th>Account Number</th><th>Report Type</th><th>Due Date</th></tr>{BEGIN_REPEAT_SECTION}<tr><td>{AWARD_NUMBER}</td><td>{SPONSOR_NAME}</td><td>{SPONSOR_AWARD_NUMBER}</td><td>{AWARD_TITLE}</td><td>{PI_NAME}</td><td>{LEAD_UNIT_NAME}</td><td>{ACCOUNT_NUMBER}</td><td>{REPORT_TYPE}</td><td>{REPORT_DUE_DATE}</td></tr>{END_REPEAT_SECTION}</table>',  'N', 'Y', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 1 and ACTION_CODE = '410'), 'KC-WKFLW:Unit Administrator', 
		'2', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_TYPE_ID, MODULE_CODE, ACTION_CODE, DESCRIPTION, SUBJECT, MESSAGE, PROMPT_USER, SEND_NOTIFICATION, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, 1, '411','Intellectual Property report 30 days',
	'Intellectual Property report 30 days',
	'<table><tr><th>Award Number</th><th>Sponsor</th><th>Sponsor Award Number</th><th>Award Title</th><th>PI</th><th>Unit</th><th>Account Number</th><th>Report Type</th><th>Due Date</th></tr>{BEGIN_REPEAT_SECTION}<tr><td>{AWARD_NUMBER}</td><td>{SPONSOR_NAME}</td><td>{SPONSOR_AWARD_NUMBER}</td><td>{AWARD_TITLE}</td><td>{PI_NAME}</td><td>{LEAD_UNIT_NAME}</td><td>{ACCOUNT_NUMBER}</td><td>{REPORT_TYPE}</td><td>{REPORT_DUE_DATE}</td></tr>{END_REPEAT_SECTION}</table>',  'N', 'Y', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 1 and ACTION_CODE = '411'), 'KC-WKFLW:Unit Administrator', 
		'2', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_TYPE_ID, MODULE_CODE, ACTION_CODE, DESCRIPTION, SUBJECT, MESSAGE, PROMPT_USER, SEND_NOTIFICATION, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, 1, '412','Intellectual Property report Overdue',
	'Intellectual Property report Overdue',
	'<table><tr><th>Award Number</th><th>Sponsor</th><th>Sponsor Award Number</th><th>Award Title</th><th>PI</th><th>Unit</th><th>Account Number</th><th>Report Type</th><th>Due Date</th></tr>{BEGIN_REPEAT_SECTION}<tr><td>{AWARD_NUMBER}</td><td>{SPONSOR_NAME}</td><td>{SPONSOR_AWARD_NUMBER}</td><td>{AWARD_TITLE}</td><td>{PI_NAME}</td><td>{LEAD_UNIT_NAME}</td><td>{ACCOUNT_NUMBER}</td><td>{REPORT_TYPE}</td><td>{REPORT_DUE_DATE}</td></tr>{END_REPEAT_SECTION}</table>',  'N', 'Y', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 1 and ACTION_CODE = '412'), 'KC-WKFLW:Unit Administrator', 
		'2', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_TYPE_ID, MODULE_CODE, ACTION_CODE, DESCRIPTION, SUBJECT, MESSAGE, PROMPT_USER, SEND_NOTIFICATION, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, 1, '413','Technical management report 90 days',
	'Technical management report 90 days',
	'<table><tr><th>Award Number</th><th>Sponsor</th><th>Sponsor Award Number</th><th>Award Title</th><th>PI</th><th>Unit</th><th>Account Number</th><th>Report Type</th><th>Due Date</th></tr>{BEGIN_REPEAT_SECTION}<tr><td>{AWARD_NUMBER}</td><td>{SPONSOR_NAME}</td><td>{SPONSOR_AWARD_NUMBER}</td><td>{AWARD_TITLE}</td><td>{PI_NAME}</td><td>{LEAD_UNIT_NAME}</td><td>{ACCOUNT_NUMBER}</td><td>{REPORT_TYPE}</td><td>{REPORT_DUE_DATE}</td></tr>{END_REPEAT_SECTION}</table>',  'N', 'Y', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 1 and ACTION_CODE = '413'), 'KC-WKFLW:Unit Administrator', 
		'2', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_TYPE_ID, MODULE_CODE, ACTION_CODE, DESCRIPTION, SUBJECT, MESSAGE, PROMPT_USER, SEND_NOTIFICATION, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, 1, '414','Technical management report 60 days',
	'Technical management report 60 days',
	'<table><tr><th>Award Number</th><th>Sponsor</th><th>Sponsor Award Number</th><th>Award Title</th><th>PI</th><th>Unit</th><th>Account Number</th><th>Report Type</th><th>Due Date</th></tr>{BEGIN_REPEAT_SECTION}<tr><td>{AWARD_NUMBER}</td><td>{SPONSOR_NAME}</td><td>{SPONSOR_AWARD_NUMBER}</td><td>{AWARD_TITLE}</td><td>{PI_NAME}</td><td>{LEAD_UNIT_NAME}</td><td>{ACCOUNT_NUMBER}</td><td>{REPORT_TYPE}</td><td>{REPORT_DUE_DATE}</td></tr>{END_REPEAT_SECTION}</table>',  'N', 'Y', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 1 and ACTION_CODE = '414'), 'KC-WKFLW:Unit Administrator', 
		'2', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_TYPE_ID, MODULE_CODE, ACTION_CODE, DESCRIPTION, SUBJECT, MESSAGE, PROMPT_USER, SEND_NOTIFICATION, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, 1, '415','Technical management report 30 days',
	'Technical management report 30 days',
	'<table><tr><th>Award Number</th><th>Sponsor</th><th>Sponsor Award Number</th><th>Award Title</th><th>PI</th><th>Unit</th><th>Account Number</th><th>Report Type</th><th>Due Date</th></tr>{BEGIN_REPEAT_SECTION}<tr><td>{AWARD_NUMBER}</td><td>{SPONSOR_NAME}</td><td>{SPONSOR_AWARD_NUMBER}</td><td>{AWARD_TITLE}</td><td>{PI_NAME}</td><td>{LEAD_UNIT_NAME}</td><td>{ACCOUNT_NUMBER}</td><td>{REPORT_TYPE}</td><td>{REPORT_DUE_DATE}</td></tr>{END_REPEAT_SECTION}</table>',  'N', 'Y', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 1 and ACTION_CODE = '415'), 'KC-WKFLW:Unit Administrator', 
		'2', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_TYPE_ID, MODULE_CODE, ACTION_CODE, DESCRIPTION, SUBJECT, MESSAGE, PROMPT_USER, SEND_NOTIFICATION, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, 1, '416','Technical management report Overdue',
	'Technical management report Overdue',
	'<table><tr><th>Award Number</th><th>Sponsor</th><th>Sponsor Award Number</th><th>Award Title</th><th>PI</th><th>Unit</th><th>Account Number</th><th>Report Type</th><th>Due Date</th></tr>{BEGIN_REPEAT_SECTION}<tr><td>{AWARD_NUMBER}</td><td>{SPONSOR_NAME}</td><td>{SPONSOR_AWARD_NUMBER}</td><td>{AWARD_TITLE}</td><td>{PI_NAME}</td><td>{LEAD_UNIT_NAME}</td><td>{ACCOUNT_NUMBER}</td><td>{REPORT_TYPE}</td><td>{REPORT_DUE_DATE}</td></tr>{END_REPEAT_SECTION}</table>',  'N', 'Y', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 1 and ACTION_CODE = '416'), 'KC-WKFLW:Unit Administrator', 
		'2', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_TYPE_ID, MODULE_CODE, ACTION_CODE, DESCRIPTION, SUBJECT, MESSAGE, PROMPT_USER, SEND_NOTIFICATION, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, 1, '417','Procurement report 90 days',
	'Procurement report 90 days',
	'<table><tr><th>Award Number</th><th>Sponsor</th><th>Sponsor Award Number</th><th>Award Title</th><th>PI</th><th>Unit</th><th>Account Number</th><th>Report Type</th><th>Due Date</th></tr>{BEGIN_REPEAT_SECTION}<tr><td>{AWARD_NUMBER}</td><td>{SPONSOR_NAME}</td><td>{SPONSOR_AWARD_NUMBER}</td><td>{AWARD_TITLE}</td><td>{PI_NAME}</td><td>{LEAD_UNIT_NAME}</td><td>{ACCOUNT_NUMBER}</td><td>{REPORT_TYPE}</td><td>{REPORT_DUE_DATE}</td></tr>{END_REPEAT_SECTION}</table>',  'N', 'Y', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 1 and ACTION_CODE = '417'), 'KC-WKFLW:Unit Administrator', 
		'2', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_TYPE_ID, MODULE_CODE, ACTION_CODE, DESCRIPTION, SUBJECT, MESSAGE, PROMPT_USER, SEND_NOTIFICATION, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, 1, '418','Procurement report 60 days',
	'Procurement report 60 days',
	'<table><tr><th>Award Number</th><th>Sponsor</th><th>Sponsor Award Number</th><th>Award Title</th><th>PI</th><th>Unit</th><th>Account Number</th><th>Report Type</th><th>Due Date</th></tr>{BEGIN_REPEAT_SECTION}<tr><td>{AWARD_NUMBER}</td><td>{SPONSOR_NAME}</td><td>{SPONSOR_AWARD_NUMBER}</td><td>{AWARD_TITLE}</td><td>{PI_NAME}</td><td>{LEAD_UNIT_NAME}</td><td>{ACCOUNT_NUMBER}</td><td>{REPORT_TYPE}</td><td>{REPORT_DUE_DATE}</td></tr>{END_REPEAT_SECTION}</table>',  'N', 'Y', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 1 and ACTION_CODE = '418'), 'KC-WKFLW:Unit Administrator', 
		'2', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_TYPE_ID, MODULE_CODE, ACTION_CODE, DESCRIPTION, SUBJECT, MESSAGE, PROMPT_USER, SEND_NOTIFICATION, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, 1, '419','Procurement report 30 days',
	'Procurement report 30 days',
	'<table><tr><th>Award Number</th><th>Sponsor</th><th>Sponsor Award Number</th><th>Award Title</th><th>PI</th><th>Unit</th><th>Account Number</th><th>Report Type</th><th>Due Date</th></tr>{BEGIN_REPEAT_SECTION}<tr><td>{AWARD_NUMBER}</td><td>{SPONSOR_NAME}</td><td>{SPONSOR_AWARD_NUMBER}</td><td>{AWARD_TITLE}</td><td>{PI_NAME}</td><td>{LEAD_UNIT_NAME}</td><td>{ACCOUNT_NUMBER}</td><td>{REPORT_TYPE}</td><td>{REPORT_DUE_DATE}</td></tr>{END_REPEAT_SECTION}</table>',  'N', 'Y', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 1 and ACTION_CODE = '419'), 'KC-WKFLW:Unit Administrator', 
		'2', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_TYPE_ID, MODULE_CODE, ACTION_CODE, DESCRIPTION, SUBJECT, MESSAGE, PROMPT_USER, SEND_NOTIFICATION, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, 1, '420','Procurement report Overdue',
	'Procurement report Overdue',
	'<table><tr><th>Award Number</th><th>Sponsor</th><th>Sponsor Award Number</th><th>Award Title</th><th>PI</th><th>Unit</th><th>Account Number</th><th>Report Type</th><th>Due Date</th></tr>{BEGIN_REPEAT_SECTION}<tr><td>{AWARD_NUMBER}</td><td>{SPONSOR_NAME}</td><td>{SPONSOR_AWARD_NUMBER}</td><td>{AWARD_TITLE}</td><td>{PI_NAME}</td><td>{LEAD_UNIT_NAME}</td><td>{ACCOUNT_NUMBER}</td><td>{REPORT_TYPE}</td><td>{REPORT_DUE_DATE}</td></tr>{END_REPEAT_SECTION}</table>',  'N', 'Y', 'admin', SYSDATE, 1, SYS_GUID())
/

INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
	VALUES (SEQ_NOTIFICATION_TYPE_ID.NEXTVAL, (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 1 and ACTION_CODE = '420'), 'KC-WKFLW:Unit Administrator', 
		'2', 'admin', SYSDATE, 1, SYS_GUID())
/