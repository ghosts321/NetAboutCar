package com.nasoft.aboutcar.administrativePenalty.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import com.nasoft.aboutcar.administrativePenalty.domain.CaseManageInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvCaseManageInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvPlantCaseInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvPunishInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantPunishInfo;
import com.nasoft.aboutcar.administrativePenalty.service.CaseManageInfoService;
import com.nasoft.aboutcar.administrativePenalty.service.DrvCaseManageInfoService;
import com.nasoft.aboutcar.administrativePenalty.service.DrvPunishInfoService;
import com.nasoft.aboutcar.administrativePenalty.service.PlantPunishInfoService;
import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;



@Controller
@RequestMapping("/plantPunishController")
public class PlantPunishController extends BaseController{
		
	@Resource
	private PlantPunishInfoService plantPunishInfoService;
	
	
	@RequestMapping("/plantpunishindex")
	public String plantpunishindex(){
		return "administrativePenalty/plantPunishIndex";
	}
	/**
	 *
	打开案件列表
	@return
	*
	**/
	@RequestMapping("plantpunishlist")
	public void plantpunishlist(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> map = new HashMap<String, Object>();
		String areaCode = request.getParameter("areaCode");
		String punishType = request.getParameter("punishType");
		String begin_time = request.getParameter("begin_time");
		String end_time = request.getParameter("end_time");
		map.put("areaCode", areaCode);
		map.put("punishType", punishType);
		map.put("begin_time", begin_time);
		if(end_time!=null && !end_time.equals("")){
			int endtime = Integer.parseInt(end_time.substring(9))+1;
			end_time=end_time.substring(0,9)+String.valueOf(endtime);
			map.put("end_time", end_time);	
			  }		
		//String bespeak_date = request.getParameter("bespeak_date");
		//map.put("bespeak_date", bespeak_date);
		List<Map> PlantPunishList = new ArrayList<Map>();
		try {
			PlantPunishList = (List<Map>)plantPunishInfoService.findAllPlantPunishInfo("com.nasoft.aboutcar.PlantPunishMapper.findAllPlantPunishInfo",map);
			


		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(PlantPunishList.toArray());
		writer(response, array+"");
	}

	
	/**
	 * 打开案件详情
	 * @return
	 */
	@RequestMapping("/plantpunishdetail")
	public ModelAndView plantpunishdetail(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> map = new HashMap<String, Object>();
		String caseId = request.getParameter("caseId");
		ModelAndView mv=new ModelAndView();
		try{
			PlantPunishInfo plantPunishInfo = plantPunishInfoService.manageDetail("com.nasoft.aboutcar.PlantPunishMapper.manageDetail", caseId);
			
			mv.addObject("PlantPunishInfo", plantPunishInfo);
			mv.setViewName("administrativePenalty/plantPunishDetail");
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date casetime = dateFormat.parse(plantPunishInfo.getCaseTime());
			plantPunishInfo.setCaseTime(dateFormat.format(casetime));
			
			map.put("caseTime", dateFormat.format((Date) map.get("caseTime")));
			map.put("updatetime", dateFormat.format((Date) map.get("updatetime")));
			
			
			map.put("caseTime", dateFormat.format((Date) map.get("caseTime")));
			map.put("updatetime", dateFormat.format((Date) map.get("updatetime")));
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return mv;
	}
		
	}
	
	
	

