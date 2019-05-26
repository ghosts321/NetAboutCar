package com.nasoft.util;

import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DateUtil {
	private static final Logger logger = LoggerFactory.getLogger(DateUtil.class);
	
	public final static String SDFyyyyMM = "yyyy-MM";
	public final static String SDFyyyyMMdd = "yyyy-MM-dd";
	public final static String SDFyyyyMMddHH = "yyyy-MM-dd HH";
	public final static String SDFyyyyMMddHHmm = "yyyy-MM-dd HH:mm";
	public final static String SDFyyyyMMddHHmmss = "yyyy-MM-dd HH:mm:ss";
	public final static String SDFyyyyMMddHHmmss2 = "yyyyMMddHHmmss";
	public final static String SDFyyyyMMddHHmmssS = "yyyy-MM-dd HH:mm:ss.S";

	public final static long millisecondsPerMinute = 60L * 1000L;
	public final static long millisecondsPerHour = 60L * millisecondsPerMinute;
	public final static long millisecondsPerDay = 24L * millisecondsPerHour;
	public final static long millisecondsPerWeek = 7L * millisecondsPerDay;

	public static DateFormat dateFormat;
	
	public static String dateFormat(Timestamp d)
	{
		return d == null ? null : new SimpleDateFormat(SDFyyyyMMdd).format(d);
	}

	public static String DateTimeFormat(Date d)
	{
		return d == null ? null : new SimpleDateFormat(SDFyyyyMMddHHmmss).format(d);
	}

	public static String dateToString(Date date, String format)
	{
		if (date == null || format == null)
		{
			return null;
		}
		return new SimpleDateFormat(format).format(date);
	}

	public static Date stringToDate(String date, String format)
	{
		if (date == null || format == null || date == "")
		{
			return null;
		}
		try
		{
			return new SimpleDateFormat(format).parse(date);
		} catch (ParseException ex)
		{
			return null;
		}
	}

	public static Date parseStandardDate(String value)
	{
		Date date = null;
		int n = value.length();
		try
		{
			if (n >= "yyyy-MM-dd HH:mm:ss.S".length())
			{
				date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(value);
			} else if (n == "yyyy-MM-dd HH:mm:ss".length())
			{
				date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(value);
			} else if (n == "yyyy-MM-dd HH:mm".length())
			{
				date = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(value);
			} else if (n == "yyyy-MM-dd HH".length())
			{
				date = new SimpleDateFormat("yyyy-MM-dd HH").parse(value);
			} else if (n == "yyyy-MM-dd".length())
			{
				date = new SimpleDateFormat("yyyy-MM-dd").parse(value);
			} else if (n == "yyyy-MM".length())
			{
				date = new SimpleDateFormat("yyyy-MM").parse(value);
			}
		} catch (ParseException e)
		{
			logger.warn("Can not parse [" + value + "] to java.util.Date");
		}
		return date;
	}

	/**
	 * 获取当前时间错 描述:
	 * 
	 * @author zhengqy
	 * @return
	 */
	public static String getCurrentTimestamp()
	{
		final Calendar cal = Calendar.getInstance();
		final DateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");

		return df.format(cal.getTime());
	}
	
	/**
	 * 
	 * 描述: 日期格式化
	 * yyyy-MM-dd
	 * 
	 * @param time
	 * @return
	 */
	public static String format(final java.sql.Date date)
	{
		dateFormat = new SimpleDateFormat(FormatConstant.DATE_FORMAT_yyyy_MM_dd);
		
		return dateFormat.format(date);
	}
	
	/**
	 * 
	 * 描述: 时间格式化
	 * HH:mm:ss 
	 * 
	 * @param date
	 * @return
	 */
	public static String format(final Time time)
	{
		dateFormat = new SimpleDateFormat(FormatConstant.TIME_FORMAT_HH_mm_ss);
		
		return dateFormat.format(time);
	}
	
	/**
	 * 
	 * 描述: 日期时间格式化
	 * yyyy-MM-dd HH:mm:ss
	 * 
	 * @param dateTime
	 * @return
	 */
	public static String format(java.util.Date dateTime)
	{
		dateFormat = new SimpleDateFormat(SDFyyyyMMddHHmmss);
		
		return dateFormat.format(dateTime);
	}
	
	/**
	 * 
	 * 描述: 时间戳格式化
	 * yyyy-MM-dd HH:mm:ss.SSS
	 * @param timestamp
	 * @return
	 */
	public static String format(final Timestamp timestamp)
	{
		dateFormat = new SimpleDateFormat(FormatConstant.TIMESTAMP_FORMAT_yyyy_MM_dd_HH_mm_ss_SSS);
		
		return dateFormat.format(timestamp);
	}
	
	
	/**
	 * 
	 * 描述: 获取当前日期 java.sql.Date
	 * 只含日期，不含时间
	 * @return
	 */
	public static java.sql.Date getDate() {
		// 每次都获取一个最新的日历 - 当前时间
		final Calendar calendar = Calendar.getInstance();
		
		return new java.sql.Date(calendar.getTimeInMillis());
	}
	
	/**
	 * 
	 * 描述:  获取当前时间数值
	 * @return
	 */
	public static Time getTime() {
		// 每次都获取一个最新的日历 - 当前时间
		final Calendar calendar = Calendar.getInstance();
		
		return new Time(calendar.getTimeInMillis());
	}
	
	/**
	 * 
	 * 描述: 获取当前日期时间
	 * 日期 + 时间 (java.util.Date)
	 * @return
	 */
	public static java.util.Date getDateTime()
	{
		// 每次都获取一个最新的日历 - 当前时间
		final Calendar calendar = Calendar.getInstance();
		
		return calendar.getTime();
	}
	
	/**
	 * 
	 * 描述: 获取当前时间戳
	 * java.sql.Timestamp
	 * 
	 * @return
	 */
	public static Timestamp getTimestamp()
	{
		// 每次都获取一个最新的日历 - 当前时间
		final Calendar calendar = Calendar.getInstance();
		
		return new Timestamp(calendar.getTimeInMillis());
	}
	
	/**
	 * 
	 * 描述:  获取当前时间数值
	 * 从[起止时间] 到 [当前时间]的毫秒数
	 * @return
	 */
	public static long getTimeInMillis() {
		// 每次都获取一个最新的日历 - 当前时间
		final Calendar calendar = Calendar.getInstance();
		
		return calendar.getTimeInMillis();
	}
	
	/**
	 * 
	 * 描述: 获取当前所在的时区
	 * @return
	 */
	public static TimeZone getTimeZone()
	{
		final TimeZone timeZone = TimeZone.getDefault();
		
		return timeZone;
	}
	
	/**
	 * 
	 * 描述: 获取当前最新日历 
	 * @return
	 */
	public static Calendar getCalendar()
	{
		// 每次都获取一个最新的日历 - 当前时间
		final Calendar calendar = Calendar.getInstance();
		
		return calendar;
	}
	
	/**
	 * 
	 * 描述: 获取当前时间戳字符串
	 * yyyyMMddHHmmssSSS
	 * 为了防止重名，可作为文件名后缀的某部分
	 * java.sql.Timestamp
	 * @return
	 */
	public static String getTsString()
	{
		// 每次都获取一个最新的日历 - 当前时间
		final Calendar calendar = Calendar.getInstance();
		dateFormat = new SimpleDateFormat(FormatConstant.TIMESTAMP_FORMAT_yyyyMMddHHmmssSSS);
		final Timestamp timestamp = new Timestamp(calendar.getTimeInMillis());
		
		return dateFormat.format(timestamp);
	}
}
