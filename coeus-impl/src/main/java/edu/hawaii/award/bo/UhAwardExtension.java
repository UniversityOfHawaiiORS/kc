package edu.hawaii.award.bo;

import java.sql.Date;




import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.kuali.coeus.common.framework.person.KcPerson;
import org.kuali.coeus.common.framework.person.KcPersonService;
import org.kuali.coeus.sys.framework.model.KcPersistableBusinessObjectBase;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.rice.krad.bo.PersistableBusinessObjectExtension;

@Entity
@Table(name = "UH_AWARD_EXT_T")
public class UhAwardExtension extends KcPersistableBusinessObjectBase
		implements PersistableBusinessObjectExtension {

	private static final long serialVersionUID = 5451523757235950756L;

	@Transient
	private transient KcPersonService kcPersonService;
	
	@Id
    @Column(name = "AWARD_ID")
	private Long awardId;
	
	@Column(name = "SIGNED_DATE")
	private Date signedDate;
	
	@Column(name = "ASSIGNED_DATE")
	private Date assignedDate;
	
	@Column(name = "COMPLETED_DATE")
	private Date completedDate;

	@Column(name = "SPONSOR_ISSUED_DATE")
	private Date sponsorIssuedDate;
	
	@Column(name = "ASSIGNED_TO_PERSON_ID")
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
