

public class Ognl {

    public static boolean startWithIsSplit(String strOri){
    	String[] split = new String[]{"in","like",">",">=","<","<=","bewtten"};
    	for (String str : split) {
    		if(strOri.startsWith(str)&&str.length()>0)return true;
		}
        return false;
    }
    
    public static boolean startWith(String strOri, String str){
        return strOri.startsWith(str);
    }
    
    public static boolean endWith(String strOri, String str){
        return strOri.endsWith(str);
    }
    
    public static boolean contains(String strOri, String str){
        return strOri.contains(str);
    }
    
    public static boolean isString(String str){
        return str instanceof String;
    }
}
