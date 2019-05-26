package com.nasoft.SSM.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class UtilInterceptor implements HandlerInterceptor {
	
	private Logger logger  = Logger.getLogger(UtilInterceptor.class);
	
	/**
	 * 执行完控制器后调用，即离开时
	 */
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object arg2, Exception arg3)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse arg1, Object arg2) throws Exception {
		// 取得BasePath
    	String path = request.getContextPath();
    	String basePath = request.getScheme() + "://" 
    			+ request.getServerName() + ":" 
    			+ request.getServerPort() + path + "/";
    	
    	request.setAttribute("path", path);
    	request.setAttribute("basePath", basePath);
		
		return true;

	}
	
}
