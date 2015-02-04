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
package org.kuali.kra.award.document.authorizer;

import java.util.ArrayList;
import java.util.List;

import org.kuali.coeus.common.framework.unit.admin.UnitAdministratorType;
import org.kuali.kra.award.awardhierarchy.AwardHierarchy;
import org.kuali.kra.award.awardhierarchy.AwardHierarchyService;
import org.kuali.kra.award.contacts.AwardPerson;
import org.kuali.kra.award.contacts.AwardUnitContact;
import org.kuali.kra.award.document.authorization.AwardTask;
import org.kuali.kra.award.home.Award;
import org.kuali.kra.award.infrastructure.AwardPermissionConstants;

/**
 * UH Changes:
 * 				KC-211 - Allow PI to view their award without Award Viewer Role
 * 				KC-346 - Allow Unit Administrator contact on the parent award view it
 * 
 */

/**
 * The View Award Authorizer determines if a user has the right
 * to view a specific award.
 */
public class ViewAwardAuthorizer extends AwardAuthorizer {

    /**
	 * UH Change: KC-211 - Allow PI to view their award without Award Viewer Role
	 * UH Change: KC-346 - Allow Unit Administrator contact on the parent award view it
     * @see org.kuali.kra.irb.document.authorizer.AwardAuthorizer#isAuthorized(java.lang.String, org.kuali.kra.irb.document.authorization.AwardTask)
     */
    public boolean isAuthorized(String userId, AwardTask task) {
		//Check parent first to hopefully avoid processing
		boolean parentAuthorized = hasPermission(userId, task.getAward(), AwardPermissionConstants.VIEW_AWARD.getAwardPermission());
		if(parentAuthorized) {
			return true;
		}
		if(userId == null) {
			return false;
		}
		Award award = task.getAward();
		if(award != null){
			//KC-211 - Authorize PIs
			List<AwardPerson> pis = new ArrayList<AwardPerson>();
			pis.addAll(award.getCoInvestigators());
			pis.addAll(award.getMultiplePis());
			pis.add(award.getPrincipalInvestigator());
			
			for (AwardPerson awardPerson : pis) {
				if(awardPerson != null && userId.equals(awardPerson.getPersonId())) {
					return true;
				}
			}
			
			//KC-346 - Authorize Unit Administrator Contact on the parent Award
			
			//Default to the current awards contacts (if this node is the parent)
			List<AwardUnitContact> contacts = award.getAwardUnitContacts();

			AwardHierarchyService service = award.getAwardHierarchyService();
			AwardHierarchy hierarchy = service.loadAwardHierarchy(award.getAwardNumber());
			
			//KC-546 Null Pointer Exception thrown when attempting to do a regular award search
			if (hierarchy != null) {
			//KC-546 END
				AwardHierarchy root = hierarchy.getRoot();
				if(root != null) {
					Award parentAward = root.getAward();
					if(parentAward != null) {
						contacts = parentAward.getAwardUnitContacts();
					}
				}
			}
			
			for (AwardUnitContact awardUnitContact : contacts) {
				UnitAdministratorType unitAdminType = awardUnitContact.getUnitAdministratorType();
				if(unitAdminType != null && "Administrative Contact".equals(unitAdminType.getDescription())) {
					if(userId.equals(awardUnitContact.getPersonId())) {
						return true;
					}
				}
			}
		}
		return false;
    }
}
