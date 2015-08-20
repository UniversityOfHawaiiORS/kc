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

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.kuali.coeus.propdev.impl.abstrct.ProposalAbstract;
import org.kuali.coeus.propdev.impl.attachment.Narrative;
import org.kuali.coeus.propdev.impl.attachment.NarrativeType;
import org.kuali.coeus.propdev.impl.core.DevelopmentProposal;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentDocument;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentDocumentRule;
import org.kuali.coeus.propdev.impl.datavalidation.ProposalDevelopmentDataValidationConstants;
import org.kuali.coeus.propdev.impl.location.ProposalSite;
import org.kuali.coeus.propdev.impl.location.SaveProposalSitesEvent;
import org.kuali.coeus.propdev.impl.person.ProposalPerson;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.kra.infrastructure.KeyConstants;
import org.kuali.rice.krad.document.Document;
import org.kuali.rice.krad.util.AuditCluster;
// KC-933 Turning on PD Audit Rules generates blank screen in KC 6.0 upgrade
import org.kuali.rice.krad.util.AuditError;
import org.kuali.rice.krad.util.GlobalVariables;
import org.kuali.rice.kns.util.KNSGlobalVariables;

import edu.hawaii.infrastructure.UhKeyConstants;

import static org.kuali.coeus.propdev.impl.datavalidation.ProposalDevelopmentDataValidationConstants.*;

/**
 * UH Extension of ProposalDevelopmentDocumentRule UH CHANGES:
 * 
 * KC-201 - Make Project Summary Abstract required
 * 
 */
@SuppressWarnings("deprecation")
public class UhProposalDevelopmentDocumentRule extends
		ProposalDevelopmentDocumentRule {

	private static final String PROJECT_SUMMARY_ABSTRACT_TYPE = "1";
	private static final String AUDIT_ERROR_KEY = "document.developmentProposalList[0].proposalAbstract*";

	/**
	 * KC-201 - Make Project Summary Abstract required
	 * @see org.kuali.rice.kns.rule.DocumentAuditRule#processRunAuditBusinessRules(org.kuali.rice.kns.document.Document)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public boolean processRunAuditBusinessRules(Document document) {
		boolean valid = super.processRunAuditBusinessRules(document);

		ProposalDevelopmentDocument proposalDevelopmentDocument = (ProposalDevelopmentDocument) document;
		DevelopmentProposal developmentProposal = proposalDevelopmentDocument
				.getDevelopmentProposal();
		boolean hasProjectSummary = false;
		boolean isProjectSummaryTooLong = false;
		//UH KC-515 BEGIN - rbl improve project summary validation
		int projSummaryLength = 0;
		for (ProposalAbstract proposalAbstract : developmentProposal.getProposalAbstracts()) {
			if(proposalAbstract.getAbstractTypeCode().equals(PROJECT_SUMMARY_ABSTRACT_TYPE)){
				projSummaryLength = proposalAbstract.getAbstractDetails().length();
				if(projSummaryLength > 0 && projSummaryLength <= 1000) {
					hasProjectSummary = true;
				}
				
				else if (projSummaryLength > 1000) {
					isProjectSummaryTooLong = true;
				}
		
			}
		}
		
		if (!hasProjectSummary) {
			valid = false;
			if(isProjectSummaryTooLong) {
				// KC-951 Fix Project Summary Required UH Enhancement
				List<AuditError> errors = new ArrayList<AuditError>();
				errors.add(new AuditError(AUDIT_ERROR_KEY, UhKeyConstants.ERROR_DOCUMENT_ABSTRACT_PROJECT_SUMMARY_TOOLONG,
						ProposalDevelopmentDataValidationConstants.ATTACHMENT_PAGE_ID + "." + ProposalDevelopmentDataValidationConstants.ATTACHMENT_ABSTRACTS_SECTION_ID));
				GlobalVariables.getAuditErrorMap().put(ProposalDevelopmentDataValidationConstants.ATTACHMENT_ABSTRACTS_SECTION_NAME, new AuditCluster(ProposalDevelopmentDataValidationConstants.ATTACHMENT_ABSTRACTS_SECTION_NAME, errors, AUDIT_ERRORS));
			}
			else {
				// KC-951 Fix Project Summary Required UH Enhancement
				List<AuditError> errors = new ArrayList<AuditError>();
				errors.add(new AuditError(AUDIT_ERROR_KEY, UhKeyConstants.ERROR_DOCUMENT_ABSTRACT_PROJECT_SUMMARY_MISSING,
						ProposalDevelopmentDataValidationConstants.ATTACHMENT_PAGE_ID + "." + ProposalDevelopmentDataValidationConstants.ATTACHMENT_ABSTRACTS_SECTION_ID));
				GlobalVariables.getAuditErrorMap().put(ProposalDevelopmentDataValidationConstants.ATTACHMENT_ABSTRACTS_SECTION_NAME, new AuditCluster(ProposalDevelopmentDataValidationConstants.ATTACHMENT_ABSTRACTS_SECTION_NAME, errors, AUDIT_ERRORS));
			}
		}
		//UH KC-515 END

		// KC-966 Add FCOI Validation rule
		Boolean warningSetForFCOI = false;
		List<ProposalPerson> persons = developmentProposal.getProposalPersons();
		for (Iterator<ProposalPerson> pIter = persons.iterator(); pIter.hasNext();) {
			ProposalPerson p = pIter.next();
			if (! warningSetForFCOI
					&& ! p.isEmployee()
					&& ! hasFCOIDisclosure(developmentProposal) ) {
				warningSetForFCOI = true;
				getAuditErrors(ATTACHMENT_INTERNAL_LOCATION, AUDIT_WARNINGS).add(new AuditError(ATTACHMENT_PAGE_ID, UhKeyConstants.WARNING_NON_EMPLOYEE_FCOI_REQUIRED, ATTACHMENT_PAGE_ID + "." + ATTACHMENT_INTERNAL_SECTION_ID));
			}
		}
		// KC-966 END

		// KC-952 Project Performance Site Improvements
		// We removed the default primary performance site but want to make sure user selects one
        ProposalSite po = developmentProposal.getPerformingOrganization();
        if (po == null || po.getOrganizationId() == null) {
            List<AuditError> errors = new ArrayList<AuditError>();
            errors.add(new AuditError(AUDIT_ERROR_KEY, UhKeyConstants.ERROR_PROPOSAL_SITES_PRIMARY_REQUIRED, ORGANIZATION_PAGE_ID + "." + PERFORMING_ORGANIZATION_SECTION_ID));
            GlobalVariables.getAuditErrorMap().put(PROPOSAL_ORGANIZATION_LOCATION, new AuditCluster(PROPOSAL_ORGANIZATION_LOCATION, errors, AUDIT_ERRORS));
        }
		// KC-952 Project Performance Site Improvements END



/*   KC-933 Turning on PD Audit Rules generates blank screen in KC 6.0 upgrade
 *   NOTE: commenting out to see if we still need this fix in new KC6.0 design I don't think we do
		if (auditErrors.size() > 0) {
			// KC-569 Abstracts and Attachments listed twice under validation errors
			AuditCluster proposalAuditWarnings = (AuditCluster) GlobalVariables.getAuditErrorMap().get("proposalAttachmentsAuditWarnings");
			if(proposalAuditWarnings == null) {
				proposalAuditWarnings = new AuditCluster(Constants.ABSTRACTS_AND_ATTACHMENTS_PANEL, auditErrors, Constants.AUDIT_ERRORS);
			}
			else {
				@SuppressWarnings("unchecked")
				List<AuditError> warningList = proposalAuditWarnings.getAuditErrorList(); 
				warningList.addAll(auditErrors);
			}
			// KC-569 Abstracts and Attachments listed twice under validation errors
			GlobalVariables.getAuditErrorMap().put("proposalAttachmentsAuditWarnings", proposalAuditWarnings);
		}
*/

		return valid;
	}

	// KC-966 Add FCOI Validation rule
	private boolean hasFCOIDisclosure(DevelopmentProposal developmentProposal) {

		List<Narrative> attachments = developmentProposal.getInstituteAttachments();
		for (Narrative attachment : attachments) {
			NarrativeType nt = attachment.getNarrativeType();
			if (nt != null
					&& nt.getDescription().equals("FCOI Disclosure")) {
				return true;
			}
		}

		return false;
	}

	private List<AuditError> getAuditErrors(String errorGroupName, String severity) {
		List<AuditError> errorsOrWarnings = new ArrayList<AuditError>();

		if (!GlobalVariables.getAuditErrorMap().containsKey(errorGroupName)) {
			GlobalVariables.getAuditErrorMap().put(errorGroupName, new AuditCluster(errorGroupName, errorsOrWarnings, severity));
		}
		else {
			errorsOrWarnings = GlobalVariables.getAuditErrorMap().get(errorGroupName).getAuditErrorList();
		}
		return errorsOrWarnings;
	}
	// KC-966 END



}







