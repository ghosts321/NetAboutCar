package com.nasoft.aboutcar.base.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;
import com.nasoft.util.redis.RedisService;

@Controller
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
	public void writer(HttpServletResponse response,String message) {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(message);
			out.close();
		} catch (Exception e) {
			out.close();
			e.printStackTrace();
		}finally{
			out=null;
		}
	}
	

	public <T> void writer(HttpServletResponse response,T obj) {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;
		try {
			JSONObject jo=JSONObject.fromObject(obj);			
			out = response.getWriter();
			out.print(jo.toString());
			out.close();
		} catch (Exception e) {
			out.close();
			e.printStackTrace();
		}finally{
			out=null;
		}
	}
	
	/**
	 * 页面输出信息
	 * 
	 * @param message
	 * @throws Exception
	 */
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
	
	
	public MngUserInfo getCurrentUser(){
		MngUserInfo currentUser = null;
		try{
			Subject subject = SecurityUtils.getSubject();
			Session session = subject.getSession(false);
			if (session == null){
				session = subject.getSession();
			}
			if (session != null){
				return (MngUserInfo) session.getAttribute("mngUserInfo");
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public Session getSession(){
		try{
			Subject subject = SecurityUtils.getSubject();
			Session session = subject.getSession(false);
			if (session == null){
				session = subject.getSession();
			}
			if (session != null){
				return session;
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		return null;
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
