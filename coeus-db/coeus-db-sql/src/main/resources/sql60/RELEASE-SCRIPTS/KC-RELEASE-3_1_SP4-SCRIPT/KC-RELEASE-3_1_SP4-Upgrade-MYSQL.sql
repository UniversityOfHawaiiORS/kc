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

\. MYSQL/SEQUENCES/KC_SEQ_All.sql
\. MYSQL/TABLES/KC_TBL_AWARD_BUDGET_LIMIT.sql
\. MYSQL/TABLES/KC_TBL_AWARD_BUDGET_PERIOD_EXT.sql
\. MYSQL/TABLES/KC_TBL_AWARD_HIERARCHY.sql
\. MYSQL/TABLES/KC_TBL_CFDA.sql
\. MYSQL/TABLES/KC_TBL_COMM_SCHEDULE.sql
\. MYSQL/TABLES/KC_TBL_EPS_PROP_PERSON_EXT.sql
\. MYSQL/TABLES/KC_TBL_KC_QRTZ_BLOB_TRIGGERS.sql
\. MYSQL/TABLES/KC_TBL_KC_QRTZ_CALENDARS.sql
\. MYSQL/TABLES/KC_TBL_KC_QRTZ_CRON_TRIGGERS.sql
\. MYSQL/TABLES/KC_TBL_KC_QRTZ_FIRED_TRIGGERS.sql
\. MYSQL/TABLES/KC_TBL_KC_QRTZ_JOB_DETAILS.sql
\. MYSQL/TABLES/KC_TBL_KC_QRTZ_JOB_LISTENERS.sql
\. MYSQL/TABLES/KC_TBL_KC_QRTZ_LOCKS.sql
\. MYSQL/TABLES/KC_TBL_KC_QRTZ_PAUSED_TRIGGER_GRPS.sql
\. MYSQL/TABLES/KC_TBL_KC_QRTZ_SCHEDULER_STATE.sql
\. MYSQL/TABLES/KC_TBL_KC_QRTZ_SIMPLE_TRIGGERS.sql
\. MYSQL/TABLES/KC_TBL_KC_QRTZ_TRIGGERS.sql
\. MYSQL/TABLES/KC_TBL_KC_QRTZ_TRIGGER_LISTENERS.sql
\. MYSQL/TABLES/KC_TBL_NOTIFICATION.sql
\. MYSQL/TABLES/KC_TBL_NOTIFICATION_TYPE_RECIPIENT.sql
\. MYSQL/TABLES/KC_TBL_PROTOCOL_ONLN_RVWS.sql
\. MYSQL/TABLES/KC_TBL_SPECIAL_REVIEW_USAGE.sql
\. MYSQL/TABLES/KC_TBL_SPONSOR_FORMS.sql
\. MYSQL/TABLES/KC_TBL_SPONSOR_FORM_TEMPLATES.sql
\. MYSQL/TABLES/KC_TBL_VALID_BASIS_METHOD_PMT.sql
\. MYSQL/DML/KC_DML_BS1_BUDGET_CATEGORY_MAPPING.sql
\. MYSQL/DML/KC_DML_BS1_BUDGET_PERSONS.sql
\. MYSQL/DML/KC_DML_BS1_CITIZENSHIP_TYPE_T.sql
\. MYSQL/DML/KC_DML_BS1_COEUS_SUB_MODULE.sql
\. MYSQL/DML/KC_DML_BS1_COMM_SCHEDULE.sql
\. MYSQL/DML/KC_DML_BS1_KC_QRTZ_LOCKS.sql
\. MYSQL/DML/KC_DML_BS1_PERSON_APPOINTMENT.sql
\. MYSQL/DML/KC_DML_BS1_SPECIAL_REVIEW_USAGE.sql
\. MYSQL/DML/KC_DML_BS1_TRAINING_STIPEND_RATES.sql
\. MYSQL/DML/KC_DML_BS2_APPOINTMENT_TYPE.sql
\. MYSQL/DML/KC_DML_BS2_BUDGET_CATEGORY_MAPS.sql
\. MYSQL/DML/KC_DML_BS2_NOTIFICATION_TYPE.sql
\. MYSQL/DML/KC_DML_BS2_SPONSOR_FORMS.sql
\. MYSQL/DML/KC_DML_BS3_EPS_PROP_PER_DOC_TYPE.sql
\. MYSQL/DML/KC_DML_BS3_NOTIFICATION_TYPE_RECIPIENT.sql
\. MYSQL/CONSTRAINTS/KC_FK_EPS_PROP_PERSON_EXT.sql
\. MYSQL/CONSTRAINTS/KC_FK_KC_QRTZ_BLOB_TRIGGERS.sql
\. MYSQL/CONSTRAINTS/KC_FK_KC_QRTZ_CRON_TRIGGERS.sql
\. MYSQL/CONSTRAINTS/KC_FK_KC_QRTZ_JOB_LISTENERS.sql
\. MYSQL/CONSTRAINTS/KC_FK_KC_QRTZ_SIMPLE_TRIGGERS.sql
\. MYSQL/CONSTRAINTS/KC_FK_KC_QRTZ_TRIGGERS.sql
\. MYSQL/CONSTRAINTS/KC_FK_KC_QRTZ_TRIGGER_LISTENERS.sql
\. MYSQL/CONSTRAINTS/KC_FK_NOTIFICATION.sql
\. MYSQL/CONSTRAINTS/KC_UQ_WATERMARK.sql
commit;
exit