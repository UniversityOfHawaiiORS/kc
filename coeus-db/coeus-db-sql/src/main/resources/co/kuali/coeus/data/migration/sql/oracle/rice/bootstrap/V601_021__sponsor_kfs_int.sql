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
INSERT INTO krcr_parm_t (APPL_ID, NMSPC_CD, CMPNT_CD, PARM_NM, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, OBJ_ID) VALUES ('KC', 'KC-GEN', 'Document', 'FIN_SYSTEM_INTEGRATION_ON_SPONSOR', 1, 'CONFG', 'OFF', 'Parameter to set the financial system integration feature ON or OFF for Sponsor.', 'A', SYS_GUID());

