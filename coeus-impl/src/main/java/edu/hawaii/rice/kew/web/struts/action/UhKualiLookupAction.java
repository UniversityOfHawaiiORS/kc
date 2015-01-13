package edu.hawaii.rice.kns.web.struts.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.kuali.rice.core.api.util.RiceConstants;
import org.kuali.rice.kns.util.KNSConstants;
import org.kuali.rice.kns.web.struts.action.KualiLookupAction;
import org.kuali.rice.kns.web.struts.form.LookupForm;
import org.kuali.rice.krad.util.KRADConstants;
import org.apache.solr.common.SolrException;

/* KC-535 - If SOLR is down search's result in incident report
            Catch Solr Exception and set attribute so 
	        KualiLookup.jsp can report an error.
*/

public class UhKualiLookupAction extends KualiLookupAction {
	
	public ActionForward search(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
		    throws Exception {
		
		try {
			return super.search(mapping, form, request, response);
		} catch (SolrException e) {			
			request.setAttribute("solrFailure", 1);
			String refreshCaller = request.getParameter(KRADConstants.REFRESH_CALLER);

	        return mapping.findForward(RiceConstants.MAPPING_BASIC);
		}
	}		    
		    
}
