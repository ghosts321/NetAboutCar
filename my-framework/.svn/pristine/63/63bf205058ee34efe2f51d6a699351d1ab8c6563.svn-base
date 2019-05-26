package com.nasoft.util;

import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.commons.collections.MapUtils;

public class MapUtil {
	public static boolean isNotEmpty(Map<?, ?> map)
	  {
	    return MapUtils.isNotEmpty(map);
	  }

	  public static boolean isEmpty(Map<?, ?> map)
	  {
	    return MapUtils.isEmpty(map);
	  }

	  public static <K, V> Map<V, K> invert(Map<K, V> source)
	  {
	    Map target = null;
	    if (isNotEmpty(source)) {
	      target = new LinkedHashMap(source.size());
	      for (Map.Entry entry : source.entrySet()) {
	        target.put(entry.getValue(), entry.getKey());
	      }
	    }
	    return target;
	  }
}
