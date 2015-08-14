/*
 * Kuali Coeus, a comprehensive research administration system for higher education.
 * 
 * Copyright 2005-2015 Kuali, Inc.
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 * 
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package org.kuali.kra.negotiations.rules;

import java.util.Calendar;
// KC-892  Enforce some negotiation activity type entries to single occurrence per award 
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
// KC-892  END



import org.apache.commons.lang3.StringUtils;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.kra.infrastructure.KeyConstants;
import org.kuali.kra.negotiations.bo.Negotiation;
import org.kuali.kra.negotiations.bo.NegotiationActivity;
import org.kuali.kra.negotiations.bo.NegotiationActivityType;
import org.kuali.kra.negotiations.document.NegotiationDocument;
import org.kuali.coeus.sys.framework.validation.ErrorReporter;
import org.kuali.rice.coreservice.framework.CoreFrameworkServiceLocator;
import org.kuali.rice.krad.service.BusinessObjectService;
import org.kuali.rice.krad.util.GlobalVariables;

import edu.hawaii.infrastructure.UhKeyConstants;

import java.util.Calendar;

/**
 * 
 * Validation class to use when validating activities.
 */
public class NegotiationActivityRuleImpl implements NegotiationActivityAddRule {
    
    private static final String START_DATE_PROPERTY = "startDate";
    private static final String END_DATE_PROPERTY = "endDate";
    private static final String ACTIVITY_TYPE = "activityType";
    private static final String ACTIVITY_TYPE_ID = "activityTypeId";
    private static final String LOCATION = "location";
    private static final String LOCATION_ID = "locationId";
    private static final String DESCRIPTION = "description";
    private static final String ACTIVITY_TYPE_DESC = "Activity Type (Activity Type)";
    private static final String LOCATION_DESC = "Location (Location)";
    private static final String ACTIVITY_START_DATE_DESC = "Activity Start Date (Activity Start Date)";
    private static final String ACTIVITY_DESCRIPTION_DESC = "Activity Description (Activity Description)";

    private ErrorReporter errorReporter;
    
    @Override
    public boolean processAddNegotiationActivityRule(NegotiationActivityAddRuleEvent event) {
        boolean result = true;
        
        NegotiationDocument negotiationDoc = (NegotiationDocument) event.getDocument();
        Negotiation negotiation = negotiationDoc.getNegotiation();
        NegotiationActivity newActivity = event.getNewActivity();
        
        GlobalVariables.getMessageMap().addToErrorPath(event.getErrorPathPrefix());
        result &= validateNegotiationActivity(newActivity, negotiation);
        GlobalVariables.getMessageMap().removeFromErrorPath(event.getErrorPathPrefix());
        
        
        return result;
    }
    
    /**
     * 
     * Call this to validate individual activities.
     */
    public boolean validateNegotiationActivity(NegotiationActivity activity, Negotiation negotiation) {
        boolean result = true;
        activity.refreshReferenceObject(ACTIVITY_TYPE);
        if (activity.getActivityType() == null) {
            result = false;
            getErrorReporter().reportError(ACTIVITY_TYPE_ID, KeyConstants.ERROR_REQUIRED, ACTIVITY_TYPE_DESC);
        }
        activity.refreshReferenceObject(LOCATION);
        if (activity.getLocation() == null) {
            result = false;
            getErrorReporter().reportError(LOCATION_ID, KeyConstants.ERROR_REQUIRED, LOCATION_DESC);
        }
        if (activity.getStartDate() == null) {
            result = false;
            getErrorReporter().reportError(START_DATE_PROPERTY, KeyConstants.ERROR_REQUIRED, ACTIVITY_START_DATE_DESC);
        }
        //  KC-817 Change Negotiation Activity Description to be non-required 
        //  NOTE: KC-815 unless activity type other is selected
        String uh_negotiation_description_required_activities = CoreFrameworkServiceLocator
                .getParameterService().getParameterValueAsString("KC-GEN",
                                "All", "uh_negotiation_description_required_activities");
        if (activity.getActivityType() != null 
        	&& uh_negotiation_description_required_activities.contains("[" + activity.getActivityType().getCode() + "]") 
        	&& StringUtils.isBlank(activity.getDescription())) {
            result = false;
            getErrorReporter().reportError(DESCRIPTION, UhKeyConstants.ERROR_NEGOTIATION_DESCRIPTION_REQUIRED, ACTIVITY_DESCRIPTION_DESC);
        }
        //  End KC-815
        if (activity.getStartDate() != null && negotiation.getNegotiationStartDate() != null 
                && activity.getStartDate().compareTo(negotiation.getNegotiationStartDate()) < 0) {
            result = false;
            getErrorReporter().reportError(START_DATE_PROPERTY, KeyConstants.NEGOTIATION_ACTIVITY_START_BEFORE_NEGOTIATION);
        }
        if (activity.getStartDate() != null && activity.getEndDate() != null
                && activity.getStartDate().compareTo(activity.getEndDate()) > 0) {
            result = false;
            getErrorReporter().reportError(END_DATE_PROPERTY, KeyConstants.NEGOTIATION_ACTIVITY_START_BEFORE_END);
        }
        if (activity.getEndDate() != null && negotiation.getNegotiationEndDate() != null
                && activity.getEndDate().compareTo(negotiation.getNegotiationEndDate()) > 0) {
            result = false;
            getErrorReporter().reportError(END_DATE_PROPERTY, KeyConstants.NEGOTIATION_ACTIVITY_END_AFTER_NEGOTIATION);
        }
        // KC-892 Enforce some negotiation activity type entries to single occurrence per award 
        String violatingActivityTypes = verifyActivityCountRule(activity, negotiation);
        if(violatingActivityTypes!=null){
        	result=false;
           	getErrorReporter().reportError("activityTypeId", UhKeyConstants.ERROR_NEGOTIATION_SINGLE_ACTIVITY_ALLOWED, violatingActivityTypes);
        }
        // KC-892 END

        return result;
    }


    public ErrorReporter getErrorReporter() {
        if (errorReporter == null) {
            errorReporter = KcServiceLocator.getService(ErrorReporter.class);
        }

        return errorReporter;
    }

    // KC-892 Enforce some negotiation activity type entries to single occurrence per award 
	private String verifyActivityCountRule(NegotiationActivity activityToVerify, Negotiation negotiation) {
		List<NegotiationActivity> negotiationActivities = negotiation.getActivities();
		String violatingActivityTypes=null; 
		
		
		//example of expected format of uh_negotiation_activity_type_required_rules returned by the parameter service :  OR:GR:CR:AR:HE:AA;CG
		String uh_negotiation_one_entry_allowed_per_activity = CoreFrameworkServiceLocator
				.getParameterService()
				.getParameterValueAsString("KC-GEN", "All",	"uh_negotiation_one_entry_allowed_per_activity");
		
		String ActivityTypeCodeToVerify=activityToVerify.getActivityType().getCode();
		String matchingActivityTypeCodeRule=null;
		//Find the Rules associated with the activity type
		for (String activityTypeCodeRules : uh_negotiation_one_entry_allowed_per_activity.split(":")) {
			for (String activityTypeCode : activityTypeCodeRules.split(";")) {
				// See if rule contains activityType we are checking
				if (activityTypeCode.equals(ActivityTypeCodeToVerify)) {
					matchingActivityTypeCodeRule = activityTypeCodeRules;
				}
			}
		}
				
		if (matchingActivityTypeCodeRule != null) {
			boolean violation=false;
			// Iterate thru the existing activities and check for activities that violate the rules
			for (NegotiationActivity negotiationActivity : negotiationActivities) {
				// Check that negotiationActivity is not also the activityToVerify so it doesn't compare to itself and cause error
				if(activityToVerify!=negotiationActivity) {				    					
				    for(String activityTypeCodeRule: matchingActivityTypeCodeRule.split(";")){
				    	if (activityTypeCodeRule.equals(negotiationActivity.getActivityType().getCode())) {
				    		violation = true;
					    }
				    }
				}
			}
			// convert activityTypeCodeRule to a user readable list of activity type code descriptions
			// Rule may contain one or more activityTypeCodes to be converted to description name(s)
			if(violation){
				StringBuilder activityDescriptions = new StringBuilder();
		    	for( String ruleActivityTypeCode : matchingActivityTypeCodeRule.split(";") ) {
		            if (activityDescriptions.length() != 0)
		            	activityDescriptions.append(",");
		    	    Map<String, String> primaryKeys = new HashMap<String, String>();
		            primaryKeys.put("NEGOTIATION_ACTIVITY_TYPE_CODE", ruleActivityTypeCode);
		            NegotiationActivityType activityType = (NegotiationActivityType) KcServiceLocator.getService(BusinessObjectService.class).findByPrimaryKey(NegotiationActivityType.class, primaryKeys);
		    	    activityDescriptions.append("\"").append(activityType.getDescription()).append("\"");
		    	}
		    	violatingActivityTypes=activityDescriptions.toString();
	    	}
		}
		return violatingActivityTypes;
	}
	// KC-892 END
    public void setErrorReporter(ErrorReporter errorReporter) {
        this.errorReporter = errorReporter;
    }
}
