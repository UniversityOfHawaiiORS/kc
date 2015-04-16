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
package edu.hawaii.award.lookup;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.kuali.kra.award.home.Award;
import org.kuali.rice.kew.api.exception.WorkflowException;
import org.kuali.rice.krad.bo.BusinessObject;
import org.kuali.kra.award.lookup.AwardLookupableHelperServiceImpl;

/**
 * KC-367: This new search does exactly the old search except it doesn't filter the results.
 * 
 * 
 * This class provides Award lookup support
 */
@SuppressWarnings("deprecation")
class AwardAdvancedSearchLookupableHelperServiceImpl extends
		AwardLookupableHelperServiceImpl {

	private static final long serialVersionUID = 167523392685204053L;
	private static final Log LOG = LogFactory.getLog(AwardAdvancedSearchLookupableHelperServiceImpl.class);

	//KC-650 Advanced Award Lookup behaves like a basic search.
	public List<? extends BusinessObject> getSearchResults(Map<String, String> fieldValues) {
		fieldValues.put("UhAdvancedSearch","Y");
		return (List<? extends BusinessObject>) super.getSearchResults(fieldValues);
	}
	
	//KC-650 Advanced Award Lookup behaves like a basic search.
	//       KC 5.1.1 broke this advanced search approach so I had to implement a different approach.
	//KC-367: Just do as before everywhere except when asked to filter, don't do it.
	//protected List<Award> filterForActiveAwardsAndAwardWithActiveTimeAndMoney(
	//		Collection<Award> collectionByQuery) throws WorkflowException {
	//	return (List<Award>) collectionByQuery;
	//}
}
