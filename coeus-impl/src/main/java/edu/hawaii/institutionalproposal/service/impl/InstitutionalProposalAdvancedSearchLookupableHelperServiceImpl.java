/*
 * Copyright 2005-2010 The Kuali Foundation
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
package edu.hawaii.institutionalproposal.service.impl;

import java.util.List;
import java.util.Map;

import org.kuali.kra.institutionalproposal.home.InstitutionalProposal;
import org.kuali.kra.institutionalproposal.service.impl.InstitutionalProposalLookupableHelperServiceImpl;
import org.kuali.rice.krad.bo.BusinessObject;

/**
 * KC-367: This new search does exactly the old search except it doesn't filter
 * the results.
 * 
 */

@SuppressWarnings("deprecation")
public class InstitutionalProposalAdvancedSearchLookupableHelperServiceImpl
		extends InstitutionalProposalLookupableHelperServiceImpl {

	private static final long serialVersionUID = -1153806499975873212L;
	
	/*
	 * KC-367 - Copied from InstitutionalProposalLookupableHelperServiceImpl (5_1 code) - In our case we want unfiltered results 
	 */
	@Override
    @SuppressWarnings("unchecked")
    public List<? extends BusinessObject> getSearchResults(Map<String, String> fieldValues) {
        
		// KC-624 IP advanced search is not working
		// Add a field indicating this is an advanced search and just call parent
        fieldValues.put("UhAdvancedSearch","Y");
        
        return (List<InstitutionalProposal>) super.getSearchResults(fieldValues);
    }
}
