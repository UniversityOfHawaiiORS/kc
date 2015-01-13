package edu.hawaii.kra;

import org.kuali.rice.coreservice.framework.CoreFrameworkServiceLocator;

// KC-549 message of the day

public class UhHelpTabHelper {
	
	public static String getMessageOfTheDay() {
		
		String motd = new String();
		try {
			motd = CoreFrameworkServiceLocator.getParameterService().getParameterValueAsString(
				"KC-GEN",
				"All",
				"uh_message_of_the_day"
			);
			motd = motd.replace("'", "");
			motd = motd.replaceAll("\r?\n", "");
		} catch (Exception e) {
			return "";			
		}
		
		return motd;
	}
}


// KC-549 END

