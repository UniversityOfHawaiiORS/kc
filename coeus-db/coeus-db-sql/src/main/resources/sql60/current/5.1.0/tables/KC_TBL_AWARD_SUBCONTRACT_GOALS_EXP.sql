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

CREATE TABLE AWARD_SUBCONTRACT_GOALS_EXP (
	AWARD_NUMBER VARCHAR2(12) NOT NULL,
	
	
	LARGE_BUSINESS_AMT_G NUMBER(12,2), 
	SMALL_BUSINESS_AMT_G NUMBER(12,2), 
	WOMAN_OWNED_AMT_G NUMBER(12,2), 
	A8_DISADVANTAGE_AMT_G NUMBER(12,2), 
	HUB_ZONE_AMT_G NUMBER(12,2), 
	VETERAN_OWNED_AMT_G NUMBER(12,2), 
	SVC_DISABLED_VET_OWNED_AMT_G NUMBER(12,2), 
	HISTORIC_BLACK_COLLEGE_AMT_G NUMBER(12,2),
			
	LARGE_BUSINESS_AMT NUMBER(12,2), 
	SMALL_BUSINESS_AMT NUMBER(12,2), 
	WOMAN_OWNED_AMT NUMBER(12,2), 
	A8_DISADVANTAGE_AMT NUMBER(12,2), 
	HUB_ZONE_AMT NUMBER(12,2), 
	VETERAN_OWNED_AMT NUMBER(12,2), 
	SVC_DISABLED_VET_OWNED_AMT NUMBER(12,2), 
	HISTORIC_BLACK_COLLEGE_AMT NUMBER(12,2),
	
	COMMENTS VARCHAR2(2000),
	
	UPDATE_TIMESTAMP DATE NOT NULL,
	UPDATE_USER VARCHAR2(60) NOT NULL,
 	VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL,
 	OBJ_ID VARCHAR2(36) NOT NULL)
/

ALTER TABLE AWARD_SUBCONTRACT_GOALS_EXP
ADD CONSTRAINT PK_SUBCONTRACT_GOALS_EXP
PRIMARY KEY (AWARD_NUMBER)
/

