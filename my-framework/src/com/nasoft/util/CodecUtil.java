package com.nasoft.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.UUID;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CodecUtil {
	private static final Logger logger = LoggerFactory.getLogger(CodecUtil.class);

	  public static String encodeURL(String str)
	  {
	    String target;
	    try
	    {
	      target = URLEncoder.encode(str, "UTF-8");
	    } catch (Exception e) {
	      logger.error("编码出错！", e);
	      throw new RuntimeException(e);
	    }
	    return target;
	  }

	  public static String decodeURL(String str)
	  {
	    String target;
	    try
	    {
	      target = URLDecoder.decode(str, "UTF-8");
	    } catch (Exception e) {
	      logger.error("解码出错！", e);
	      throw new RuntimeException(e);
	    }
	    return target;
	  }

	  public static String encodeBASE64(String str)
	  {
	    String target;
	    try
	    {
	      target = Base64.encodeBase64URLSafeString(str.getBytes("UTF-8"));
	    } catch (UnsupportedEncodingException e) {
	      logger.error("编码出错！", e);
	      throw new RuntimeException(e);
	    }
	    return target;
	  }

	  public static String decodeBASE64(String str)
	  {
	    String target;
	    try
	    {
	      target = new String(Base64.decodeBase64(str), "UTF-8");
	    } catch (UnsupportedEncodingException e) {
	      logger.error("解码出错！", e);
	      throw new RuntimeException(e);
	    }
	    return target;
	  }

	  public static String encryptMD5(String str)
	  {
	    return DigestUtils.md5Hex(str);
	  }

	  public static String encryptSHA(String str)
	  {
	    return DigestUtils.sha1Hex(str);
	  }

	  public static String createRandom(int count)
	  {
	    return RandomStringUtils.randomNumeric(count);
	  }

	  public static String createUUID()
	  {
	    return UUID.randomUUID().toString().replaceAll("-", "");
	  }
}
