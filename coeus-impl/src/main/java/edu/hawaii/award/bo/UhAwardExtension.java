package edu.hawaii.award.bo;

import java.sql.Date;

import org.kuali.coeus.common.framework.person.KcPerson;
import org.kuali.coeus.common.framework.person.KcPersonService;
import org.kuali.coeus.sys.framework.model.KcPersistableBusinessObjectBase;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.rice.krad.bo.PersistableBusinessObjectExtension;

public class UhAwardExtension extends KcPersistableBusinessObjectBase
		implements PersistableBusinessObjectExtension {

	private static final long serialVersionUID = 5451523757235950756L;

	private transient KcPersonService kcPersonService;

	private Long awardId;

	private Date signedDate;
	private Date assignedDate;
	private Date completedDate;
	private Date sponsorIssuedDate;
	private String assignedToPersonId;

	public Long getAwardId() {
		return awardId;
	}

	public void setAwardId(Long awardId) {
		this.awardId = awardId;
	}

	public Date getSignedDate() {
		return signedDate;
	}

	public void setSignedDate(Date signedDate) {
		this.signedDate = signedDate;
	}

	public Date getAssignedDate() {
		return assignedDate;
	}

	public void setAssignedDate(Date assignedDate) {
		this.assignedDate = assignedDate;
	}

	public Date getCompletedDate() {
		return completedDate;
	}

	public void setCompletedDate(Date completedDate) {
		this.completedDate = completedDate;
	}

	public Date getSponsorIssuedDate() {
		return sponsorIssuedDate;
	}

	public void setSponsorIssuedDate(Date sponsorIssuedDate) {
		this.sponsorIssuedDate = sponsorIssuedDate;
	}
	
	public String getAssignedToPersonId() {
		return assignedToPersonId;
	}
	
	public void setAssignedToPersonId(String assignedToPersonId) {
		this.assignedToPersonId = assignedToPersonId;
	}

	public KcPerson getAssignedToPerson() {
		return this.getKcPersonService().getKcPersonByPersonId(assignedToPersonId);
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
