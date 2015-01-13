package edu.hawaii.proposaldevelopment.service.impl;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal;
import org.kuali.kra.proposaldevelopment.bo.ProposalSite;
import org.kuali.kra.proposaldevelopment.document.ProposalDevelopmentDocument;
import org.kuali.kra.proposaldevelopment.service.impl.ProposalDevelopmentServiceImpl;

/**
 * UH Changes: KC-306: We don't want to populate a default performance site.
 *             KC-391: If SITE_NUMBER generated by the code exceeds 999 for a proposal it can't be saved due to data constraint errors
 * 
 * @author sfblake
 * 
 */
public class UhProposalDevelopmentServiceImpl extends
		ProposalDevelopmentServiceImpl {

	protected final Log LOG = LogFactory
			.getLog(UhProposalDevelopmentServiceImpl.class);

	/**
	 * KC-306: We don't want to populate a default performance site.
	 * 
	 * This method will empty the performing organization if set by the parent's version of this method.
	 * 
	 * We need to call the parent so it can set the Applicant Organization, then we blank out the Performing Organization
	 * if it is set initially by the lead unit (versus manually set by the user). 
	 * 
	 * @param proposalDevelopmentDocument
	 */
	public void initializeUnitOrganizationLocation(
			ProposalDevelopmentDocument proposalDevelopmentDocument) {
		//Here we do the same check that the parent method will eventually do to decide
		//whether to set the performing organization from the lead unit.  If it does get set 
		//by the parent method, we will reset it back to an empty proposal site.
		DevelopmentProposal developmentProposal = proposalDevelopmentDocument.getDevelopmentProposal();
		ProposalSite performingOrganization = developmentProposal.getPerformingOrganization();
		boolean isPerformingOrganizationSetByLeadUnit = StringUtils.isEmpty(developmentProposal.getProposalNumber()) && performingOrganization.getOrganization() == null && developmentProposal.getOwnedByUnitNumber() != null;
		
		//Call the parent version so the Applicant Organization gets set
		super.initializeUnitOrganizationLocation(proposalDevelopmentDocument);

		//If it was set by the parent's initializeUnitOrganizationLocation
		if(isPerformingOrganizationSetByLeadUnit) {
			developmentProposal.setPerformingOrganization(new ProposalSite());
		}
		return;
	}
}
