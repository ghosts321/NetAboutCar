package com.nasoft.util;

import java.util.List;

import net.sf.json.JSONArray;

public class JsonUtil {

	public static String formatJsonStr(List list){
		String json = "";
		if (list != null && list.size() > 0) {
			JSONArray jsonObject = JSONArray.fromObject(list);
			json = "{Rows: " + jsonObject.toString() + ",Total:"
					+ list.size() + "}";
			try {
				return json;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return json;
	}
}
