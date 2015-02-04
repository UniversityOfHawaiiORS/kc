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
package org.kuali.coeus.sys.framework.util;

import org.drools.core.util.StringUtils;
import org.kuali.kra.infrastructure.Constants;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Utility methods for working with dates
 */
public final class DateUtils {

    private static final Pattern TIME_PATTERN_12_HOUR = Pattern.compile("(0?[1-9]|1[0-2])" + // hour
            "(?:(?::|\\.)([0-5][0-9]))?" + // minute (optional)
            "(?:\\s*(\\b[ap]m?\\b|\\b[ap]\\.m\\.\\s?))?" + // AM/PM (optional)
            "(?:\\s*([a-z]{2,5}))?", //time zone abbreviation (optional)
            Pattern.CASE_INSENSITIVE);
    private static final Pattern TIME_PATTERN_24_HOUR = Pattern.compile("([01][0-9]|2[0-3])" + // hour
            "(?:(?::|\\.)?([0-5][0-9]))" + // minute (optional)
            "(?:\\s*(\\b[ap]m?\\b|\\b[ap]\\.m\\.\\s?))?" + // AM/PM (optional)
            "(?:\\s*([a-z]{2,5}))?", //time zone abbreviation (optional)
            Pattern.CASE_INSENSITIVE);

  //time zone abbreviation list data from http://www.timeanddate.com/library/abbreviations/timezones/
    // also added some commonly used alternative acronyms such as HST, PDST
    private static final HashMap<String, String> tz_abbreviations = new HashMap<String,String>(192) {{
    	put("ACDT","ACDT");
    	put("ACST","ACST");
    	put("ADT","ADT");
    	put("AEDT","AEDT");
    	put("AEST","AEST");
    	put("AFT","AFT");
    	put("AKDT","AKDT");
    	put("AKST","AKST");
    	put("ALMT","ALMT");
    	put("AMST","AMST");
    	put("AMT","AMT");
    	put("ANAST","ANAST");
    	put("ANAT","ANAT");
    	put("AQTT","AQTT");
    	put("ART","ART");
    	put("AST","AST");
    	put("AWDT","AWDT");
    	put("AWST","AWST");
    	put("AZOST","AZOST");
    	put("AZOT","AZOT");
    	put("AZST","AZST");
    	put("AZT","AZT");
    	put("BNT","BNT");
    	put("BOT","BOT");
    	put("BRST","BRST");
    	put("BRT","BRT");
    	put("BST","BST");
    	put("BTT","BTT");
    	put("CAST","CAST");
    	put("CAT","CAT");
    	put("CCT","CCT");
    	put("CDT","CDT");
    	put("CEST","CEST");
    	put("CET","CET");
    	put("CHADT","CHADT");
    	put("CHAST","CHAST");
    	put("CKT","CKT");
    	put("CLST","CLST");
    	put("CLT","CLT");
    	put("COT","COT");
    	put("CST","CST");
    	put("CVT","CVT");
    	put("CXT","CXT");
    	put("CHST","CHST");
    	put("DAVT","DAVT");
    	put("EASST","EASST");
    	put("EAST","EAST");
    	put("EAT","EAT");
    	put("ECT","ECT");
    	put("EDT","EDT");
    	put("EEST","EEST");
    	put("EET","EET");
    	put("EGST","EGST");
    	put("EGT","EGT");
    	put("EST","EST");
    	put("FJST","FJST");
    	put("FJT","FJT");
    	put("FKST","FKST");
    	put("FKT","FKT");
    	put("FNT","FNT");
    	put("GALT","GALT");
    	put("GAMT","GAMT");
    	put("GET","GET");
    	put("GFT","GFT");
    	put("GILT","GILT");
    	put("GMT","GMT");
    	put("GST","GST");
    	put("GYT","GYT");
    	put("HADT","HADT");
    	put("HAST","HAST");
    	put("HKT","HKT");
    	put("HLV","HLV");
    	put("HOVT","HOVT");
    	put("HST","HST");
    	put("ICT","ICT");
    	put("IDT","IDT");
    	put("IOT","IOT");
    	put("IRDT","IRDT");
    	put("IRKST","IRKST");
    	put("IRKT","IRKT");
    	put("IRST","IRST");
    	put("IST","IST");
    	put("JST","JST");
    	put("KGT","KGT");
    	put("KRAST","KRAST");
    	put("KRAT","KRAT");
    	put("KST","KST");
    	put("KUYT","KUYT");
    	put("LHDT","LHDT");
    	put("LHST","LHST");
    	put("LINT","LINT");
    	put("MAGST","MAGST");
    	put("MAGT","MAGT");
    	put("MART","MART");
    	put("MAWT","MAWT");
    	put("MDT","MDT");
    	put("MHT","MHT");
    	put("MMT","MMT");
    	put("MSD","MSD");
    	put("MSK","MSK");
    	put("MST","MST");
    	put("MUT","MUT");
    	put("MVT","MVT");
    	put("MYT","MYT");
    	put("NCT","NCT");
    	put("NDT","NDT");
    	put("NFT","NFT");
    	put("NOVST","NOVST");
    	put("NOVT","NOVT");
    	put("NPT","NPT");
    	put("NST","NST");
    	put("NUT","NUT");
    	put("NZDT","NZDT");
    	put("NZST","NZST");
    	put("OMSST","OMSST");
    	put("OMST","OMST");
    	put("PDT","PDT");
       	put("PDST","PDST");
    	put("PET","PET");
    	put("PETST","PETST");
    	put("PETT","PETT");
    	put("PGT","PGT");
    	put("PHOT","PHOT");
    	put("PHT","PHT");
    	put("PKT","PKT");
    	put("PMDT","PMDT");
    	put("PMST","PMST");
    	put("PONT","PONT");
    	put("PST","PST");
    	put("PT","PT");
    	put("PWT","PWT");
    	put("PYST","PYST");
    	put("PYT","PYT");
    	put("RET","RET");
    	put("SAMT","SAMT");
    	put("SAST","SAST");
    	put("SBT","SBT");
    	put("SCT","SCT");
    	put("SGT","SGT");
    	put("SRT","SRT");
    	put("SST","SST");
    	put("TAHT","TAHT");
    	put("TFT","TFT");
    	put("TJT","TJT");
    	put("TKT","TKT");
    	put("TLT","TLT");
    	put("TMT","TMT");
    	put("TVT","TVT");
    	put("ULAT","ULAT");
    	put("UTC","UTC");
    	put("UYST","UYST");
    	put("UYT","UYT");
    	put("UZT","UZT");
    	put("VET","VET");
    	put("VLAST","VLAST");
    	put("VLAT","VLAT");
    	put("VUT","VUT");
    	put("WAST","WAST");
    	put("WAT","WAT");
    	put("WEST","WEST");
    	put("WET","WET");
    	put("WFT","WFT");
    	put("WGST","WGST");
    	put("WGT","WGT");
    	put("WIB","WIB");
    	put("WIT","WIT");
    	put("WITA","WITA");
    	put("WST","WST");
    	put("WT","WT");
    	put("YAKST","YAKST");
    	put("YAKT","YAKT");
    	put("YAPT","YAPT");
    	put("YEKST","YEKST");
    	put("YEKT","YEKT");
    }};

    //KC-605 END
    
    /** private ctor. */
    private DateUtils() {
        throw new UnsupportedOperationException("do not call");
    }

    /**
     * Adds null-safety to commons.DateUtils isSameDay method.
     * 
     * @return true if both dates are null or represent the same day
     */
    public static boolean isSameDay(Date date1, Date date2) {
        boolean same = false;

        if ((date1 == null) && (date2 == null)) {
            same = true;
        }
        else if ((date1 != null) && (date2 != null)) {
            return org.apache.commons.lang3.time.DateUtils.isSameDay(date1, date2);
        }
        else {
            same = false;
        }

        return same;
    }

    /**
     * Converts the given java.util.Date into an equivalent java.sql.Date
     * 
     * @param date
     * @return java.sql.Date constructed from the given java.util.Date
     */
    public static java.sql.Date convertToSqlDate(java.util.Date date) {
        return new java.sql.Date(date.getTime());
    }


    /**
     * Convert the given java.sql.date into a java.sql.date of which all the time fields are set to 0.
     * 
     * @param date
     * @return
     */
    public static java.sql.Date clearTimeFields(java.sql.Date date) {
        Calendar timelessCal = new GregorianCalendar();
        timelessCal.setTime(date);
        timelessCal.set(Calendar.HOUR_OF_DAY, 0);
        timelessCal.set(Calendar.MINUTE, 0);
        timelessCal.set(Calendar.SECOND, 0);
        timelessCal.set(Calendar.MILLISECOND, 0);

        return new java.sql.Date(timelessCal.getTimeInMillis());
    }

    /**
     * @param startDateTime
     * @param endDateTime
     * @return the difference in days between the second timestamp and first
     */
    public static double getDifferenceInDays(Timestamp startDateTime, Timestamp endDateTime) {
        int difference = 0;

        Calendar startCalendar = Calendar.getInstance();
        startCalendar.setTime(startDateTime);

        Calendar endCalendar = Calendar.getInstance();
        endCalendar.setTime(endDateTime);

        // First, get difference in whole days
        Calendar startCompare = Calendar.getInstance();
        startCompare.setTime(startDateTime);
        startCompare.set(Calendar.HOUR_OF_DAY, 0);
        startCompare.set(Calendar.MINUTE, 0);
        startCompare.set(Calendar.SECOND, 0);
        startCompare.set(Calendar.MILLISECOND, 0);

        Calendar endCompare = Calendar.getInstance();
        endCompare.setTime(endDateTime);
        endCompare.set(Calendar.HOUR_OF_DAY, 0);
        endCompare.set(Calendar.MINUTE, 0);
        endCompare.set(Calendar.SECOND, 0);
        endCompare.set(Calendar.MILLISECOND, 0);

        return (endCompare.getTimeInMillis() - startCompare.getTimeInMillis()) / (24 * 60 * 60 * 1000);
    }

    /**
     * 
     * This method is a utility method to create a new java.sql.Date in one line.
     * 
     * @param year
     * @param month
     * @param day
     * 
     * @return a populated java.sql.Date with the year, month, and day specified, and no values for hour, minute, second,
     *         millisecond
     * 
     */
    public static java.sql.Date newDate(Integer year, Integer month, Integer day) {

        // test for null arguments
        if (year == null) {
            throw new IllegalArgumentException("Argument 'year' passed in was null.");
        }
        if (month == null) {
            throw new IllegalArgumentException("Argument 'month' passed in was null.");
        }
        if (day == null) {
            throw new IllegalArgumentException("Argument 'day' passed in was null.");
        }

        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR, year);
        calendar.set(Calendar.MONTH, month);
        calendar.set(Calendar.DAY_OF_MONTH, day);
        calendar.clear(Calendar.HOUR_OF_DAY);
        calendar.clear(Calendar.MINUTE);
        calendar.clear(Calendar.SECOND);
        calendar.clear(Calendar.MILLISECOND);

        return new java.sql.Date(calendar.getTimeInMillis());
    }

    /**
     * 
     * This method is a utility method to create a new java.sql.Date in one line.
     * 
     * @param year
     * @param month
     * @param day
     * @param hour
     * @param minute
     * @param second
     * 
     * @return a populated java.sql.Date with the year, month, hour, minute, and second populated, with no value for millisecond.
     * 
     */
    public static java.sql.Date newDate(Integer year, Integer month, Integer day, Integer hour, Integer minute, Integer second) {

        // test for null arguments
        if (year == null) {
            throw new IllegalArgumentException("Argument 'year' passed in was null.");
        }
        if (month == null) {
            throw new IllegalArgumentException("Argument 'month' passed in was null.");
        }
        if (day == null) {
            throw new IllegalArgumentException("Argument 'day' passed in was null.");
        }
        if (hour == null) {
            throw new IllegalArgumentException("Argument 'hour' passed in was null.");
        }
        if (minute == null) {
            throw new IllegalArgumentException("Argument 'minute' passed in was null.");
        }
        if (second == null) {
            throw new IllegalArgumentException("Argument 'second' passed in was null.");
        }

        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR, year);
        calendar.set(Calendar.MONTH, month);
        calendar.set(Calendar.DAY_OF_MONTH, day);
        calendar.set(Calendar.HOUR_OF_DAY, hour);
        calendar.set(Calendar.MINUTE, minute);
        calendar.set(Calendar.SECOND, second);
        calendar.clear(Calendar.MILLISECOND);

        return new java.sql.Date(calendar.getTimeInMillis());
    }

    /**
     * @deprecated do not use. This method is poorly designed.
     */
    @Deprecated
    public static String formatFrom12Or24Str(String input) {
        if (!StringUtils.isEmpty(input)) {
            input = input.trim();

            Matcher matcher = TIME_PATTERN_12_HOUR.matcher(input);
            if (matcher.matches()) {
                return parseTwelveHourTime(matcher);
            }

            matcher = TIME_PATTERN_24_HOUR.matcher(input);
            if (matcher.matches()) {
                return parseTwentyFourHourTime(matcher);
            }
            return Constants.INVALID_TIME;
        } else {
            return "";
        }

    }

    private static String parseTwelveHourTime(Matcher matcher) {
        String hour = matcher.group(1);
        if (hour.startsWith("0")) {
            hour = hour.substring(1); // strip off the leading 0
        }

        String minute = matcher.group(2);
        if (minute == null) {
            minute = "00";
        }

        String amPmMarker = matcher.group(3);
        if (amPmMarker == null) {
            amPmMarker = "12".equals(hour) ? "PM" : "AM";
        }
        else {
            amPmMarker = amPmMarker.replaceAll("\\.", "").toUpperCase();
            if (amPmMarker.length() == 1) {
                amPmMarker += "M";
            }
        }

        //KC-605 BEGIN rbl add time zone to sponsor deadline time
        String timeZone =  matcher.group(4);
        if(timeZone == null) {
        	timeZone = "";
        }
        else {
        	timeZone = timeZone.toUpperCase();
        }
        
        if(timeZone.length() > 0) {
        	if(tz_abbreviations.get(timeZone) != null) {
        		return hour + ":" + minute + " " + amPmMarker + " " + timeZone;
        	}
        	else {
        		return Constants.INVALID_TIME;
        	}
        }
        else {
            return hour + ":" + minute + " " + amPmMarker;
        }
        //KC-605 END
    }

    private static String parseTwentyFourHourTime(Matcher matcher) {
        String hour = matcher.group(1);
        String minute = matcher.group(2);

        int intHour = Integer.parseInt(hour);
        String amPmMarker = "AM";
        if (intHour == 0) {
            intHour = 12;
        }
        else if (intHour >= 12) {
            amPmMarker = "PM";
            intHour -= 12;
        }
        if (minute == null) {
            minute = "00";
        }

        // KC-605 BEGIN
        String timeZone =  matcher.group(4);
        if(timeZone == null) {
        	timeZone = "";
        }
        else {
        	timeZone = timeZone.toUpperCase();
        }
        
        if(timeZone.length() > 0) {
        	if(tz_abbreviations.get(timeZone) != null) {
        		return hour + ":" + minute + " " + amPmMarker + " " + timeZone;
        	}
        	else {
        		return Constants.INVALID_TIME;
        	}
        }
        else {
        	return hour + ":" + minute + " " + amPmMarker;
        }
        //KC-605 END
    }
}
