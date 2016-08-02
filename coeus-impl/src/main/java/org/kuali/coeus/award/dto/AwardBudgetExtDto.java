package org.kuali.coeus.award.dto;

import com.codiform.moo.annotation.CollectionProperty;
import org.codehaus.jackson.annotate.JsonProperty;
import org.kuali.coeus.sys.api.model.ScaleTwoDecimal;
import org.kuali.kra.award.budget.AwardBudgetLimit;

import java.util.List;

public class AwardBudgetExtDto extends AwardBudgetGeneralInfoDto {

    private ScaleTwoDecimal totalDirectCostInclPrev;
    private ScaleTwoDecimal totalIndirectCostInclPrev;
    private ScaleTwoDecimal totalCostInclPrev;
    @JsonProperty(value="budgetRates")
    @CollectionProperty(source="budgetRates", itemClass= BudgetRateDto.class)
    private List<BudgetRateDto> budgetRates;
    @JsonProperty(value="budgetLaRates")
    @CollectionProperty(source="budgetLaRates", itemClass= BudgetRateDto.class)
    private List<BudgetRateDto> budgetLaRates;
    @JsonProperty(value="budgetPeriods")
    @CollectionProperty(source="budgetPeriods", itemClass= BudgetPeriodDto.class)
    private List<BudgetPeriodDto> budgetPeriods;
    @JsonProperty(value="awardBudgetLimits")
    @CollectionProperty(source="awardBudgetLimits", itemClass= AwardBudgetLimitDto.class)
    private List<AwardBudgetLimitDto> awardBudgetLimits;
    @JsonProperty(value="budgetPersons")
    @CollectionProperty(source="budgetPersons", itemClass= BudgetPersonDto.class)
    private List<BudgetPersonDto> budgetPersons;

    public List<AwardBudgetLimitDto> getAwardBudgetLimits() {
        return awardBudgetLimits;
    }

    public void setAwardBudgetLimits(List<AwardBudgetLimitDto> awardBudgetLimits) {
        this.awardBudgetLimits = awardBudgetLimits;
    }

    public ScaleTwoDecimal getTotalDirectCostInclPrev() {
        return totalDirectCostInclPrev;
    }

    public void setTotalDirectCostInclPrev(ScaleTwoDecimal totalDirectCostInclPrev) {
        this.totalDirectCostInclPrev = totalDirectCostInclPrev;
    }

    public ScaleTwoDecimal getTotalIndirectCostInclPrev() {
        return totalIndirectCostInclPrev;
    }

    public void setTotalIndirectCostInclPrev(ScaleTwoDecimal totalIndirectCostInclPrev) {
        this.totalIndirectCostInclPrev = totalIndirectCostInclPrev;
    }

    public ScaleTwoDecimal getTotalCostInclPrev() {
        return totalCostInclPrev;
    }

    public void setTotalCostInclPrev(ScaleTwoDecimal totalCostInclPrev) {
        this.totalCostInclPrev = totalCostInclPrev;
    }

}

