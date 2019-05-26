package com.nasoft.util;

import java.net.URL;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ClassUtil {

	private static final Logger logger = LoggerFactory.getLogger(ClassUtil.class);

	  public static ClassLoader getClassLoader()
	  {
	    return Thread.currentThread().getContextClassLoader();
	  }

	  public static String getClassPath()
	  {
	    String classpath = "";
	    URL resource = getClassLoader().getResource("");
	    if (resource != null) {
	      classpath = resource.getPath();
	    }
	    return classpath;
	  }

	  public static Class<?> loadClass(String className)
	  {
	    return loadClass(className, true);
	  }

	  public static Class<?> loadClass(String className, boolean isInitialized)
	  {
	    Class cls;
	    try
	    {
	      cls = Class.forName(className, isInitialized, getClassLoader());
	    } catch (ClassNotFoundException e) {
	      logger.error("加载类出错！", e);
	      throw new RuntimeException(e);
	    }
	    return cls;
	  }

	  public static boolean isInt(Class<?> type)
	  {
	    return (type.equals(Integer.TYPE)) || (type.equals(Integer.class));
	  }

	  public static boolean isLong(Class<?> type)
	  {
	    return (type.equals(Long.TYPE)) || (type.equals(Long.class));
	  }

	  public static boolean isDouble(Class<?> type)
	  {
	    return (type.equals(Double.TYPE)) || (type.equals(Double.class));
	  }

	  public static boolean isString(Class<?> type)
	  {
	    return type.equals(String.class);
	  }
}
