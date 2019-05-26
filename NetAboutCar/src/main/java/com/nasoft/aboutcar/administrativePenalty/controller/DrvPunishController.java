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
import com.nasoft.aboutcar.administrativePenalty.service.CaseManageInfoService;
import com.nasoft.aboutcar.administrativePenalty.service.DrvCaseManageInfoService;
import com.nasoft.aboutcar.administrativePenalty.service.DrvPunishInfoService;
import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;



@Controller
@RequestMapping("/drvpunishcontroller")
public class DrvPunishController extends BaseController{
		
	@Resource
	private DrvPunishInfoService drvPunishInfoService;
	
	
	@RequestMapping("/drvpunishindex")
	public String drvmanageindex(){
		return "administrativePenalty/drvPunishIndex";
	}
	/**
	 *
	打开案件列表
	@return
	*
	**/
	@RequestMapping("drvpunishlist")
	public void drvpunishlist(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> map = new HashMap<String, Object>();
		String areacode = request.getParameter("areacode");
		String punishtype = request.getParameter("punishtype");
		String begin_time = request.getParameter("begin_time");
		String end_time = request.getParameter("end_time");
		map.put("areacode", areacode);
		map.put("punishtype", punishtype);
		map.put("begin_time", begin_time);
		if(end_time!=null && !end_time.equals("")){
			int endtime = Integer.parseInt(end_time.substring(9))+1;
			end_time=end_time.substring(0,9)+String.valueOf(endtime);
			map.put("end_time", end_time);	
			  }
		
		List<Map> DrvPunishList = new ArrayList<Map>();
		try {
			DrvPunishList = (List<Map>)drvPunishInfoService.findAllDrvCaseInfo("com.nasoft.aboutcar.DrvPunishMapper.findAllDrvCaseInfo",map);
			for(Map m :DrvPunishList ){
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				System.out.println(m.get("casetime"));
				m.put("casetime", dateFormat.format((Date) m.get("casetime")));
				m.put("updatetime", dateFormat.format((Date) m.get("updatetime")));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(DrvPunishList.toArray());
		writer(response, array+"");
	}

	
	/**
	 * 打开案件详情
	 * @return
	 */
	@RequestMapping("/drvpunishdetail")
	public ModelAndView drvpunishdetail(HttpServletRequest request, HttpServletResponse response){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String caseid = request.getParameter("caseid");
		ModelAndView mv=new ModelAndView();
		try{
			DrvPunishInfo drvPunishInfo = drvPunishInfoService.manageDetail("com.nasoft.aboutcar.DrvPunishMapper.manageDetail", caseid);
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date casetime = dateFormat.parse(drvPunishInfo.getCasetime());
			drvPunishInfo.setCasetime(dateFormat.format(casetime));
			
			
			
			mv.addObject("DrvPunishInfo", drvPunishInfo);
			mv.setViewName("administrativePenalty/drvPunishDetail");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return mv;
	}
		
	}
	
	
	

