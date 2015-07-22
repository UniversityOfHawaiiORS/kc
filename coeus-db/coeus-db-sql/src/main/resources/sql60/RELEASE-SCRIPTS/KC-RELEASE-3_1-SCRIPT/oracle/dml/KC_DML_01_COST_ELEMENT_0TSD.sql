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

INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('1234','CE less than 6',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Alteration and Renovations'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400000','Summary Budget',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Operating Expenses'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400005','Summer Faculty - On',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Senior Personnel'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400025','Faculty Salaries Tenured - On',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Senior Personnel'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400040','Faculty Salaries Non-Tenured - On',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Senior Personnel'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400050','Summer Other Academic - On',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Senior Personnel'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400070','Summer Faculty - Off',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Senior Personnel'),'F','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400090','Faculty Salaries Tenured - Off',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Senior Personnel'),'F','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400105','Faculty Salaires Non-Tenured - Off',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Senior Personnel'),'F','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400115','Summer - Other Academic - Off',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Senior Personnel'),'F','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400135','Faculty Emeriti',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Senior Personnel'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400136','Faculty Retired Non-Tenured - On',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Senior Personnel'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400140','Other Academic Staff - On',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Senior Personnel'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400155','Other Academic Staff - Off',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Senior Personnel'),'F','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400250','Administrative Staff - On',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Professionals'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400255','Administrative Staff - Off',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Professionals'),'F','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400350','Research Staff - On',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Professionals'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400355','Research Staff - Off',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Professionals'),'F','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400365','Program Manager',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Professionals'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400370','Project Engineering Staff - On',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Professionals'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400390','Post-Doctoral Staff',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Postdoctoral'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400450','Hourly Personnel - On',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Personnel'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400452','Hourly Personnel - Off',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Personnel'),'F','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400550','Electronic Assembly - On',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Personnel'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400552','Mechanical Assembly - On',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Personnel'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400556','Quality Control - On',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Personnel'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400600','Project Support Staff - On',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Project Support Staff'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400601','Project Support Staff - Off',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Project Support Staff'),'F','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400654','Exempt Technical - On',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Professionals'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400700','Graduate Student Staff - On',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Graduate Students'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400706','Research Asst - On',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Graduate Students'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400708','Research Asst - Off',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Graduate Students'),'F','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400754','MIT Students - On',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Undergraduate Students'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400756','MIT Students - Off',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Undergraduate Students'),'F','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400768','Undergrad S&W UROP - Off',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Undergraduate Students'),'F','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('400770','Undergrad S&W UROP - On',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Undergraduate Students'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420050','Travel Expenses',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Travel - Domestic'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420060','Travel - Not MTDC',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Trainee/Participant Costs - Travel'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420070','Travel - Foreign Expenses',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Travel - Foreign'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420081','Travel - Professional Development',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Travel - Domestic'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420102','Animal Care',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Vertebrate Animals'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420103','Animal Care - Off',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Vertebrate Animals'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420104','Animal Purchases',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Vertebrate Animals'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420106','Audio Visual Expense',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Operating Expenses'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420111','Participant costs - Tuition',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Trainee/Participant Costs - Tuition'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420128','Chemicals',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Materials '),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420131','Professional Development and Training',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Operating Expenses'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420140','Conference Expenses',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Meeting Costs'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420144','Cost Part Rel Programs - Not MTDC',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Trainee/Participant Costs - Other'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420160','Electrical Components',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Materials '),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420162','Electrical System',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Materials '),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420172','Fellowship Expense',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Operating Expenses'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420174','Field Expense',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Operating Expenses'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420198','Insurance Premiums',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Operating Expenses'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420220','Maintenance and Repairs',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Materials '),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420226','Materials and Services',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Materials '),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420232','Mechanical Components',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Materials '),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420258','Office Supplies',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Materials '),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420262','Temporary Help',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Personnel'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420298','Professional Services',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Professional Services/Consultant'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420310','Raw Materials',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Materials '),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420316','Other Sponsor Funded Costs - Not MTDC',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Operating Expenses'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420320','Renovations',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Alteration and Renovations'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420333','Participant costs - subsistence',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Trainee/Participant Costs - Subsistence'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420338','Service Contracts',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Service Agreement(s)'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420346','Shop Expense',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Operating Expenses'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420350','Space Rental - Not MTDC',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Operating Expenses'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420376','Use of Facilities',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Operating Expenses'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420392','Xerox Expense',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Duplicating'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420600','Subcontracts (first 25K) - Subject to F&A',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Subcontracts'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420610','Subcontractor''s F&A-subject to MIT F&A',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Subcontracts'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420620','Subcontracts (beyond first 25K) - No F&A',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Subcontracts'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420630','Subcontractor''s F&A (NIH only)-no MIT F&A',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Subcontracts'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420710','Consultants',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Professional Services/Consultant'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420720','Contract Services',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Professional Services/Consultant'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420726','Outpatient Services',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Outpatient costs'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420800','Books',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Materials '),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420825','Journals',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Materials '),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420840','Printing',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Publication Costs/Documentation/Dissemenation'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420875','Publication Charges',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Publication Costs/Documentation/Dissemenation'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420890','Subscriptions',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Operating Expenses'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('420920','Postage Mailing and Shipping',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Postage'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('421000','Meetings-Food and Beverages',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Meeting Costs'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('421010','Meetings Allowable',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Operating Expenses'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('421200','Food',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Materials '),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('421500','Service Facilities',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Operating Expenses'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('421502','Service Facilities - Broad SSF F&A',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Subcontracts'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('421503','Sequencing Services-not MTDC',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Subcontracts'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('421504','Reactor Use',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Equipment Rental'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('421510','Educational Video Resources',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Materials '),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('421568','CWSP Credit - Not MTDC',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Senior Personnel'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('421572','Experimental Subjects ',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Human Subjects'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('421586','Memberships and Dues',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Operating Expenses'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('421588','Miscellaneous',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Operating Expenses'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('421590','Moving',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Alteration and Renovations'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('421598','Research Patient Care',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Inpatient Care Costs'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('421753','Telephone - Basic Monthly Service',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Telephone, Fax'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('421759','Telephone - Toll Calls',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Telephone, Fax'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('421762','Telephone - Data Facilities',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Vertebrate Animals'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('421765','Telephone - Moves and Installations',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Telephone, Fax'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('421766','Telecommunications - Consolidated Charges',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Telephone, Fax'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('421809','Fabricated Equipment - Not MTDC',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Equipment'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('421818','Equipment - Not MTDC',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Equipment'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('421827','Equipment Minor',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Materials '),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('421833','Equipment Rental - Not MTDC',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Equipment Rental'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('421900','Computer Supplies and Peripherals',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Computer Time'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('421925','Software',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Computer Time'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('422310','Tuition - RA - Not MTDC',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Operating Expenses'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('422315','Stipends - Not MTDC',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Trainee/Participant Costs - Stipends'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('422320','Undergrad Student Fees - No Overhead',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Other Operating Expenses'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('1111112','Computer Time',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Computer Time'),'F','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('PHTD01','Total Direct Cost for Proposal Hierarchy',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Proposal Hierarchy Sub-Projects'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO COST_ELEMENT (COST_ELEMENT,DESCRIPTION,BUDGET_CATEGORY_CODE,ON_OFF_CAMPUS_FLAG,ACTIVE_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('PHTID02','Total Indirect Cost for Proposal Hierarchy',(SELECT BUDGET_CATEGORY_CODE FROM BUDGET_CATEGORY WHERE DESCRIPTION = 'Proposal Hierarchy Sub-Projects'),'N','Y','admin',SYSDATE,SYS_GUID(),1)
/