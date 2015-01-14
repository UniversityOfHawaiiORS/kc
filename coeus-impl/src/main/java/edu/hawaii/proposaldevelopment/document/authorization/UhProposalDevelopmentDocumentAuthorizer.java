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
package edu.hawaii.proposaldevelopment.document.authorization;

import org.kuali.coeus.propdev.impl.auth.ProposalDevelopmentDocumentAuthorizer;
import org.kuali.rice.kim.api.identity.Person;
import org.kuali.rice.krad.document.Document;

/**
 * KC-263 - Hide or Remove Disapprove button on Proposal Actions tab
 *
 */
public class UhProposalDevelopmentDocumentAuthorizer extends ProposalDevelopmentDocumentAuthorizer {

    
    /**
	 * 
	 */
	private static final long serialVersionUID = 7944931271831598538L;
	org.apache.commons.logging.Log LOG = org.apache.commons.logging.LogFactory.getLog(UhProposalDevelopmentDocumentAuthorizer.class);
    
    
    /**
     * KC-263 - Hide or Remove Disapprove button on Proposal Actions tab
     *
     */
    @Override
    public boolean canDisapprove( Document document, Person user ) {
        return false;
    }
}
