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

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nasoft.aboutcar.administrativePenalty.domain.CaseDealInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvCaseAppeal;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvPlantCaseInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantCaseAppeal;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantCaseInfo;
import com.nasoft.aboutcar.administrativePenalty.service.PlantCaseAppealService;
import com.nasoft.aboutcar.administrativePenalty.service.PlantCaseInfoService;
import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.exam.domain.MngExamBespeak;
import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;
import com.nasoft.aboutcar.pilotapply.service.DrvExamresultService;
import com.nasoft.aboutcar.supervise.domain.DrvIllegalInfo;
import com.nasoft.util.DateUtil;

import net.sf.json.JSONArray;

/**
 * 行政处罚-案件申诉
 * @author 蒋俊鹏
 */
@Controller
@RequestMapping("/plantcaseappeal")
public class PlantCaseAppealController extends BaseController {
	
	
	@Resource
	private  PlantCaseAppealService plantCaseAppealService;
	
	/**
     * 平台案件申诉列表
     */
	@RequestMapping("plantappeal")
	public String plantappeal(HttpServletRequest request,Model model){
		
		return "administrativePenalty/plantCaseAppealList";
	}
	
	@RequestMapping("plantappealFindAll")
	public void plantappealFindAll(HttpServletRequest request,HttpServletResponse response){
		String plateName = request.getParameter("plateName");
		String caseId = request.getParameter("caseId");
		String begin_time = request.getParameter("begin_time");
		String end_time = request.getParameter("end_time");
		Map<String, Object> map = new HashMap<String, Object>();
		if(end_time!=null && !end_time.equals("")){
			int endtime = Integer.parseInt(end_time.substring(9))+1;
			end_time=end_time.substring(0,9)+String.valueOf(endtime);
			map.put("end_time", end_time);	
			System.out.println(end_time);
			  }	
		map.put("plateName", plateName);
		map.put("caseId", caseId);
		map.put("begin_time", begin_time);
		//map.put("end_time", end_time);
		List<Map> plantCaseInfoList = new ArrayList<Map>();
		try {
			plantCaseInfoList = plantCaseAppealService.plantCaseAppealfindAll("com.nasoft.aboutcar.administrativePenalty.plantCaseAppealfindAll", map);
			for(Map m :plantCaseInfoList ){
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				m.put("caseTime", dateFormat.format((Date) m.get("caseTime")));
				m.put("updateTime", dateFormat.format((Date) m.get("updatetime")));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(plantCaseInfoList.toArray());
		writer(response, array.toString());
		
	}
	
	/**
     * 申诉详情
     */
	@RequestMapping("appealDetail")
	public ModelAndView appealDetail(HttpServletRequest request,HttpServletResponse response,String caseId){
		
		ModelAndView mv=new ModelAndView();
		try {
			PlantCaseInfo plantcaseinfo = plantCaseAppealService.appealDetailbyId("com.nasoft.aboutcar.administrativePenalty.appealDetailbyId", caseId);
			mv.addObject("plantcaseinfo", plantcaseinfo);
			mv.setViewName("administrativePenalty/plantAppealDetail");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
     * 申诉受理
     */
	@RequestMapping("caseAppeal")
	public ModelAndView caseAppeal(HttpServletRequest request,HttpServletResponse response,String caseId){
		
		ModelAndView mv=new ModelAndView();
		try {
			PlantCaseAppeal plantcaseappeal = plantCaseAppealService.caseAppealbyId("com.nasoft.aboutcar.administrativePenalty.caseAppealbyId", caseId);
			mv.addObject("plantcaseappeal", plantcaseappeal);
			mv.setViewName("administrativePenalty/plantCaseAppeal");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("caseAppealPage")
	public ModelAndView caseAppealPage(HttpServletRequest request,HttpServletResponse response,PlantCaseInfo plantcaseinfo) throws Exception{
		ModelAndView mv=new ModelAndView();
		String id = request.getParameter("id");
		String caseId=plantcaseinfo.getCaseId();
		 //plantCaseInfo = new PlantCaseInfo();
		//plantcaseinfo.setCaseId(caseId);
		//plantcaseinfo.setPunishType(punishType);
		//plantcaseinfo.setPunishContent(punishcontent);
		if(id != null && id.equals("1")){
			plantCaseAppealService.updateCaseInfo("com.nasoft.aboutcar.administrativePenalty.updateCaseInfo", plantcaseinfo);
		}else{
			plantCaseAppealService.updateCaseInfo("com.nasoft.aboutcar.administrativePenalty.updateCaseAppeal", plantcaseinfo);
			plantCaseAppealService.updateCaseInfo("com.nasoft.aboutcar.administrativePenalty.updateDealStatus", plantcaseinfo);
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
     * 驾驶员案件申诉列表
     */
	@RequestMapping("drvappeal")
	public String drvappeal(HttpServletRequest request,Model model){
		
		return "administrativePenalty/drvCaseAppealList";
	}
	
	@RequestMapping("drvappealFindAll")
	public void drvappealFindAll(HttpServletRequest request,HttpServletResponse response){
		String carid = request.getParameter("carid");
		String caseid = request.getParameter("caseid");
		String begin_time = request.getParameter("begin_time");
		String end_time = request.getParameter("end_time");
		Map<String, Object> map = new HashMap<String, Object>();
		if(end_time!=null && !end_time.equals("")){
			int endtime = Integer.parseInt(end_time.substring(9))+1;
			end_time=end_time.substring(0,9)+String.valueOf(endtime);
			map.put("end_time", end_time);	
			System.out.println(end_time);
			  }
		map.put("carid", carid);
		map.put("caseid", caseid);
		map.put("begin_time", begin_time);
		//map.put("end_time", end_time);
		List<Map> drvCaseInfoList = new ArrayList<Map>();
		try {
			drvCaseInfoList = plantCaseAppealService.drvCaseAppealfindAll("com.nasoft.aboutcar.administrativePenalty.drvCaseAppealfindAll", map);
			for(Map m :drvCaseInfoList ){
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				m.put("casetime", dateFormat.format((Date) m.get("casetime")));
				m.put("updatetime", dateFormat.format((Date) m.get("updatetime")));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(drvCaseInfoList.toArray());
		writer(response, array.toString());
		
	}
	
	/**
     * 申诉详情
     */
	@RequestMapping("drvappealDetail")
	public ModelAndView drvappealDetail(HttpServletRequest request,HttpServletResponse response,String caseid){
		
		ModelAndView mv=new ModelAndView();
		try {
			DrvPlantCaseInfo drvplantcaseinfo = plantCaseAppealService.drvappealDetailbyId("com.nasoft.aboutcar.administrativePenalty.drvappealDetailbyId", caseid);
			mv.addObject("drvplantcaseinfo", drvplantcaseinfo);
			mv.setViewName("administrativePenalty/drvAppealDetail");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
     * 申诉受理
     */
	@RequestMapping("drvcaseAppeal")
	public ModelAndView drvcaseAppeal(HttpServletRequest request,HttpServletResponse response,String caseid){
		
		ModelAndView mv=new ModelAndView();
		try {
			DrvCaseAppeal drvcaseappeal = plantCaseAppealService.drvcaseAppealbyId("com.nasoft.aboutcar.administrativePenalty.drvcaseAppealbyId", caseid);
			mv.addObject("drvcaseappeal", drvcaseappeal);
			mv.setViewName("administrativePenalty/drvCaseAppeal");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("drvcaseAppealPage")
	public ModelAndView drvcaseAppealPage(HttpServletRequest request,HttpServletResponse response,DrvPlantCaseInfo drvplantcaseinfo) throws Exception{
		ModelAndView mv=new ModelAndView();
		String id = request.getParameter("id");
		String caseid=drvplantcaseinfo.getCaseid();
		 //plantCaseInfo = new PlantCaseInfo();
		//plantcaseinfo.setCaseId(caseId);
		//plantcaseinfo.setPunishType(punishType);
		//plantcaseinfo.setPunishContent(punishcontent);
		if(id != null && id.equals("1")){
			plantCaseAppealService.drvupdateCaseInfo("com.nasoft.aboutcar.administrativePenalty.drvupdateCaseInfo", drvplantcaseinfo);
		}else{
			plantCaseAppealService.drvupdateCaseInfo("com.nasoft.aboutcar.administrativePenalty.drvupdateCaseAppeal", drvplantcaseinfo);
			plantCaseAppealService.drvupdateCaseInfo("com.nasoft.aboutcar.administrativePenalty.drvupdateDealStatus", drvplantcaseinfo);
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
     * 平台处罚案件统计
     */
	@RequestMapping("/plantanalysisList")
	public String plantanalysisList(HttpServletRequest request,String areacode,String punishType,String instid,String beginTime,String endTime){
		try {
			Map m = new HashMap();
			m.put("areacode", areacode);
			m.put("punishType", punishType);
			m.put("beginTime", beginTime);
			//m.put("endTime", endTime);
			m.put("instid", instid);
			if(endTime!=null && !endTime.equals("")){
				int endtime = Integer.parseInt(endTime.substring(9))+1;
				endTime=endTime.substring(0,9)+String.valueOf(endtime);
				m.put("endTime", endTime);	
				System.out.println(endTime);
				  }	

			Map map = plantCaseAppealService.findplantanalysisList("com.nasoft.aboutcar.administrativePenalty.findplantanalysisList", m);
			request.getSession().setAttribute("map", map);
	        request.getSession().setAttribute("m", m);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "administrativePenalty/plantanalysisList";
	}
	
	/**
     * 驾驶员处罚案件统计
     */
	@RequestMapping("/drvanalysisList")
	public String drvanalysisList(HttpServletRequest request,String areacode,String punishType,String instid,String beginTime,String endTime){
		try {
			Map m = new HashMap();
			m.put("areacode", areacode);
			m.put("punishType", punishType);
			m.put("beginTime", beginTime);
			//m.put("endTime", endTime);
			m.put("instid", instid);
			if(endTime!=null && !endTime.equals("")){
				int endtime = Integer.parseInt(endTime.substring(9))+1;
				endTime=endTime.substring(0,9)+String.valueOf(endtime);
				m.put("endTime", endTime);	
				System.out.println(endTime);
				  }	
			Map map = plantCaseAppealService.findplantanalysisList("com.nasoft.aboutcar.administrativePenalty.finddrvanalysisList", m);
			request.getSession().setAttribute("map", map);
	        request.getSession().setAttribute("m", m);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "administrativePenalty/drvanalysisList";
	}
	
}
