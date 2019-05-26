package com.nasoft.util;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.commons.beanutils.PropertyUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ObjectUtil {
	private static final Logger logger = LoggerFactory.getLogger(ObjectUtil.class);

	  public static void setField(Object obj, String fieldName, Object fieldValue)
	  {
	    try
	    {
	      if (PropertyUtils.isWriteable(obj, fieldName))
	        PropertyUtils.setProperty(obj, fieldName, fieldValue);
	    }
	    catch (Exception e) {
	      logger.error("设置成员变量出错！", e);
	      throw new RuntimeException(e);
	    }
	  }

	  public static Object getFieldValue(Object obj, String fieldName)
	  {
	    Object propertyValue = null;
	    try {
	      if (PropertyUtils.isReadable(obj, fieldName))
	        propertyValue = PropertyUtils.getProperty(obj, fieldName);
	    }
	    catch (Exception e) {
	      logger.error("获取成员变量出错！", e);
	      throw new RuntimeException(e);
	    }
	    return propertyValue;
	  }

	  public static void copyFields(Object source, Object target)
	  {
	    try
	    {
	      for (Field field : source.getClass().getDeclaredFields())
	      {
	        if (!Modifier.isStatic(field.getModifiers())) {
	          field.setAccessible(true);
	          field.set(target, field.get(source));
	        }
	      }
	    } catch (Exception e) {
	      logger.error("复制成员变量出错！", e);
	      throw new RuntimeException(e);
	    }
	  }

	  public static <T> T newInstance(String className)
	  {
	    Object instance;
	    try
	    {
	      Class commandClass = ClassUtil.loadClass(className);
	      instance = commandClass.newInstance();
	    } catch (Exception e) {
	      logger.error("创建实例出错！", e);
	      throw new RuntimeException(e);
	    }
	    return (T) instance;
	  }

	  public static Map<String, Object> getFieldMap(Object obj)
	  {
	    return getFieldMap(obj, true);
	  }

	  public static Map<String, Object> getFieldMap(Object obj, boolean isStaticIgnored)
	  {
	    Map fieldMap = new LinkedHashMap();
	    Field[] fields = obj.getClass().getDeclaredFields();
	    for (Field field : fields)
	      if ((!isStaticIgnored) || (!Modifier.isStatic(field.getModifiers())))
	      {
	        String fieldName = field.getName();
	        Object fieldValue = getFieldValue(obj, fieldName);
	        fieldMap.put(fieldName, fieldValue);
	      }
	    return fieldMap;
	  }
}
