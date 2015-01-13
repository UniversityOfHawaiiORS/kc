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
import java.util.List;

import org.kuali.kra.infrastructure.Constants;
import org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal;
import org.kuali.kra.proposaldevelopment.bo.ProposalAbstract;
import org.kuali.kra.proposaldevelopment.document.ProposalDevelopmentDocument;
import org.kuali.kra.proposaldevelopment.rule.event.SaveProposalSitesEvent;
import org.kuali.kra.proposaldevelopment.rules.ProposalDevelopmentDocumentRule;
import org.kuali.rice.krad.document.Document;
import org.kuali.rice.kns.util.AuditCluster;
import org.kuali.rice.kns.util.AuditError;
import org.kuali.rice.kns.util.KNSGlobalVariables;
import edu.hawaii.infrastructure.UhKeyConstants;

/**
 * UH Extension of ProposalDevelopmentDocumentRule UH CHANGES:
 * 
 * KC-201 - Make Project Summary Abstract required
 * 
 */
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
		List<AuditError> auditErrors = new ArrayList<AuditError>();
		DevelopmentProposal developmentProposal = proposalDevelopmentDocument
				.getDevelopmentProposal();
		boolean hasProjectSummary = false;
		boolean isProjectSummaryTooLong = false;
		//UH KC-515 BEGIN - rbl improve project summary validation
		int projSummaryLength = 0;
		for (ProposalAbstract proposalAbstract : developmentProposal.getProposalAbstracts()) {
			if(proposalAbstract.getAbstractType().getAbstractTypeCode().equals(PROJECT_SUMMARY_ABSTRACT_TYPE)){
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
				auditErrors.add(new AuditError(
						AUDIT_ERROR_KEY, UhKeyConstants.ERROR_DOCUMENT_ABSTRACT_PROJECT_SUMMARY_TOOLONG, Constants.ATTACHMENTS_PAGE));
			}
			else {
			auditErrors.add(new AuditError(
				AUDIT_ERROR_KEY, UhKeyConstants.ERROR_DOCUMENT_ABSTRACT_PROJECT_SUMMARY_MISSING, Constants.ATTACHMENTS_PAGE));
			}
		}
		//UH KC-515 END

		if (auditErrors.size() > 0) {
			// KC-569 Abstracts and Attachments listed twice under validation errors
			AuditCluster proposalAuditWarnings = (AuditCluster) KNSGlobalVariables.getAuditErrorMap().get("proposalAttachmentsAuditWarnings");
			if(proposalAuditWarnings == null) {
				proposalAuditWarnings = new AuditCluster(Constants.ABSTRACTS_AND_ATTACHMENTS_PANEL, auditErrors, Constants.AUDIT_ERRORS);
			}
			else {
				@SuppressWarnings("unchecked")
				List<AuditError> warningList = proposalAuditWarnings.getAuditErrorList(); 
				warningList.addAll(auditErrors);
			}
			// KC-569 Abstracts and Attachments listed twice under validation errors
			KNSGlobalVariables.getAuditErrorMap().put("proposalAttachmentsAuditWarnings", proposalAuditWarnings);
		}

		return valid;
	}
	
	/**
	 * KC-306 - Make Primary performance site required
	 * 
	 * @see org.kuali.rice.kns.rule.SaveDocumentRule#processSaveDocument(org.kuali.rice.kns.document.Document)
	 */
	@Override
	public boolean processSaveProposalSiteBusinessRules(SaveProposalSitesEvent saveProposalSitesEvent) {
		return new UhProposalDevelopmentProposalLocationRule().processSaveProposalSiteBusinessRules(saveProposalSitesEvent);
	  }
}
