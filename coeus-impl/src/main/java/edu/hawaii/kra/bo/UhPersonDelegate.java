package edu.hawaii.kra.bo;

import java.sql.Date;
import java.text.SimpleDateFormat;

import org.kuali.coeus.common.framework.person.KcPerson;
import org.kuali.coeus.common.framework.person.KcPersonService;
import org.kuali.coeus.sys.framework.model.KcPersistableBusinessObjectBase;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.rice.kim.api.identity.Person;
import org.kuali.rice.kim.api.identity.PersonService;
import org.kuali.rice.krad.bo.PersistableBusinessObjectExtension;

import com.ibm.icu.util.Calendar;

public class UhPersonDelegate extends KcPersistableBusinessObjectBase
		implements PersistableBusinessObjectExtension {

	private static final long serialVersionUID = -3045593545793330990L;

	private transient KcPersonService kcPersonService;

	private Long uhPersonDelegateId;
	private String delegatorPersonId;
	private String delegateePersonId;
	private Date fromDate;
	private Date toDate;
	private Boolean includeDelegator;

	public Long getUhPersonDelegateId() {
		return uhPersonDelegateId;
	}

	public void setUhPersonDelegateId(Long uhPersonDelegateId) {
		this.uhPersonDelegateId = uhPersonDelegateId;
	}

	public Date getFromDate() {
		return fromDate;
	}

	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}
	
	public Date getToDate() {
		return toDate;
	}

	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}
	
	public boolean isActive() {	
		// KC-747 Inactive users are appearing in new routing
		// First check that delegateePersonId is still an active user.  If not then consider the
		// delegation inactive.
		Person adminPerson = KcServiceLocator.getService(PersonService.class).getPerson(delegateePersonId);
	    if (adminPerson.isActive()) {	
		    // Check from and to dates.  Inclusive so need to add/subtract days from today before comparing
		    java.util.Calendar cal = java.util.Calendar.getInstance();
		    long now = cal.getTime().getTime();
		    Date today = new Date(now);
		
		    // drop time component by converting to yyyy-mm-dd
		    if (fromDate == null || fromDate.toString().compareTo(today.toString()) <= 0)  {
			    if (toDate == null || toDate.toString().compareTo(today.toString()) >= 0) {
				    return true;
			    }
		    }
	    }
		return false;
	}
	
	public void setDelegatorPersonId(String delegatorPersonId) {
		this.delegatorPersonId = delegatorPersonId;
	}

	public String getDelegatorPersonId() {
		return this.delegatorPersonId;
	}
	
	public KcPerson getDelegatorPerson() {
		return this.getKcPersonService().getKcPersonByPersonId(delegatorPersonId);
	}
	
	public void setDelegateePersonId(String delegateePersonId) {
		this.delegateePersonId = delegateePersonId;
	}

	public String getDelegateePersonId() {
		return this.delegateePersonId;
	}
	
	public KcPerson getDelegateePerson() {
		return this.getKcPersonService().getKcPersonByPersonId(delegateePersonId);
	}
	
	/* nicer method name to make logic clear as in if (obj.includeDelegator())... */
	public Boolean includeDelegator() {
		return getIncludeDelegator();
	}
	
	public Boolean getIncludeDelegator() {
		return includeDelegator;
	}
	
	public void setIncludeDelegator(Boolean includeDelegator) {
		this.includeDelegator = includeDelegator;
	}

	/**
	 * Gets the KC Person Service.
	 * 
	 * @return KC Person Service.
	 */
	protected KcPersonService getKcPersonService() {
		if (this.kcPersonService == null) {
			this.kcPersonService = KcServiceLocator
					.getService(KcPersonService.class);
		}

		return this.kcPersonService;
	}

}
