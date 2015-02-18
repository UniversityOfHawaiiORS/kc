<%--

    Copyright 2005-2015 The Kuali Foundation

    Licensed under the Educational Community License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.opensource.org/licenses/ecl2.php

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

--%>
<%@ include file="/kr/WEB-INF/jsp/tldHeader.jsp"%>

<!-- UH KC-487 BEGIN  code added by rbl to check if user is an administrator then set a request attribute accordingly,
	value will then be used as a flag to make certain (fields for activating/deactivating users) editable for admins and read-only for non-admins
 -->
<%

boolean hasRole = false;
org.kuali.rice.krad.UserSession userSession = (org.kuali.rice.krad.UserSession) session.getAttribute("UserSession");
org.kuali.rice.kim.api.role.RoleService rms = org.kuali.rice.kim.api.services.KimApiServiceLocator.getRoleService();

org.kuali.rice.kim.api.role.Role roleInfo = rms.getRoleByNamespaceCodeAndName("KR-SYS", "Technical Administrator");
if(roleInfo != null && userSession != null) {
	java.util.List<String> roleIds = new java.util.ArrayList<String>(1);
	roleIds.add(roleInfo.getId()); 
	
	hasRole = rms.principalHasRole(userSession.getPrincipalId(), roleIds, null);
}
request.setAttribute("principalHasAdminRole", hasRole);
%>
<!--UH KC-487 END -->
<c:set var="inquiry" scope="request" value="${KualiForm.inquiry}" />
<c:set var="readOnly" scope="request" value="${!KualiForm.documentActions[Constants.KUALI_ACTION_CAN_EDIT] || inquiry}" />
<c:set var="readOnlyEntity" scope="request" value="${!KualiForm.canModifyEntity || readOnly}" />

<c:set var="formAction" value="identityManagementPersonDocument" />
<c:if test="${inquiry}">
    <c:set var="formAction" value="identityManagementPersonInquiry" />
</c:if>
<!-- UH KC-487 BEGIN only admins can see the person edit page for now - for regular users display a link to ors helpline where they can create a work ticket -->
<c:if test="${inquiry || principalHasAdminRole}">
<kul:documentPage
    showDocumentInfo="${!inquiry}"
    htmlFormAction="${formAction}"
	documentTypeName="IdentityManagementPersonDocument"
	renderMultipart="${inquiry}"
	showTabButtons="true"
	auditCount="0">

    <c:if test="${!inquiry}">
 	    <kul:hiddenDocumentFields />
	    <kul:documentOverview editingMode="${KualiForm.editingMode}" />
	</c:if>
    <c:if test="${inquiry}">
        <div id="workarea">
    </c:if>
	<kim:personOverview />
	<kim:personContact />
	<kim:personMembership />

    <c:if test="${!inquiry}">    		
		<kul:adHocRecipients />
		<kul:routeLog />
	</c:if>
	<kul:superUserActions />
	<kul:panelFooter />
    <c:if test="${inquiry}">
        </div>
    </c:if>
    <c:choose>
        <c:when test="${!inquiry}">
        <%-- UH KC-487 rbl added code to allow suppression of close button on person identity management person screen --%>
            <kul:documentControls transactionalDocument="false" viewOnly="true" suppressCloseButton="true"/>
        </c:when>
        <c:otherwise>
            <kul:inquiryControls />
            <input type="hidden" name="principalId" value="${KualiForm.document.principalId}" />
        </c:otherwise>
    </c:choose>

</kul:documentPage>
</c:if>
<c:if test="${not principalHasAdminRole && !inquiry}">
<h3>Please contact <a href="http://www.ors.hawaii.edu/helpline/" target="_blank">ORS Helpline</a> to change your information.</h3>
</c:if>
<!--UH KC-487 END -->
