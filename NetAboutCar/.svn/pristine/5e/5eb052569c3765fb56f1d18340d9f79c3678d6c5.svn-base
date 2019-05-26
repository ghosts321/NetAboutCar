package com.nasoft.aboutcar.monitor.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;
import com.nasoft.aboutcar.monitor.domain.MngAbnormityPriceSet;
import com.nasoft.aboutcar.monitor.service.MngAbnormityPriceSetService;
import com.nasoft.util.DateUtil;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/monitor")
public class MonitorController extends BaseController{

	@Autowired
	private MngAbnormityPriceSetService mngAbnormityPriceSetService;
	
	@RequestMapping("/abnormityPriceSet")
	public String abnormityPriceSetList(){
		return "monitor/mngAbnormityPriceSet";
	}
	
	@RequestMapping("/abnormityPriceAdd")
	public String openPriceSetAdd(){
		return "monitor/mngAbnormityPriceSetAdd";
	}
	
	/**
	 * 打开运价设定修改页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/abnormityPriceUpdate")
	public ModelAndView openPriceSetUpdate(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		String abnormity_id = request.getParameter("abnormity_id");
		try{
			MngAbnormityPriceSet mngAbnormityPriceSet = mngAbnormityPriceSetService.findPriceSetById("com.nasoft.aboutcar.MngAbnormityPriceSet.selectPriceSetById",abnormity_id);
			mv.setViewName("monitor/mngAbnormityPriceSetUpdate");
			mv.addObject(mngAbnormityPriceSet);
		}catch (Exception e){
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 获取所有运价设定记录
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getAbnormityPriceSetList")
	public void getAbnormityPriceSetList(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> map = new HashMap<String, Object>();
		String region_code = request.getParameter("region_code");
		String fare_type = request.getParameter("fare_type");
		String company_id = request.getParameter("company_id");
		map.put("region_code", region_code);
		map.put("fare_type", fare_type);
		map.put("company_id", company_id);
		List<MngAbnormityPriceSet> abnormityPriceSetList = new ArrayList<MngAbnormityPriceSet>();
		try {
			abnormityPriceSetList = mngAbnormityPriceSetService.findAllMngAbnormityPriceSet("com.nasoft.aboutcar.MngAbnormityPriceSet.findAllPriceSet",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(abnormityPriceSetList.toArray());
		writer(response, array.toString());
	}
	
	/**
	 * 添加运价设定
	 * @param request
	 * @param response
	 * @param mngAbnormityPriceSet
	 * @return
	 */
	@RequestMapping("/addPriceSet")
	public ModelAndView addPriceSet(HttpServletRequest request, HttpServletResponse response, MngAbnormityPriceSet mngAbnormityPriceSet){
		ModelAndView mv=new ModelAndView();
		String msg="";//页面返回状态
		
		//获取当前登录用户
		MngUserInfo currentUser = getCurrentUser();
		mngAbnormityPriceSet.setCreate_user(currentUser.getUserId());
		mngAbnormityPriceSet.setCreate_time(DateUtil.format(new Date()));
		mngAbnormityPriceSet.setUpdate_user(currentUser.getUserId());
		mngAbnormityPriceSet.setUpdate_time(DateUtil.format(new Date()));
		//设置查询记录是否存在的查询条件
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("region_code", mngAbnormityPriceSet.getRegion_code());
		map.put("fare_type", mngAbnormityPriceSet.getFare_type());
		map.put("company_id", mngAbnormityPriceSet.getCompany_id());
		try {
			List<MngAbnormityPriceSet> PriceSetById = mngAbnormityPriceSetService.selectPriceSetById("com.nasoft.aboutcar.MngAbnormityPriceSet.selectPriceSetIsExist", map);
			if(!PriceSetById.isEmpty()){
				msg ="该运价已存在！";//存在
			}else{
				int result = mngAbnormityPriceSetService.addMngAbnormityPriceSet("com.nasoft.aboutcar.MngAbnormityPriceSet.AddPriceSet",mngAbnormityPriceSet);
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
	 * @param mngAbnormityPriceSet
	 * @return
	 */
	@RequestMapping("/updatePriceSet")
	public ModelAndView updatePriceSet(MngAbnormityPriceSet mngAbnormityPriceSet){
		ModelAndView mv=new ModelAndView();
		String msg="";
		//获取当前登录用户
		MngUserInfo currentUser = getCurrentUser();
		mngAbnormityPriceSet.setUpdate_user(currentUser.getUserId());
		mngAbnormityPriceSet.setUpdate_time(DateUtil.format(new Date()));
		try{
			int result = mngAbnormityPriceSetService.updatePriceSet("com.nasoft.aboutcar.MngAbnormityPriceSet.updatePriceSet",mngAbnormityPriceSet);
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
	 * 删除运价设定
	 * @param request
	 * @param response
	 */
	@RequestMapping("/abnormityPriceDel")
	public void abnormityPriceDel(HttpServletRequest request, HttpServletResponse response){
		String abnormityids = request.getParameter("abnormityids");
		String result = "";
		try {
			mngAbnormityPriceSetService.batchDelAbnormityPrice("com.nasoft.aboutcar.MngAbnormityPriceSet.delPriceSetById",abnormityids);
			result = "success";
		} catch (Exception e) {
			result = "fail";
			e.printStackTrace();
		}
		writer(response, result);
	}
}
