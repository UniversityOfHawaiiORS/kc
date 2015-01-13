package edu.hawaii.award.bo;

import java.sql.Date;
import org.kuali.kra.bo.KcPerson;
import org.kuali.kra.bo.KraPersistableBusinessObjectBase;
import org.kuali.kra.infrastructure.KraServiceLocator;
import org.kuali.kra.service.KcPersonService;
import org.kuali.rice.krad.bo.PersistableBusinessObjectExtension;

public class UhAwardExtension extends KraPersistableBusinessObjectBase
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
			this.kcPersonService = KraServiceLocator
					.getService(KcPersonService.class);
		}

		return this.kcPersonService;
	}

}
