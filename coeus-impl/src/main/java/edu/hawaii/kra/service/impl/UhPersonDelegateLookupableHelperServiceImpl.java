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
package edu.hawaii.kra.service.impl;

import java.util.Collection;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.kuali.coeus.common.framework.person.KcPerson;
import org.kuali.coeus.common.framework.person.KcPersonService;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.rice.kns.lookup.KualiLookupableHelperServiceImpl;
import org.kuali.rice.kns.web.struts.form.LookupForm;
import org.kuali.rice.kns.web.ui.Field;
import org.kuali.rice.kns.web.ui.Row;

/**
 * Lookupable helper service used for proposal log lookup
 */  
@SuppressWarnings("deprecation")
public class UhPersonDelegateLookupableHelperServiceImpl extends KualiLookupableHelperServiceImpl {

    /**
     * Comment for <code>serialVersionUID</code>
     */
    private static final long serialVersionUID = 2733736916454475501L;
    
    /*  This override will hide the copy and edit links.
    @SuppressWarnings("unchecked")
    public List<HtmlData> getCustomActionUrls(BusinessObject businessObject, List pkNames){
        List<HtmlData> htmlDataList = new ArrayList<HtmlData>();
        htmlDataList = super.getCustomActionUrls(businessObject, pkNames);
        List<HtmlData> returnHtmlDataList = new ArrayList<HtmlData>();
        for (HtmlData htmlData : htmlDataList) {
            if(!(htmlData.getDisplayText().equals("copy") ||
                    htmlData.getDisplayText().equals("edit"))) {
                returnHtmlDataList.add(htmlData);
            }
        }
        return returnHtmlDataList;
    }
    */

    /**
     * @see org.kuali.rice.kns.lookup.AbstractLookupableHelperServiceImpl#getRows()
     */
    @Override
    public List<Row> getRows() {
        List<Row> rows =  super.getRows();
        for (Row row : rows) {
            for (Field field : row.getFields()) {
                if (field.getPropertyName().equals("delegatorPerson.userName")) {
                    field.setFieldConversions("principalName:delegatorPerson.userName,principalId:delegatorPersonId");
                }
                if (field.getPropertyName().equals("delegateePerson.userName")) {
                    field.setFieldConversions("principalName:delegateePerson.userName,principalId:delegateePersonId");
                }
            }
        }
        return rows;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public Collection performLookup(LookupForm lookupForm, Collection resultTable, boolean bounded) {
        String delegatorUserName = (String) lookupForm.getFieldsForLookup().get("delegatorPerson.userName");
        if (StringUtils.isNotEmpty(delegatorUserName)) {
            KcPerson person = getKcPersonService().getKcPersonByUserName(delegatorUserName);
            if (person != null) {
                lookupForm.getFieldsForLookup().put("delegatorPersonId", person.getPersonId());
            }
        }
        
        String delegateeUserName = (String) lookupForm.getFieldsForLookup().get("delegateePerson.userName");
        if (StringUtils.isNotEmpty(delegateeUserName)) {
            KcPerson person = getKcPersonService().getKcPersonByUserName(delegateeUserName);
            if (person != null) {
                lookupForm.getFieldsForLookup().put("delegateePersonId", person.getPersonId());
            }
        }
        
        return super.performLookup(lookupForm, resultTable, bounded);
    }
    
    public KcPersonService getKcPersonService() {
        return (KcPersonService) KcServiceLocator.getService(KcPersonService.class);
    }
/*
    @Override
    public List<? extends BusinessObject> getSearchResults(Map<String, String> fieldValues) {
        List<UhPersonDelegate> searchResults = (List<UhPersonDelegate>)super.getSearchResults(fieldValues);

        if (!searchResults.isEmpty()) {
            if (StringUtils.isNotBlank(fieldValues.get("delegatorPerson.userName"))) {
                return filterSearchResults(searchResults, fieldValues.get("delegatorPerson.userName"));
            }
        }
        
        return searchResults;
    }
*/
    /*
     * This method is primarily to match person username.
     * kcperson is not in unitadministrator table, so generic getsearchresults is not working properly.
     */
/*
    protected List<UhPersonDelegate> filterSearchResults(List<UhPersonDelegate> searchResults, String userName) {
        List<UhPersonDelegate> filteredList = new ArrayList<UhPersonDelegate>();
        
        String regexp = StringUtils.replace(userName, "*", ".*").toUpperCase() + "$";
        for (UhPersonDelegate unitAdministratorDelegate : searchResults) {
            if (unitAdministratorDelegate.getDelegatorPerson().getUserName().toUpperCase().matches(regexp)) {
                filteredList.add(unitAdministratorDelegate);
            }
        }
        return filteredList;
    }
*/

    
}
