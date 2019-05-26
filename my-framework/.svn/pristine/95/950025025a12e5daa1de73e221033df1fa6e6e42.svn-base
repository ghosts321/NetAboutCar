package com.nasoft.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * 自己封装的时间类型,用于对Date、Calendar与String类型之间互相转换
 *  * 
 */
public class DateTime implements Comparable {

    public static int  YEAR         = 1;
    public static int  MONTH        = 2;
    public static int  DAY          = 3;
    public static int  HOUR         = 4;
    public static int  MINUTE       = 5;
    public static int  SECOND       = 6;
    public static int  TYPE_TEXT    = 7;
    public static int  TYPE_STREAM  = 8;
    private static int _month_end[] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31,
            30, 31                 };
    private int        OK;
    private String     _datetime;
    private int        _nowtype;
    private int        ERROR_UNKOWN;
    private int        ERROR_NULL_PARAM;
    private int        ERROR_INVALID_TYPE;
    private int        ERROR_INVALID_DATETIME;
    
    /**
     * 构造函数，将当前日期初始化为DateTime类型
     */
    public DateTime() {
        OK = 0;
        ERROR_UNKOWN = -1;
        ERROR_NULL_PARAM = -2;
        ERROR_INVALID_TYPE = -3;
        ERROR_INVALID_DATETIME = -4;
        _datetime = ToolKit.getRightNow();
        _nowtype = TYPE_TEXT;
    }

    /**
     * 构造函数，将DateTime类型传入。
     * 
     * @param datetime
     */
    public DateTime(DateTime datetime) {
        OK = 0;
        ERROR_UNKOWN = -1;
        ERROR_NULL_PARAM = -2;
        ERROR_INVALID_TYPE = -3;
        ERROR_INVALID_DATETIME = -4;
        _datetime = datetime.getText();
        _nowtype = datetime.getType();
    }

    /**
     * 构造函数，将Date类型转化为DateTime类型
     * 
     * @param date
     */
    public DateTime(Date date) {
    	date=date==null?new Date():date;
        OK = 0;
        ERROR_UNKOWN = -1;
        ERROR_NULL_PARAM = -2;
        ERROR_INVALID_TYPE = -3;
        ERROR_INVALID_DATETIME = -4;
        StringBuffer dateStrBuff = new StringBuffer("");
        dateStrBuff.append(ToolKit.format("" + (1900 + date.getYear()), 4, "0",
                0));
        dateStrBuff.append("-");
        dateStrBuff.append(ToolKit.formatNumber(date.getMonth() + 1));
        dateStrBuff.append("-");
        dateStrBuff.append(ToolKit.formatNumber(date.getDate()));
        dateStrBuff.append(" ");
        dateStrBuff.append(ToolKit.formatNumber(date.getHours()));
        dateStrBuff.append(":");
        dateStrBuff.append(ToolKit.formatNumber(date.getMinutes()));
        dateStrBuff.append(":");
        dateStrBuff.append(ToolKit.formatNumber(date.getSeconds()));
        _datetime = dateStrBuff.toString();
        _nowtype = TYPE_TEXT;
    }

    /**
     * 构造函数，将Calendar类型转化为DateTime类型
     * 
     * @param date
     */
    public DateTime(Calendar calendar) {
        OK = 0;
        ERROR_UNKOWN = -1;
        ERROR_NULL_PARAM = -2;
        ERROR_INVALID_TYPE = -3;
        ERROR_INVALID_DATETIME = -4;
        StringBuffer dateStrBuff = new StringBuffer("");
        dateStrBuff.append(ToolKit.format("" + calendar.get(1), 4, "0", 0));
        dateStrBuff.append("-");
        dateStrBuff.append(ToolKit.formatNumber(calendar.get(2) + 1));
        dateStrBuff.append("-");
        dateStrBuff.append(ToolKit.formatNumber(calendar.get(5)));
        dateStrBuff.append(" ");
        dateStrBuff.append(ToolKit.formatNumber(calendar.get(11)));
        dateStrBuff.append(":");
        dateStrBuff.append(ToolKit.formatNumber(calendar.get(12)));
        dateStrBuff.append(":");
        dateStrBuff.append(ToolKit.formatNumber(calendar.get(13)));
        _datetime = dateStrBuff.toString();
        _nowtype = TYPE_TEXT;
    }

    /**
     * 构造函数，将String类型转化为DateTime类型
     * 
     * @param sDateString
     * @throws Exception 转换失败抛出异常
     */
    public DateTime(String sDateString) throws Exception {
        OK = 0;
        ERROR_UNKOWN = -1;
        ERROR_NULL_PARAM = -2;
        ERROR_INVALID_TYPE = -3;
        ERROR_INVALID_DATETIME = -4;
        if (sDateString == null)
            throw new Exception("参数为null,构造日期失败。");
        sDateString = sDateString.trim();
        int i = checkType(sDateString);
        if (i == ERROR_INVALID_TYPE) {
            throw new Exception("输入的参数不是合法的DateTime有效形式。<"
                    + sDateString + ">");
        }
        if (i == ERROR_INVALID_DATETIME) {
            throw new Exception("输入的参数不是合法日期和时间。<" + sDateString + ">");
        }
        if (i == TYPE_TEXT) {
            if (sDateString.length() == 10)
                sDateString += " 00:00:00";
            _datetime = sDateString;
            _nowtype = TYPE_TEXT;
        } else if (i == TYPE_STREAM) {
            if (sDateString.length() == 8)
                sDateString += "000000";
            _datetime = str2txt(sDateString);
            _nowtype = TYPE_STREAM;
        }
    }

    /**
     * 获取一个月最后一天的日期
     * 
     * @param year
     * @param month
     * @return int 每月的最后一日
     */
    public static int getMonthEnd(String year, String month) {
        try {
            if (isLeapYear(Integer.parseInt(year)) && month.equals("02"))
                return 29;
            int i = Integer.parseInt(month);
            return _month_end[i - 1];
        } catch (Exception exception) {
        }
        return 0;
    }

    /**
     * 将传入的对象与DateTime类型对象比较，当DateTime类型对象不早于传入对象返回0，否则返回-1
     * 传入对象为空，或者不是DateTime的实例，则抛出ClassCastException
     * 
     * @param obj
     * @throws ClassCastException
     */
    public int compareTo(Object obj) throws ClassCastException {
        if (obj == null || !(obj instanceof DateTime))
            throw new ClassCastException("A DateTime object expected.");
        DateTime datetime = (DateTime) obj;
        long localStream = Long.parseLong(getStream());
        long objStream = Long.parseLong(datetime.getStream());
        if (localStream > objStream)
            return 1;
        return localStream >= objStream ? 0 : -1;
    }

    public long compare(Object obj) throws Exception {
        if (obj == null || !(obj instanceof DateTime)) {
            throw new Exception("A DateTime object expected.");
        } else {
            DateTime datetime = (DateTime) obj;
            Calendar calendar = Calendar.getInstance();
            int i = getYear();
            int j = getMonth();
            int k = getDay();
            int l = getHour();
            int i1 = getMinute();
            int j1 = getSecond();
            calendar.set(i, j - 1, k, l, i1, j1);
            Calendar calendar1 = Calendar.getInstance();
            int k1 = datetime.getYear();
            int l1 = datetime.getMonth();
            int i2 = datetime.getDay();
            int j2 = datetime.getHour();
            int k2 = datetime.getMinute();
            int l2 = datetime.getSecond();
            calendar1.set(k1, l1 - 1, i2, j2, k2, l2);
            return calendar.getTimeInMillis() - calendar1.getTimeInMillis();
        }
    }

    /**
     * 转换为Calendar类型
     * 
     * @return
     */
    public Calendar turnIntoCalendar() {
        Calendar calendar = Calendar.getInstance();
        int i = getYear();
        int j = getMonth();
        int k = getDay();
        int l = getHour();
        int i1 = getMinute();
        int j1 = getSecond();
        calendar.set(i, j - 1, k, l, i1, j1);
        return calendar;
    }

    /**
     * 转换为Date类型
     * 
     * @return
     */
    public Date turnIntoDate() {
        int i = getYear();
        int j = getMonth();
        int k = getDay();
        int l = getHour();
        int i1 = getMinute();
        int j1 = getSecond();
        return new Date(i - 1900, j - 1, k, l, i1, j1);
    }

    public long compare(String s) throws Exception {
        if (s == null) {
            throw new Exception("参数为null。");
        } else {
            DateTime datetime = new DateTime(s);
            return compare(datetime);
        }
    }

    public long compare(Date date) throws Exception {
        if (date == null) {
            throw new Exception("参数为null。");
        } else {
            DateTime datetime = new DateTime(date);
            return compare(datetime);
        }
    }

    public long compare(Calendar calendar) throws Exception {
        if (calendar == null) {
            throw new Exception("参数为null。");
        } else {
            Calendar calendar1 = Calendar.getInstance();
            int iYear = getYear();
            int iMonth = getMonth();
            int iDay = getDay();
            int iHour = getHour();
            int iMinute = getMinute();
            int iSecond = getSecond();
            calendar1.set(iYear, iMonth - 1, iDay, iHour, iMinute, iSecond);
            return calendar1.getTimeInMillis() - calendar.getTimeInMillis();
        }
    }

    /**
     * 返回后一天的日期.
     * 
     * @return
     */
    public DateTime addOneDay() {
        Calendar calendar = Calendar.getInstance();
        String sDate = _datetime.substring(0, 10);
        String sNextDate = "";
        int iYear = Integer.parseInt(sDate.substring(0, 4));
        int iMonth = Integer.parseInt(sDate.substring(5, 7));
        int iDay = Integer.parseInt(sDate.substring(8));
        calendar.set(iYear, iMonth - 1, iDay);
        calendar.add(5, 1);
        sNextDate = sNextDate + ToolKit.format("" + calendar.get(1), 4, "0", 0);
        sNextDate = sNextDate + "-" + ToolKit.formatNumber(calendar.get(2) + 1);
        sNextDate = sNextDate + "-" + ToolKit.formatNumber(calendar.get(5));
        _datetime = sNextDate + _datetime.substring(10);
        return new DateTime(this);
    }
    
    public DateTime addOneMonth() {
        Calendar calendar = Calendar.getInstance();
        String sDate = _datetime.substring(0, 10);
        String sNextDate = "";
        int iYear = Integer.parseInt(sDate.substring(0, 4));
        int iMonth = Integer.parseInt(sDate.substring(5, 7));
        int iDay = Integer.parseInt(sDate.substring(8));
        calendar.set(iYear, iMonth - 1, iDay);
        calendar.add(2, 1);
        sNextDate = sNextDate + ToolKit.format("" + calendar.get(1), 4, "0", 0);
        sNextDate = sNextDate + "-" + ToolKit.formatNumber(calendar.get(2) + 1);
        sNextDate = sNextDate + "-" + ToolKit.formatNumber(calendar.get(5));
        _datetime = sNextDate + _datetime.substring(10);
        return new DateTime(this);
    }

    /**
     * 返回前一天的日期
     * 
     * @return
     */
    public DateTime delOneDay() {
        Calendar calendar = Calendar.getInstance();
        String sDate = _datetime.substring(0, 10);
        String sPrevDate = "";
        int iYear = Integer.parseInt(sDate.substring(0, 4));
        int iMonth = Integer.parseInt(sDate.substring(5, 7));
        int iDay = Integer.parseInt(sDate.substring(8));
        calendar.set(iYear, iMonth - 1, iDay);
        calendar.add(5, -1);
        sPrevDate = sPrevDate + ToolKit.format("" + calendar.get(1), 4, "0", 0);
        sPrevDate = sPrevDate + "-" + ToolKit.formatNumber(calendar.get(2) + 1);
        sPrevDate = sPrevDate + "-" + ToolKit.formatNumber(calendar.get(5));
        _datetime = sPrevDate + _datetime.substring(10);
        return new DateTime(this);
    }

    /**
     * 为DateTime增加在addPosition上addAmount量
     * 
     * @param addAmount
     * @param addPosition  
     * @return
     */
    public DateTime add(int addAmount, int addPosition) {
        Calendar calendar = Calendar.getInstance();
        String s = "";
        int k = getYear();
        int l = getMonth();
        int i1 = getDay();
        int j1 = getHour();
        int k1 = getMinute();
        int l1 = getSecond();
        calendar.set(k, l - 1, i1, j1, k1, l1);
        if (addPosition == YEAR)
            calendar.add(1, addAmount);
        if (addPosition == MONTH)
            calendar.add(2, addAmount);
        if (addPosition == DAY)
            calendar.add(5, addAmount);
        if (addPosition == HOUR)
            calendar.add(11, addAmount);
        if (addPosition == SECOND)
            calendar.add(13, addAmount);
        if (addPosition == MINUTE)
            calendar.add(12, addAmount);
        DateTime datetime = new DateTime(calendar);
        try {
            setYear(datetime.getYear());
            setMonth(datetime.getMonth());
            setDay(datetime.getDay());
            setHour(datetime.getHour());
            setMinute(datetime.getMinute());
            setSecond(datetime.getSecond());
        } catch (Exception datetimeexception) {
        }
        return datetime;
    }

    /**
     * 
     * @param i 偏移量
     * @param j 类别
     * @return
     */
    public DateTime del(int i, int j) {
        Calendar calendar = Calendar.getInstance();
        String s = "";
        int k = getYear();
        int l = getMonth();
        int i1 = getDay();
        int j1 = getHour();
        int k1 = getMinute();
        int l1 = getSecond();
        calendar.set(k, l - 1, i1, j1, k1, l1);
        if (j == YEAR)
            calendar.add(1, -i);
        if (j == MONTH)
            calendar.add(2, -i);
        if (j == DAY)
            calendar.add(5, -i);
        if (j == HOUR)
            calendar.add(11, -i);
        if (j == SECOND)
            calendar.add(13, -i);
        if (j == MINUTE)
            calendar.add(12, -i);
        DateTime datetime = new DateTime(calendar);
        try {
            setYear(datetime.getYear());
            setMonth(datetime.getMonth());
            setDay(datetime.getDay());
            setHour(datetime.getHour());
            setMinute(datetime.getMinute());
            setSecond(datetime.getSecond());
        } catch (Exception datetimeexception) {
        }
        return datetime;
    }

    public DateTime delYear(int offset) {
    	return this.del(offset, DateTime.YEAR);
    }
    
    public DateTime addSecond(int i) {
        Calendar calendar = Calendar.getInstance();
        String s = "";
        int j = getYear();
        int k = getMonth();
        int l = getDay();
        int i1 = getHour();
        int j1 = getMinute();
        int k1 = getSecond();
        calendar.set(j, k - 1, l, i1, j1, k1);
        calendar.add(13, i);
        DateTime datetime = new DateTime(calendar);
        try {
            setYear(datetime.getYear());
            setMonth(datetime.getMonth());
            setDay(datetime.getDay());
            setHour(datetime.getHour());
            setMinute(datetime.getMinute());
            setSecond(datetime.getSecond());
        } catch (Exception datetimeexception) {
        }
        return datetime;
    }

    public DateTime delSecond(int i) {
        Calendar calendar = Calendar.getInstance();
        String s = "";
        int j = getYear();
        int k = getMonth();
        int l = getDay();
        int i1 = getHour();
        int j1 = getMinute();
        int k1 = getSecond();
        calendar.set(j, k - 1, l, i1, j1, k1);
        calendar.add(13, -i);
        DateTime datetime = new DateTime(calendar);
        try {
            setYear(datetime.getYear());
            setMonth(datetime.getMonth());
            setDay(datetime.getDay());
            setHour(datetime.getHour());
            setMinute(datetime.getMinute());
            setSecond(datetime.getSecond());
        } catch (Exception datetimeexception) {
        }
        return datetime;
    }

    public String toString() {
        return _datetime.substring(0);
    }

    public int getMonth() {
        return Integer.parseInt(_datetime.substring(5, 7));
    }

    public int getDay() {
        return Integer.parseInt(_datetime.substring(8, 10));
    }

    public int getYear() {
        return Integer.parseInt(_datetime.substring(0, 4));
    }

    public int getSecond() {
        return Integer.parseInt(_datetime.substring(17));
    }

    public int getHour() {
        return Integer.parseInt(_datetime.substring(11, 13));
    }

    public int getMinute() {
        return Integer.parseInt(_datetime.substring(14, 16));
    }

    public int get(int i) {
        int j = 0;
        if (i == YEAR)
            j = getYear();
        else if (i == MONTH)
            j = getMonth();
        else if (i == DAY)
            j = getDay();
        else if (i == HOUR)
            j = getHour();
        else if (i == MINUTE)
            j = getMinute();
        else if (i == SECOND)
            j = getSecond();
        return j;
    }

    public String getByType(int i) {
        String s = "";
        if (i == TYPE_TEXT)
            s = getText();
        else if (i == TYPE_STREAM)
            s = getStream();
        return s;
    }

    public DateTime setHour(int i) throws Exception {
        if (i < 0 || i > 23) {
            String s = "要设置的小时值非法: " + i + ".";
            throw new Exception(s);
        } else {
            String s1 = ToolKit.formatNumber(i);
            _datetime = _datetime.substring(0, 11) + s1
                    + _datetime.substring(13);
            return this;
        }
    }

    public DateTime setMinute(int i) throws Exception {
        if (i < 0 || i > 59) {
            String s = "要设置的分钟值非法: " + i + ".";
            throw new Exception(s);
        } else {
            String s1 = ToolKit.formatNumber(i);
            _datetime = _datetime.substring(0, 14) + s1
                    + _datetime.substring(16);
            return this;
        }
    }

    public DateTime setSecond(int i) throws Exception {
        if (i < 0 || i > 59) {
            String s = "要设置的秒值非法: " + i + ".";
            throw new Exception(s);
        } else {
            String s1 = ToolKit.formatNumber(i);
            _datetime = _datetime.substring(0, 17) + s1;
            return this;
        }
    }

    public DateTime setDay(int i) throws Exception {
        int j = getMonth();
        int k = getYear();
        if (i < 1 || i > DaysInMonth(k, j)) {
            String s = "要设置的日期不是合法的日期:" + i + ".";
            throw new Exception(s);
        } else {
            String s1 = ToolKit.formatNumber(i);
            _datetime = _datetime.substring(0, 8) + s1
                    + _datetime.substring(10);
            return this;
        }
    }

    public DateTime setMonth(int i) throws Exception {
        if (i < 1 || i > 12) {
            String s = "要设置的月份非法ݷǷ�: " + i + ".";
            throw new Exception(s);
        } else {
            String s1 = ToolKit.formatNumber(i);
            _datetime = _datetime.substring(0, 5) + s1 + _datetime.substring(7);
            return this;
        }
    }

    public DateTime setYear(int i) throws Exception {
        if (i < 0 || i > 9999) {
            String s = "要设置的年非法: " + i + ".";
            throw new Exception(s);
        } else {
            String s1 = ToolKit.format("" + i, 4, "0", 0);
            _datetime = s1 + _datetime.substring(4);
            return this;
        }
    }

    public boolean equals(Object obj) {
        if (obj == null || !(obj instanceof DateTime)) {
            return false;
        } else {
            DateTime datetime = (DateTime) obj;
            long l = Long.parseLong(getStream());
            long l1 = Long.parseLong(datetime.getStream());
            return l == l1;
        }
    }

    public int hashCode() {
        Calendar calendar = Calendar.getInstance();
        int i = getYear();
        int j = getMonth();
        int k = getDay();
        int l = getHour();
        int i1 = getMinute();
        int j1 = getSecond();
        calendar.set(i, j, k, l, i1, j1);
        return 1;
    }

    /**
     * 检查传入的字符串格式是否满足转换为DateTime类型需求
     */
    public int checkType(String dateString) {
        int i = OK;
        if (dateString.length() == 19) {
            // 检查字符串是否是YYYY-MM-DD hh:mm:ss的格式，否则返回格式非法
            if (dateString.charAt(4) == '-' && dateString.charAt(7) == '-'
                    && dateString.charAt(10) == ' '
                    && dateString.charAt(13) == ':'
                    && dateString.charAt(16) == ':') {
                String s1 = dateString.substring(0, 4);
                String s2 = dateString.substring(5, 7);
                String s4 = dateString.substring(8, 10);
                String s6 = dateString.substring(11, 13);
                String s8 = dateString.substring(14, 16);
                String s10 = dateString.substring(17);
                // 检查代表年、月、日、时、分、秒部分的字符串是否为正整数，否则返回格式非法
                if (Numbers.isNumberString(s1) && Numbers.isNumberString(s2)
                        && Numbers.isNumberString(s4)
                        && Numbers.isNumberString(s6)
                        && Numbers.isNumberString(s8)
                        && Numbers.isNumberString(s10)) {
                    // 检查代表月、日、时、分、秒的字符串是否在应该在的数字区间内，
                    // 并且字符串不是表示公元0年0月0日0时0分0秒，否则返回非法日期时间
                    if ((Integer.parseInt(s2) < 1
                            || Integer.parseInt(s2) > 12
                            || Integer.parseInt(s4) < 1
                            || Integer.parseInt(s4) > DaysInMonth(Integer
                                    .parseInt(s1), Integer.parseInt(s2))
                            || Integer.parseInt(s6) > 23
                            || Integer.parseInt(s8) > 59 || Integer
                            .parseInt(s10) > 59)
                            && !dateString.equals("0000-00-00 00:00:00"))
                        i = ERROR_INVALID_DATETIME;
                    else
                        i = TYPE_TEXT;
                } else {
                    i = ERROR_INVALID_TYPE;
                }
            } else {
                i = ERROR_INVALID_TYPE;
            }
        } else if (dateString.length() == 14) {
            // 当字符串长度为14时，检查是否为YYYYMMDDhhmmss的格式，
            // 并确定是否为整数，否则返回格式非法
            boolean flag = Numbers.isNumberString(dateString);
            if (flag) {
                String s3 = dateString.substring(0, 4);
                String s5 = dateString.substring(4, 6);
                String s7 = dateString.substring(6, 8);
                String s9 = dateString.substring(8, 10);
                String s11 = dateString.substring(10, 12);
                String s12 = dateString.substring(12);
                // 检查代表月、日、时、分、秒的字符串是否在应该在的数字区间内，
                // 并且字符串不是表示公元0年0月0日0时0分0秒，否则返回非法日期时间
                if ((Integer.parseInt(s5) < 1
                        || Integer.parseInt(s5) > 12
                        || Integer.parseInt(s7) < 1
                        || Integer.parseInt(s7) > DaysInMonth(Integer
                                .parseInt(s3), Integer.parseInt(s5))
                        || Integer.parseInt(s9) > 23
                        || Integer.parseInt(s11) > 59 || Integer.parseInt(s12) > 59)
                        && !dateString.equals("0000-00-00 00:00:00"))
                    i = ERROR_INVALID_DATETIME;
                else
                    i = TYPE_STREAM;
            } else {
                i = ERROR_INVALID_TYPE;
            }
        } else if (dateString.length() == 10) {
            // 检查字符串是否是YYYY-MM-DD的格式，否则返回格式非法
            if (dateString.charAt(4) == '-' && dateString.charAt(7) == '-') {
                String s1 = dateString.substring(0, 4);
                String s2 = dateString.substring(5, 7);
                String s4 = dateString.substring(8, 10);
                // 检查代表年、月、日部分的字符串是否为正整数，否则返回格式非法
                if (Numbers.isNumberString(s1) && Numbers.isNumberString(s2)
                        && Numbers.isNumberString(s4)) {
                    // 检查代表月、日的字符串是否在应该在的数字区间内，
                    // 并且字符串不是表示公元0年0月0日，否则返回非法日期时间
                    if ((Integer.parseInt(s2) < 1 || Integer.parseInt(s2) > 12
                            || Integer.parseInt(s4) < 1 || Integer.parseInt(s4) > DaysInMonth(
                            Integer.parseInt(s1), Integer.parseInt(s2)))
                            && !dateString.equals("0000-00-00"))
                        i = ERROR_INVALID_DATETIME;
                    else
                        i = TYPE_TEXT;
                } else
                    i = ERROR_INVALID_TYPE;
            } else
                i = ERROR_INVALID_TYPE;
        } else if (dateString.length() == 8) {
            // 检查字符串是否是YYYYMMDD的格式，否则返回格式非法
            boolean flag = Numbers.isNumberString(dateString);
            if (flag) {
                String s3 = dateString.substring(0, 4);
                String s5 = dateString.substring(4, 6);
                String s7 = dateString.substring(6, 8);
                // 检查代表月、日、时、分、秒的字符串是否在应该在的数字区间内，
                // 并且字符串不是表示公元0年0月0日0时0分0秒，否则返回非法日期时间
                if ((Integer.parseInt(s5) < 1 || Integer.parseInt(s5) > 12
                        || Integer.parseInt(s7) < 1 || Integer.parseInt(s7) > DaysInMonth(
                        Integer.parseInt(s3), Integer.parseInt(s5)))
                        && !dateString.equals("0000-00-00")) 
                    i = ERROR_INVALID_DATETIME;
                else
                    i = TYPE_STREAM;
            } else
                i = ERROR_INVALID_TYPE;
        } else
            i = ERROR_INVALID_TYPE;
        return i;
    }

    /*
     * 祛除日期字符串中的符号，变换为YYYYMMDDhhmmss的形式
     */
    public String txt2str(String s) {
        String s1 = "";
        String s2 = s;
        String s3 = s2.substring(0, 4);
        String s4 = s2.substring(5, 7);
        String s5 = s2.substring(8, 10);
        String s6 = s2.substring(11, 13);
        String s7 = s2.substring(14, 16);
        String s8 = s2.substring(17);
        s1 = s3 + s4 + s5 + s6 + s7 + s8;
        return s1;
    }

    /*
     * 将YYYYMMDDhhmmss形式的字符串，转换成YYYY-MM-DD hh:mm:ss的形式
     */
    public String str2txt(String s) {
        String s1 = "";
        String s2 = s;
        String s3 = s2.substring(0, 4);
        String s4 = s2.substring(4, 6);
        String s5 = s2.substring(6, 8);
        String s6 = s2.substring(8, 10);
        String s7 = s2.substring(10, 12);
        String s8 = s2.substring(12);
        s1 = s3 + "-" + s4 + "-" + s5 + " " + s6 + ":" + s7 + ":" + s8;
        return s1;
    }

    public int getType() {
        return _nowtype;
    }

    /**
     * 设置日期类型类型只有TYPE_TEXT和TYPE_STREAM
     * 
     * @param i
     * @return
     * @throws Exception
     */
    public DateTime setType(int i) throws Exception {
        if (i != TYPE_TEXT && i != TYPE_STREAM) {
            String s = "设置的类型非法。";
            throw new Exception(s);
        } else {
            _nowtype = i;
            return this;
        }
    }

    /**
     * 获取YYYY-MM-DD hh:mm:ss的时间字符串
     * 
     * @return
     */
    public String getText() {
        return _datetime.substring(0);
    }

    /**
     * 返回格式: MM-dd HH:mm
     * @return
     */
    public String getSimpleText(){
    	return _datetime.substring(5, 16);
    }
    
    /**
     * 获取YYYY-MM-DD形式的日期字符串
     * 
     * @return
     */
    public String getTextDate() {
        return _datetime.substring(0, 10);
    }

    /**
     * 获取hh:mm:ss形式的时间字符串
     * 
     * @return
     */
    public String getTextTime() {
        return _datetime.substring(11);
    }

    /**
     * 获取YYYYMMDDhhmmss形式的时间字符串
     * 
     * @return
     */
    public String getStream() {
        return txt2str(_datetime);
    }

    /**
     * 获取YYYYMMDD形式的日期字符串
     * 
     * @return
     */
    public String getStreamDate() {
        return getStream().substring(0, 8);
    }

    /**
     * 获取hhmmss形式的时间字符串
     * 
     * @return
     */
    public String getStreamTime() {
        return getStream().substring(8);
    }

    /**
     * 当时间为公元0年0月0日的0点0分0秒返回真,否则为假
     * 
     * @return
     */
    public boolean zeroDate() {
        return getText().equals("0000-00-00 00:00:00")
                || getStream().equals("00000000000000");
    }

    /**
     * 获得所输入年份与月份的天数.
     * 
     * @param iYear
     * @param iMonth
     * @return int: Days in that month
     */
    public int DaysInMonth(int iYear, int iMonth) {
        if (iMonth < 1 || iMonth > 12)
            return 0;
        int ai[] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
        if (isLeapYear(iYear))
            ai[1] = 29;
        return ai[iMonth - 1];
    }

    /**
     * 判断输入年份是否为闰年
     * 
     * @param iYear
     * @return
     */
    public static boolean isLeapYear(int iYear) {
        return iYear % 4 == 0 && iYear % 100 != 0 || iYear % 400 == 0;
    }

    /**
     * 初始化DateTime类型.
     * 
     * @return
     */
    public static DateTime getInstance() {
        Calendar calendar = Calendar.getInstance();
        return new DateTime(calendar);
    }

    /**
     * 按照输入的格式生成日期结果
     * 
     * @param s
     * @return
     * @throws Exception 
     */
    public String format(String pattern) throws Exception {
        if (pattern == null || pattern.equals("")) {
        	throw new Exception("没有输入日期格式参数");
        } else {
            SimpleDateFormat simpledateformat = new SimpleDateFormat(pattern);
            Date date = turnIntoDate();
            return simpledateformat.format(date);
        }
    }

    public static void main(String args[]) {
        DateTime datetime = getInstance();
        DateTime datetime2 = new DateTime(new Date());
        datetime.del(2, DAY);
        String s = "2000-01-12 12:12:12";
        String s2 = "20000112";
        try {
            DateTime dt3 = new DateTime(s2);
            System.out.println(dt3.getText());

            long compare1n2 = datetime.compare(datetime2.turnIntoDate());
            System.out.println(compare1n2);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // try {
        // long compare1n1 = datetime.compare(datetime.turnIntoDate());
        // System.out.println(compare1n1);
        // } catch (Exception e) {
        // e.printStackTrace();
        // }
        System.out.println(datetime);
    }
    public static int calculateMonthIn(Date date1, Date date2) {
	  Calendar cal1 = new GregorianCalendar();
	  cal1.setTime(date1);
	  Calendar cal2 = new GregorianCalendar();
	  cal2.setTime(date2);
	  int c =
	   (cal1.get(Calendar.YEAR) - cal2.get(Calendar.YEAR)) * 12 + cal1.get(Calendar.MONTH)
	    - cal2.get(Calendar.MONTH);
	  return c;
	 } 
    
    public Date getAccountDay(Date now){
		int days = this.getMonthEnd(String.valueOf(now.getYear()), String.valueOf(now.getMonth()));
		int nowDay = now.getDate();
		if(days - nowDay > 3){
			days = this.getMonthEnd(String.valueOf(now.getYear()), String.valueOf(now.getMonth()));
			return new Date(now.getYear(),now.getMonth()-1,days-3,0,0,0);
		}else{
			return new Date(now.getYear(),now.getMonth(),days-3,0,0,0);
		}
    }  
    
    public String getAccountStartDay(){
    	String date=_datetime;
    	_datetime=_datetime.substring(0,7)+"-01 00:00:00";
    	this.add(1, this.MONTH);
    	String start=this.del(2, this.DAY).getTextDate();
    	if(date.compareTo(start)<0){
    		this.add(2, this.DAY);
    		this.del(1, this.MONTH);
        	start=this.del(2, this.DAY).getTextDate();
    	}
    	_datetime=date;
    	return start;
    } 
    
    public DateTime clone(){
    	DateTime dt=new DateTime(this);
    	return dt;
    }
    
    /**
     * 自然月前一天作为月第一天
     * @return
     */
    public String getMonthStartDay(){
    	String date=_datetime;
    	_datetime=_datetime.substring(0,7)+"-01 00:00:00";
    	this.add(1, this.MONTH);
    	String start=this.del(1, this.DAY).getTextDate();
    	if(date.compareTo(start)<0){
    		this.add(1, this.DAY);
    		this.del(1, this.MONTH);
        	start=this.del(1, this.DAY).getTextDate();
    	}
    	_datetime=date;
    	return start;   	
    }
}
