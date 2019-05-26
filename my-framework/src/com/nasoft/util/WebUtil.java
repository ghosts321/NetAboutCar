package com.nasoft.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.ArrayUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSONArray;

public class WebUtil {
	private static final Logger logger = LoggerFactory.getLogger(WebUtil.class);

	/**
	 * List转成json格式并输出
	 * @param response
	 * @param list
	 * @param totalList
	 */
	  public static void writeJSON(HttpServletResponse response, List list,int totalList)
	  {
	    try
	    {
	      response.setContentType("application/json");
	      response.setCharacterEncoding("UTF-8");
	      String json = "";
		 if (list != null && list.size() > 0) {
			JSONArray jsonObject = JSONArray.parseArray(list+"");
			json = "{Rows: " + jsonObject.toString() + ",Total:"
					+ totalList + "}";
		 }else{
			list=new ArrayList();
			JSONArray jsonObject = JSONArray.parseArray(list+"");
			json = "{Rows: " + jsonObject.toString() + ",Total:"
					+ list.size() + "}";
		 }
	      PrintWriter writer = response.getWriter();
	      writer.write(json);
	      writer.flush();
	      writer.close();
	    } catch (Exception e) {
	      logger.error("在响应中写数据出错！", e);
	      throw new RuntimeException(e);
	    }
	  }
	  
	  /**
		 * 页面输出信息
		 * 
		 * @param message
		 * @throws Exception
		 */
		public void writerMessage(HttpServletResponse response,String message) throws Exception {
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			try {
				out.print(message);
				out.close();
			} catch (Exception e) {
				out.close();
				e.printStackTrace();
			}finally{
				out=null;
			}
		}

	  public static Map<String, Object> getRequestParamMap(HttpServletRequest request)
	  {
	    Map paramMap = new LinkedHashMap();
	    try {
	      String method = request.getMethod();
	      if ((method.equalsIgnoreCase("put")) || (method.equalsIgnoreCase("delete"))) {
	        String queryString = CodecUtil.decodeURL(StreamUtil.getString(request.getInputStream()));
	        if (StringUtil.isNotEmpty(queryString)) {
	          String[] qsArray = StringUtil.splitString(queryString, "&");
	          if (ArrayUtils.isNotEmpty(qsArray))
	            for (String qs : qsArray) {
	              String[] array = StringUtil.splitString(qs, "=");
	              if ((ArrayUtils.isNotEmpty(array)) && (array.length == 2)) {
	                String paramName = array[0];
	                String paramValue = array[1];
	                if (checkParamName(paramName)) {
	                  if (paramMap.containsKey(paramName)) {
	                    paramValue = new StringBuilder().append(paramMap.get(paramName)).append(StringUtil.SEPARATOR).append(paramValue).toString();
	                  }
	                  paramMap.put(paramName, paramValue);
	                }
	              }
	            }
	        }
	      }
	      else {
	        Enumeration paramNames = request.getParameterNames();
	        while (paramNames.hasMoreElements()) {
	          String paramName = (String)paramNames.nextElement();
	          if (checkParamName(paramName)) {
	            String[] paramValues = request.getParameterValues(paramName);
	            if (ArrayUtils.isNotEmpty(paramValues))
	              if (paramValues.length == 1) {
	                paramMap.put(paramName, paramValues[0]);
	              } else {
	                StringBuilder paramValue = new StringBuilder("");
	                for (int i = 0; i < paramValues.length; i++) {
	                  paramValue.append(paramValues[i]);
	                  if (i != paramValues.length - 1) {
	                    paramValue.append(StringUtil.SEPARATOR);
	                  }
	                }
	                paramMap.put(paramName, paramValue.toString());
	              }
	          }
	        }
	      }
	    }
	    catch (Exception e) {
	      logger.error("获取请求参数出错！", e);
	      throw new RuntimeException(e);
	    }
	    return paramMap;
	  }

	  private static boolean checkParamName(String paramName) {
	    return !paramName.equals("_");
	  }

	  public static void forwardRequest(String path, HttpServletRequest request, HttpServletResponse response)
	  {
	    try
	    {
	      request.getRequestDispatcher(path).forward(request, response);
	    } catch (Exception e) {
	      logger.error("转发请求出错！", e);
	      throw new RuntimeException(e);
	    }
	  }

	  public static void redirectRequest(String path, HttpServletRequest request, HttpServletResponse response)
	  {
	    try
	    {
	      response.sendRedirect(new StringBuilder().append(request.getContextPath()).append(path).toString());
	    } catch (Exception e) {
	      logger.error("重定向请求出错！", e);
	      throw new RuntimeException(e);
	    }
	  }

	  public static void sendError(int code, String message, HttpServletResponse response)
	  {
	    try
	    {
	      response.sendError(code, message);
	    } catch (Exception e) {
	      logger.error("发送错误代码出错！", e);
	      throw new RuntimeException(e);
	    }
	  }

	  public static boolean isAJAX(HttpServletRequest request)
	  {
	    return request.getHeader("X-Requested-With") != null;
	  }

	  public static String getRequestPath(HttpServletRequest request)
	  {
	    String servletPath = request.getServletPath();
	    String pathInfo = StringUtil.defaultIfEmpty(request.getPathInfo(), "");
	    return new StringBuilder().append(servletPath).append(pathInfo).toString();
	  }

	  public static String getCookie(HttpServletRequest request, String name)
	  {
	    String value = "";
	    try {
	      Cookie[] cookieArray = request.getCookies();
	      if (cookieArray != null)
	        for (Cookie cookie : cookieArray)
	          if ((StringUtil.isNotEmpty(name)) && (name.equals(cookie.getName()))) {
	            value = CodecUtil.decodeURL(cookie.getValue());
	            break;
	          }
	    }
	    catch (Exception e)
	    {
	      logger.error("获取 Cookie 出错！", e);
	      throw new RuntimeException(e);
	    }
	    return value;
	  }

	  public static void downloadFile(HttpServletResponse response, String filePath)
	  {
	    try
	    {
	      String originalFileName = FilenameUtils.getName(filePath);
	      String downloadedFileName = new String(originalFileName.getBytes("GBK"), "ISO8859_1");

	      response.setContentType("application/octet-stream");
	      response.addHeader("Content-Disposition", new StringBuilder().append("attachment;filename=\"").append(downloadedFileName).append("\"").toString());

	      InputStream inputStream = new BufferedInputStream(new FileInputStream(filePath));
	      OutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
	      StreamUtil.copyStream(inputStream, outputStream);
	    } catch (Exception e) {
	      logger.error("下载文件出错！", e);
	      throw new RuntimeException(e);
	    }
	  }

	  public static void setRedirectUrl(HttpServletRequest request, String sessionKey)
	  {
	    if (!isAJAX(request)) {
	      String requestPath = getRequestPath(request);
	      request.getSession().setAttribute(sessionKey, requestPath);
	    }
	  }

	  public static String createCaptcha(HttpServletResponse response)
	  {
	    StringBuilder captcha = new StringBuilder();
	    try
	    {
	      int width = 60;
	      int height = 25;
	      int codeCount = 4;
	      int codeX = width / (codeCount + 1);
	      int codeY = height - 4;
	      int fontHeight = height - 2;
	      int randomSeed = 10;
	      char[] codeSequence = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };

	      BufferedImage bi = new BufferedImage(width, height, 1);
	      Graphics2D g = bi.createGraphics();

	      g.setColor(Color.WHITE);
	      g.fillRect(0, 0, width, height);

	      g.setFont(new Font("Courier New", 1, fontHeight));

	      g.setColor(Color.BLACK);
	      g.drawRect(0, 0, width - 1, height - 1);

	      g.setColor(Color.WHITE);

	      Random random = new Random();
	      for (int i = 0; i < 160; i++) {
	        int x = random.nextInt(width);
	        int y = random.nextInt(height);
	        int xl = random.nextInt(12);
	        int yl = random.nextInt(12);
	        g.drawLine(x, y, x + xl, y + yl);
	      }

	      for (int i = 0; i < codeCount; i++)
	      {
	        String validateCode = String.valueOf(codeSequence[random.nextInt(randomSeed)]);

	        int red = random.nextInt(255);
	        int green = random.nextInt(255);
	        int blue = random.nextInt(255);

	        g.setColor(new Color(red, green, blue));
	        g.drawString(validateCode, (i + 1) * codeX - 6, codeY);

	        captcha.append(validateCode);
	      }

	      response.setHeader("Cache-Control", "no-store");
	      response.setHeader("Pragma", "no-cache");
	      response.setDateHeader("Expires", 0L);

	      response.setContentType("image/jpeg");

	      ServletOutputStream sos = response.getOutputStream();
	      ImageIO.write(bi, "jpeg", sos);
	      sos.close();
	    } catch (Exception e) {
	      logger.error("创建验证码出错！", e);
	      throw new RuntimeException(e);
	    }
	    return captcha.toString();
	  }

	  public boolean isIE(HttpServletRequest request)
	  {
	    String agent = request.getHeader("User-Agent");
	    return (agent != null) && (agent.contains("MSIE"));
	  }
}
