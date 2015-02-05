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
\. MYSQL/TABLES/KC_TBL_AWARD.sql
\. MYSQL/TABLES/KC_TBL_AWARD_AMOUNT_INFO.sql
\. MYSQL/TABLES/KC_TBL_AWARD_AMOUNT_TRANSACTION.sql
\. MYSQL/TABLES/KC_TBL_AWARD_AMT_FNA_DISTRIBUTION.sql
\. MYSQL/TABLES/KC_TBL_AWARD_BUDGET_EXT.sql
\. MYSQL/TABLES/KC_TBL_AWARD_COST_SHARE.sql
\. MYSQL/TABLES/KC_TBL_AWARD_DOCUMENT.sql
\. MYSQL/TABLES/KC_TBL_AWARD_FUNDING_PROPOSALS.sql
\. MYSQL/TABLES/KC_TBL_AWARD_PERSONS.sql
\. MYSQL/TABLES/KC_TBL_BUDGET.sql
\. MYSQL/TABLES/KC_TBL_BUDGET_DOCUMENT.sql
\. MYSQL/TABLES/KC_TBL_BUDGET_PERIODS.sql
\. MYSQL/TABLES/KC_TBL_CITIZENSHIP_TYPE_T.sql
\. MYSQL/TABLES/KC_TBL_COMMITTEE.sql
\. MYSQL/TABLES/KC_TBL_CUSTOM_ATTRIBUTE.sql
\. MYSQL/TABLES/KC_TBL_CUSTOM_ATTRIBUTE_DOC_VALUE.sql
\. MYSQL/TABLES/KC_TBL_DOCUMENT_NEXTVALUE.sql
\. MYSQL/TABLES/KC_TBL_EPS_PROPOSAL.sql
\. MYSQL/TABLES/KC_TBL_EPS_PROPOSAL_BUDGET_EXT.sql
\. MYSQL/TABLES/KC_TBL_EPS_PROP_COST_SHARING.sql
\. MYSQL/TABLES/KC_TBL_EPS_PROP_PERSON.sql
\. MYSQL/TABLES/KC_TBL_EPS_PROP_SITES.sql
\. MYSQL/TABLES/KC_TBL_FUNDING_SOURCE_TYPE.sql
\. MYSQL/TABLES/KC_TBL_INSTITUTE_PROPOSAL_DOCUMENT.sql
\. MYSQL/TABLES/KC_TBL_PENDING_TRANSACTIONS.sql
\. MYSQL/TABLES/KC_TBL_PERSON_EXT_T.sql
\. MYSQL/TABLES/KC_TBL_PROPOSAL.sql
\. MYSQL/TABLES/KC_TBL_PROPOSAL_ADMIN_DETAILS.sql
\. MYSQL/TABLES/KC_TBL_PROPOSAL_COST_SHARING.sql
\. MYSQL/TABLES/KC_TBL_PROPOSAL_PERSONS.sql
\. MYSQL/TABLES/KC_TBL_PROTOCOL.sql
\. MYSQL/TABLES/KC_TBL_PROTOCOL_EXEMPT_CHKLST.sql
\. MYSQL/TABLES/KC_TBL_PROTOCOL_EXPIDITED_CHKLST.sql
\. MYSQL/TABLES/KC_TBL_PROTOCOL_ONLN_RVWS.sql
\. MYSQL/TABLES/KC_TBL_PROTOCOL_REVIEWERS.sql
\. MYSQL/TABLES/KC_TBL_PROTOCOL_VOTE_ABSTAINEES.sql
\. MYSQL/TABLES/KC_TBL_PROTOCOL_VOTE_RECUSED.sql
\. MYSQL/TABLES/KC_TBL_QUESTIONNAIRE.sql
\. MYSQL/TABLES/KC_TBL_QUESTIONNAIRE_CONDITION_TYPE.sql
\. MYSQL/TABLES/KC_TBL_QUESTIONNAIRE_QUESTIONS.sql
\. MYSQL/TABLES/KC_TBL_RATE_CLASS.sql
\. MYSQL/TABLES/KC_TBL_RESEARCH_AREAS.sql
\. MYSQL/TABLES/KC_TBL_ROLODEX.sql
\. MYSQL/TABLES/KC_TBL_S2S_APPLICATION.sql
\. MYSQL/TABLES/KC_TBL_S2S_APP_ATTACHMENTS.sql
\. MYSQL/TABLES/KC_TBL_S2S_APP_SUBMISSION.sql
\. MYSQL/TABLES/KC_TBL_S2S_OPPORTUNITY.sql
\. MYSQL/TABLES/KC_TBL_S2S_OPP_FORMS.sql
\. MYSQL/TABLES/KC_TBL_SPONSOR.sql
\. MYSQL/TABLES/KC_TBL_TIME_AND_MONEY_DOCUMENT.sql
\. MYSQL/TABLES/KC_TBL_TRANSACTION_DETAILS.sql
\. MYSQL/TABLES/KC_TBL_VALID_RATES.sql
\. MYSQL/DML/KC_DML_BS1_QUESTION.sql
\. MYSQL/DML/KC_DML_BS1_QUESTIONNAIRE_CONDITION_TYPE.sql
\. MYSQL/DML/KC_DML_BS2_QUESTIONNAIRE.sql
\. MYSQL/DML/KC_DML_BS2_QUESTION_EXPLANATION.sql
\. MYSQL/DML/KC_DML_BS3_QUESTIONNAIRE_QUESTIONS.sql
\. MYSQL/DML/KC_DML_BS3_QUESTIONNAIRE_USAGE.sql
\. MYSQL/DML/KC_DML_BS3_S2S_FORM_TO_QUESTIONNAIRE.sql
\. MYSQL/DML/KC_DML_BS4_ARG_VALUE_LOOKUP.sql
\. MYSQL/DML/KC_DML_BS5_PERSON_EDITABLE_FIELDS.sql
\. MYSQL/DML/KC_DML_BS5_PROTOCOL_MODULES.sql
\. MYSQL/DML/KC_DML_BS5_PROTO_CORRESP_TEMPL.sql
\. MYSQL/CONSTRAINTS/KC_FK_QUEST_QUESTIONS_COND_TYPE.sql
commit;
