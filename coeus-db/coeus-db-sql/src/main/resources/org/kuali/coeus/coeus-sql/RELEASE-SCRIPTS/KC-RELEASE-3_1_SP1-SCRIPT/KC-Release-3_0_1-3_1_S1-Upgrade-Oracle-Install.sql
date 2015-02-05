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

set define off 
set sqlblanklines on 
spool KC-Release-3_0_1-3_1_S1-Upgrade-Oracle-Install.log
@ORACLE/SEQUENCES/SEQ_ALL.sql
@ORACLE/TABLES/TBL_AWARD.sql
@ORACLE/TABLES/TBL_AWARD_CUSTOM_DATA.sql
@ORACLE/TABLES/TBL_AWARD_NOTEPAD.sql
@ORACLE/TABLES/TBL_AWARD_SYNC_CHANGE.sql
@ORACLE/TABLES/TBL_AWARD_SYNC_LOG.sql
@ORACLE/TABLES/TBL_AWARD_SYNC_STATUS.sql
@ORACLE/TABLES/TBL_BUDGET_MODS.sql
@ORACLE/TABLES/TBL_BUDGET_SUB_AWARD_FILES.sql
@ORACLE/TABLES/TBL_BUDGET_SUB_AWARDS.sql
@ORACLE/TABLES/TBL_CITIZENSHIP_TYPE_T.sql
@ORACLE/TABLES/TBL_EPS_PROP_EXEMPT_NUMBER.sql
@ORACLE/TABLES/TBL_EPS_PROP_CONG_DISTRICT.sql
@ORACLE/TABLES/TBL_EPS_PROP_PERSON_BIO.sql
@ORACLE/TABLES/TBL_LOCATION_TYPE.sql
@ORACLE/TABLES/TBL_NARRATIVE.sql
@ORACLE/TABLES/TBL_OBJ_ID_NOT_NULL.sql
@ORACLE/TABLES/TBL_PENDING_TRANSACTIONS.sql
@ORACLE/TABLES/TBL_PERSON_EXT_T.sql
@ORACLE/TABLES/TBL_PROPOSAL_CUSTOM_DATA.sql
@ORACLE/TABLES/TBL_PROPOSAL_SPECIAL_REVIEW.sql
@ORACLE/TABLES/TBL_PROTOCOL_ACTIONS.sql
@ORACLE/TABLES/TBL_PROTOCOL_PERSON_ROLES.sql
@ORACLE/TABLES/TBL_QUESTIONNAIRE.sql
@ORACLE/TABLES/TBL_S2S_FORM_TO_QUESTIONNAIRE.sql
@ORACLE/TABLES/TBL_SPECIAL_REVIEW_USAGE.sql
@ORACLE/TABLES/TBL_TRAINING_STIPEND_RATES.sql
@ORACLE/TABLES/TBL_TRANSACTION_DETAILS.sql
@ORACLE/TABLES/TBL_VALID_NARR_FORMS.sql
@ORACLE/TABLES/TBL_VALID_PROTO_ACTION_ACTION.sql
@ORACLE/TABLES/TBL_VALID_SP_REV_APPROVAL.sql
@ORACLE/DML/DML_BS1_CITIZENSHIP_TYPE_T.sql
@ORACLE/DML/DML_BS1_CONTACT_TYPE.sql
@ORACLE/DML/DML_BS1_PROTO_CORRESP_TEMPL.sql
@ORACLE/DML/DML_BS1_PROTOCOL_ACTION_TYPE.sql
@ORACLE/DML/DML_BS1_PROTOCOL_STATUS.sql
@ORACLE/DML/DML_BS1_SUBMISSION_TYPE.sql
@ORACLE/DML/DML_BS2_COEUS_SUB_MODULE.sql
@ORACLE/DML/DML_BS2_PERSON_EXT_T.sql
@ORACLE/DML/DML_BS2_VALID_NARR_FORMS.sql
@ORACLE/DML/DML_BS2_VALID_PROTO_ACTION_ACTION.sql
@ORACLE/DML/DML_BS5_NARRATIVE_TYPE.sql
@ORACLE/DML/DML_BS5_QUESTION.sql
@ORACLE/DML/DML_BS5_SPECIAL_REVIEW_USAGE.sql
@ORACLE/DML/DML_BS5_TRAINING_STIPEND_RATES.sql
@ORACLE/DML/DML_BS6_ARG_VALUE_LOOKUP.sql
@ORACLE/DML/DML_BS6_PROTO_CORRESP_TYPE.sql
@ORACLE/DML/DML_BS6_VALID_NARR_FORMS.sql
@ORACLE/DML/DML_BS7_PROTO_CORRESP_TEMPL.sql
@ORACLE/DML/DML_BS7_VALID_NARR_FORMS.sql
@ORACLE/CONSTRAINTS/FK_SPECIAL_REVIEW_USAGE.sql
@ORACLE/CONSTRAINTS/FK_VALID_PROTO_ACTION_ACTION.sql
@ORACLE/VIEWS/VEW_EPS_PROP_SPECIAL_REVIEW.sql
@ORACLE/VIEWS/VEW_PROPOSAL_SPECIAL_REVIEW.sql
@ORACLE/VIEWS/VEW_SPECIAL_REVIEW_USAGE.sql
@ORACLE/VIEWS/VEW_TRAINING_STIPEND_RATES.sql
commit;
exit;
