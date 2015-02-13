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
<c:set var="personAttributes" value="${DataDictionary.KcPerson.attributes}" />
<%@ attribute name="title" required="true" %>
<%@ attribute name="methodName" required="true" %>
<%@ attribute name="printPdfMethodName" required="true" %>
<%@ attribute name="requestUri" required="true" %>
<!-- UH KC-536 BEGIN User with no roles can run current & pending support report and see proposals for other PI
coded added by rbl to restrict the viewing of "Pending Support Reports" for other users to ORS Central Group Members. 
NON ORS Central Group Members can view only their own "Pending Support Report".
-->
<%

boolean isMember = false;
org.kuali.rice.krad.UserSession userSession = (org.kuali.rice.krad.UserSession) session.getAttribute("UserSession");

if(userSession != null && request != null) {
	
    for ( org.kuali.rice.kim.api.group.Group group : org.kuali.rice.kim.api.services.KimApiServiceLocator.getGroupService().getGroupsByPrincipalId(userSession.getPrincipalId())) {
        if (org.apache.commons.lang.StringUtils.equals("KC-WKFLW", group.getNamespaceCode()) && org.apache.commons.lang.StringUtils.equals("Central ORS", group.getName())) {
            isMember = true;
            break;
        }
    }
}
request.setAttribute("isCentralORSMember", isMember);
%>
<!-- UH KC-536 END -->
    <tr>
        <td width="10%">&nbsp;</td>
        <th width="40%">${title}</th>
        <td width="40%">
            <div align="center">
                Person:
                <c:if test="${KualiForm.reportHelperBean.targetPerson != null}">
                    <kul:htmlControlAttribute property="reportHelperBean.targetPerson.fullName"
                                    attributeEntry="${personAttributes.fullName}" readOnly="true"/>
                </c:if>
                <c:if test="${KualiForm.reportHelperBean.targetPerson == null}">
                    <kul:htmlControlAttribute property="reportHelperBean.personId"
                                    attributeEntry="${personAttributes.personId}" readOnly="true"/>
                </c:if>
                <label>
                    <kul:lookup boClassName="org.kuali.coeus.common.framework.person.KcPerson"
                                fieldConversions="personId:reportHelperBean.personId" anchor="${tabKey}"
                                lookupParameters="reportHelperBean.personId:personId"/>
                </label>
            </div>
        </td>
        <td width="10%">
            <div align="center">
            <!-- UH KC-536 BEGIN coded added by rbl to restrict the viewing of "Pending Support Reports" for other users to ORS Central Group Members. 
			NON ORS Central Group Members can view only their own "Pending Support Report".
			-->
            	<c:if test="${fn:contains(methodName, 'prepareCurrentReport')}">
                    <c:if test="${KualiForm.reportHelperBean.personId == null}">
                        <html:image src="${ConfigProperties.kra.externalizable.images.url}tinybutton-initiatereport_disabled.gif" styleClass="globalbuttons"
                                    property="methodToCall.${methodName}" alt="${methodName}" disabled="true" />
                    </c:if>
                    <c:if test="${KualiForm.reportHelperBean.personId != null}">
                        <html:image src="${ConfigProperties.kra.externalizable.images.url}tinybutton-initiatereport.gif" styleClass="globalbuttons"
                                    property="methodToCall.${methodName}" alt="${methodName}" />
                        <html:image src="${ConfigProperties.kra.externalizable.images.url}tinybutton-print.gif" styleClass="globalbuttons"
                                    property="methodToCall.${printPdfMethodName}" alt="${printPdfMethodName}" onclick="excludeSubmitRestriction=true" />
                    </c:if>
            	</c:if>
                <c:if test="${fn:contains(methodName, 'preparePendingReport')}">
                    <c:if test="${KualiForm.reportHelperBean.personId == null or (!fn:contains(KualiForm.reportHelperBean.personId, UserSession.person.principalId) and not isCentralORSMember)}">
                        <html:image src="${ConfigProperties.kra.externalizable.images.url}tinybutton-initiatereport_disabled.gif" styleClass="globalbuttons"
                                    property="methodToCall.${methodName}" alt="${methodName}" disabled="true" />
                    </c:if>
                    <c:if test="${KualiForm.reportHelperBean.personId != null and (fn:contains(KualiForm.reportHelperBean.personId, UserSession.person.principalId) or isCentralORSMember)}">
                        <html:image src="${ConfigProperties.kra.externalizable.images.url}tinybutton-initiatereport.gif" styleClass="globalbuttons"
                                    property="methodToCall.${methodName}" alt="${methodName}" />
                        <html:image src="${ConfigProperties.kra.externalizable.images.url}tinybutton-print.gif" styleClass="globalbuttons"
                                    property="methodToCall.${printPdfMethodName}" alt="${printPdfMethodName}" onclick="excludeSubmitRestriction=true" />
                    </c:if>
               </c:if>
             <!-- UH KC-536 END -->
            </div>
        </td>
    </tr>
