<%--
   - Kuali Coeus, a comprehensive research administration system for higher education.
   - 
   - Copyright 2005-2015 Kuali, Inc.
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

<channel:portalChannelTop channelTitle="Personnel" />
<div class="body">
  <ul class="chan">
    <%-- KC-487 added Change My Information link  --%>
    <li><a href="http://www.ors.hawaii.edu/helpline/index.php?/Tickets/Submit/RenderForm/4" target="_blank">Change My Information</a></li>
    <%-- KC-737 Remove menu items from Researcher and Unit Tab --%>
    <%-- KC-612 Declutter the menu screens --%>
    <uh-kc:principalHasRole roleNamespace="KR-SYS" roleName="UH VIEW ALL LINKS ROLE">
    <li>Degree Information</li>
   <li><portal:portalLink displayTitle="false" title="Current & Pending Support" url="${ConfigProperties.application.url}/currentOrPendingReport.do">Current &amp; Pending Support</portal:portalLink></li>
    <li>Bio-sketches</li>
    <li>All my Training</li>
    </uh-kc:principalHasRole>
  </ul>
</div>
<channel:portalChannelBottom />
