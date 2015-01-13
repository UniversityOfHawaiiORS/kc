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
package edu.hawaii.proposaldevelopment.web.struts.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal;
import org.kuali.kra.proposaldevelopment.bo.ProposalSite;
import org.kuali.kra.proposaldevelopment.web.struts.action.ProposalDevelopmentProposalAction;
import org.kuali.kra.proposaldevelopment.web.struts.form.ProposalDevelopmentForm;

public class UhProposalDevelopmentProposalAction extends
		ProposalDevelopmentProposalAction {

	/* 
	 * KC-306: Prevent performance site from defaulting to applicant organization
	 * 
	 * (non-Javadoc)
	 * @see org.kuali.kra.proposaldevelopment.web.struts.action.ProposalDevelopmentProposalAction#refresh(org.apache.struts.action.ActionMapping, org.apache.struts.action.ActionForm, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public ActionForward refresh(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//Here we want to do the same check that the parent method will do to determine whether it will set the
		//performing organization.  If it does, we undo it by setting it to an empty one. 
		ProposalDevelopmentForm proposalDevelopmentForm = (ProposalDevelopmentForm) form;
		DevelopmentProposal developmentProposal = proposalDevelopmentForm.getProposalDevelopmentDocument().getDevelopmentProposal();
		String performingOrganizationId = developmentProposal
				.getPerformingOrganization().getOrganizationId();

		boolean isPerformingOrganizationBeSetByApplicantOrg = StringUtils
				.isEmpty(performingOrganizationId);

		ActionForward returnAction = super.refresh(mapping, form, request,
				response);

		if (isPerformingOrganizationBeSetByApplicantOrg) {
			developmentProposal.setPerformingOrganization(new ProposalSite());
		}

		return returnAction;
	}
}
