package com.nasoft.aboutcar.instInfo.controller;


import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.instInfo.domain.InstInfo;
import com.nasoft.aboutcar.instInfo.service.InstInfoService;
import com.nasoft.aboutcar.mngareainfo.service.MngAreaInfoService;

@Controller
@RequestMapping("/instInfo")
public class InstInfoController extends BaseController{

	@Resource
	private InstInfoService infoService;
	
	@Resource
	private MngAreaInfoService mngAreaInfoService;
	
	@RequestMapping("index")
	public String index(){
		return "instInfo/index";
	}
	@RequestMapping("toAdd")
	public String toAdd(){
		return "instInfo/add";
	}
	
	
	@RequestMapping("toUpdate")
	public ModelAndView toUpdate(String instId){
		ModelAndView mv=new ModelAndView();
		try {
			InstInfo instInfo=infoService.findInstInfoByInstId("com.nasoft.aboutcar.instInfo.findInstInfoByInstId", instId);
			mv.addObject("instInfo", instInfo);
			mv.setViewName("instInfo/update");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("del")
	public void del(String instId,PrintWriter out){
		
		try {
			int result=infoService.deleteInstInfoByInstId("com.nasoft.aboutcar.instInfo.deleteInstInfo", instId);
			if(result>0){
				out.write("success");
			}else{
				out.write("failed");
			}
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("findAllInstInfo")
	public void findAllInstInfo(HttpServletRequest request,HttpServletResponse response){
		String instName = request.getParameter("instName");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("instName", instName);
		try {
			List<InstInfo> list=infoService.findAllInstInfo("com.nasoft.aboutcar.instInfo.findAllInstInfo",map);
			JSONArray array = JSONArray.fromObject(list);
			writer(response, array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("add")
	public ModelAndView add(InstInfo instInfo){
		ModelAndView mv=new ModelAndView();
		String msg="";
		try {
			//设置创建人创建时间
			instInfo.setCreateMan(1);
			instInfo.setCreateInstId(1);
			instInfo.setCreateDate(getStringDate());
			int result=infoService.addInstInfo("com.nasoft.aboutcar.instInfo.insertInstInfo", instInfo);
		    if(result>0){
		    	msg="success";
		    }else{
		    	msg="failed";
		    }
		} catch (Exception e) {
			msg="failed";
			e.printStackTrace();
		}
		mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
	}
	
	@RequestMapping("update")
	public ModelAndView update(InstInfo instInfo){
		
		ModelAndView mv=new ModelAndView();
		String msg="";
		try {
			int result=infoService.updateInstInfo("com.nasoft.aboutcar.instInfo.updateInstInfo", instInfo);
		    if(result>0){
		    	msg="success";
		    }else{
		    	msg="failed";
		    }
		} catch (Exception e) {
			msg="failed";
			e.printStackTrace();
		}
		mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
	}
	 @RequestMapping("getAreaCode")
	  public void getAreaCode(HttpServletRequest request, HttpServletResponse response) {
		   try{
			    String code = request.getParameter("codeParam");
			    Map map = new HashMap();
			    map.put("pareaCode", code);
			    List areaInfoList = this.mngAreaInfoService.findAreaList("com.nasoft.aboutcar.MngAreaInfoMapper.findAreaListByCode", map);
			    JSONArray array = JSONArray.fromObject(areaInfoList);
				writer(response, array+"");
		  } catch (Exception e) {
			e.printStackTrace();
		 }
	  }
	 @RequestMapping("getInstByAreaCode")
	  public void getInstByAreaCode(HttpServletRequest request, HttpServletResponse response) {
		   try{
			    String code = request.getParameter("codeParam");
			    List<InstInfo> InstInfoList = this.infoService.findAllInstInfoByAreaCode("com.nasoft.aboutcar.instInfo.findAllInstInfoByAreaCode", code);
			    JSONArray array = JSONArray.fromObject(InstInfoList);
				writer(response, array+"");
		  } catch (Exception e) {
			e.printStackTrace();
		 }
	  }
	public String getStringDate(){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return sdf.format(new Date());
		
	}
}
