<%--
   - Kuali Coeus, a comprehensive research administration system for higher education.
   - 
   - Copyright 2005-2016 Kuali, Inc.
   - 
   - This program is free software: you can redistribute it and/or modify
   - it under the terms of the GNU Affero General Public License as
   - published by the Free Software Foundation, either version 3 of the
   - License, or (at your option) any later version.
   - 
   - This program is distributed in the hope that it will be useful,
   - but WITHOUT ANY WARRANTY; without even the implied warranty of
   - MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   - GNU Affero General Public License for more details.
   - 
   - You should have received a copy of the GNU Affero General Public License
   - along with this program.  If not, see <http://www.gnu.org/licenses/>.
--%>
<%@ include file="/WEB-INF/jsp/kraTldHeader.jsp"%>

<td class="content" valign="top">
	  	<channel:messageOfTheDay/>
      <channel:researcherProposals />
      <channel:researcherAwards />
      <%-- KC-737 Remove menu items from Researcher and Unit Tab --%>
      <uh-kc:principalHasRole roleNamespace="KR-SYS" roleName="UH VIEW ALL LINKS ROLE">
      <channel:researcherNegotiations />
      </uh-kc:principalHasRole>
      <channel:researcherPersonnel />
</td>

<%-- KC-612 Declutter the menu screens --%>
<uh-kc:principalHasRole roleNamespace="KR-SYS" roleName="UH VIEW ALL LINKS ROLE">
<td class="content" valign="top">
      <channel:researcherCompliance/>
      <channel:researcherIRBProtocols/>
</td>

</uh-kc:principalHasRole>

<!-- AAP: report links -->
<td class="content" valign="top">
      <channel:researcherReportLinks />
      <channel:researcherIACUCProtocols/>
      <channel:researcherWorkflow />
</td>
