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

<%@ attribute name="selectedTab" required="true"%>

<div id="tabs" class="tabposition">
	<ul>
	<%-- Researcher Menu --%>
	<c:if test='${selectedTab == "portalResearcherBody"}'>
        <li class="red"><a class="red" href="portal.do?selectedTab=portalResearcherBody" title="Researcher">Researcher</a></li>
    </c:if>
    <c:if test='${selectedTab != "portalResearcherBody"}'>
        <c:if test="${empty selectedTab}">
            <li class="red"><a class="red" href="portal.do?selectedTab=portalResearcherBody" title="Researcher">Researcher</a></li>
        </c:if>
        <c:if test="${!empty selectedTab}">
            <li class="green"><a class="green" href="portal.do?selectedTab=portalResearcherBody" title="Researcher">Researcher</a></li>
        </c:if>
    </c:if>
    
    <%-- Unit --%>
    <c:if test='${selectedTab == "portalUnitBody"}'>
        <li class="red"><a class="red" href="portal.do?selectedTab=portalUnitBody" title="Unit">Unit</a></li>
    </c:if> 
    <c:if test='${selectedTab != "portalUnitBody"}'>
        <li class="green"><a class="green" href="portal.do?selectedTab=portalUnitBody" title="Unit">Unit</a></li>
    </c:if>
    
    <%-- Central Admin --%>
    <c:if test='${selectedTab == "portalCentralAdminBody"}'>
        <li class="red"><a class="red" href="portal.do?selectedTab=portalCentralAdminBody" title="Central Admin">Central Admin</a></li>
    </c:if> 
    <c:if test='${selectedTab != "portalCentralAdminBody"}'>
        <li class="green"><a class="green" href="portal.do?selectedTab=portalCentralAdminBody" title="Central Admin">Central Admin</a></li>
    </c:if>
    


    <%-- Help KC-517 --%>
    
    <c:if test='${selectedTab == "portalHelpBody"}'>
        <li class="red"><a class="red" href="portal.do?selectedTab=portalHelpBody" title="Help">Help</a></li>
    </c:if> 
    <c:if test='${selectedTab != "portalHelpBody"}'>
        <li class="green"><a class="green" href="portal.do?selectedTab=portalHelpBody" title="Help">Help</a></li>
    </c:if>

    
	<%-- Researcher Menu --%>
	<c:if test='${selectedTab == "portalResearcherBody"}'>
        <li class="red"><a class="red" href="portal.do?selectedTab=portalResearcherBody" title="Researcher">Researcher</a></li>
    </c:if>
    <c:if test='${selectedTab != "portalResearcherBody"}'>
        <c:if test="${empty selectedTab}">
            <li class="red"><a class="red" href="portal.do?selectedTab=portalResearcherBody" title="Researcher">Researcher</a></li>
        </c:if>
        <c:if test="${!empty selectedTab}">
            <li class="green"><a class="green" href="portal.do?selectedTab=portalResearcherBody" title="Researcher">Researcher</a></li>
        </c:if>
    </c:if>
    
    <%-- Unit --%>
    <c:if test='${selectedTab == "portalUnitBody"}'>
        <li class="red"><a class="red" href="portal.do?selectedTab=portalUnitBody" title="Unit">Unit</a></li>
    </c:if> 
    <c:if test='${selectedTab != "portalUnitBody"}'>
        <li class="green"><a class="green" href="portal.do?selectedTab=portalUnitBody" title="Unit">Unit</a></li>
    </c:if>
    
    <%-- KC-612 Declutter the menu screens --%>
    <uh-kc:principalHasRole roleNamespace="KR-SYS" roleName="UH Central Admin Tab Viewer">
    <%-- Central Admin --%>
    <c:if test='${selectedTab == "portalCentralAdminBody"}'>
        <li class="red"><a class="red" href="portal.do?selectedTab=portalCentralAdminBody" title="Central Admin">Central Admin</a></li>
    </c:if> 
    <c:if test='${selectedTab != "portalCentralAdminBody"}'>
        <li class="green"><a class="green" href="portal.do?selectedTab=portalCentralAdminBody" title="Central Admin">Central Admin</a></li>
    </c:if>
    </uh-kc:principalHasRole>
    <%-- KC-612 END --%>
    
    <uh-kc:principalHasRole roleNamespace="KR-SYS" roleName="Technical Administrator">
    <%-- Maintenance --%>
    <c:if test='${selectedTab == "portalMaintenanceBody"}'>
        <li class="red"><a class="red" href="portal.do?selectedTab=portalMaintenanceBody" title="Maintenance">Maintenance</a></li>
    </c:if> 
    <c:if test='${selectedTab != "portalMaintenanceBody"}'>
        <li class="green"><a class="green" href="portal.do?selectedTab=portalMaintenanceBody" title="Maintenance">Maintenance</a></li>
    </c:if>
    
    <%-- System Admin --%>
    <c:if test='${selectedTab == "portalSystemAdminBody"}'>
        <li class="red"><a class="red" href="portal.do?selectedTab=portalSystemAdminBody" title="System Admin">System Admin</a></li>
    </c:if> 
    <c:if test='${selectedTab != "portalSystemAdminBody"}'>
        <li class="green"><a class="green" href="portal.do?selectedTab=portalSystemAdminBody" title="System Admin">System Admin</a></li>
    </c:if>
	</uh-kc:principalHasRole> 
	
	</ul>
</div>
