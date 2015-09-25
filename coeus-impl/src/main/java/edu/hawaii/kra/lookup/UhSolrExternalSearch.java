package edu.hawaii.kra.lookup;

import java.util.*;

import org.apache.log4j.Logger;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.params.ModifiableSolrParams;
import org.kuali.coeus.common.framework.person.KcPerson;
import org.kuali.coeus.common.framework.rolodex.Rolodex;
import org.kuali.coeus.common.view.wizard.framework.WizardResultsDto;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.rice.krad.bo.BusinessObject;
import org.kuali.rice.krad.lookup.CollectionIncomplete;
import org.kuali.rice.core.api.CoreApiServiceLocator;
import org.kuali.rice.core.api.config.property.ConfigurationService;
import org.kuali.rice.coreservice.framework.CoreFrameworkServiceLocator;
import org.kuali.rice.krad.service.BusinessObjectService;


//KC-530 Lookup screens are too difficult for users, make searches easier by implementing search engine

public class UhSolrExternalSearch {
	
	protected static final org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(UhSolrExternalSearch.class);
	private HttpSolrServer solr;
	private Map<String, String> dbParams;

	public List<? extends BusinessObject> getExternalSearchResults(@SuppressWarnings("rawtypes") Class c, Map<String, String> conf, String query) {
		ModifiableSolrParams p = new ModifiableSolrParams();
		p.set("q", query);
		return getExternalSearchResults(c, conf, p);
	}

	public List<Object> searchForNonEmployee(Map<String, String> conf, String query) {
		// KC-1218 Use SOLR for person lookup
		Class<Rolodex> classObj = Rolodex.class;
		return searchForPerson(classObj, conf, query);
	}

	public List<Object> searchForKcPerson(Map<String, String> conf, String query) {
		// KC-1218 Use SOLR for person lookup
		Class<KcPerson> classObj = KcPerson.class;
		return searchForPerson(classObj, conf, query);
	}

	public List<Object> searchForPerson(@SuppressWarnings("rawtypes") Class classObj, Map<String, String> conf, String query) {
		// KC-1218 Use SOLR for person lookup
		ModifiableSolrParams paramsFromCaller = new ModifiableSolrParams();
		paramsFromCaller.set("q", query);
		ModifiableSolrParams params = configSolr(conf, paramsFromCaller);
		List<Object> searchResultsReturn = new ArrayList<>();
		String pk = conf.get("pk");

		try {
			QueryResponse resp = solr.query(params);
			Iterator<SolrDocument> docs = resp.getResults().iterator();
			int i = 0;

			while(docs.hasNext()) {
				if (i++ > 100) {
					break;
				}
				SolrDocument d = docs.next();
				String id = (String) d.getFieldValue("id");
				dbParams.put(pk, id);

				/*
				Tried to make objects the KRAD way...didnt work for KcPerson because its not a JPA annotated class...
				List<Object> results = KRADServiceLocator.getDataObjectService().findMatching(classObj, QueryByCriteria.Builder.fromPredicates(
						PredicateFactory.in(pk, id)
				)).getResults();
				*/

				/* Oh apparently KcPerson is transient? not persisted by OJB either
				BusinessObject bo = KcServiceLocator.getService(BusinessObjectService.class).findByPrimaryKey(classObj, dbParams);
				*/

				if (classObj.getName().contains("Rolodex")) {
					Rolodex r = (Rolodex) KcServiceLocator.getService(BusinessObjectService.class).findByPrimaryKey(classObj, dbParams);
					if (r == null) {
						LOG.warn("UHSEARCH: couldnt find a BusinessObject (" + classObj.getName() + "," + pk + "," + id + ")");
					} else {
						WizardResultsDto w = new WizardResultsDto();
						w.setRolodex(r);
						searchResultsReturn.add(w);
					}
				} else if (classObj.getName().contains("KcPerson")) {
					String uhId = (String) d.getFieldValue("UHID_STR");
					KcPerson p = KcPerson.fromPersonId(uhId);
					if (p == null) {
						LOG.warn("UHSEARCH: couldnt find a BusinessObject (" + classObj.getName() + "," + pk + "," + id + ")");
					} else {
						WizardResultsDto w = new WizardResultsDto();
						w.setKcPerson(p);
						searchResultsReturn.add(w);
					}
				} else {
					Logger.getLogger(UhSolrExternalSearch.class).error("Something has gone horribly wrong. Trying to search for a person but not sure if KcPerson or Rolodex (nonemployee), class: " + classObj.getName());
				}

			}

		} catch (SolrServerException e) {
			e.printStackTrace();
		}
		return new CollectionIncomplete(searchResultsReturn, new Long(searchResultsReturn.size()));

	}

	protected List<? extends BusinessObject> getExternalSearchResults(@SuppressWarnings("rawtypes") Class classObj, Map<String, String> conf, ModifiableSolrParams paramsFromCaller) {
		ModifiableSolrParams params = configSolr(conf, paramsFromCaller);
		List<BusinessObject> searchResultsReturn = new ArrayList<>();
		String pk = conf.get("pk");

		try {
			QueryResponse resp = solr.query(params);
			Iterator<SolrDocument> docs = resp.getResults().iterator();

			while(docs.hasNext()) {
				SolrDocument d = docs.next();
				String id = (String) d.getFieldValue("id");
				dbParams.put(pk, id);

		    	BusinessObject o = KcServiceLocator.getService(BusinessObjectService.class).findByPrimaryKey(classObj, dbParams);

				if (o == null) {
					LOG.warn("UHSEARCH: couldnt find a BusinessObject (" + classObj.getName() + "," + pk + "," + id + ")");
				} else {
					searchResultsReturn.add(o);
				}
			}

		} catch (SolrServerException e) {
			e.printStackTrace();
		}
		return new CollectionIncomplete(searchResultsReturn, new Long(searchResultsReturn.size()));
	}

	private ModifiableSolrParams configSolr(Map<String, String> conf, ModifiableSolrParams paramsFromCaller) {
		// KC-1218 Use SOLR for person lookup
		ConfigurationService configService = CoreApiServiceLocator.getKualiConfigurationService();
		String solrUrl = configService.getPropertyValueAsString("solr.url");

		solr = new HttpSolrServer(solrUrl);

		ModifiableSolrParams params = new ModifiableSolrParams();
		params.set("qt", "/browse");
		params.set("sort", "score desc, name_untouched asc");
		params.set("mm", "25%");
		params.set("fq", "kind:" + conf.get("kind"));
		params.set("rows", 100);

		for (String p : paramsFromCaller.getParameterNames()) {
			params.set(p, paramsFromCaller.get(p));
		}

		dbParams = new java.util.HashMap<String, String>();

		String query_raw = params.get("q");
		String[] terms = query_raw.split("\\s+");
		String query = new String();

		for (String t : terms) {
			if (t.isEmpty())
				continue;

			query = query + " " + t;

			if (t.length() < 1 || t.length() > 3)
				continue;

			try {
				String wildCardRegex = CoreFrameworkServiceLocator.getParameterService().getParameterValueAsString("KC-GEN", "A", "uh_solr_wildcard_regex");
				if (!t.matches(wildCardRegex))
					query = query + '*';
			} catch (Exception e) {
				LOG.warn("UHSEARCH: couldnt find wildcard regex parameter; using original query: " + query_raw);
				query = query_raw;
				e.printStackTrace();
			}

		}

		params.set("q", query);

		return params;
	}



}

//KC-530 END

