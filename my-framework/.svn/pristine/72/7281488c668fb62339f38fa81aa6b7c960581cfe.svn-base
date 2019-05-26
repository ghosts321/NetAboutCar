package com.nasoft.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class StreamUtil {
	private static final Logger logger = LoggerFactory.getLogger(StreamUtil.class);

	  public static void copyStream(InputStream inputStream, OutputStream outputStream)
	  {
	    try
	    {
	      byte[] buffer = new byte[4096];
	      int length;
	      while ((length = inputStream.read(buffer, 0, buffer.length)) != -1) {
	        outputStream.write(buffer, 0, length);
	      }
	      outputStream.flush();
	    } catch (Exception e) {
	      logger.error("复制流出错！", e);
	      throw new RuntimeException(e);
	    } finally {
	      try {
	        inputStream.close();
	        outputStream.close();
	      } catch (Exception e) {
	        logger.error("释放资源出错！", e);
	      }
	    }
	  }

	  public static String getString(InputStream is)
	  {
	    StringBuilder sb = new StringBuilder();
	    try {
	      BufferedReader reader = new BufferedReader(new InputStreamReader(is));
	      String line;
	      while ((line = reader.readLine()) != null)
	        sb.append(line);
	    }
	    catch (Exception e) {
	      logger.error("Stream 转 String 出错！", e);
	      throw new RuntimeException(e);
	    }
	    return sb.toString();
	  }
}
