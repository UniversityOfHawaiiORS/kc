/* KC-959 Improve search for Performance Site, Unit and Sponsor using SOLR */
package edu.hawaii.kra.lookup;

import edu.hawaii.kra.lookup.UhSolrExternalSearch;
import org.kuali.coeus.common.framework.sponsor.Sponsor;
import org.kuali.coeus.common.framework.unit.Unit;
import org.kuali.rice.krad.lookup.LookupForm;
import org.kuali.rice.krad.lookup.LookupableImpl;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component("uhUnitLookupable")
@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class UhUnitLookupable extends LookupableImpl {

    @Override
    public List<?> performSearch(LookupForm form, Map<String, String> searchCriteria, boolean unbounded) {

        UhSolrExternalSearch search = new UhSolrExternalSearch();
        Map<String, String> conf = new HashMap<String, String>();
        conf.put("kind", "UNIT");
        conf.put("pk", "unitNumber");

        String q = searchCriteria.get("unitSearchInput");
        return search.getExternalSearchResults(Unit.class, conf, q);
    }
}
