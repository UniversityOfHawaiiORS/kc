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
import org.kuali.rice.krad.bo.BusinessObject;
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
