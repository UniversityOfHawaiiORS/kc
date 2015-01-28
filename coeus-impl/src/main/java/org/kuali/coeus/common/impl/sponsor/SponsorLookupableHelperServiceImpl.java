/*
 * Copyright 2005-2014 The Kuali Foundation
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
package org.kuali.coeus.common.impl.sponsor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.kuali.coeus.common.framework.sponsor.Sponsor;
import org.kuali.coeus.sys.framework.lookup.KcKualiLookupableHelperServiceImpl;
import edu.hawaii.kra.lookup.UhSolrExternalSearch;
import org.kuali.rice.kns.lookup.LookupUtils;
import org.kuali.rice.kns.util.KNSGlobalVariables;
import org.kuali.rice.kns.web.struts.form.KualiForm;
import org.kuali.rice.kns.web.struts.form.MultipleValueLookupForm;
import org.kuali.rice.kns.web.ui.Field;
import org.kuali.rice.kns.web.ui.Row;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Component("sponsorLookupableHelperService")
@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class SponsorLookupableHelperServiceImpl  extends KcKualiLookupableHelperServiceImpl {
    private static final String HIERARCHY_NAME = "hierarchyName";
    private static final String SELECTED_HIERARCHY_NAME = "selectedHierarchyName";
    private static final String CONVERSION_FIELD_PARAM_NAME = "conversionFields";
    
    @Autowired
    @Qualifier("sponsorHierarchyMaintenanceService")
    private SponsorHierarchyMaintenanceService sponsorHierarchyMaintenanceService;


    /**
     * 
     * This is primarily for multiple value lookup.  also need to take care of single value lookup
     */
    public List<? extends BusinessObject> getSearchResults(Map<String, String> fieldValues) {
		// KC-530 Lookup screens are too difficult for users, make searches easier by implementing search engine
		UhSolrExternalSearch search = new UhSolrExternalSearch();
		Map<String, String> conf = new HashMap<String, String>();
		conf.put("kind", "SPONSOR");
		conf.put("pk", "sponsorCode");
    
		String q = fieldValues.get("sponsorSearchInput");
		return search.getExternalSearchResults(Sponsor.class, conf, q);
		// KC-530 END
    }
    
}
