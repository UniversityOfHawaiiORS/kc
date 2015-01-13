/*
 * Copyright 2005-2013 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.opensource.org/licenses/ecl1.php
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package edu.hawaii.kra.bo;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.kuali.kra.bo.KcPerson;
import org.kuali.kra.infrastructure.KraServiceLocator;
import org.kuali.kra.maintenance.KraMaintainableImpl;
import org.kuali.kra.rules.ErrorReporter;
import org.kuali.kra.service.KcPersonService;
import org.kuali.rice.kim.api.KimConstants;
import org.kuali.rice.kns.document.MaintenanceDocument;
import org.kuali.rice.kns.maintenance.Maintainable;
import org.kuali.rice.krad.service.BusinessObjectService;
import org.kuali.rice.krad.service.SequenceAccessorService;

import org.kuali.rice.kns.web.ui.Section;
import org.kuali.rice.kns.web.ui.Field;
import org.kuali.rice.kns.web.ui.Row;

/**
 * This class...
 */
public class UhPersonDelegateMaintainableImpl extends KraMaintainableImpl implements Maintainable {

    /**
     * Comment for <code>serialVersionUID</code>
     */
    private static final long serialVersionUID = -4267900712064482626L;
    private static final String KIM_PERSON_LOOKUPABLE_REFRESH_CALLER = "kimPersonLookupable";
    private static final String DELEGATOR_ID_INVALID_ERROR_KEY = "error.invalid.delegatorPersonId";
    private static final String DELEGATEE_ID_INVALID_ERROR_KEY = "error.invalid.delegateePersonId"; 
    private static final String PERSON_DELEGATE_SEQUENCE = "SEQ_UH_PERSON_DELEGATE_ID";
    public static final String UH_PERSON_DELEGATE_ID_NAME = "uhPersonDelegateId";
    public static final String SECTION_ID = "Edit UhPersonDelegate";

    @Override
    public void setGenerateDefaultValues(String docTypeName) {
         super.setGenerateDefaultValues(docTypeName);
         UhPersonDelegate delegate = (UhPersonDelegate) getBusinessObject();
         delegate.setUhPersonDelegateId(KraServiceLocator.getService(SequenceAccessorService.class).getNextAvailableSequenceNumber(PERSON_DELEGATE_SEQUENCE, UhPersonDelegate.class));
     }
  
    // KC-742 BEGIN Delegation Maintenance lookups not working for Delegatee and Delegator during edit/add
    // NOTE this required a modification to rice to pass the referencesToRefresh
    //      field in fieldValues so we can identify which person was being
    //      lookedup.  It's a bit of a hack and may break in a future version
    /**
     * @see org.kuali.rice.kns.maintenance.Maintainable#refresh(String refreshCaller, Map fieldValues, MaintenanceDocument document)
     */
    @Override
    @SuppressWarnings("unchecked")
    public void refresh(String refreshCaller, Map fieldValues, MaintenanceDocument document) {
        super.refresh(refreshCaller, fieldValues, document);
        if (KIM_PERSON_LOOKUPABLE_REFRESH_CALLER.equals(refreshCaller) && fieldValues.containsValue("delegatorPersonId")) {
        	UhPersonDelegate delegate = (UhPersonDelegate) getBusinessObject();
        	String principalId = (String) fieldValues.get(KimConstants.PrimaryKeyConstants.PRINCIPAL_ID);
        	delegate.setDelegatorPersonId(principalId);
        }
        if (KIM_PERSON_LOOKUPABLE_REFRESH_CALLER.equals(refreshCaller) && fieldValues.containsValue("delegateePersonId")) {
        	UhPersonDelegate delegate = (UhPersonDelegate) getBusinessObject();
        	String principalId = (String) fieldValues.get(KimConstants.PrimaryKeyConstants.PRINCIPAL_ID);
        	delegate.setDelegateePersonId(principalId);
        }
    }
    // KC-742 END
    
    protected void disablePersonDelegateId(List<Section> sections) {
         for (Section section : sections) {
             if (StringUtils.equals(section.getSectionId(), SECTION_ID)) {
                 for (Row row : section.getRows()) {
                     for (Field field : row.getFields()) {
                         if (StringUtils.equals(field.getPropertyName(), UH_PERSON_DELEGATE_ID_NAME)) {
                             field.setReadOnly(true);
                         }
                     }
                 }
             }
         }        
     }
    
    @SuppressWarnings("unchecked")
    public List<Section> getSections(MaintenanceDocument document, Maintainable oldMaintainable) {
        List<Section> sections = super.getSections(document, oldMaintainable);
        disablePersonDelegateId(sections);
        return sections;
    }
    
}
