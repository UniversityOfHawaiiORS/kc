<%@ include file="/WEB-INF/jsp/uh/uhTldHeader.jsp"%>

<%@ attribute name="roleNamespace" required="true"%>
<%@ attribute name="roleName" required="true"%>

<%

boolean hasRole = false;
org.kuali.rice.krad.UserSession userSession = (org.kuali.rice.krad.UserSession) session.getAttribute("UserSession");
org.kuali.rice.kim.api.role.RoleService rms = org.kuali.rice.kim.api.services.KimApiServiceLocator.getRoleService();

org.kuali.rice.kim.api.role.Role roleInfo = rms.getRoleByNamespaceCodeAndName(roleNamespace, roleName);
if(roleInfo != null && userSession != null) {
	java.util.List<String> roleIds = new java.util.ArrayList<String>(1);
	roleIds.add(roleInfo.getId()); 
	
	hasRole = rms.principalHasRole(userSession.getPrincipalId(), roleIds, null);
}
request.setAttribute("principalHasRoleTagHasRole", hasRole);
%>

<c:if test='${principalHasRoleTagHasRole}'>
	<jsp:doBody/>
</c:if>