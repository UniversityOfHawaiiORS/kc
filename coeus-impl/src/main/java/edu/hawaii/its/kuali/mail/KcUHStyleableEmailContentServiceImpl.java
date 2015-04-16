/*
 * Copyright 2005-2007 The Kuali Foundation Licensed under the Educational Community License,
 * Version 2.0 (the "License"); you may not use this file except in compliance with the License. You
 * may obtain a copy of the License at http://www.opensource.org/licenses/ecl2.php Unless required
 * by applicable law or agreed to in writing, software distributed under the License is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See
 * the License for the specific language governing permissions and limitations under the License.
 */

package edu.hawaii.its.kuali.mail;

import static org.kuali.kra.infrastructure.Constants.CO_INVESTIGATOR_ROLE;
import static org.kuali.kra.infrastructure.Constants.KEY_PERSON_ROLE;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.log4j.Logger;
import org.kuali.coeus.propdev.impl.core.DevelopmentProposal;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentDocument;
import org.kuali.coeus.propdev.impl.person.ProposalPerson;
import org.kuali.rice.kew.actiontaken.ActionTakenValue;
import org.kuali.rice.kew.api.action.ActionItem;
import org.kuali.rice.kew.api.util.CodeTranslator;
import org.kuali.rice.kew.doctype.bo.DocumentType;
import org.kuali.rice.core.api.mail.EmailContent;
import org.kuali.rice.kew.mail.service.impl.StyleableEmailContentServiceImpl;
import org.kuali.rice.kew.routeheader.DocumentRouteHeaderValue;
import org.kuali.rice.kew.service.KEWServiceLocator;
import org.kuali.rice.kim.api.identity.Person;
import org.kuali.rice.krad.service.KRADServiceLocatorWeb;

import com.google.common.base.Preconditions;

/**
 * Associated Jira Issues
 * KC-286, KC-422, KC-434, KC-457, KC-496
 * 
 * @author Kuali Rice Team (kuali-rice@googlegroups.com)
 */
public class KcUHStyleableEmailContentServiceImpl extends
			StyleableEmailContentServiceImpl {
	private static final int MAX_SUBJECT_LENGTH = 60;
	private static final int MAX_TITLE_LENGTH = 60;
	private static final Logger LOG = Logger
			.getLogger(KcUHStyleableEmailContentServiceImpl.class);

	/**
	 * KC-286: Here we just change the email subject to add PI and COI and limit it to MAX_SUBJECT_LENGTH.
	 */
	public EmailContent generateImmediateReminder(Person user,
			ActionItem actionItem, DocumentType documentType) {

		EmailContent content = super.generateImmediateReminder(user, actionItem, documentType);
		//UH KC-422, KC-434, KC-457, KC-496, KC-645 BEGIN rbl made email notification body changes
		String origEmailBody = content.getBody();
		boolean isHtml = content.isHtml();
		String newEmailBody = "";
		String newEmailLines = "";
		String newProjectTitleLine = "Title:\t \n";
		//UH KC-422, KC-434, KC-457, KC-496, KC-645 END
		//Catch and log everything so that if anything goes wrong with our code the email will still go out
		try {
			Preconditions.checkNotNull(actionItem);
			Preconditions.checkNotNull(documentType);

			//Only check ProposalDevelopmentDocuments - Not sure if there is a constant for the document type name but
			//the class would be the next best thing
			if(documentType.getName().equals(ProposalDevelopmentDocument.class.getSimpleName())) {
				ProposalDevelopmentDocument proposalDoc = null;
				proposalDoc = (ProposalDevelopmentDocument) KRADServiceLocatorWeb.getDocumentService().getByDocumentHeaderId(actionItem.getDocumentId());
				
				if(proposalDoc != null && proposalDoc.getDevelopmentProposal() != null) {
					DevelopmentProposal proposal = proposalDoc.getDevelopmentProposal();
					ProposalPerson principal = proposal.getPrincipalInvestigator();
					List<ProposalPerson> proposalPersons = proposal.getProposalPersons();
					String pi = "";
					String coi = "";
					String keyPerson = "";
					pi = principal.getFullName();
					String subject = "Proposal action (" + CodeTranslator.getActionRequestLabel(
			                actionItem.getActionRequestCd()) + ") for " + pi;
					//NIH proposal development docs can have multiple PIs
					pi += ", ";
					for (ProposalPerson proposalPerson : proposalPersons) {
						if(proposalPerson.getProposalPersonRoleId().equals(CO_INVESTIGATOR_ROLE)) {
							subject += ", " + proposalPerson.getFullName();
							//UH KC-434 rbl add pis, cois, and key persons to action list notification for proposal development docs
							//NOTE: NIH proposal development docs can have multiple PIs they are entered in the system with role of COI and the Multiple PI checked
							//so we will process them here and add them to the PI list
							if(proposalPerson.isMultiplePi()) {
								pi += proposalPerson.getFullName() + ", ";
							}
							else {
								coi += proposalPerson.getFullName() + ", ";
							}
						}
						else if(proposalPerson.getProposalPersonRoleId().equals(KEY_PERSON_ROLE)) {
							keyPerson += proposalPerson.getFullName() + ", ";
						}
					}
					if(subject.length() > MAX_SUBJECT_LENGTH) {
						subject = subject.substring(0, MAX_SUBJECT_LENGTH - 3) + "...";
					}
					content.setSubject(subject);
					//UH KC-457, UH KC-434 BEGIN rbl added sponsor deadline date(proposal due date) and Lead unit name and PI and CO-Is, Key Person to action list notification for proposal development docs
					//remove the last comma and space from PIs, CO-Is, Key Persons string
					if(pi.length() > 2) {
						pi = pi.substring(0, pi.length() - 2);
					}
					if(coi.length() > 2) {
						coi = coi.substring(0, coi.length() - 2);
					}
					if(keyPerson.length() > 2) {
						keyPerson = keyPerson.substring(0, keyPerson.length() - 2);
					}
					
					
					String sponsorDeadlineDate = "";
					String sponsorName = "";
					String leadUnitName = "";
					String projectTitle = "";
					DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
					if(proposal.getDeadlineDate() != null) {
						sponsorDeadlineDate = formatter.format(proposal.getDeadlineDate());
					}
					if(proposal.getOwnedByUnitNumber() != null && proposal.getOwnedByUnitName() != null) {
						leadUnitName = proposal.getOwnedByUnitNumber() + " - " + proposal.getOwnedByUnitName();
					}
					if(proposal.getSponsorName() != null) {
						sponsorName = proposal.getSponsorName();
					}
					//UH KC-645 BEGIN
					if(proposal.getProjectName() != null) {
						projectTitle = proposal.getProjectName();
						if(projectTitle.length() > MAX_TITLE_LENGTH) {
							projectTitle = projectTitle.substring(0, MAX_TITLE_LENGTH - 3) + "...";
						}
					}
					newProjectTitleLine = "Title:\t" + projectTitle +  "\n";
					//UH KC-645 END
					String leadUnitNameLine = "Lead Unit:\t\t" + leadUnitName + "\n";
					String sponsorNameLine = "Sponsor:\t" + sponsorName + "\n";
					String sponsorDeadlineDateLine = "Sponsor Deadline Date:\t" + sponsorDeadlineDate;
					String piLine = "PI:\t\t\t" + pi + "\n";
					String coiLine = "CO-I:\t\t\t" + coi + "\n";
					String keyPersonLine = "Key Person:\t\t" + keyPerson + "\n";
					newEmailLines = "\n" + leadUnitNameLine + piLine + coiLine + keyPersonLine + sponsorNameLine + sponsorDeadlineDateLine;
					//UH KC-457, UH KC-434 END
				}
			}
			//UH KC-496 BEGIN rbl added Completed By Person info to all email notifications
			String lastCompletedByLine = "Completed By:\t\t";
			String lastCompletedByName = "";
			DocumentRouteHeaderValue documentRhv = KEWServiceLocator.getRouteHeaderService().getRouteHeader(actionItem.getDocumentId());
			List<ActionTakenValue> actionsTaken = documentRhv.getActionsTaken();
			for (ActionTakenValue actionTakenVal : actionsTaken) {
				if(actionTakenVal.isCompletion()) {
					lastCompletedByName = actionTakenVal.getPrincipalDisplayName();
					lastCompletedByLine += lastCompletedByName;
					break;
				}
			}
			newEmailLines +=  "\n" + lastCompletedByLine + "\n\nTo respond to this eDoc:\n";
			newEmailBody = origEmailBody.replaceFirst("\\s*To respond to this eDoc:", newEmailLines);
			//UH KC-496 END
			//UH KC-422 BEGIN rbl added ORS Helpline contact information to all email notifications
			String newHelpLine = "Instructions for myGRANT approvers can be found here:\nhttp://www.hawaii.edu/ors/training/myGrant/Job_aids/approver.pdf\n\nIf you have any questions or concerns, please contact the ORS Helpline at <mailto:helpline@ors.hawaii.edu> or (808) 956-5198.";
			newEmailBody = newEmailBody.replaceFirst("For additional help.*", newHelpLine);
			//UH KC-645 replace the generated docTitle which contains extraneous info in KC 5.1.x with just the proposal's actual project title
			newEmailBody = newEmailBody.replaceFirst("Title:.*\n", newProjectTitleLine);
			
			if(!newEmailBody.equals("")) {
				//update the content with new email body
				content.setBody(newEmailBody, isHtml);
			}
			//UH KC-422 END
			
		} catch (Throwable e) {
			LOG.error("Error while attempting to add Key Persons to proposal document workflow email. Reminder will not include additional information.", e);
		}
		
		
		return content;
	}
}
