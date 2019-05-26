package com.nasoft.util;

import java.util.HashSet;
import java.util.Set;

public class SetUtil {

	public static Set<String> strCaseSet(String str,String regex){
		if(StringUtil.isNotEmpty(str)){
			String[] strs = str.split(regex);
			Set<String> set = new HashSet<String>();
			for(String s:strs){
				set.add(s);
			}
			return set;
		}
		return null;
	}
	
	public static void main(String[] args) {
		String str = "abc,acb,bac,bca,cab,cba";
		Set<String> set = strCaseSet(str, ",");
		for(String s : set){
			System.out.println(s);
		}
	}
}
