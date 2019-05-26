package com.nasoft.aboutcar.datadic.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.commons.lang.time.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.common.DataDicConstant;
import com.nasoft.aboutcar.datadic.domain.DataDic;
import com.nasoft.aboutcar.datadic.service.DataDicService;
import com.nasoft.aboutcar.instInfo.domain.InstInfo;
import com.nasoft.util.DateUtil;


@Controller
@RequestMapping("/dataDic")
public class DataDicController extends BaseController{

	
	@Resource
	private DataDicService dataDicService;
	
	@RequestMapping("index")
	public String index(){
		return "dataDic/index";
	}
	
	@RequestMapping("toAdd")
	public String toAdd(HttpServletRequest request){
		
		try {
			String lastDataCode=dataDicService.findLastDataCode("com.nasoft.aboutcar.dataDic.findLastDataCode");
		    String nowDataCode=(Integer.valueOf(lastDataCode)+1)+"";
		    request.setAttribute("nowDataCode", nowDataCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "dataDic/add";
	}
	@RequestMapping("add")
	public ModelAndView add(DataDic dataDic){
		ModelAndView mv=new ModelAndView();
		String msg="";
		try {
			dataDic.setPdataCode("0");
			dataDic.setCreateDateTime(DateUtil.DateTimeFormat(new Date()));
			dataDicService.insertDataDic("com.nasoft.aboutcar.dataDic.insertDic", dataDic);
		    msg="success";
		} catch (Exception e) {
			msg="failed";
			e.printStackTrace();
		}
		mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
	}
	@RequestMapping("findAllDataDic")
	public void findAllDataDic(HttpServletRequest request,HttpServletResponse response){
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			String dataName=request.getParameter("dataName");
			map.put("dataName", dataName);
			List<DataDic> list=dataDicService.findAllDataDic("com.nasoft.aboutcar.dataDic.findAllDataDic", map);
			JSONArray array = JSONArray.fromObject(list);
			writer(response, array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	@RequestMapping("detail")
	public String findAllDataDicByDataCode(String dataCode,HttpServletRequest request,HttpServletResponse response){
		try {
			List<DataDic> list=dataDicService.findDataDicByDataCode("com.nasoft.aboutcar.dataDic.findAllDataDicByDataCode", dataCode);
			request.setAttribute("list", list);
		    request.setAttribute("pdataCode", dataCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "dataDic/detail";
	}
		
	@RequestMapping("updateDic")
	public void updateDic(HttpServletRequest request,HttpServletResponse response,DataDic dataDic){
		
		String msg="";
		try {
			dataDic.setUpdDateTime(DateUtil.DateTimeFormat(new Date()));
			dataDicService.updateDataDic("com.nasoft.aboutcar.dataDic.updateDic", dataDic);
		    msg="success";
		} catch (Exception e) {
			msg="failed";
			e.printStackTrace();
		}
		writer(response, msg);
	}
	
	@RequestMapping("insertDic")
	public void insertDic(HttpServletRequest request,HttpServletResponse response,DataDic dataDic){
		
		String msg="";
		try {
			dataDic.setCreateDateTime(DateUtil.DateTimeFormat(new Date()));
			dataDicService.insertDataDic("com.nasoft.aboutcar.dataDic.insertDic", dataDic);
		    msg="success";
		} catch (Exception e) {
			msg="failed";
			e.printStackTrace();
		}
		writer(response, msg);
	}
	public static void main(String[] args) {
		String dataCode="10009";
		System.out.println(Integer.valueOf(dataCode)+1);
		
	}
		
}
