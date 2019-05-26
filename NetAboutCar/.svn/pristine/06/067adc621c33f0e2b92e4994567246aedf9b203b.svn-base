package com.nasoft.aboutcar.administrativePenalty.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nasoft.aboutcar.administrativePenalty.domain.CaseManageInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvPlantCaseInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantManageHisInfo;
import com.nasoft.aboutcar.administrativePenalty.service.CaseManageInfoService;
import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;



@Controller
@RequestMapping("/casemanage")
public class CaseManageController extends BaseController{
		
	@Resource
	private CaseManageInfoService caseManageInfoService;
	
	
	@RequestMapping("/manageindex")
	public String manageindex(){
		return "administrativePenalty/manageIndex";
	}
	/**
	 *
	打开案件修改列表
	@return
	*
	**/
	@RequestMapping("reviselist")
	public void reviselist(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> map = new HashMap<String, Object>();
		String caseId = request.getParameter("caseId");
		String compn_compy = request.getParameter("compn_compy");
		String begin_time = request.getParameter("begin_time");
		String end_time = request.getParameter("end_time");
		map.put("caseId", caseId);
		map.put("compn_compy", compn_compy);

		map.put("begin_time", begin_time);
		if(end_time!=null && !end_time.equals("")){
			int endtime = Integer.parseInt(end_time.substring(9))+1;
			end_time=end_time.substring(0,9)+String.valueOf(endtime);
			map.put("end_time", end_time);	
			  }
		//String bespeak_date = request.getParameter("bespeak_date");
		//map.put("bespeak_date", bespeak_date);
		List<Map> CaseManageInfoList = new ArrayList<Map>();
		try {
			CaseManageInfoList = (List<Map>)caseManageInfoService.findAllPlantCaseInfo("com.nasoft.aboutcar.CaseManageMapper.findAllPlantCaseInfo",map);
			for(Map m :CaseManageInfoList ){
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:MM:SS");
				System.out.println(m.get("caseTime"));
				m.put("caseTime", dateFormat.format((Date) m.get("caseTime")));
				m.put("updatetime", dateFormat.format((Date) m.get("updatetime")));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(CaseManageInfoList.toArray());
		writer(response, array+"");
	}
	
	/**
	 * 案件修改
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/caseRevise")
	public ModelAndView caseRevise(HttpServletRequest request, HttpServletResponse response, CaseManageInfo caseManageInfo) throws Exception{
		ModelAndView mv=new ModelAndView();
		PlantManageHisInfo plantManageHisInfo=new PlantManageHisInfo();
         String caseId = request.getParameter("caseId");
		String msg="";
		//获取当前登录用户
		MngUserInfo currentUser = getCurrentUser();
		
		//获取当前系统时间
		caseManageInfo.setUpdateTime(new Date());
		caseManageInfo.setCaseId(caseId);
		caseManageInfo.setCaseUserId(currentUser.getRealName());
		ArrayList strarr = new ArrayList();
		ArrayList strlist = new ArrayList();
		String alterzd = request.getParameter("alterzd");
		
		try{
			int result = caseManageInfoService.updateplantCaseInfo("com.nasoft.aboutcar.CaseManageMapper.updateCaseManageInfo", caseManageInfo);
			if(result>0){
				if(alterzd!=null && !alterzd.equals("")){
					   int x=0;
					   String str1 = "";
						 for(int i=0;i<alterzd.length();i++) {  
				             String getstr=alterzd.substring(i,i+1);  
				             if(getstr.equals("^")){  
				                 x++;  
				             }  
				         } 
						for(int i=0;i<x;i++){
							String str3 ="";
							String value="";
							String name="";
							str1 =  alterzd.substring(0,alterzd.indexOf("^"));
							value=str1.substring(str1.indexOf("=")+1);
							name=str1.substring(0, str1.indexOf("="));
							str3 = alterzd.substring(alterzd.indexOf("^")+1);
							alterzd=str3;
							plantManageHisInfo.setAltercontentb(value);
							plantManageHisInfo.setAlterzd(name);
							plantManageHisInfo.setCaseId(caseId);
							plantManageHisInfo.setUpdatetime(new Date());
							plantManageHisInfo.setUpduserid(currentUser.getRealName());
							if(name.equals("所属平台")){
								plantManageHisInfo.setAltercontenta(caseManageInfo.getPlateName());
							}
							else if (name.equals("案件来源")) {
								plantManageHisInfo.setAltercontenta(caseManageInfo.getSource());
							}
							else if (name.equals("案件状态")) {
								plantManageHisInfo.setAltercontenta(caseManageInfo.getIsRegister());
							}
							else if (name.equals("行政区划")) {
								plantManageHisInfo.setAltercontenta(caseManageInfo.getAreaCode());
							}
							else if (name.equals("组织机构")) {
								plantManageHisInfo.setAltercontenta(caseManageInfo.getCreateInstId());
							}
							else if (name.equals("案发时间")) {
								plantManageHisInfo.setAltercontenta(caseManageInfo.getCaseTime());
							}
							else if (name.equals("案件事由")) {
								plantManageHisInfo.setAltercontenta(caseManageInfo.getCaseReason());
							}
							int result1 = caseManageInfoService.insertHis("com.nasoft.aboutcar.CaseManageMapper.insertPlantManageHisInfo", plantManageHisInfo);
						}
				}
				msg="success";
			}else{
				msg="failed";
			}
		}catch(Exception e){
			e.printStackTrace();
			msg="failed";
		}
		mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 打开修改案件
	 * @return
	 */
	@RequestMapping("/manageAlter")
	public ModelAndView manageAlter(HttpServletRequest request, HttpServletResponse response){
		
		String caseId = request.getParameter("caseId");
		ModelAndView mv=new ModelAndView();
		try{
			List<Map> comlist = caseManageInfoService.selectAllCompn("com.nasoft.aboutcar.administrativePenalty.selectComName");
			request.getSession().setAttribute("comlist", comlist);
			
			CaseManageInfo caseManageInfo = caseManageInfoService.manageDetail("com.nasoft.aboutcar.CaseManageMapper.manageDetail", caseId);
			
			mv.addObject("CaseManageInfo", caseManageInfo);
			mv.setViewName("administrativePenalty/manageAlter");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return mv;
	}
	
	/**
	 * 打开案件修改历史
	 * @return
	 */
	
	@RequestMapping("/penaltyHistory")
	public ModelAndView penaltyHistory(HttpServletRequest request, HttpServletResponse response){
		
		String caseId = request.getParameter("caseId");
		ModelAndView mv=new ModelAndView();
		try{
			List<Map> plantManageHisInfo = caseManageInfoService.penaltyHistory("com.nasoft.aboutcar.CaseManageMapper.manageHistory", caseId);
			for(Map mm :plantManageHisInfo ){
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:MM:SS");
				/*m.put("casetime", dateFormat.format((Date) m.get("casetime")));*/
				mm.put("updatetime", dateFormat.format((Date) mm.get("updatetime")));
			}
			
			mv.addObject("PlantManageHisInfo", plantManageHisInfo);
			mv.setViewName("administrativePenalty/penaltyHistory");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return mv;
	}
		
	}
	
		

