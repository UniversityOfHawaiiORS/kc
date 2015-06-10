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

-- NOTE RRG MOVED from KC_TBL_EPS_PROP_PERSON_ROLE.sql
-- to fix failure in next update due to this constraint
alter table AWARD_PERSONS drop constraint FK_PROP_PERS_ROLE_AWD_PERSONS;

update AWARD_PERSONS set CONTACT_ROLE_CODE = 'MPI' where CONTACT_ROLE_CODE = 'COI' and MULTIPLE_PI = 'Y';

alter table AWARD_PERSONS drop column MULTIPLE_PI;
