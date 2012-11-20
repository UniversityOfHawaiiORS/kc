/*
 * Copyright 2005-2010 The Kuali Foundation.
 * 
 * Licensed under the Educational Community License, Version 1.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.opensource.org/licenses/ecl1.php
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.kra.s2s.generator.impl;

import gov.grants.apply.forms.rrBudgetV11.BudgetTypeDataType;
import gov.grants.apply.forms.rrBudgetV11.BudgetYear1DataType;
import gov.grants.apply.forms.rrBudgetV11.BudgetYearDataType;
import gov.grants.apply.forms.rrBudgetV11.BudgetYearDataType.BudgetPeriod;
import gov.grants.apply.forms.rrBudgetV11.BudgetYearDataType.Equipment;
import gov.grants.apply.forms.rrBudgetV11.BudgetYearDataType.Equipment.AdditionalEquipmentsAttachment;
import gov.grants.apply.forms.rrBudgetV11.BudgetYearDataType.Equipment.EquipmentList;
import gov.grants.apply.forms.rrBudgetV11.BudgetYearDataType.Equipment.TotalFundForAttachedEquipment;
import gov.grants.apply.forms.rrBudgetV11.BudgetYearDataType.IndirectCosts;
import gov.grants.apply.forms.rrBudgetV11.BudgetYearDataType.KeyPersons;
import gov.grants.apply.forms.rrBudgetV11.BudgetYearDataType.KeyPersons.AttachedKeyPersons;
import gov.grants.apply.forms.rrBudgetV11.BudgetYearDataType.KeyPersons.TotalFundForAttachedKeyPersons;
import gov.grants.apply.forms.rrBudgetV11.BudgetYearDataType.OtherDirectCosts;
import gov.grants.apply.forms.rrBudgetV11.BudgetYearDataType.OtherDirectCosts.Others;
import gov.grants.apply.forms.rrBudgetV11.BudgetYearDataType.OtherPersonnel;
import gov.grants.apply.forms.rrBudgetV11.BudgetYearDataType.OtherPersonnel.GraduateStudents;
import gov.grants.apply.forms.rrBudgetV11.BudgetYearDataType.OtherPersonnel.PostDocAssociates;
import gov.grants.apply.forms.rrBudgetV11.BudgetYearDataType.OtherPersonnel.SecretarialClerical;
import gov.grants.apply.forms.rrBudgetV11.BudgetYearDataType.OtherPersonnel.UndergraduateStudents;
import gov.grants.apply.forms.rrBudgetV11.BudgetYearDataType.ParticipantTraineeSupportCosts;
import gov.grants.apply.forms.rrBudgetV11.BudgetYearDataType.ParticipantTraineeSupportCosts.Other;
import gov.grants.apply.forms.rrBudgetV11.BudgetYearDataType.Travel;
import gov.grants.apply.forms.rrBudgetV11.KeyPersonCompensationDataType;
import gov.grants.apply.forms.rrBudgetV11.KeyPersonDataType;
import gov.grants.apply.forms.rrBudgetV11.OtherPersonnelDataType;
import gov.grants.apply.forms.rrBudgetV11.RRBudgetDocument;
import gov.grants.apply.forms.rrBudgetV11.RRBudgetDocument.RRBudget;
import gov.grants.apply.forms.rrBudgetV11.RRBudgetDocument.RRBudget.BudgetSummary;
import gov.grants.apply.forms.rrBudgetV11.RRBudgetDocument.RRBudget.BudgetSummary.CumulativeEquipments;
import gov.grants.apply.forms.rrBudgetV11.RRBudgetDocument.RRBudget.BudgetSummary.CumulativeOtherDirect;
import gov.grants.apply.forms.rrBudgetV11.RRBudgetDocument.RRBudget.BudgetSummary.CumulativeTrainee;
import gov.grants.apply.forms.rrBudgetV11.RRBudgetDocument.RRBudget.BudgetSummary.CumulativeTravels;
import gov.grants.apply.forms.rrBudgetV11.SectBCompensationDataType;
import gov.grants.apply.system.attachmentsV10.AttachedFileDataType;
import gov.grants.apply.system.attachmentsV10.AttachedFileDataType.FileLocation;
import gov.grants.apply.system.globalLibraryV20.YesNoDataType;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.xmlbeans.XmlObject;
import org.kuali.kra.budget.BudgetDecimal;
import org.kuali.kra.budget.core.BudgetService;
import org.kuali.kra.infrastructure.KraServiceLocator;
import org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal;
import org.kuali.kra.proposaldevelopment.bo.Narrative;
import org.kuali.kra.proposaldevelopment.bo.ProposalPerson;
import org.kuali.kra.proposaldevelopment.document.ProposalDevelopmentDocument;
import org.kuali.kra.s2s.S2SException;
import org.kuali.kra.s2s.generator.bo.AttachmentData;
import org.kuali.kra.s2s.generator.bo.BudgetPeriodInfo;
import org.kuali.kra.s2s.generator.bo.BudgetSummaryInfo;
import org.kuali.kra.s2s.generator.bo.CompensationInfo;
import org.kuali.kra.s2s.generator.bo.CostInfo;
import org.kuali.kra.s2s.generator.bo.IndirectCostDetails;
import org.kuali.kra.s2s.generator.bo.KeyPersonInfo;
import org.kuali.kra.s2s.generator.bo.OtherDirectCostInfo;
import org.kuali.kra.s2s.generator.bo.OtherPersonnelInfo;
import org.kuali.kra.s2s.util.S2SConstants;

/**
 * 
 * This class is used to generate XML Document object for grants.gov
 * RRBudgetV1.1. This form is generated using XMLBean API's generated by
 * compiling RRBudgetV1.1 schema.
 * 
 * @author Kuali Research Administration Team (kualidev@oncourse.iu.edu)
 */
public class RRBudgetV1_1Generator extends RRBudgetBaseGenerator {

	private static final Log LOG = LogFactory.getLog(RRBudgetV1_0Generator.class);

	/**
	 * This method returns RRBudgetDocument object based on proposal development
	 * document which contains the informations such as
	 * DUNSID,OrganizationName,BudgetType,BudgetYear and BudgetSummary.
	 * 
	 * @return rrBudgetDocument {@link XmlObject} of type RRBudgetDocument.
	 */
	private RRBudgetDocument getRRBudget() {
		
		deleteAutoGenNarratives();
		RRBudgetDocument rrBudgetDocument = RRBudgetDocument.Factory
				.newInstance();
		RRBudget rrBudget = RRBudget.Factory.newInstance();
		rrBudget.setFormVersion(S2SConstants.FORMVERSION_1_1);
		if (pdDoc.getDevelopmentProposal().getApplicantOrganization() != null) {
			rrBudget.setDUNSID(pdDoc.getDevelopmentProposal()
					.getApplicantOrganization().getOrganization()
					.getDunsNumber());
			rrBudget.setOrganizationName(pdDoc.getDevelopmentProposal()
					.getApplicantOrganization().getOrganization()
					.getOrganizationName());
		}
		rrBudget.setBudgetType(BudgetTypeDataType.PROJECT);
		// Set default values for mandatory fields
		rrBudget.setBudgetYear1(BudgetYear1DataType.Factory.newInstance());

		List<BudgetPeriodInfo> budgetperiodList;
		BudgetSummaryInfo budgetSummary = null;
		try {
		    validateBudgetForForm(pdDoc);
			budgetperiodList = s2sBudgetCalculatorService
					.getBudgetPeriods(pdDoc);
			budgetSummary = s2sBudgetCalculatorService.getBudgetInfo(pdDoc,budgetperiodList);
		} catch (S2SException e) {
			LOG.error(e.getMessage(), e);
			return rrBudgetDocument;
		}

		for (BudgetPeriodInfo budgetPeriodData : budgetperiodList) {
//			saveExtraKeyPersons(budgetPeriodData);
			if (budgetPeriodData.getBudgetPeriod() == BudgetPeriodInfo.BUDGET_PERIOD_1) {
				rrBudget
						.setBudgetYear1(getBudgetYear1DataType(budgetPeriodData));
			} else if (budgetPeriodData.getBudgetPeriod() == BudgetPeriodInfo.BUDGET_PERIOD_2) {
				rrBudget
						.setBudgetYear2(getBudgetYearDataType(budgetPeriodData));
			} else if (budgetPeriodData.getBudgetPeriod() == BudgetPeriodInfo.BUDGET_PERIOD_3) {
				rrBudget
						.setBudgetYear3(getBudgetYearDataType(budgetPeriodData));
			} else if (budgetPeriodData.getBudgetPeriod() == BudgetPeriodInfo.BUDGET_PERIOD_4) {
				rrBudget
						.setBudgetYear4(getBudgetYearDataType(budgetPeriodData));
			} else if (budgetPeriodData.getBudgetPeriod() == BudgetPeriodInfo.BUDGET_PERIOD_5) {
				rrBudget
						.setBudgetYear5(getBudgetYearDataType(budgetPeriodData));
			}
		}
		for (BudgetPeriodInfo budgetPeriodData : budgetperiodList) {
		    if (budgetPeriodData.getBudgetPeriod() == BudgetPeriodInfo.BUDGET_PERIOD_1) {
                rrBudget
                        .setBudgetYear1(getBudgetJustificationAttachment(rrBudget.getBudgetYear1()));
            }
		}
		rrBudget.setBudgetSummary(getBudgetSummary(budgetSummary));
		rrBudgetDocument.setRRBudget(rrBudget);
		return rrBudgetDocument;
	}

	/**
	 * This method gets BudgetYear1DataType details like
	 * BudgetPeriodStartDate,BudgetPeriodEndDate,BudgetPeriod
	 * KeyPersons,OtherPersonnel,TotalCompensation,Equipment,ParticipantTraineeSupportCosts,Travel,OtherDirectCosts
	 * DirectCosts,IndirectCosts,CognizantFederalAgency,TotalCosts 
	 * 
	 * @param periodInfo
	 *            (BudgetPeriodInfo) budget summary entry.
	 * @return BudgetYear1DataType corresponding to the BudgetSummaryInfo
	 *         object.
	 */
	private BudgetYear1DataType getBudgetYear1DataType(
			BudgetPeriodInfo periodInfo) {

		BudgetYear1DataType budgetYear = BudgetYear1DataType.Factory
				.newInstance();
		if (periodInfo != null) {
			budgetYear.setBudgetPeriodStartDate(s2sUtilService
					.convertDateToCalendar(periodInfo.getStartDate()));
			budgetYear.setBudgetPeriodEndDate(s2sUtilService
					.convertDateToCalendar(periodInfo.getEndDate()));
			BudgetPeriod.Enum budgetPeriod = BudgetPeriod.Enum
					.forInt(periodInfo.getBudgetPeriod());
			budgetYear.setBudgetPeriod(budgetPeriod);
			budgetYear.setKeyPersons(getKeyPersons(periodInfo));
			budgetYear.setOtherPersonnel(getOtherPersonnel(periodInfo));
			if (periodInfo.getTotalCompensation() != null) {
				budgetYear.setTotalCompensation(periodInfo
						.getTotalCompensation().bigDecimalValue());
			}
			budgetYear.setEquipment(getEquipment(periodInfo));
			budgetYear.setTravel(getTravel(periodInfo));
			budgetYear
					.setParticipantTraineeSupportCosts(getParticipantTraineeSupportCosts(periodInfo));
			budgetYear.setOtherDirectCosts(getOtherDirectCosts(periodInfo));
			budgetYear.setDirectCosts(periodInfo.getDirectCostsTotal()
					.bigDecimalValue());
			IndirectCosts indirectCosts = getIndirectCosts(periodInfo);
			if (indirectCosts != null) {
				budgetYear.setIndirectCosts(indirectCosts);
				budgetYear.setTotalCosts(periodInfo.getDirectCostsTotal().bigDecimalValue().add(indirectCosts.getTotalIndirectCosts()));
			}else{
				budgetYear.setTotalCosts(periodInfo.getDirectCostsTotal().bigDecimalValue());
			}
			budgetYear.setCognizantFederalAgency(periodInfo
					.getCognizantFedAgency());
		}
		return budgetYear;
	}
	/*
	 * This method gets BudgetJustificationAttachment from proposalDevelopmentDocument for the RRBudget.
	 */
	private BudgetYear1DataType getBudgetJustificationAttachment(BudgetYear1DataType budgetYear) {

		AttachedFileDataType attachedFileDataType = AttachedFileDataType.Factory.newInstance();
		for (Narrative narrative : pdDoc.getDevelopmentProposal().getNarratives()) {
			if (narrative.getNarrativeTypeCode() != null
					&& Integer.parseInt(narrative.getNarrativeTypeCode()) == BUDGET_JUSTIFICATION_ATTACHMENT) {
				attachedFileDataType = getAttachedFileType(narrative);
				if (attachedFileDataType != null) {
					break;
				}
			}
		}
        budgetYear.setBudgetJustificationAttachment(attachedFileDataType);
		return budgetYear;
	}

	/**
	 * This method gets BudgetYearDataType details like
	 * BudgetPeriodStartDate,BudgetPeriodEndDate,BudgetPeriod
	 * KeyPersons,OtherPersonnel,TotalCompensation,Equipment,ParticipantTraineeSupportCosts,Travel,OtherDirectCosts
	 * DirectCosts,IndirectCosts,CognizantFederalAgency,TotalCosts based on
	 * BudgetPeriodInfo for the RRBudget.
	 * 
	 * @param periodInfo
	 *            (BudgetPeriodInfo) budget period entry.
	 * @return BudgetYear1DataType corresponding to the BudgetSummaryInfo
	 *         object.
	 */
	private BudgetYearDataType getBudgetYearDataType(BudgetPeriodInfo periodInfo) {

		BudgetYearDataType budgetYear = BudgetYearDataType.Factory
				.newInstance();
		if (periodInfo != null) {
			budgetYear.setBudgetPeriodStartDate(s2sUtilService
					.convertDateToCalendar(periodInfo.getStartDate()));
			budgetYear.setBudgetPeriodEndDate(s2sUtilService
					.convertDateToCalendar(periodInfo.getEndDate()));
			BudgetPeriod.Enum budgetPeriod = BudgetPeriod.Enum
					.forInt(periodInfo.getBudgetPeriod());
			budgetYear.setBudgetPeriod(budgetPeriod);
			budgetYear.setKeyPersons(getKeyPersons(periodInfo));
			budgetYear.setOtherPersonnel(getOtherPersonnel(periodInfo));
			if (periodInfo.getTotalCompensation() != null) {
				budgetYear.setTotalCompensation(periodInfo
						.getTotalCompensation().bigDecimalValue());
			}
			budgetYear.setEquipment(getEquipment(periodInfo));
			budgetYear.setTravel(getTravel(periodInfo));
			budgetYear
					.setParticipantTraineeSupportCosts(getParticipantTraineeSupportCosts(periodInfo));
			budgetYear.setOtherDirectCosts(getOtherDirectCosts(periodInfo));
			BigDecimal directCosts = periodInfo.getDirectCostsTotal()
					.bigDecimalValue();
			budgetYear.setDirectCosts(directCosts);
			IndirectCosts indirectCosts = getIndirectCosts(periodInfo);
			budgetYear.setIndirectCosts(indirectCosts);
			budgetYear.setCognizantFederalAgency(periodInfo
					.getCognizantFedAgency());
			if(indirectCosts != null){
				budgetYear.setTotalCosts(directCosts.add(indirectCosts.getTotalIndirectCosts()));
			}else{
				budgetYear.setTotalCosts(periodInfo.getTotalCosts()
						.bigDecimalValue());
			}
		}
		return budgetYear;
	}

	/**
	 * This method gets BudgetSummary details such as
	 * CumulativeTotalFundsRequestedSeniorKeyPerson,CumulativeTotalFundsRequestedOtherPersonnel
	 * CumulativeTotalNoOtherPersonnel,CumulativeTotalFundsRequestedPersonnel,CumulativeEquipments,CumulativeTravels
	 * CumulativeTrainee,CumulativeOtherDirect,CumulativeTotalFundsRequestedDirectCosts,CumulativeTotalFundsRequestedIndirectCost
	 * CumulativeTotalFundsRequestedDirectIndirectCosts and CumulativeFee based
	 * on BudgetSummaryInfo for the RRBudget.
	 * 
	 * @param budgetSummaryData
	 *            (BudgetSummaryInfo) budget summary entry.
	 * @return BudgetSummary details corresponding to the BudgetSummaryInfo
	 *         object.
	 */
	private BudgetSummary getBudgetSummary(BudgetSummaryInfo budgetSummaryData) {

		BudgetSummary budgetSummary = BudgetSummary.Factory.newInstance();
		// Set default values for mandatory fields
		budgetSummary
				.setCumulativeTotalFundsRequestedSeniorKeyPerson(BigDecimal.ZERO);
		budgetSummary
				.setCumulativeTotalFundsRequestedPersonnel(BigDecimal.ZERO);
		budgetSummary
				.setCumulativeTotalFundsRequestedDirectCosts(BigDecimal.ZERO);

		if (budgetSummaryData.getCumTotalFundsForSrPersonnel() != null) {
			budgetSummary
					.setCumulativeTotalFundsRequestedSeniorKeyPerson(budgetSummaryData
							.getCumTotalFundsForSrPersonnel().bigDecimalValue());
		}
		if (budgetSummaryData.getCumTotalFundsForOtherPersonnel() != null) {
			budgetSummary
					.setCumulativeTotalFundsRequestedOtherPersonnel(budgetSummaryData
							.getCumTotalFundsForOtherPersonnel()
							.bigDecimalValue());
		}
		if (budgetSummaryData.getCumNumOtherPersonnel() != null) {
			budgetSummary.setCumulativeTotalNoOtherPersonnel(budgetSummaryData
					.getCumNumOtherPersonnel().intValue());
		}
		if (budgetSummaryData.getCumTotalFundsForPersonnel() != null) {
			budgetSummary
					.setCumulativeTotalFundsRequestedPersonnel(budgetSummaryData
							.getCumTotalFundsForPersonnel().bigDecimalValue());
		}
		budgetSummary
				.setCumulativeEquipments(getCumulativeEquipments(budgetSummaryData));
		budgetSummary
				.setCumulativeTravels(getCumulativeTravels(budgetSummaryData));
		budgetSummary
				.setCumulativeTrainee(getCumulativeTrainee(budgetSummaryData));
		budgetSummary
				.setCumulativeOtherDirect(getCumulativeOtherDirect(budgetSummaryData));
		budgetSummary
				.setCumulativeTotalFundsRequestedDirectCosts(budgetSummaryData
						.getCumTotalDirectCosts().bigDecimalValue());
		budgetSummary
				.setCumulativeTotalFundsRequestedIndirectCost(budgetSummaryData
						.getCumTotalIndirectCosts().bigDecimalValue());
		budgetSummary
				.setCumulativeTotalFundsRequestedDirectIndirectCosts(budgetSummaryData
						.getCumTotalCosts().bigDecimalValue());
		if (budgetSummaryData.getCumFee() != null) {
			budgetSummary.setCumulativeFee(budgetSummaryData.getCumFee()
					.bigDecimalValue());
		}
		return budgetSummary;
	}

	/**
	 * This method gets CumulativeEquipments information
	 * CumulativeTotalFundsRequestedEquipment based on BudgetSummaryInfo for the
	 * form RRBudget.
	 * 
	 * @param budgetSummaryData
	 *            (BudgetSummaryInfo) budget summary entry.
	 * @return CumulativeEquipments details corresponding to the
	 *         BudgetSummaryInfo object.
	 */
	private CumulativeEquipments getCumulativeEquipments(
			BudgetSummaryInfo budgetSummaryData) {

		CumulativeEquipments cumulativeEquipments = CumulativeEquipments.Factory
				.newInstance();
		if (budgetSummaryData != null
				&& budgetSummaryData.getCumEquipmentFunds() != null) {
			cumulativeEquipments
					.setCumulativeTotalFundsRequestedEquipment(budgetSummaryData
							.getCumEquipmentFunds().bigDecimalValue());
		}
		return cumulativeEquipments;
	}

	/**
	 * This method gets CumulativeTravels
	 * details,CumulativeTotalFundsRequestedTravel,CumulativeDomesticTravelCosts
	 * and CumulativeForeignTravelCosts based on BudgetSummaryInfo for the
	 * RRBudget.
	 * 
	 * @param budgetSummaryData
	 *            (BudgetSummaryInfo) budget summary entry.
	 * @return CumulativeTravels details corresponding to the BudgetSummaryInfo
	 *         object.
	 */
	private CumulativeTravels getCumulativeTravels(
			BudgetSummaryInfo budgetSummaryData) {
		CumulativeTravels cumulativeTravels = CumulativeTravels.Factory
				.newInstance();
		if (budgetSummaryData.getCumDomesticTravel() != null) {
			cumulativeTravels
					.setCumulativeDomesticTravelCosts(budgetSummaryData
							.getCumDomesticTravel().bigDecimalValue());
		}
		if (budgetSummaryData.getCumForeignTravel() != null) {
			cumulativeTravels.setCumulativeForeignTravelCosts(budgetSummaryData
					.getCumForeignTravel().bigDecimalValue());
		}
		if (budgetSummaryData.getCumTravel() != null) {
			cumulativeTravels
					.setCumulativeTotalFundsRequestedTravel(budgetSummaryData
							.getCumTravel().bigDecimalValue());
		}
		return cumulativeTravels;
	}

	/**
	 * This method gets CumulativeTrainee details,
	 * CumulativeTotalFundsRequestedTraineeCosts,CumulativeTraineeTuitionFeesHealthInsurance
	 * CumulativeTraineeStipends,CumulativeTraineeTravel,CumulativeTraineeSubsistence,CumulativeOtherTraineeCost
	 * and CumulativeNoofTrainees based on BudgetSummaryInfo for the RRBudget.
	 * 
	 * @param budgetSummaryData
	 *            (BudgetSummaryInfo) budget summary entry.
	 * @return CumulativeTrainee details corresponding to the BudgetSummaryInfo
	 *         object.
	 */
	private CumulativeTrainee getCumulativeTrainee(
			BudgetSummaryInfo budgetSummaryData) {
		CumulativeTrainee cumulativeTrainee = CumulativeTrainee.Factory
				.newInstance();
		cumulativeTrainee
				.setCumulativeTotalFundsRequestedTraineeCosts(BigDecimal.ZERO);
		if (budgetSummaryData != null) {
			cumulativeTrainee
					.setCumulativeTotalFundsRequestedTraineeCosts(budgetSummaryData
							.getpartOtherCost()
							.add(
									budgetSummaryData
											.getpartStipendCost()
											.add(
													budgetSummaryData
															.getpartTravelCost()
															.add(
																	budgetSummaryData
																			.getPartTuition()
																			.add(
																					budgetSummaryData
																							.getPartSubsistence()))))
							.bigDecimalValue());
			cumulativeTrainee
					.setCumulativeTraineeTuitionFeesHealthInsurance(budgetSummaryData
							.getPartTuition().bigDecimalValue());
			cumulativeTrainee.setCumulativeTraineeStipends(budgetSummaryData
					.getpartStipendCost().bigDecimalValue());
			cumulativeTrainee.setCumulativeTraineeTravel(budgetSummaryData
					.getpartTravelCost().bigDecimalValue());
			cumulativeTrainee.setCumulativeTraineeSubsistence(budgetSummaryData
					.getPartSubsistence().bigDecimalValue());
			cumulativeTrainee.setCumulativeOtherTraineeCost(budgetSummaryData
					.getpartOtherCost().bigDecimalValue());
			cumulativeTrainee.setCumulativeNoofTrainees(budgetSummaryData
					.getparticipantCount());
		}
		return cumulativeTrainee;
	}

	/**
	 * This method gets CumulativeOtherDirectCost
	 * details,CumulativeMaterialAndSupplies,CumulativePublicationCosts,
	 * CumulativeConsultantServices,CumulativeADPComputerServices,CumulativeSubawardConsortiumContractualCosts
	 * CumulativeEquipmentFacilityRentalFees,CumulativeAlterationsAndRenovations
	 * and CumulativeOther1DirectCost based on BudgetSummaryInfo for the
	 * RRBudget.
	 * 
	 * @param budgetSummaryData
	 *            (BudgetSummaryInfo) budget summary entry.
	 * @return CumulativeOtherDirect details corresponding to the
	 *         BudgetSummaryInfo object.
	 */
	private CumulativeOtherDirect getCumulativeOtherDirect(
			BudgetSummaryInfo budgetSummaryData) {
		CumulativeOtherDirect cumulativeOtherDirect = CumulativeOtherDirect.Factory
				.newInstance();
		cumulativeOtherDirect
				.setCumulativeTotalFundsRequestedOtherDirectCosts(BigDecimal.ZERO);
		if (budgetSummaryData != null
				&& budgetSummaryData.getOtherDirectCosts() != null) {
			for (OtherDirectCostInfo cumOtherDirect : budgetSummaryData
					.getOtherDirectCosts()) {
				cumulativeOtherDirect
						.setCumulativeTotalFundsRequestedOtherDirectCosts(cumOtherDirect
								.gettotalOtherDirect().bigDecimalValue());
				if (cumOtherDirect.getmaterials() != null) {
					cumulativeOtherDirect
							.setCumulativeMaterialAndSupplies(cumOtherDirect
									.getmaterials().bigDecimalValue());
				}
				if (cumOtherDirect.getpublications() != null) {
					cumulativeOtherDirect
							.setCumulativePublicationCosts(cumOtherDirect
									.getpublications().bigDecimalValue());
				}
				if (cumOtherDirect.getConsultants() != null) {
					cumulativeOtherDirect
							.setCumulativeConsultantServices(cumOtherDirect
									.getConsultants().bigDecimalValue());
				}
				if (cumOtherDirect.getcomputer() != null) {
					cumulativeOtherDirect
							.setCumulativeADPComputerServices(cumOtherDirect
									.getcomputer().bigDecimalValue());
				}
				if (cumOtherDirect.getsubAwards() != null) {
					cumulativeOtherDirect
							.setCumulativeSubawardConsortiumContractualCosts(cumOtherDirect
									.getsubAwards().bigDecimalValue());
				}
				if (cumOtherDirect.getEquipRental() != null) {
					cumulativeOtherDirect
							.setCumulativeEquipmentFacilityRentalFees(cumOtherDirect
									.getEquipRental().bigDecimalValue());
				}
				if (cumOtherDirect.getAlterations() != null) {
					cumulativeOtherDirect
							.setCumulativeAlterationsAndRenovations(cumOtherDirect
									.getAlterations().bigDecimalValue());
				}
				if (cumOtherDirect.getOtherCosts().size() > 0) {
					cumulativeOtherDirect
							.setCumulativeOther1DirectCost(new BigDecimal(
									cumOtherDirect.getOtherCosts().get(0).get(
											S2SConstants.KEY_COST)));
				}
			}
		}
		return cumulativeOtherDirect;
	}

	/**
	 * This method gets ParticipantTraineeSupportCosts details in
	 * BudgetYearDataType such as TuitionFeeHealthInsurance
	 * Stipends,Subsistence,Travel,Other,ParticipantTraineeNumber and TotalCost
	 * based on the BudgetPeriodInfo for the RRBudget.
	 * 
	 * @param periodInfo
	 *            (BudgetPeriodInfo) budget period entry.
	 * @return ParticipantTraineeSupportCosts corresponding to the
	 *         BudgetPeriodInfo object.
	 */
	private ParticipantTraineeSupportCosts getParticipantTraineeSupportCosts(
			BudgetPeriodInfo periodInfo) {

		ParticipantTraineeSupportCosts traineeSupportCosts = ParticipantTraineeSupportCosts.Factory
				.newInstance();
		if (periodInfo != null) {
			traineeSupportCosts.setTuitionFeeHealthInsurance(periodInfo
					.getPartTuition().bigDecimalValue());
			traineeSupportCosts.setStipends(periodInfo.getpartStipendCost()
					.bigDecimalValue());
			traineeSupportCosts.setTravel(periodInfo.getpartTravelCost()
					.bigDecimalValue());
			traineeSupportCosts.setSubsistence(periodInfo.getPartSubsistence()
					.bigDecimalValue());
			traineeSupportCosts.setOther(getOtherPTSupportCosts(periodInfo));
			traineeSupportCosts.setParticipantTraineeNumber(periodInfo
					.getparticipantCount());
			traineeSupportCosts
					.setTotalCost(traineeSupportCosts
							.getTuitionFeeHealthInsurance()
							.add(
									traineeSupportCosts
											.getStipends()
											.add(
													traineeSupportCosts
															.getTravel()
															.add(
																	traineeSupportCosts
																			.getSubsistence()
																			.add(
																					traineeSupportCosts
																							.getOther()
																							.getCost())))));
		}
		return traineeSupportCosts;
	}

	/**
	 * This method gets Other type description and total cost for
	 * ParticipantTraineeSupportCosts based on BudgetPeriodInfo.
	 * 
	 * @param periodInfo
	 *            (BudgetPeriodInfo) budget period entry.
	 * @return Other other participant trainee support costs corresponding to
	 *         the BudgetPeriodInfo object.
	 */
	private Other getOtherPTSupportCosts(BudgetPeriodInfo periodInfo) {
		Other other = Other.Factory.newInstance();
		other.setDescription(OTHERCOST_DESCRIPTION);
		BudgetDecimal otherCost = BudgetDecimal.ZERO;
		if (periodInfo != null && periodInfo.getpartOtherCost() != null) {
			otherCost = periodInfo.getpartOtherCost();
		}
		other.setCost(otherCost.bigDecimalValue());
		return other;
	}

	/**
	 * This method gets OtherDirectCosts details such as
	 * PublicationCosts,MaterialsSupplies,ConsultantServices,
	 * ADPComputerServices,SubawardConsortiumContractualCosts,EquipmentRentalFee,AlterationsRenovations
	 * and TotalOtherDirectCost in BudgetYearDataType based on BudgetPeriodInfo
	 * for the RRBudget.
	 * 
	 * @param periodInfo
	 *            (BudgetPeriodInfo) budget period entry.
	 * @return OtherDirectCosts corresponding to the BudgetPeriodInfo object.
	 */
	private OtherDirectCosts getOtherDirectCosts(BudgetPeriodInfo periodInfo) {

		OtherDirectCosts otherDirectCosts = OtherDirectCosts.Factory
				.newInstance();
		if (periodInfo != null && periodInfo.getOtherDirectCosts().size() > 0) {
			if (periodInfo.getOtherDirectCosts().get(0).getpublications() != null) {
				otherDirectCosts.setPublicationCosts(periodInfo
						.getOtherDirectCosts().get(0).getpublications()
						.bigDecimalValue());
			}
			if (periodInfo.getOtherDirectCosts().get(0).getmaterials() != null) {
				otherDirectCosts.setMaterialsSupplies(periodInfo
						.getOtherDirectCosts().get(0).getmaterials()
						.bigDecimalValue());
			}
			if (periodInfo.getOtherDirectCosts().get(0).getConsultants() != null) {
				otherDirectCosts.setConsultantServices(periodInfo
						.getOtherDirectCosts().get(0).getConsultants()
						.bigDecimalValue());
			}
			if (periodInfo.getOtherDirectCosts().get(0).getcomputer() != null) {
				otherDirectCosts.setADPComputerServices(periodInfo
						.getOtherDirectCosts().get(0).getcomputer()
						.bigDecimalValue());
			}
			if (periodInfo.getOtherDirectCosts().get(0).getsubAwards() != null) {
				otherDirectCosts
						.setSubawardConsortiumContractualCosts(periodInfo
								.getOtherDirectCosts().get(0).getsubAwards()
								.bigDecimalValue());
			}
			if (periodInfo.getOtherDirectCosts().get(0).getAlterations() != null) {
				otherDirectCosts.setAlterationsRenovations(periodInfo
						.getOtherDirectCosts().get(0).getAlterations()
						.bigDecimalValue());
			}
			if (periodInfo.getOtherDirectCosts().get(0).getEquipRental() != null) {
				otherDirectCosts.setEquipmentRentalFee(periodInfo
						.getOtherDirectCosts().get(0).getEquipRental()
						.bigDecimalValue());
			}
			otherDirectCosts
					.setOthers(getOthersForOtherDirectCosts(periodInfo));
			if (periodInfo.getOtherDirectCosts().get(0).gettotalOtherDirect() != null) {
				otherDirectCosts.setTotalOtherDirectCost(periodInfo
						.getOtherDirectCosts().get(0).gettotalOtherDirect()
						.bigDecimalValue());
			}
		}
		return otherDirectCosts;
	}

	/**
	 * This method returns IndirectCosts details such as
	 * Base,CostType,FundRequested,Rate and TotalIndirectCosts in
	 * BudgetYearDataType based on BudgetPeriodInfo for the RRBudget.
	 * 
	 * @param periodInfo
	 *            (BudgetPeriodInfo) budget period entry.
	 * @return IndirectCosts corresponding to the BudgetPeriodInfo object.
	 */
	private IndirectCosts getIndirectCosts(BudgetPeriodInfo periodInfo) {

		IndirectCosts indirectCosts = null;

		if (periodInfo != null
				&& periodInfo.getIndirectCosts() != null
				&& periodInfo.getIndirectCosts().getIndirectCostDetails() != null) {

			List<IndirectCosts.IndirectCost> indirectCostList = new ArrayList<IndirectCosts.IndirectCost>();
			int IndirectCostCount = 0;
			for (IndirectCostDetails indirectCostDetails : periodInfo
					.getIndirectCosts().getIndirectCostDetails()) {
				IndirectCosts.IndirectCost indirectCost = IndirectCosts.IndirectCost.Factory
						.newInstance();
				if (indirectCostDetails.getBase() != null) {
					indirectCost.setBase(indirectCostDetails.getBase()
							.bigDecimalValue());
				}
				indirectCost.setCostType(indirectCostDetails.getCostType());
				if (indirectCostDetails.getFunds() != null) {
					indirectCost.setFundRequested(indirectCostDetails
							.getFunds().bigDecimalValue());
				}
				if (indirectCostDetails.getRate() != null) {
					indirectCost.setRate(indirectCostDetails.getRate()
							.bigDecimalValue());
				}
				indirectCostList.add(indirectCost);
				IndirectCostCount++;
				if (IndirectCostCount == ARRAY_LIMIT_IN_SCHEMA) {
					LOG
							.warn("Stopping iteration over indirect cost details because array limit in schema is only 4");
					break;
				}
			}
			if (IndirectCostCount > 0) {
				indirectCosts = IndirectCosts.Factory.newInstance();
				IndirectCosts.IndirectCost indirectCostArray[] = new IndirectCosts.IndirectCost[0];
				indirectCosts.setIndirectCostArray(indirectCostList
						.toArray(indirectCostArray));
				if (periodInfo.getIndirectCosts().getTotalIndirectCosts() != null) {
					indirectCosts.setTotalIndirectCosts(periodInfo
							.getIndirectCosts().getTotalIndirectCosts()
							.bigDecimalValue());
				}
			}
		}
		return indirectCosts;
	}

	/**
	 * This method is to get Other type description and total cost
	 * OtherDirectCosts details in BudgetYearDataType based on BudgetPeriodInfo
	 * for the RRBudget.
	 * 
	 * @param periodInfo
	 *            (BudgetPeriodInfo) budget period entry.
	 * @return Other others for other direct costs corresponding to the
	 *         BudgetPeriodInfo object.
	 */
	private Others getOthersForOtherDirectCosts(BudgetPeriodInfo periodInfo) {

		Others others = Others.Factory.newInstance();
		if (periodInfo != null && periodInfo.getOtherDirectCosts() != null) {
			Others.Other otherArray[] = new Others.Other[periodInfo
					.getOtherDirectCosts().size()];
			int Otherscount = 0;
			for (OtherDirectCostInfo otherDirectCostInfo : periodInfo
					.getOtherDirectCosts()) {
				Others.Other other = Others.Other.Factory.newInstance();
				if (otherDirectCostInfo.getOtherCosts() != null
						&& otherDirectCostInfo.getOtherCosts().size() > 0) {
					other
							.setCost(new BigDecimal(otherDirectCostInfo
									.getOtherCosts().get(0).get(
											S2SConstants.KEY_COST)));
				}
				other.setDescription(OTHERCOST_DESCRIPTION);
				otherArray[Otherscount] = other;
				Otherscount++;
			}
			others.setOtherArray(otherArray);
		}
		return others;
	}

	/**
	 * This method gets Travel cost information including
	 * DomesticTravelCost,ForeignTravelCost and TotalTravelCost in the
	 * BudgetYearDataType based on BudgetPeriodInfo for the RRBudget.
	 * 
	 * @param periodInfo
	 *            (BudgetPeriodInfo) budget period entry.
	 * @return Travel costs corresponding to the BudgetPeriodInfo object.
	 */
	private Travel getTravel(BudgetPeriodInfo periodInfo) {

		Travel travel = Travel.Factory.newInstance();
		if (periodInfo != null) {
			travel.setDomesticTravelCost(periodInfo.getDomesticTravelCost()
					.bigDecimalValue());
			travel.setForeignTravelCost(periodInfo.getForeignTravelCost()
					.bigDecimalValue());
			travel.setTotalTravelCost(periodInfo.getTotalTravelCost()
					.bigDecimalValue());
		}
		return travel;
	}

	/**
	 * This method gets Equipment details such as
	 * EquipmentItem,FundsRequested,TotalFundForAttachedEquipment, TotalFund and
	 * AdditionalEquipmentsAttachment based on BudgetPeriodInfo for the
	 * RRBudget.
	 * 
	 * @param periodInfo
	 *            (BudgetPeriodInfo) budget period entry.
	 * @return Equipment costs corresponding to the BudgetPeriodInfo object.
	 * 
	 */
	private Equipment getEquipment(BudgetPeriodInfo periodInfo) {
		Equipment equipment = Equipment.Factory.newInstance();
		Narrative extraEquipmentNarr = null;
		if (periodInfo != null && periodInfo.getEquipment() != null
				&& periodInfo.getEquipment().size() > 0) {
			// Evaluating Equipments.
			List<EquipmentList> equipmentArrayList = new ArrayList<EquipmentList>();
			BudgetDecimal totalFund = BudgetDecimal.ZERO;
			for (CostInfo costInfo : periodInfo.getEquipment().get(0)
					.getEquipmentList()) {
				EquipmentList equipmentList = EquipmentList.Factory.newInstance();
				equipmentList.setEquipmentItem(costInfo.getDescription());
				if (costInfo.getCost() != null) {
					equipmentList.setFundsRequested(costInfo.getCost().bigDecimalValue());
				}
				totalFund = totalFund.add(costInfo.getCost());
				equipmentArrayList.add(equipmentList);
			}

			// Evaluating Extra Equipments.
			List<CostInfo> extraEquipmentArrayList = new ArrayList<CostInfo>();
			BudgetDecimal totalExtraEquipFund = BudgetDecimal.ZERO;
			for(CostInfo costInfo:periodInfo.getEquipment().get(0).getExtraEquipmentList()){
				extraEquipmentArrayList.add(costInfo);
				totalExtraEquipFund = totalExtraEquipFund.add(costInfo.getCost());
			}
			EquipmentList[] equipmentArray = new EquipmentList[0];
			equipmentArray = equipmentArrayList.toArray(equipmentArray);
			equipment.setEquipmentListArray(equipmentArray);
			TotalFundForAttachedEquipment totalFundForAttachedEquipment = TotalFundForAttachedEquipment.Factory
					.newInstance();
			totalFundForAttachedEquipment
					.setTotalFundForAttachedEquipmentExist(YesNoDataType.Y_YES);
			totalFundForAttachedEquipment.setBigDecimalValue(totalExtraEquipFund.bigDecimalValue());
			equipment.setTotalFundForAttachedEquipment(totalFundForAttachedEquipment);
			totalFund = totalFund.add(totalExtraEquipFund);
			equipment.setTotalFund(totalFund.bigDecimalValue());
			extraEquipmentNarr = saveAdditionalEquipments(periodInfo,extraEquipmentArrayList);
		}
//		for (Narrative narrative : pdDoc.getDevelopmentProposal()
//				.getNarratives()) {
//			if (narrative.getNarrativeTypeCode() != null
//					&& Integer.parseInt(narrative.getNarrativeTypeCode()) == ADDITIONAL_EQUIPMENT_ATTACHMENT) {
		if(extraEquipmentNarr!=null){
			AdditionalEquipmentsAttachment equipmentAttachment = AdditionalEquipmentsAttachment.Factory
					.newInstance();
			FileLocation fileLocation = FileLocation.Factory.newInstance();
			equipmentAttachment.setFileLocation(fileLocation);
			String contentId = createContentId(extraEquipmentNarr);
			fileLocation.setHref(contentId);
			equipmentAttachment.setFileLocation(fileLocation);
			equipmentAttachment.setFileName(extraEquipmentNarr.getFileName());
			equipmentAttachment
					.setMimeType(S2SConstants.CONTENT_TYPE_OCTET_STREAM);
			extraEquipmentNarr.refreshReferenceObject(NARRATIVE_ATTACHMENT_LIST);
			if (extraEquipmentNarr.getNarrativeAttachmentList() != null
					&& extraEquipmentNarr.getNarrativeAttachmentList().size() > 0) {
				equipmentAttachment.setHashValue(getHashValue(extraEquipmentNarr
						.getNarrativeAttachmentList().get(0).getContent()));
			}
			AttachmentData attachmentData = new AttachmentData();
			attachmentData.setContent(extraEquipmentNarr
					.getNarrativeAttachmentList().get(0).getContent());
			attachmentData.setContentId(contentId);
			attachmentData
					.setContentType(S2SConstants.CONTENT_TYPE_OCTET_STREAM);
			attachmentData.setFileName(extraEquipmentNarr.getFileName());
			addAttachment(attachmentData);
			equipmentAttachment
					.setTotalFundForAttachedEquipmentExist(YesNoDataType.Y_YES);
			equipment
					.setAdditionalEquipmentsAttachment(equipmentAttachment);
		}
//		}
		return equipment;
	}

	/**
	 * This method gets OtherPersonnel informations like
	 * PostDocAssociates,GraduateStudents,UndergraduateStudents
	 * SecretarialClerical based on PersonnelType and also gets
	 * NumberOfPersonnel, ProjectRole,Compensation OtherPersonnelTotalNumber and
	 * TotalOtherPersonnelFund based on BudgetPeriodInfo for the RRBudget.
	 * 
	 * @param periodInfo
	 *            (BudgetPeriodInfo) budget period entry.
	 * @return OtherPersonnel details corresponding to the BudgetPeriodInfo
	 *         object.
	 */
	private OtherPersonnel getOtherPersonnel(BudgetPeriodInfo periodInfo) {
		OtherPersonnel otherPersonnel = OtherPersonnel.Factory.newInstance();
		int OtherpersonalCount = 0;
		List<OtherPersonnelDataType> otherPersonnelList = new ArrayList<OtherPersonnelDataType>();
		OtherPersonnelDataType otherPersonnelDataTypeArray[] = new OtherPersonnelDataType[1];
		if (periodInfo != null) {
			for (OtherPersonnelInfo otherPersonnelInfo : periodInfo
					.getOtherPersonnel()) {
				if (OTHERPERSONNEL_POSTDOC.equals(otherPersonnelInfo
						.getPersonnelType())) {
					otherPersonnel
							.setPostDocAssociates(getPostDocAssociates(otherPersonnelInfo));
				} else if (OTHERPERSONNEL_GRADUATE.equals(otherPersonnelInfo
						.getPersonnelType())) {
					otherPersonnel
							.setGraduateStudents(getGraduateStudents(otherPersonnelInfo));
				} else if (OTHERPERSONNEL_UNDERGRADUATE
						.equals(otherPersonnelInfo.getPersonnelType())) {
					otherPersonnel
							.setUndergraduateStudents(getUndergraduateStudents(otherPersonnelInfo));
				} else if (OTHERPERSONNEL_SECRETARIAL.equals(otherPersonnelInfo
						.getPersonnelType())) {
					otherPersonnel
							.setSecretarialClerical(getSecretarialClerical(otherPersonnelInfo));
				} else if (OtherpersonalCount < OTHERPERSONNEL_MAX_ALLOWED) {// Max
					// allowed
					// is 6
					OtherPersonnelDataType otherPersonnelDataType = OtherPersonnelDataType.Factory
							.newInstance();
					otherPersonnelDataType
							.setNumberOfPersonnel(otherPersonnelInfo
									.getNumberPersonnel());
					otherPersonnelDataType.setProjectRole(otherPersonnelInfo
							.getRole());
					otherPersonnelDataType
							.setCompensation(getSectBCompensationDataType(otherPersonnelInfo
									.getCompensation()));
					otherPersonnelList.add(otherPersonnelDataType);
					OtherpersonalCount++;
				}
			}
			otherPersonnelDataTypeArray = otherPersonnelList
					.toArray(otherPersonnelDataTypeArray);
			otherPersonnel.setOtherArray(otherPersonnelDataTypeArray);

			if (periodInfo.getOtherPersonnelTotalNumber() != null) {
				otherPersonnel.setOtherPersonnelTotalNumber(periodInfo
						.getOtherPersonnelTotalNumber().intValue());
			}
			if (periodInfo.getTotalOtherPersonnelFunds() != null) {
				otherPersonnel.setTotalOtherPersonnelFund(periodInfo
						.getTotalOtherPersonnelFunds().bigDecimalValue());
			}
		}
		return otherPersonnel;
	}

	/**
	 * This method gets the PostDocAssociates details,ProjectRole,
	 * NumberOfPersonnel,Compensation based on OtherPersonnelInfo for the
	 * RRBudget,if it is a PostDocAssociates type.
	 * 
	 * @param otherPersonnel
	 *            (OtherPersonnelInfo)other personnel info entry.
	 * @return PostDocAssociates details corresponding to the OtherPersonnelInfo
	 *         object.
	 */
	private PostDocAssociates getPostDocAssociates(
			OtherPersonnelInfo otherPersonnel) {

		PostDocAssociates postDocAssociates = PostDocAssociates.Factory
				.newInstance();
		if (otherPersonnel != null) {
			postDocAssociates.setNumberOfPersonnel(otherPersonnel
					.getNumberPersonnel());
			postDocAssociates.setProjectRole(otherPersonnel.getRole());
			postDocAssociates
					.setCompensation(getSectBCompensationDataType(otherPersonnel
							.getCompensation()));
		}
		return postDocAssociates;
	}

	/**
	 * This method gets the GraduateStudents details,ProjectRole,
	 * NumberOfPersonnel,Compensation based on OtherPersonnelInfo for the
	 * RRBudget, if it is a GraduateStudents type.
	 * 
	 * @param otherPersonnel
	 *            (OtherPersonnelInfo) other personnel info entry.
	 * @return GraduateStudents details corresponding to the OtherPersonnelInfo
	 *         object.
	 */
	private GraduateStudents getGraduateStudents(
			OtherPersonnelInfo otherPersonnel) {

		GraduateStudents graduate = GraduateStudents.Factory.newInstance();
		if (otherPersonnel != null) {
			graduate.setNumberOfPersonnel(otherPersonnel.getNumberPersonnel());
			graduate.setProjectRole(otherPersonnel.getRole());
			graduate
					.setCompensation(getSectBCompensationDataType(otherPersonnel
							.getCompensation()));
		}
		return graduate;
	}

	/**
	 * This method is to get the UndergraduateStudents details,ProjectRole,
	 * NumberOfPersonnel,Compensation based on OtherPersonnelInfo for the
	 * RRBudget,if it is a UndergraduateStudents type.
	 * 
	 * @param otherPersonnel
	 *            (OtherPersonnelInfo) other personnel info entry.
	 * @return UndergraduateStudents details corresponding to the
	 *         OtherPersonnelInfo object.
	 */
	private UndergraduateStudents getUndergraduateStudents(
			OtherPersonnelInfo otherPersonnel) {

		UndergraduateStudents undergraduate = UndergraduateStudents.Factory
				.newInstance();
		if (otherPersonnel != null) {
			undergraduate.setNumberOfPersonnel(otherPersonnel
					.getNumberPersonnel());
			undergraduate.setProjectRole(otherPersonnel.getRole());
			undergraduate
					.setCompensation(getSectBCompensationDataType(otherPersonnel
							.getCompensation()));
		}
		return undergraduate;
	}

	/**
	 * This method is to get the SecretarialClerical details,ProjectRole,
	 * NumberOfPersonnel,Compensation based on OtherPersonnelInfo for the
	 * RRBudget,if it is a SecretarialClerical type.
	 * 
	 * @param otherPersonnel
	 *            (OtherPersonnelInfo) other personnel info entry.
	 * @return SecretarialClerical corresponding to the OtherPersonnelInfo
	 *         object.
	 */
	private SecretarialClerical getSecretarialClerical(
			OtherPersonnelInfo otherPersonnel) {

		SecretarialClerical secretarialClerical = SecretarialClerical.Factory
				.newInstance();
		if (otherPersonnel != null) {
			secretarialClerical.setNumberOfPersonnel(otherPersonnel
					.getNumberPersonnel());
			secretarialClerical.setProjectRole(otherPersonnel.getRole());
			secretarialClerical
					.setCompensation(getSectBCompensationDataType(otherPersonnel
							.getCompensation()));
		}
		return secretarialClerical;
	}

	/**
	 * This method gets SectBCompensationDataType details
	 * AcademicMonths,CalendarMonths,FringeBenefits
	 * FundsRequested,SummerMonths,and RequestedSalary based on KeyPersonInfo
	 * for the OtherPersonnel.
	 * 
	 * @param compensation
	 *            (CompensationInfo) compensation info entry.
	 * @return SectBCompensationDataType details corresponding to the
	 *         CompensationInfo object.
	 */
	private SectBCompensationDataType getSectBCompensationDataType(
			CompensationInfo compensation) {

		SectBCompensationDataType sectBCompensation = SectBCompensationDataType.Factory
				.newInstance();
		if (compensation != null) {
			sectBCompensation.setAcademicMonths(compensation
					.getAcademicMonths().bigDecimalValue());
			sectBCompensation.setCalendarMonths(compensation
					.getCalendarMonths().bigDecimalValue());
			sectBCompensation.setSummerMonths(compensation.getSummerMonths()
					.bigDecimalValue());
			sectBCompensation.setFringeBenefits(compensation.getFringe()
					.bigDecimalValue());
			sectBCompensation.setFundsRequested(compensation
					.getFundsRequested().bigDecimalValue());
			sectBCompensation.setRequestedSalary(compensation
					.getRequestedSalary().bigDecimalValue());
		}
		return sectBCompensation;
	}

	/**
	 * This method gets KeyPersons details such as
	 * Name,ProjectRole,Compensation,TotalFundForAttachedKeyPersons
	 * TotalFundForKeyPersons and AttachedKeyPersons based on BudgetPeriodInfo
	 * for the RRBudget.
	 * 
	 * @param periodInfo
	 *            (BudgetPeriodInfo) budget period entry.
	 * @return KeyPersons details corresponding to the BudgetPeriodInfo object.
	 */
	private KeyPersons getKeyPersons(BudgetPeriodInfo periodInfo) {

		KeyPersons keyPersons = KeyPersons.Factory.newInstance();
		BudgetDecimal extraFunds = BudgetDecimal.ZERO;
		if (periodInfo != null) {
			if (periodInfo.getKeyPersons() != null) {
			    List<KeyPersonDataType> keyPersonList = new ArrayList<KeyPersonDataType>();
				int keyPersonCount = 0;
				for (KeyPersonInfo keyPerson : periodInfo.getKeyPersons()) {
				  if(keyPerson.getRole().equals(NID_PD_PI) || hasPersonnelBudget(keyPerson,periodInfo.getBudgetPeriod())){
					KeyPersonDataType keyPersonDataType = KeyPersonDataType.Factory
							.newInstance();
					keyPersonDataType.setName(globLibV20Generator
							.getHumanNameDataType(keyPerson));
					if (isSponsorNIH(pdDoc)
							&& KEYPERSON_CO_PD_PI.equals(keyPerson.getRole())) {
					    DevelopmentProposal developmentProposal=pdDoc.getDevelopmentProposal();		
					    
					    for (ProposalPerson proposalPerson : developmentProposal.getInvestigators()) {	
					        if(isProposalPersonEqualsKeyPerson(proposalPerson,keyPerson)){	
					            if(proposalPerson.isMultiplePi())
					                keyPersonDataType.setProjectRole(NID_PD_PI); 					           
					            else 
					                keyPersonDataType.setProjectRole(NID_CO_PD_PI);                                 				            
					        }
					    }					
					} 					
					else if(keyPerson.getKeyPersonRole()!=null){
					    keyPersonDataType.setProjectRole(keyPerson.getKeyPersonRole());
                    }
					else {
						keyPersonDataType.setProjectRole(keyPerson.getRole());						
					}
					keyPersonDataType
							.setCompensation(getCompensation(keyPerson, periodInfo.getBudgetPeriod()));
					keyPersonList.add(keyPersonDataType);
					keyPersonCount++;
					LOG.info("keyPersonCount:" + keyPersonCount);
				}
			}
				keyPersons.setKeyPersonArray(keyPersonList.toArray(new KeyPersonDataType[0]));
			}
			if (periodInfo.getTotalFundsKeyPersons() != null) {
				keyPersons.setTotalFundForKeyPersons(periodInfo
						.getTotalFundsKeyPersons().bigDecimalValue());
			}
			for (KeyPersonInfo keyPerson : periodInfo.getExtraKeyPersons()) {
				extraFunds = extraFunds.add(keyPerson.getFundsRequested());
			}
		}
		TotalFundForAttachedKeyPersons totalFundForAttachedKeyPersons = TotalFundForAttachedKeyPersons.Factory
				.newInstance();
		totalFundForAttachedKeyPersons.setTotalFundForAttachedKeyPersonsExist(YesNoDataType.Y_YES);
		totalFundForAttachedKeyPersons.setBigDecimalValue(extraFunds.bigDecimalValue());
		keyPersons.setTotalFundForAttachedKeyPersons(totalFundForAttachedKeyPersons);
		Narrative extraKeyPersonNarr = saveExtraKeyPersons(periodInfo);
//		for (Narrative narrative : pdDoc.getDevelopmentProposal()
//				.getNarratives()) {
//			if (narrative.getNarrativeTypeCode() != null
//					&& Integer.parseInt(narrative.getNarrativeTypeCode()) == ADDITIONAL_KEYPERSONS_ATTACHMENT) {
		if(extraKeyPersonNarr!=null){
			AttachedKeyPersons attachedKeyPersons = AttachedKeyPersons.Factory
					.newInstance();
			FileLocation fileLocation = FileLocation.Factory.newInstance();
			attachedKeyPersons.setFileLocation(fileLocation);
			String contentId = createContentId(extraKeyPersonNarr);
			fileLocation.setHref(contentId);
			attachedKeyPersons.setFileLocation(fileLocation);
			attachedKeyPersons.setFileName(extraKeyPersonNarr.getFileName());
			attachedKeyPersons
					.setMimeType(S2SConstants.CONTENT_TYPE_OCTET_STREAM);
			extraKeyPersonNarr.refreshReferenceObject(NARRATIVE_ATTACHMENT_LIST);
			AttachmentData attachmentData = new AttachmentData();
			byte[] narrativeContent = null;
			if (extraKeyPersonNarr.getNarrativeAttachmentList() != null
					&& extraKeyPersonNarr.getNarrativeAttachmentList().size() > 0) {
				narrativeContent = extraKeyPersonNarr
				.getNarrativeAttachmentList().get(0).getContent();
				
			}
			if(narrativeContent != null && narrativeContent.length > 0){
				attachedKeyPersons.setHashValue(getHashValue(narrativeContent));
				attachmentData.setContent(narrativeContent);
				attachmentData.setContentId(contentId);
				attachmentData
						.setContentType(S2SConstants.CONTENT_TYPE_OCTET_STREAM);
				attachmentData.setFileName(extraKeyPersonNarr.getFileName());
				addAttachment(attachmentData);
				attachedKeyPersons
						.setTotalFundForAttachedKeyPersonsExist(YesNoDataType.Y_YES);
				keyPersons.setAttachedKeyPersons(attachedKeyPersons);
//				}
			}
		}
		return keyPersons;
	}



    /**
	 * This method gets KeyPersonCompensationDataType informations such as
	 * AcademicMonths,CalendarMonths,FringeBenefits
	 * SummerMonths,RequestedSalary,FundsRequested and BaseSalary based on
	 * KeyPersonInfo for the keyPerson.
	 * 
	 * @param keyPerson
	 *            (KeyPersonInfo) key person entry.
	 * @return KeyPersonCompensationDataType details corresponding to the
	 *         KeyPersonInfo object.
	 */
	private KeyPersonCompensationDataType getCompensation(
			KeyPersonInfo keyPerson, int budgetPeriod) {

		KeyPersonCompensationDataType compensation = KeyPersonCompensationDataType.Factory
				.newInstance();
		BudgetService budgetService = KraServiceLocator.getService(BudgetService.class);
        BudgetDecimal baseSalaryByPeriod; 
		if (keyPerson != null) {
			compensation.setAcademicMonths(keyPerson.getAcademicMonths()
					.bigDecimalValue());
			compensation.setCalendarMonths(keyPerson.getCalendarMonths()
					.bigDecimalValue());
			compensation.setSummerMonths(keyPerson.getSummerMonths()
					.bigDecimalValue());
			compensation.setFringeBenefits(keyPerson.getFringe()
					.bigDecimalValue());
			compensation.setRequestedSalary(keyPerson.getRequestedSalary()
					.bigDecimalValue());
			compensation.setFundsRequested(keyPerson.getFundsRequested()
					.bigDecimalValue());
			if (pdDoc.getBudgetDocumentVersions() != null) {
                baseSalaryByPeriod = budgetService.getBaseSalaryByPeriod(pdDoc.getBudgetDocumentVersion(0)
                        .getBudgetVersionOverview().getBudgetId(), budgetPeriod, keyPerson);
                if (baseSalaryByPeriod != null) {
                    compensation.setBaseSalary(baseSalaryByPeriod.bigDecimalValue());
                }
                else {
                    if (keyPerson.getBaseSalary() != null) {
                        compensation.setBaseSalary(keyPerson.getBaseSalary().bigDecimalValue());
                    }
                }
            }
            else {
                compensation.setBaseSalary(keyPerson.getBaseSalary().bigDecimalValue());
            }			
		}
		return compensation;
	}



	/**
	 * This method creates {@link XmlObject} of type {@link RRBudgetDocument} by
	 * populating data from the given {@link ProposalDevelopmentDocument}
	 * 
	 * @param proposalDevelopmentDocument
	 *            for which the {@link XmlObject} needs to be created
	 * @return {@link XmlObject} which is generated using the given
	 *         {@link ProposalDevelopmentDocument}
	 * @see org.kuali.kra.s2s.generator.S2SFormGenerator#getFormObject(ProposalDevelopmentDocument)
	 */
	public XmlObject getFormObject(
			ProposalDevelopmentDocument proposalDevelopmentDocument) {
		this.pdDoc = proposalDevelopmentDocument;
		return getRRBudget();
	}

	/**
	 * This method typecasts the given {@link XmlObject} to the required
	 * generator type and returns back the document of that generator type.
	 * 
	 * @param xmlObject
	 *            which needs to be converted to the document type of the
	 *            required generator
	 * @return {@link XmlObject} document of the required generator type
	 * @see org.kuali.kra.s2s.generator.S2SFormGenerator#getFormObject(XmlObject)
	 */
	public XmlObject getFormObject(XmlObject xmlObject) {
		RRBudget rrBudget = (RRBudget) xmlObject;
		RRBudgetDocument rrBudgetDocument = RRBudgetDocument.Factory
				.newInstance();
		rrBudgetDocument.setRRBudget(rrBudget);
		return rrBudgetDocument;
	}
}
