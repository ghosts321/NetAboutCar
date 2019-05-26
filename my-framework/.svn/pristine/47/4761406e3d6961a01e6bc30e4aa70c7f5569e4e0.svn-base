package com.nasoft.util;

public class Numbers {

    private Numbers() {
    }
    
    public static String toStandard(String str){
    	String rets="";
    	for(int i=0; i<str.length(); i++){
    		if(i!=0&&i%3==0){
    			rets=","+rets;
    		}
    		rets=str.substring(str.length()-1-i, str.length()-i)+rets;
    	}
    	return rets;
    }
    /**
     * 判断一个字符串是否表示一个整数。
     * @param sourceString
     * @return true:整数 false:非整数
     */
    public static boolean isInt(String s) {
        boolean flag = false;
        if (isPosInt(s) || isNegaInt(s))
            flag = true;
        else
            flag = false;
        return flag;
    }

    /**
     * 判断一个字符串是否表示一个正数。
     * @param sourceString
     * @return true:正数 false:非正数
     */
    public static boolean isPositive(String s) {
        boolean flag = true;
        if (isPosInt(s) || isPosFloat(s))
            flag = true;
        else
            flag = false;
        return flag;
    }

    /**
     * 判断一个字符串是否表示一个负数。
     * @param sourceString
     * @return true:负数 false:非负数
     */    
    public static boolean isNegative(String s) {
        boolean flag = false;
        if (isNegaInt(s) || isNegaFloat(s))
            flag = true;
        else
            flag = false;
        return flag;
    }
    
    /**
     * 判断一个字符串是否表示一个浮点数。
     * @param sourceString
     * @return true:浮点数 false:非浮点数
     */    
    public static boolean isFloat(String s) {
        boolean flag = false;
        if (isPosFloat(s) || isNegaFloat(s))
            flag = true;
        else
            flag = false;
        return flag;
    }

    /**
     * 判断一个字符串是否表示一个正整数。
     * @param sourceString
     * @return true:正整数 false:非正整数
     */
    public static boolean isPosInt(String sourceString) {
        if (sourceString == null || sourceString.length() == 0)
            return false;
        if (sourceString.charAt(0) == '+')
            return isNumberString(sourceString.substring(1));
        else
            return isNumberString(sourceString);
    }

    /**
     * 判断一个字符串是否表示一个负整数。
     * @param sourceString
     * @return true:负整数 false:非负整数
     */
    public static boolean isNegaInt(String sourceString) {
        if (sourceString == null || sourceString.length() < 2)
            return false;
        if (sourceString.charAt(0) == '-')
            return isNumberString(sourceString.substring(1));
        else
            return isNumberString(sourceString);
    }
    
    /**
     * 判断一个字符串是否表示一个正数。
     * @param sourceString
     * @return true:正数 false:非正数
     */
    public static boolean isPosFloat(String sourceString) {
        if (sourceString == null || sourceString.length() < 2)
            return false;
        if (sourceString.charAt(0) == '+')
            return isFloatString(sourceString.substring(1));
        else
            return isFloatString(sourceString);
    }

    /**
     * 判断一个字符串是否表示一个负数。
     * @param sourceString
     * @return true:负数 false:非负数
     */
    public static boolean isNegaFloat(String sourceString) {
        if (sourceString == null || sourceString.length() < 3)
            return false;
        if (sourceString.charAt(0) == '-')
            return isFloatString(sourceString.substring(1));
        else
            return isFloatString(sourceString);
    }

    /**
     * 判断一个字符串是否表示一个整数。
     * @param sourceString
     * @return true:整数 false:非整数
     */
    public static boolean isNumberString(String sourceString) {
        if (sourceString == null || sourceString.length() == 0)
            return false;
        boolean flag = true;
        int i = sourceString.length();
        int j;
        for (j = 0; j < i && sourceString.charAt(j) >= '0' && sourceString.charAt(j) <= '9'; j++)
            ;
        if (j < i)
            flag = false;
        return flag;
    }

    /**
     * 判断一个字符串是否表示一个浮点数。
     * @param sourceString
     * @return true:浮点数 false:非浮点数
     */    
    public static boolean isFloatString(String sourceString) {
        if (sourceString == null || sourceString.length() < 2)
            return false;
        boolean flag = true;
        boolean flag1 = false;
        int i = sourceString.length();
        int j = 0;
        do {
            if (j >= i || sourceString.charAt(j) != '.' || flag1)
                break;
            flag1 = true;
            if ((sourceString.charAt(j) < '0' || sourceString.charAt(j) > '9') && sourceString.charAt(j) != '.')
                break;
            j++;
        } while (true);
        if (j < i)
            flag = false;
        return flag;
    }
}
