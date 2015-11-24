/*
 * Kuali Coeus, a comprehensive research administration system for higher education.
 * 
 * Copyright 2005-2015 Kuali, Inc.
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 * 
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package org.kuali.kra.institutionalproposal.contacts;

import org.apache.commons.lang3.StringUtils;
import org.kuali.coeus.common.framework.unit.Unit;
import org.kuali.kra.award.home.ContactRole;
import org.kuali.rice.krad.util.GlobalVariables;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


public class InstitutionalProposalPersonSaveRuleImpl implements InstitutionalProposalPersonSaveRule {

    /**
     * This method will be called when saving InstitutionalProposal Project Persons
     * @param event
     * @return
     */
    public boolean processInstitutionalProposalPersonSaveBusinessRules(InstitutionalProposalPersonSaveRuleEvent event) {
        return processSaveInstitutionalProposalProjectPersonsBusinessRules(event.getProjectPersons());
    }

    /**
     * Default access to allow unit test access since SaveInstitutionalProposalProjectPersonsRuleEvent needs a Document to be constructed   
     * @param projectPersons
     * @return
     */
    boolean processSaveInstitutionalProposalProjectPersonsBusinessRules(List<InstitutionalProposalPerson> projectPersons) {
        if (projectPersons.size() == 0) {
            return true;
        }

        boolean valid = checkForDuplicateUnits(projectPersons);
        valid &= checkForKeyPersonProjectRoles(projectPersons);
        valid &= checkForOnePrincipalInvestigator(projectPersons);
        valid &= checkForRequiredUnitDetails(projectPersons);
        valid &= checkForLeadUnitForPI(projectPersons);

        return valid;
    }

    boolean checkForKeyPersonProjectRoles(List<InstitutionalProposalPerson> projectPersons) {
       boolean valid = true;
       for ( InstitutionalProposalPerson person : projectPersons ) {
           if ( person.getContactRole() != null && StringUtils.equalsIgnoreCase(person.getContactRole().getRoleCode(), ContactRole.KEY_PERSON_CODE) &&
                   StringUtils.isBlank(person.getKeyPersonRole()) ) {
               valid = false;
               GlobalVariables.getMessageMap().putError(PROPOSAL_PROJECT_PERSON_LIST_ERROR_KEY + "[" + projectPersons.indexOf(person) + "].keyPersonRole", 
                       ERROR_PROPOSAL_PROJECT_KEY_PERSON_ROLE_REQUIRED, person.getFullName());
           }
       }
       return valid;
    }

    /**
     * Unit details are required for PI and COI persons
     * @param projectPersons
     * @return
     */
    boolean checkForRequiredUnitDetails(List<InstitutionalProposalPerson> projectPersons) {
        boolean valid = true;
        for(InstitutionalProposalPerson p: projectPersons) {
            // KC-1318 Remove requirement for Non-employee Co-Investigator to have a unit
            if(p.isPrincipalInvestigator() || p.isCoInvestigator() && p.isEmployee()) {
                if(p.getUnits().size() == 0) {
                    valid = false;
                    GlobalVariables.getMessageMap().putError(PROPOSAL_PROJECT_PERSON_LIST_ERROR_KEY,
                                                                ERROR_PROPOSAL_PROJECT_PERSON_UNIT_DETAILS_REQUIRED,
                                                                p.getFullName());
                }
            }
        }
        return valid;
    }

    /**
     * Duplicate units not allowed
     * @param projectPersons
     * @return
     */
    boolean checkForDuplicateUnits(List<InstitutionalProposalPerson> projectPersons) {
        boolean valid = true;
        for(InstitutionalProposalPerson p: projectPersons) {
            Set<Unit> uniqueUnits = new HashSet<Unit>();
            List<Unit> tempUnits = new ArrayList<Unit>();
            for(InstitutionalProposalPersonUnit apu: p.getUnits()) {
                uniqueUnits.add(apu.getUnit());
                tempUnits.add(apu.getUnit());
            }
            
            valid &= tempUnits.size() == uniqueUnits.size();
            if(!valid) {
                // remove unique units from list of all units
                for(Unit u: uniqueUnits) {
                    tempUnits.remove(u);
                }
                // remove duplicates from remaining units
                Set<Unit> duplicateUnits = new HashSet<Unit>(tempUnits);
                for(Unit dupeUnit: duplicateUnits) {
                    GlobalVariables.getMessageMap().putError(PROPOSAL_PROJECT_PERSON_LIST_ERROR_KEY, 
                                                            ERROR_PROPOSAL_PROJECT_PERSON_DUPLICATE_UNITS, 
                                                            dupeUnit.getUnitName(), dupeUnit.getUnitNumber(),
                                                            p.getFullName());
                }
            }
        }
        
        return valid;
    }

    /**
     * Only one PI allowed
     * @param projectPersons
     * @return
     */
    boolean checkForOnePrincipalInvestigator(List<InstitutionalProposalPerson> projectPersons) {
        int count = 0;
        for(InstitutionalProposalPerson p: projectPersons) {
            if(p.isPrincipalInvestigator()) {
                count++;
            }
        }
        boolean result = count == 1;
        if(!result) {
            if(count == 0) {
                GlobalVariables.getMessageMap().putError(PROPOSAL_PROJECT_PERSON_LIST_ERROR_KEY, ERROR_PROPOSAL_PROJECT_PERSON_NO_PI);                
            } else {
                GlobalVariables.getMessageMap().putError(PROPOSAL_PROJECT_PERSON_LIST_ERROR_KEY, ERROR_PROPOSAL_PROJECT_PERSON_MULTIPLE_PI_EXISTS);
            }
        }
        return result;
    }

    /**
     * PI must have lead unit
     * @param projectPersons
     * @return
     */
    boolean checkForLeadUnitForPI(List<InstitutionalProposalPerson> projectPersons) {
        boolean valid = true;
        for(InstitutionalProposalPerson p: projectPersons) {
            if(p.isPrincipalInvestigator()) {
                boolean found = false;
                for(InstitutionalProposalPersonUnit apu: p.getUnits()) {
                    found = apu.isLeadUnit();
                    if(found) {
                       break;
                    }
                }
                valid = found;
                if(!valid) {
                    GlobalVariables.getMessageMap().putError(PROPOSAL_PROJECT_PERSON_LIST_ERROR_KEY, ERROR_PROPOSAL_PROJECT_PERSON_LEAD_UNIT_REQUIRED);
                }
            }
        }
        return valid;
    }

}
