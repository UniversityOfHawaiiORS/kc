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

<channel:portalChannelTop channelTitle="System" />
<div class="body">
  <ul class="chan">
    <li>Employee Status</li>
    <li>Employee Type</li>
    <li><portal:portalLink displayTitle="true" title="Messages Of The Day" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.common.framework.motd.MessageOfTheDay&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true&docFormKey=88888888" /></li>
    <li><portal:portalLink displayTitle="true" title="Person Extended Attributes" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.common.framework.person.attr.KcPersonExtendedAttributes&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true&docFormKey=88888888" /></li>
    <li><portal:portalLink displayTitle="true" title="Document Configuration Hierarchy" url="${ConfigProperties.kew.url}/RuleQuickLinks.do?methodToCall=start&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true&docFormKey=88888888" /></li>
    <li>System Options</li>
    <li><portal:portalLink displayTitle="true" title="Database Schema Information" url="${ConfigProperties.application.url}/schemaspy/index.html" /></li>
    <%-- KC-679 New routing 5.1.1 --%>
    <li><portal:portalLink displayTitle="true" title="UH Person Delegate (Affects Routing Only)" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=edu.hawaii.kra.bo.UhPersonDelegate&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true&docFormKey=88888888" /></li>
    <li><portal:portalLink displayTitle="true" title="Flush UH KC Users Cache" url="${ConfigProperties.application.url}/flushUhKcUsersCache.jsp"/></li>
    <%-- KC-901 Add ability for help desk to run the uhims process on demand --%>
    <br>
    <li><portal:portalLink displayTitle="true" title="Process UHIMS messages (Wait for result)" url="${ConfigProperties.application.url}/uh_processUHIMS.jsp"/></li>
    <li><portal:portalLink displayTitle="true" title="Sync KC Users to CORE (Wait for result)" url="${ConfigProperties.application.url}/uh_processCORE.jsp"/></li>
    <%-- KC-901 END --%>
    <li>
      <portal:portalLink displayTitle="true" title="Database Schema Information" url="${ConfigProperties.application.url}/schemaspy/index.html" />
      <a href="${ConfigProperties.application.url}/schemaspy/_schema.xml">
        <img border="0" alt="XML" src="static/images/tinybutton-viewxml.gif" class="tinybutton">
      </a>
    </li>
    <c:if test="${krafn:isGrm() && krafn:getConfigValueAsBoolean('legacy.coeus.kc.schemaspy.enabled')}">
      <li>
        <portal:portalLink displayTitle="true" title="Legacy Coeus Database Schema Information" url="${ConfigProperties.application.url}/legacyCoeusSchemaspy/index.html" />
        <a href="${ConfigProperties.application.url}/legacyCoeusSchemaspy/_schema.xml">
          <img border="0" alt="XML" src="static/images/tinybutton-viewxml.gif" class="tinybutton">
        </a>
      </li>
    </c:if>
    <li><portal:portalLink displayTitle="true" title="Monitoring" url="${ConfigProperties.application.url}/monitoring/jm" /></li>
    <li><portal:portalLink displayTitle="true" title="ActiveMQ Message Queue" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.sys.impl.mq.ActiveMqMessage&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true&docFormKey=88888888" /></li>
  </ul>
</div>
<channel:portalChannelBottom />
