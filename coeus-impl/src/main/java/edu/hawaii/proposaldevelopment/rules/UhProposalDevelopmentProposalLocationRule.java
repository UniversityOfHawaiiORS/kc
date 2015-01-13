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
package edu.hawaii.proposaldevelopment.rules;

import org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal;
import org.kuali.kra.proposaldevelopment.bo.ProposalSite;
import org.kuali.kra.proposaldevelopment.document.ProposalDevelopmentDocument;
import org.kuali.kra.proposaldevelopment.rule.event.SaveProposalSitesEvent;
import org.kuali.kra.proposaldevelopment.rules.ProposalDevelopmentProposalLocationRule;

import edu.hawaii.infrastructure.UhKeyConstants;

public class UhProposalDevelopmentProposalLocationRule extends ProposalDevelopmentProposalLocationRule {

	/**
	 * KC-306 - Make Primary performance site required.
	 * 
	 * @param saveProposalSiteEvent
	 * @return
	 */
	public boolean processSaveProposalSiteBusinessRules(
			SaveProposalSitesEvent saveProposalSiteEvent) {
		boolean isValid = super.processSaveProposalSiteBusinessRules(saveProposalSiteEvent);

		ProposalDevelopmentDocument document = (ProposalDevelopmentDocument) saveProposalSiteEvent.getDocument();
		DevelopmentProposal developmentProposal = document.getDevelopmentProposal();
		ProposalSite performingOrganization = developmentProposal.getPerformingOrganization();
		
		if(performingOrganization == null || performingOrganization.getOrganizationId() == null) {
			isValid = false;
			this.getErrorReporter().reportError(saveProposalSiteEvent.getErrorPathPrefix(), UhKeyConstants.ERROR_PROPOSAL_SITES_PRIMARY_REQUIRED);
		}

		return isValid;
	}
}
