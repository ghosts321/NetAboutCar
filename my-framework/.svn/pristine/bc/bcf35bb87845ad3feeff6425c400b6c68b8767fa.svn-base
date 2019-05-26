package com.nasoft.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;

public class StringUtil {
	public static final String SEPARATOR = String.valueOf('\035');

	  public static boolean isNotEmpty(String str)
	  {
	    return StringUtils.isNotEmpty(str);
	  }

	  public static boolean isEmpty(String str)
	  {
	    return StringUtils.isEmpty(str);
	  }

	  public static String defaultIfEmpty(String str, String defaultValue)
	  {
	    return StringUtils.defaultIfEmpty(str, defaultValue);
	  }

	  public static String replaceAll(String str, String regex, String replacement)
	  {
	    Pattern p = Pattern.compile(regex);
	    Matcher m = p.matcher(str);
	    StringBuffer sb = new StringBuffer();
	    while (m.find()) {
	      m.appendReplacement(sb, replacement);
	    }
	    m.appendTail(sb);
	    return sb.toString();
	  }

	  public static boolean isNumber(String str)
	  {
	    return NumberUtils.isNumber(str);
	  }

	  public static boolean isDigits(String str)
	  {
	    return NumberUtils.isDigits(str);
	  }

	  public static String camelhumpToUnderline(String str)
	  {
	    Matcher matcher = Pattern.compile("[A-Z]").matcher(str);
	    StringBuilder builder = new StringBuilder(str);
	    for (int i = 0; matcher.find(); i++) {
	      builder.replace(matcher.start() + i, matcher.end() + i, new StringBuilder().append("_").append(matcher.group().toLowerCase()).toString());
	    }
	    if (builder.charAt(0) == '_') {
	      builder.deleteCharAt(0);
	    }
	    return builder.toString();
	  }

	  public static String underlineToCamelhump(String str)
	  {
	    Matcher matcher = Pattern.compile("_[a-z]").matcher(str);
	    StringBuilder builder = new StringBuilder(str);
	    for (int i = 0; matcher.find(); i++) {
	      builder.replace(matcher.start() - i, matcher.end() - i, matcher.group().substring(1).toUpperCase());
	    }
	    if (Character.isUpperCase(builder.charAt(0))) {
	      builder.replace(0, 1, String.valueOf(Character.toLowerCase(builder.charAt(0))));
	    }
	    return builder.toString();
	  }

	  public static String[] splitString(String str, String separator)
	  {
	    return StringUtils.splitByWholeSeparator(str, separator);
	  }

	  public static String firstToUpper(String str)
	  {
	    return new StringBuilder().append(Character.toUpperCase(str.charAt(0))).append(str.substring(1)).toString();
	  }

	  public static String firstToLower(String str)
	  {
	    return new StringBuilder().append(Character.toLowerCase(str.charAt(0))).append(str.substring(1)).toString();
	  }

	  public static String toPascalStyle(String str, String seperator)
	  {
	    return firstToUpper(toCamelhumpStyle(str, seperator));
	  }

	  public static String toCamelhumpStyle(String str, String seperator)
	  {
	    return underlineToCamelhump(toUnderlineStyle(str, seperator));
	  }

	  public static String toUnderlineStyle(String str, String seperator)
	  {
	    str = str.trim().toLowerCase();
	    if (str.contains(seperator)) {
	      str = str.replace(seperator, "_");
	    }
	    return str;
	  }

	  public static String toDisplayStyle(String str, String seperator)
	  {
	    String displayName = "";
	    str = str.trim().toLowerCase();
	    if (str.contains(seperator)) {
	      String[] words = splitString(str, seperator);
	      for (String word : words) {
	        displayName = new StringBuilder().append(displayName).append(firstToUpper(word)).append(" ").toString();
	      }
	      displayName = displayName.trim();
	    } else {
	      displayName = firstToUpper(str);
	    }
	    return displayName;
	  }
}
