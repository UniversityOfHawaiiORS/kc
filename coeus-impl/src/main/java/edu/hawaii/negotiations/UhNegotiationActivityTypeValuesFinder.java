/*
 * Copyright 2005-2013 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.opensource.org/licenses/ecl1.php
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package edu.hawaii.negotiations;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.kuali.kra.infrastructure.KraServiceLocator;
import org.kuali.kra.lookup.keyvalue.ExtendedPersistableBusinessObjectValuesFinder;
import org.kuali.kra.lookup.keyvalue.PrefixValuesFinder;
import org.kuali.kra.negotiations.bo.NegotiationActivityType;
import org.kuali.kra.negotiations.bo.NegotiationAssociationType;
import org.kuali.kra.negotiations.service.NegotiationService;
import org.kuali.rice.core.api.util.ConcreteKeyValue;
import org.kuali.rice.core.api.util.KeyValue;
import org.kuali.rice.coreservice.framework.CoreFrameworkServiceLocator;
import org.kuali.rice.krad.service.BusinessObjectService;

public class UhNegotiationActivityTypeValuesFinder extends ExtendedPersistableBusinessObjectValuesFinder {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1047136444232486423L;
	private BusinessObjectService businessObjectService;

    /**
     * Filter results based on whether the association is enabled.
     * @see org.kuali.rice.krad.keyvalues.PersistableBusinessObjectValuesFinder#getKeyValues()
     */
    @SuppressWarnings("unchecked")
    public List<KeyValue> getKeyValues(){
    	String uh_negotiation_activity_type_sort_order = CoreFrameworkServiceLocator
                .getParameterService().getParameterValueAsString("KC-GEN",
                                "All", "uh_negotiation_activity_type_sort_order");
    	
    	List<String> sortOrder =  Arrays.asList(uh_negotiation_activity_type_sort_order.split(","));
    	
    	// First add all the Activity Types to the list which are not in the sort parameter so we don't 
    	// drop any active activity types, place active activity types which are found in the sort list
    	// into a map so we can process them quickly in next step.
        List<ConcreteKeyValue> labels = new ArrayList<ConcreteKeyValue>();
        Collection<NegotiationActivityType> activityTypes = getBusinessObjectService().findAll(NegotiationActivityType.class);
        HashMap<String,NegotiationActivityType> activeActivityTypes = new HashMap<String,NegotiationActivityType>();
        
        for (NegotiationActivityType type : activityTypes) {
        	// If the type is active and not in the sort list then add it now
            if (type.isActive()) { 
            	if (!sortOrder.contains(type.getCode())) {
                    labels.add(new ConcreteKeyValue(type.getId().toString(), type.getDescription()));
            	} else {
            		activeActivityTypes.put(type.getCode(), type);
            	}
            }
        }
        
        // Now go though the sort parameter array list and add any code that is found in the active list
        for  (String activityCode : sortOrder ) {
        	// Add separator is sort order contains a value of "--"
        	if (activityCode.equals("--")) {
        		labels.add(new ConcreteKeyValue("", ""));
        	}
        	NegotiationActivityType activityType = activeActivityTypes.get(activityCode);
        	if (activityType != null) {
        		labels.add(new ConcreteKeyValue(activityType.getId().toString(), activityType.getDescription()));
        	}
        }

        // Add the "select" option at the top of the list
        labels.add(0, new ConcreteKeyValue(PrefixValuesFinder.getPrefixKey(), PrefixValuesFinder.getDefaultPrefixValue()));
        
        List<KeyValue> returnLabels = new ArrayList<KeyValue>();
        returnLabels.addAll(labels);
        
        return returnLabels;
    }

    protected BusinessObjectService getBusinessObjectService() {
        if (businessObjectService == null) {
            businessObjectService = KraServiceLocator.getService(BusinessObjectService.class);
        }
        return businessObjectService;
    }
}
