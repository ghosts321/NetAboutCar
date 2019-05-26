package com.nasoft.aboutcar.mngoperating.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.mngoperating.domain.MngOperatingTimeSet;
import com.nasoft.aboutcar.mngoperating.service.MngOperatingTimeSetService;
import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;
import com.nasoft.util.DateUtil;

@Controller
@RequestMapping("/mngoperating")
public class MngOperatingController extends BaseController{
	@Autowired
	private MngOperatingTimeSetService mngOperatingTimeSetService;
	
	/**
	 * 打开列表页面
	 * @return
	 */
	@RequestMapping("/mngOperatingTimeSet")
	public String mngOperatingTimeSetList(){
		return "mngoperating/mngOperatingTimeSet";
	}
	
	/**
	 * 打开长期未运营新增页面
	 * @return
	 */
	@RequestMapping("/mngOperatingTimeSetAdd")
	public String mngOperatingTimeSetAdd(){
		return "mngoperating/mngOperatingTimeSetAdd";
	}
	
	/**
	 * 打开长期未运营修改页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/mngOperatingUpdate")
	public ModelAndView mngOperatingUpdate(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		String operating_time_id = request.getParameter("operating_time_id");
		try{
			MngOperatingTimeSet mngOperatingTimeSet = mngOperatingTimeSetService.findOperatingSetById("com.nasoft.aboutcar.MngOperatingTimeSet.selectOperatingSetById",operating_time_id);
			mv.setViewName("mngoperating/mngOperatingTimeSetUpdate");
			mv.addObject(mngOperatingTimeSet);
		}catch (Exception e){
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 获取所有长期未运营记录
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getMngOperatingTimeSetList")
	public void getMngOperatingTimeSetList(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> map = new HashMap<String, Object>();
		String company_name = request.getParameter("company_name");
		String begin_time = request.getParameter("begin_time");
		String end_time = request.getParameter("end_time");
		map.put("company_name", company_name); 
		map.put("begin_time", begin_time);
		map.put("end_time", end_time);
		List<MngOperatingTimeSet> mngOperatingTimeSetList = new ArrayList<MngOperatingTimeSet>();
		try {
			mngOperatingTimeSetList = mngOperatingTimeSetService.findAllMngOperatingTimeSet("com.nasoft.aboutcar.MngOperatingTimeSet.findAllOperatingTimeSet",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(mngOperatingTimeSetList.toArray());
		writer(response, array.toString());
	}
	
	/**
	 * 新增长期未运营记录
	 * @param request
	 * @param response
	 * @param mngOperatingTimeSet
	 * @return
	 */
	@RequestMapping("/addOperatingTimeSet")
	public ModelAndView addOperatingTimeSet(HttpServletRequest request, HttpServletResponse response, 
			MngOperatingTimeSet mngOperatingTimeSet){
		ModelAndView mv=new ModelAndView();
		String msg="";//页面返回状态
		
		//获取当前登录用户
		MngUserInfo currentUser = getCurrentUser();
		mngOperatingTimeSet.setCreate_user(currentUser.getUserId());
		mngOperatingTimeSet.setCreate_time(DateUtil.getTimestamp());
		
		//设置查询记录是否存在的查询条件
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("region_code", mngOperatingTimeSet.getRegion_code());
		map.put("company_id", mngOperatingTimeSet.getCompany_id());
		try {
			List<MngOperatingTimeSet> PriceSetById = mngOperatingTimeSetService.selectOperatingSetById("com.nasoft.aboutcar.MngOperatingTimeSet.selectOperatingSetIsExist", map);
			if(!PriceSetById.isEmpty()){
				msg ="该运营时间已存在！";//存在
			}else{
				int result = mngOperatingTimeSetService.addMngOperatingSet("com.nasoft.aboutcar.MngOperatingTimeSet.AddOperatingTimeSet",mngOperatingTimeSet);
				if(result > 0){
					msg="success";
				}else{
					msg="failed";
				}
			}
		} catch (Exception e) {
			msg="failed";
			e.printStackTrace();
		}
		mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 保存修改
	 * @param mngOperatingTimeSet
	 * @return
	 */
	@RequestMapping("/updateOperatingSet")
	public ModelAndView updateOperatingSet(MngOperatingTimeSet mngOperatingTimeSet){
		ModelAndView mv=new ModelAndView();
		String msg="";
		//获取当前登录用户
		MngUserInfo currentUser = getCurrentUser();
		mngOperatingTimeSet.setUpdate_user(currentUser.getUserId());
		mngOperatingTimeSet.setUpdate_time(DateUtil.getTimestamp());
		try{
			int result = mngOperatingTimeSetService.updateOperatingSet("com.nasoft.aboutcar.MngOperatingTimeSet.updateOperatingSet",mngOperatingTimeSet);
			if(result>0){
				msg="success";
			}else{
				msg="failed";
			}
		}catch(Exception e){
			msg="failed";
			e.printStackTrace();
		}
		mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除长期未运营记录
	 * @param request
	 * @param response
	 */
	@RequestMapping("/mngOperatingDel")
	public void mngOperatingDel(HttpServletRequest request, HttpServletResponse response){
		String operatingids = request.getParameter("operatingids");
		String result = "";
		try {
			mngOperatingTimeSetService.batchDelOperatingTime("com.nasoft.aboutcar.MngOperatingTimeSet.delOperatingSetById",operatingids);
			result = "success";
		} catch (Exception e) {
			result = "fail";
			e.printStackTrace();
		}
		writer(response, result);
	}
}
