package com.nasoft.SSM.base.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;



import com.nasoft.util.redis.RedisService;

public class BaseController{
	private HttpServletRequest request;
	private String page;
	private int pagesize;
	private int offset;
	private int limit;
	
	@Autowired protected RedisService redisService;

	/**
	 * 页面输出信息
	 * 
	 * @param message
	 * @throws Exception
	 */
	public void writer(HttpServletResponse response,String message) throws Exception {
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
	
	public <T> void writer(HttpServletResponse response,List<T> list) {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;
		try {
			JSONArray arr=JSONArray.fromObject(list);		
			out = response.getWriter();
			out.print(arr.toString());
			out.close();
		} catch (Exception e) {
			out.close();
			e.printStackTrace();
		}finally{
			out=null;
		}
	}
	
	/**
     * 分页
     * 
     */
	public void getPageParameters() {
		page = 1+"";
		pagesize = 10;
		if (request.getParameter("page") != null
				&& request.getParameter("pagesize") != null) {
			page =  request.getParameter("page") ;
			pagesize = Integer.parseInt(request.getParameter("pagesize"));
		}
		// 计算开始的记录和结束的记录
		offset = (Integer.parseInt(page) - 1) * pagesize;
		limit = ((Integer.parseInt(page) - 1) * pagesize) + pagesize;
	}
	
	
}
