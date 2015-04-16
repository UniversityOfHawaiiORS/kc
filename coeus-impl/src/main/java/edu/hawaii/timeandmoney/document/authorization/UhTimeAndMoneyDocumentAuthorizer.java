/*
 * Copyright 2005-2010 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.osedu.org/licenses/ECL-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package edu.hawaii.timeandmoney.document.authorization;

import org.kuali.kra.timeandmoney.document.authorization.TimeAndMoneyDocumentAuthorizer;
import org.kuali.rice.kim.api.identity.Person;
import org.kuali.rice.krad.document.Document;

/**
 * KC-335: Allow Award to be submit by anyone with correct permission.  We need to add the unit role to the
 * qualifications or their role will not authorize correctly (in UnitHierarchyRoleTypeServiceImpl.performMatch).
 * The logic is a copy of the same method in TimeAndMoneyDocumentAuthorizer.
 * 
 */
public class UhTimeAndMoneyDocumentAuthorizer extends TimeAndMoneyDocumentAuthorizer {

	private static final long serialVersionUID = -3042408842687498598L;

	// KC-843 Can we hide the cancel button in award and time and money
	@Override
    public boolean canCancel(Document document, Person user) {
		return false;
	}
	// KC-843 End
	
}
