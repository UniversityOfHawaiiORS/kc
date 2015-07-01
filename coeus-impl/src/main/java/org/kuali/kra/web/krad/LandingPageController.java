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
package org.kuali.kra.web.krad;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForward;
import org.kuali.coeus.sys.framework.controller.KcCommonControllerService;
import org.kuali.rice.core.api.CoreApiServiceLocator;
import org.kuali.rice.core.api.config.property.ConfigurationService;
import org.kuali.rice.krad.web.service.ControllerService;
import org.kuali.rice.krad.web.service.ModelAndViewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Properties;

@Controller
public class LandingPageController {

    @Autowired
    @Qualifier("modelAndViewService")
    private ModelAndViewService modelAndViewService;

    @Autowired
    @Qualifier("controllerService")
    private ControllerService controllerService;

    @Autowired
    @Qualifier("kcCommonControllerService")
    private KcCommonControllerService kcCommonControllerService;
    
    @Transactional @RequestMapping(value = "/landingPage")
    public ModelAndView defaultRequest(@ModelAttribute("KualiForm") LandingPageForm form, BindingResult result,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
        return getModelAndViewService().getModelAndView(form);
    }

    @ModelAttribute(value = "KualiForm")
    public LandingPageForm initForm(HttpServletRequest request, HttpServletResponse response) {
        return (LandingPageForm) getKcCommonControllerService().initForm(new LandingPageForm(), request, response);
    }

    @Transactional @RequestMapping(value = "/landingPage", params = "methodToCall=defaultMapping")
    public ModelAndView defaultMapping(@ModelAttribute(value = "KualiForm") LandingPageForm form, BindingResult result, HttpServletRequest request,
            HttpServletResponse response) {
        return getControllerService().start(form);
    }

    @Transactional @RequestMapping(value = "/landingPage", params = "methodToCall=start")
    public ModelAndView start(@ModelAttribute(value = "KualiForm") LandingPageForm form, HttpServletRequest request, HttpServletResponse response) {
        return getControllerService().start(form);
    }

    @Transactional @RequestMapping(value = "/landingPage", params = "methodToCall=sessionTimeout")
    public ModelAndView sessionTimeout(@ModelAttribute(value = "KualiForm") LandingPageForm form, BindingResult result, HttpServletRequest request,
            HttpServletResponse response) {
        return getControllerService().sessionTimeout(form);
    }

    @Transactional @RequestMapping(value = "/landingPage", params = "methodToCall=checkForm")
    public ModelAndView checkForm(@ModelAttribute(value = "KualiForm") LandingPageForm form, BindingResult result, HttpServletRequest request, HttpServletResponse response) {
        return getModelAndViewService().checkForm(form);
    }

    // KC-1005 Fix logout
    @Transactional @RequestMapping(value = "/landingPage", params = "methodToCall=logout")
    public ModelAndView logout(@ModelAttribute(value = "KualiForm") LandingPageForm form, BindingResult result, HttpServletRequest request,
                                       HttpServletResponse response) {

        ConfigurationService configService =  CoreApiServiceLocator.getKualiConfigurationService();
        String logoutUrlBase = configService.getPropertyValueAsString("rice.portal.logout.redirectUrl");

        StringBuffer casLogoutUrl = new StringBuffer(logoutUrlBase);
        casLogoutUrl.append("?service=");
        casLogoutUrl.append(buildContextUrlBase(request));
        casLogoutUrl.append("/portal.do");

        // destroy the session
        HttpSession session = request.getSession();
        if (session != null) {
            try {
                session.invalidate();
            }
            catch (IllegalStateException e) {
                // ignore failure, since that just means that the session has
                // already been
                // invalidated
            }
        }

        // get 'em out of here
        System.out.println("DEBUG DEBUG " + casLogoutUrl.toString());
        return modelAndViewService.performRedirect(form,casLogoutUrl.toString(),new Properties());
    }

    private String buildContextUrlBase(HttpServletRequest request)
    {
        StringBuffer contextUrlBase = new StringBuffer();
        contextUrlBase.append(request.getScheme());
        contextUrlBase.append("://");
        contextUrlBase.append(request.getServerName());
        contextUrlBase.append(":");
        contextUrlBase.append(request.getServerPort());
        contextUrlBase.append(request.getContextPath());

        return contextUrlBase.toString();
    }
    // KC-1005 end

    public ModelAndViewService getModelAndViewService() {
        return modelAndViewService;
    }

    public void setModelAndViewService(ModelAndViewService modelAndViewService) {
        this.modelAndViewService = modelAndViewService;
    }

    public KcCommonControllerService getKcCommonControllerService() {
        return kcCommonControllerService;
    }

    public void setKcCommonControllerService(KcCommonControllerService kcCommonControllerService) {
        this.kcCommonControllerService = kcCommonControllerService;
    }

    public ControllerService getControllerService() {
        return controllerService;
    }

    public void setControllerService(ControllerService controllerService) {
        this.controllerService = controllerService;
    }
}
