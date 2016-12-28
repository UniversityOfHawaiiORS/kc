package edu.hawaii.rice.kew.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashSet;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


//import org.apache.log4j.Logger;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.rice.kim.api.group.Group;
import org.kuali.rice.kim.api.group.GroupService;
import org.kuali.rice.kim.api.identity.principal.Principal;
import org.kuali.rice.kim.api.services.KimApiServiceLocator;
import org.kuali.coeus.sys.framework.auth.AuthServiceUserLoginFilter;
import org.kuali.rice.core.api.config.property.ConfigurationService;

/**
 * KC-203: Filter out users not in UH KC Users group.  (NOTE:KC-531 removed changes for KC-203 and implemented better technique)
 * KC-531 Improve message when user doesn't have "KC USER" group current status 500 error confuses users
 * KC-146 Logging in through TEST CAS as invalid user throws exception
 *
 */
public class UhKcAuthServiceUserLoginFilter extends AuthServiceUserLoginFilter
{	
	//private static final Logger LOG = Logger.getLogger(UhKcUserLoginFilter.class);
	
	private static HashSet<String>kcUsers=new HashSet<String>();
	private static String kcUserGroupId;
	// KC-1508  Make new "UH COI Users" group for COI only users
	private static HashSet<String>coiUsers=new HashSet<String>();
	private static String coiUserGroupId;
	// KC-901 Add ability for help desk to run the uhims process on demand
	private static Boolean uhimsRunning=false;

	// KC-901 Add ability for help desk to run the uhims process on demand
	private static Boolean coresyncRunning=false;

	private static String appUrl;
	// KC-1508  Make new "UH COI Users" group for COI only users
	private static String coiUrl;
	private static String contextName;

	// KC-1523 Need method for help desk to run CORE sync users process
	public static synchronized String executeCOREsync() {
		ConfigurationService configService = KcServiceLocator.getService(ConfigurationService.class);
		String cmd = configService.getPropertyValueAsString("uh.coresync.cmd");

		if (cmd==null) {
			return "uh.coresync.cmd not configured";
		}

		if (coresyncRunning!=true) {
			coresyncRunning=true;
		} else {
			return "Already Running";
		}

		String result;
		result = executeShellCommand(cmd);
		coresyncRunning=false;
		return result;
	}
	// KC-1523 END

	// KC-901 Add ability for help desk to run the uhims process on demand
	public static synchronized String executeUHIMSprocess() {
		ConfigurationService configService = KcServiceLocator.getService(ConfigurationService.class);
		String cmd = configService.getPropertyValueAsString("uh.uhims.cmd");

		if (cmd==null) {
			return "uh.uhims.cmd not configured";
		}

		if (uhimsRunning!=true) {
			uhimsRunning=true;
		} else {
			return "Already Running";
		}

		String result;
		result = executeShellCommand(cmd);
		uhimsRunning=false;
		return result;
	}
		
	public static synchronized String executeShellCommand(String cmd) {
		String result;
					
		try {
			ProcessBuilder procBuilder = new ProcessBuilder(cmd.split(" "));
			procBuilder.redirectErrorStream(true);
			Process proc = procBuilder.start();
			String line;
			
			BufferedReader reader = new BufferedReader (new InputStreamReader(proc.getInputStream()));
			
			StringBuffer stdOut = new StringBuffer();
			while ((line = reader.readLine ()) != null) {
				stdOut.append(line);
				stdOut.append("<br>");
			}
		    
		    result = stdOut.toString();
		} catch (IOException e) {
			result = "IOException " + e.getMessage();
		}
		uhimsRunning=false;
		return result;
	}
	// KC-901 END
	
	public static void flushKcUserGroupCache() {
		kcUsers=new HashSet<String>();
		coiUsers=new HashSet<String>();
	}
	
	String getKcUserGroupId() {
		if (kcUserGroupId == null) {
			GroupService groupService = KimApiServiceLocator.getGroupService();
			Group kcUserGroup=groupService.getGroupByNamespaceCodeAndName("KC-GEN", "UH KC Users");
			kcUserGroupId = kcUserGroup.getId();
		}
		return kcUserGroupId;
	}

	// KC-1508  Make new "UH COI Users" group for COI only users
	String getCoiUserGroupId() {
		if (coiUserGroupId == null) {
			GroupService groupService = KimApiServiceLocator.getGroupService();
			Group coiUserGroup=groupService.getGroupByNamespaceCodeAndName("KC-GEN", "UH COI Users");
			coiUserGroupId = coiUserGroup.getId();
		}
		return coiUserGroupId;
	}
	
	
	// KC-620 Check for user in group "KC Users" not working (5.1 upgrade issue)
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException,
    ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;  
        
		String principalName = request.getRemoteUser();

		if (!kcUsers.contains(principalName)) {
			Principal principal = KimApiServiceLocator.getIdentityService().getPrincipalByPrincipalName(principalName);
			if (principal == null || !principal.isActive()) {
            	// RRG KC-620 ... This is were we know CAS allowed a user through that has no principle data in our system yet
                // so we redirect to logout url and display message that user is not found.  This can actually happen in production 
                // now since a new user may not yet be processed by UHIMS message but be in cas  rare but possible
        	    // more often this is caused in dev where dev CAS allows you to type anything resulting in no principle data
        	    // This will also block inactive users similar to code in 3.1.1 for KC-487 put in by RBL
            	ConfigurationService configService = KcServiceLocator.getService(ConfigurationService.class);
            	String logoutUrlBase = configService.getPropertyValueAsString("filter.casLogoutUrl");
            	String profilerNotFoundRedirectUrl = configService.getPropertyValueAsString("filter.profilerNotFoundRedirectUrl");
            	
                // Logout and redirect to profiler account not found page
            	response.sendRedirect(logoutUrlBase + "?service=" + profilerNotFoundRedirectUrl);
            	
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
                return; 
			} else  {	
				boolean inKcUsersGroup = KimApiServiceLocator.getGroupService().isMemberOfGroup(principal.getPrincipalId(), getKcUserGroupId());
				if (inKcUsersGroup) {
                	kcUsers.add(principalName);
                }
			}
			// KC-531 End
        }

		// KC-1508  Make new "UH COI Users" group for COI only users
		if (!kcUsers.contains(principalName) && !coiUsers.contains(principalName)) {
			Principal principal = KimApiServiceLocator.getIdentityService().getPrincipalByPrincipalName(principalName);
			if (principal == null || !principal.isActive()) {
				ConfigurationService configService = KcServiceLocator.getService(ConfigurationService.class);
				String logoutUrlBase = configService.getPropertyValueAsString("filter.casLogoutUrl");
				String profilerNotFoundRedirectUrl = configService.getPropertyValueAsString("filter.profilerNotFoundRedirectUrl");

				// Logout and redirect to profiler account not found page
				response.sendRedirect(logoutUrlBase + "?service=" + profilerNotFoundRedirectUrl);

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
				return;
			} else  {
				boolean inCoiUsersGroup = KimApiServiceLocator.getGroupService().isMemberOfGroup(principal.getPrincipalId(), getCoiUserGroupId());
				if (inCoiUsersGroup) {
					coiUsers.add(principalName);
				}
			}
			// KC-531 End
		}

		// KC-1540 UH COI Users aren't getting their "Reviewer Role" from monolith
		// COI service calls not working for people only in "UH COI Users" group
		// need to allow api calls through for these users.
		boolean isAPIrequest  = request.getRequestURL() != null && request.getRequestURL().toString().contains("research-sys/api");

		// If still not in either group the user doesn't have either group so don't let them into mygrant
		// KC-1540 UH COI Users aren't getting their "Reviewer Role" from monolith
		if (!isAPIrequest && !kcUsers.contains(principalName) && !coiUsers.contains(principalName)) {
			// User is not in "UH KC Users" group so redirect them to permission denied page.
			// Check if request is already forwarded to Permission Denied to prevent redirect loop
			String channelTitle=(String)request.getParameter("channelTitle");
			// KC-1204 Only allow users in the "UH KC Users" or "UH COI Users" group to access myGRANT
			if (request.getRequestURL() != null && !request.getRequestURL().toString().contains("PermissionDenied")) {
				response.sendRedirect(getAppUrl() + "/PermissionDenied.do");
				return;
			}
		}

		// If user is in "UH COI Users" but not in "UH KC Users" then redirect them directly to COI module
		// KC-1540 UH COI Users aren't getting their "Reviewer Role" from monolith
		if (!isAPIrequest && !kcUsers.contains(principalName) && coiUsers.contains(principalName)) {
			response.sendRedirect(getCoiUrl());
			return;
		}
		// KC-1508 END

		// If user with no System Admin permission tries to access system admin pages
		// redirect to KRAD app url
		if (request.getRequestURL() != null && request.getRequestURL().toString().contains(getContextName() + "/portal")) {
			Principal principal = KimApiServiceLocator.getIdentityService().getPrincipalByPrincipalName(principalName);
			if (!KimApiServiceLocator.getPermissionService().hasPermission(principal.getPrincipalId(), "KC-GEN", "uh-view-sys-admin-portal")) {
				response.sendRedirect(getAppUrl());
				return;
			}
		}

        super.doFilter(request, response, chain);
    }

	public static String getAppUrl() {
		if (appUrl == null) {
			ConfigurationService configService = KcServiceLocator.getService(ConfigurationService.class);
			appUrl = configService.getPropertyValueAsString("application.url");
		}
		return appUrl;
	}

	// KC-1508  Make new "UH COI Users" group for COI only users
	public static String getCoiUrl() {
		if (coiUrl == null) {
			ConfigurationService configService = KcServiceLocator.getService(ConfigurationService.class);
			coiUrl = configService.getPropertyValueAsString("coi.standalone.base.url") + "/coi";
		}
		return coiUrl;
	}

	public static String getContextName() {
		if (contextName == null) {
			ConfigurationService configService = KcServiceLocator.getService(ConfigurationService.class);
			contextName = configService.getPropertyValueAsString("app.context.name");
		}
		return contextName;
	}
}
