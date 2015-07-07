/* KC-959 Improve search for Performance Site, Unit and Sponsor using SOLR */
package edu.hawaii.kra.lookup;

import edu.hawaii.kra.lookup.UhSolrExternalSearch;
import org.kuali.coeus.common.framework.org.Organization;
import org.kuali.rice.krad.lookup.LookupForm;
import org.kuali.rice.krad.lookup.LookupableImpl;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component("uhOrganizationLookupableKRAD")
@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class UhOrganizationLookupable extends LookupableImpl {

    @Override
    public List<?> performSearch(LookupForm form, Map<String, String> searchCriteria, boolean unbounded) {

        UhSolrExternalSearch search = new UhSolrExternalSearch();
        Map<String, String> conf = new HashMap<String, String>();
        conf.put("kind", "ORGANIZATION");
        conf.put("pk", "organizationId");

        String q = searchCriteria.get("organizationSearchInput");
        return search.getExternalSearchResults(Organization.class, conf, q);
    }
}
