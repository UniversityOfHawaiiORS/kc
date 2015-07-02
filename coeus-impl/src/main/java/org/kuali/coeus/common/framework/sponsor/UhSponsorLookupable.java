/*  NOTE: Placing this in edu.hawaii.kra.lookup; makes it file to find the service
          perhaps we have to tell spring what folders to search for annotations ?
*/
package org.kuali.coeus.common.framework.sponsor;

import edu.hawaii.kra.lookup.UhSolrExternalSearch;
import org.eclipse.osgi.framework.util.ArrayMap;
import org.kuali.coeus.common.framework.sponsor.Sponsor;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.rice.krad.lookup.LookupForm;
import org.kuali.rice.krad.lookup.LookupableImpl;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ronald on 6/30/2015.
 */

@Component("uhSponsorLookupable")
@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class UhSponsorLookupable extends LookupableImpl {

    @Override
    public List<?> performSearch(LookupForm form, Map<String, String> searchCriteria, boolean unbounded) {

        UhSolrExternalSearch search = new UhSolrExternalSearch();
        Map<String, String> conf = new HashMap<String, String>();
        conf.put("kind", "SPONSOR");
        conf.put("pk", "sponsorCode");

        String q = searchCriteria.get("sponsorSearchInput");
        return search.getExternalSearchResults(Sponsor.class, conf, q);
    }
}
