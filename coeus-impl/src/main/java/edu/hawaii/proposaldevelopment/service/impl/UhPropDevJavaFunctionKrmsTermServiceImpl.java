/* New code for KC-801 */
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
package edu.hawaii.proposaldevelopment.service.impl;

import org.apache.commons.lang.StringUtils;
import org.kuali.kra.budget.core.Budget;
import org.kuali.kra.krms.service.impl.KcKrmsJavaFunctionTermServiceBase;
import org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal;
import edu.hawaii.proposaldevelopment.service.UhPropDevJavaFunctionKrmsTermService;


public class UhPropDevJavaFunctionKrmsTermServiceImpl extends KcKrmsJavaFunctionTermServiceBase implements UhPropDevJavaFunctionKrmsTermService {
    
    //  RRG 
    /**
     * 
     * This method checks if there is a final budget which contains unrecovered F & A  
     * @param developmentProposal
     * @return 'true' if is any unrecovered F and A (know as underrecovery amount under the hood, otherwise returns 'false'.
     */
    @Override
    public String hasUnrecoveredFandA(DevelopmentProposal developmentProposal) {
    	Budget budget=developmentProposal.getProposalDocument().getFinalBudgetForThisProposal();
    	if (budget != null) {
    		if (budget.getUnderrecoveryAmount() != null && budget.getUnderrecoveryAmount().getFloatValue() != 0) {
    			return TRUE;
    		}
    	}
    	return FALSE;
    }
    
    // KC-837 KRMS - New term needed, "Prime Sponsor ID"
    public String hasPrimeSponsor(DevelopmentProposal developmentProposal, String sponsorCode) {
        if (StringUtils.equals(developmentProposal.getPrimeSponsorCode(), sponsorCode)) {
            return TRUE;
        } else {
            return FALSE;
        }
    }
    // KC-837 END
    

}
