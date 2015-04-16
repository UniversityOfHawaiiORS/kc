package edu.hawaii.rice.kew.role.service.impl;

import org.apache.commons.lang.StringUtils;
import org.kuali.rice.core.api.exception.RiceIllegalArgumentException;
import org.kuali.rice.kew.api.KewApiServiceLocator;
import org.kuali.rice.kew.api.document.WorkflowDocumentService;
import org.kuali.rice.kew.role.service.impl.RouteLogDerivedRoleTypeServiceImpl;
import org.kuali.rice.kim.api.KimConstants;
import org.kuali.rice.kim.framework.common.delegate.DelegationTypeService;
import org.kuali.rice.kim.framework.role.RoleTypeService;
import java.util.List;
import java.util.Map;

public class UhRouteLogDerivedRoleTypeServiceImpl
extends RouteLogDerivedRoleTypeServiceImpl
implements RoleTypeService, DelegationTypeService
{

    @Override
    public boolean hasDerivedRole(String principalId, List<String> groupIds, String namespaceCode, String roleName,
                                  Map<String, String> qualification)
    {
        if (StringUtils.isBlank(principalId)) {
            throw new RiceIllegalArgumentException("principalId was null or blank");
        }

        if (groupIds == null) {
            throw new RiceIllegalArgumentException("groupIds was null or blank");
        }

        if (StringUtils.isBlank(namespaceCode)) {
            throw new RiceIllegalArgumentException("namespaceCode was null or blank");
        }

        if (StringUtils.isBlank(roleName)) {
            throw new RiceIllegalArgumentException("roleName was null or blank");
        }

        if (qualification == null) {
            throw new RiceIllegalArgumentException("qualification was null");
        }


        validateRequiredAttributesAgainstReceived(qualification);
        boolean isUserInRouteLog = false;
        if (qualification != null && !qualification.isEmpty()) {
            String documentId = qualification.get(KimConstants.AttributeConstants.DOCUMENT_NUMBER);
            // KC-869 Awards opened from award notice emails randomly failing
            // When testing I find there are times this method is called in rice but the 
            // document id attribute is not provided.  This causes a null exception 
            // which is ignored in my testing but in production is producing Stack Trace 
            // failure page to appear
            // So I will override this service in myGRANT with this implementation  to 
            // return false in these conditions. 
            if (documentId != null) {
                WorkflowDocumentService workflowDocumentService = KewApiServiceLocator.getWorkflowDocumentService();
                try {
                    if (INITIATOR_ROLE_NAME.equals(roleName)) {
                        isUserInRouteLog = principalId.equals(workflowDocumentService.getDocumentInitiatorPrincipalId(documentId));
                    }
                    else if (INITIATOR_OR_REVIEWER_ROLE_NAME.equals(roleName)) {
                        isUserInRouteLog = KewApiServiceLocator.getWorkflowDocumentActionsService().isUserInRouteLog(documentId,
                        principalId, true);
                    }
                    else if (ROUTER_ROLE_NAME.equals(roleName)) {
                        isUserInRouteLog = principalId.equals(workflowDocumentService.getRoutedByPrincipalIdByDocumentId(documentId));
                    }
                }
                catch (Exception wex) {
                    throw new RuntimeException("Error in determining whether the principal Id: " + principalId + " is in route log "
                    + "for document id: " + documentId + " :" + wex.getLocalizedMessage(), wex);
                }
            }
            // KC-869 END
        }
        return isUserInRouteLog;
    }
}
