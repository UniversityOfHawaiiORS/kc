/*
 * Kuali Coeus, a comprehensive research administration system for higher education.
 * 
 * Copyright 2005-2015 Kuali, Inc.
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 * 
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package org.kuali.coeus.common.api.budget.rates;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.validation.Valid;

import org.kuali.coeus.common.budget.framework.rate.InstituteRate;
import org.kuali.coeus.common.budget.framework.rate.RateClass;
import org.kuali.coeus.common.budget.framework.rate.RateClassType;
import org.kuali.coeus.common.budget.framework.rate.RateType;
import org.kuali.coeus.common.framework.fiscalyear.FiscalYearMonthService;
import org.kuali.coeus.sys.framework.controller.rest.RestController;
import org.kuali.coeus.sys.framework.gv.GlobalVariableService;
import org.kuali.coeus.sys.framework.rest.UnauthorizedAccessException;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.kra.infrastructure.PermissionConstants;
import org.kuali.rice.kim.api.permission.PermissionService;
import org.kuali.rice.krad.service.BusinessObjectService;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.codiform.moo.Moo;
import com.codiform.moo.configuration.Configuration;
import com.codiform.moo.curry.Translate;

@Controller("budgetRatesRestController")
public class BudgetRatesRestController extends RestController {
	
	@Autowired
	@Qualifier("businessObjectService")
	private BusinessObjectService businessObjectService;
	
	@Autowired
	@Qualifier("fiscalYearMonthService")
	private FiscalYearMonthService fiscalYearMonthService;
	
	@Autowired
	@Qualifier("permissionService")
	private PermissionService permissionService;
	
	@Autowired
	@Qualifier("globalVariableService")
	private GlobalVariableService globalVariableService;
	
	@RequestMapping(value="/api/rateClassTypes", method=RequestMethod.GET)
	public @ResponseBody Collection<RateClassTypeDto> getRateClassTypes() {
		return Translate.to(RateClassTypeDto.class).fromEach(getBusinessObjectService().findAll(RateClassType.class));
	}
	
	@RequestMapping(value="/api/rateClasses", method=RequestMethod.GET)
	public @ResponseBody Collection<RateClassDto> getRateClasses() {
		return Translate.to(RateClassDto.class).fromEach(getBusinessObjectService().findAll(RateClass.class));
	}
	
	@RequestMapping(value="/api/rateTypes", method=RequestMethod.GET)
	public @ResponseBody Collection<RateTypeDto> getRateTypes() {
		return Translate.to(RateTypeDto.class).fromEach(getBusinessObjectService().findAll(RateType.class));
	}
	
	@RequestMapping(value="/api/instituteRates", method=RequestMethod.GET)
	public @ResponseBody Collection<InstituteRateDto> getInstituteRates(@RequestParam(value="rateClassTypeCode", required=false) String rateClassTypeCode) {
		if (rateClassTypeCode != null) {
			return Translate.to(InstituteRateDto.class).fromEach(getBusinessObjectService().findMatching(InstituteRate.class, 
					Collections.singletonMap("rateClass.rateClassTypeCode", rateClassTypeCode)));
		} else {
			return Translate.to(InstituteRateDto.class).fromEach(getBusinessObjectService().findAll(InstituteRate.class));
		}
	}
	
	@RequestMapping(value="/api/instituteRates", method=RequestMethod.PUT, consumes = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseStatus(value = HttpStatus.OK)
	public void updateInstituteRates(@Valid @RequestBody List<InstituteRateDto> updatedRates) {
		if (!permissionService.hasPermission(globalVariableService.getUserSession().getPrincipalId(), 
				Constants.MODULE_NAMESPACE_MAINTENANCE, PermissionConstants.MAINTAIN_INSTITUTE_RATES)) {
			throw new UnauthorizedAccessException();
		}
		Configuration mooConfig = new Configuration();
		mooConfig.setSourcePropertiesRequired(false);
		Moo moo = new Moo(mooConfig);
		Collection<InstituteRate> currentRates = getBusinessObjectService().findAll(InstituteRate.class);
		updatedRates.forEach(updatedRate -> {
			InstituteRate currentRate = currentRates.stream().filter(rate -> { 
				return new EqualsBuilder()
					.append(rate.getRateClassCode(), updatedRate.getRateClassCode())
					.append(rate.getRateTypeCode(), updatedRate.getRateTypeCode())
					.append(rate.getActivityTypeCode(), updatedRate.getActivityTypeCode())
					.append(rate.getFiscalYear(), updatedRate.getFiscalYear())
					.append(rate.getOnOffCampusFlag(), updatedRate.getOnOffCampusFlag())
					.append(rate.getUnitNumber(), updatedRate.getUnitNumber())
					.isEquals();
			}).findFirst().orElse(null);
			if (currentRate != null) {
				currentRate.setInstituteRate(updatedRate.getInstituteRate());
				getBusinessObjectService().save(currentRate);
			} else {
				InstituteRate newRate = new InstituteRate();
				moo.update(updatedRate).to(newRate);
				if (newRate.getStartDate() == null) {
					newRate.setStartDate(new java.sql.Date(getFiscalYearMonthService().getFiscalYearStartDate(Integer.parseInt(newRate.getFiscalYear())).getTimeInMillis()));
				}
				getBusinessObjectService().save(newRate);
			}
		});
	}
	
	@RequestMapping(value="/instituteRates", method=RequestMethod.GET)
	public String displayInstituteRates() {
		return "instituteRates";
	}
	
	public BusinessObjectService getBusinessObjectService() {
		return businessObjectService;
	}

	public void setBusinessObjectService(BusinessObjectService businessObjectService) {
		this.businessObjectService = businessObjectService;
	}

	public FiscalYearMonthService getFiscalYearMonthService() {
		return fiscalYearMonthService;
	}

	public void setFiscalYearMonthService(
			FiscalYearMonthService fiscalYearMonthService) {
		this.fiscalYearMonthService = fiscalYearMonthService;
	}

	public PermissionService getPermissionService() {
		return permissionService;
	}

	public void setPermissionService(PermissionService permissionService) {
		this.permissionService = permissionService;
	}

	public GlobalVariableService getGlobalVariableService() {
		return globalVariableService;
	}

	public void setGlobalVariableService(GlobalVariableService globalVariableService) {
		this.globalVariableService = globalVariableService;
	}
	
}