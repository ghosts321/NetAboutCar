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
import com.nasoft.aboutcar.administrativePenalty.domain.DrvPlantManageHisInfo;
import com.nasoft.aboutcar.administrativePenalty.service.CaseManageInfoService;
import com.nasoft.aboutcar.administrativePenalty.service.DrvCaseManageInfoService;
import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;



@Controller
@RequestMapping("/drvcasemanage")
public class DrvCaseManageController extends BaseController{
		
	@Resource
	private DrvCaseManageInfoService drvCaseManageInfoService;
	
	
	@RequestMapping("/drvmanageindex")
	public String drvmanageindex(){
		return "administrativePenalty/drvManageIndex";
	}
	/**
	 *
	打开案件修改列表
	@return
	*
	**/
	@RequestMapping("drvreviselist")
	public void reviselist(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> map = new HashMap<String, Object>();
		String caseid = request.getParameter("caseid");
		String carid = request.getParameter("carid");
		String begin_time = request.getParameter("begin_time");
		String end_time = request.getParameter("end_time");
		map.put("caseid", caseid);
		map.put("carid", carid);
		map.put("begin_time", begin_time);
		if(end_time!=null && !end_time.equals("")){
			int endtime = Integer.parseInt(end_time.substring(9))+1;
			end_time=end_time.substring(0,9)+String.valueOf(endtime);
			map.put("end_time", end_time);	
			  }
		//String bespeak_date = request.getParameter("bespeak_date");
		//map.put("bespeak_date", bespeak_date);
		List<Map> DrvCaseManageInfoList = new ArrayList<Map>();
		try {
			DrvCaseManageInfoList = (List<Map>)drvCaseManageInfoService.findAllPlantCaseInfo("com.nasoft.aboutcar.DrvCaseManageMapper.findAllPlantCaseInfo",map);
			for(Map m :DrvCaseManageInfoList ){
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:MM:SS");
				System.out.println(m.get("caseTime"));
				m.put("casetime", dateFormat.format((Date) m.get("casetime")));
				m.put("updatetime", dateFormat.format((Date) m.get("updatetime")));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(DrvCaseManageInfoList.toArray());
		writer(response, array+"");
	}
	
	/**
	 * 案件修改
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/drvcaserevise")
	public ModelAndView caseRevise(HttpServletRequest request, HttpServletResponse response, DrvCaseManageInfo drvCaseManageInfo){
		ModelAndView mv=new ModelAndView();
		DrvPlantManageHisInfo drvPlantManageHisInfo = new DrvPlantManageHisInfo();
		String caseId = request.getParameter("caseId");
		String msg="";
		//获取当前登录用户
		MngUserInfo currentUser = getCurrentUser();
		drvCaseManageInfo.setCaseuserid(currentUser.getRealName());
		
		drvCaseManageInfo.setUpdatetime(new Date());
		drvCaseManageInfo.setCarid(caseId);
		drvCaseManageInfo.setCaseuserid(currentUser.getRealName());
		ArrayList strarr = new ArrayList();
		ArrayList strlist = new ArrayList();
		String alterzd = request.getParameter("alterzd");
		try{
			int result = drvCaseManageInfoService.updateplantCaseInfo("com.nasoft.aboutcar.DrvCaseManageMapper.updateCaseManageInfo", drvCaseManageInfo);
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
						drvPlantManageHisInfo.setAltercontentb(value);
						drvPlantManageHisInfo.setAlterzd(name);
						drvPlantManageHisInfo.setCaseId(caseId);
						drvPlantManageHisInfo.setUpdatetime(new Date());
						drvPlantManageHisInfo.setUpduserid(currentUser.getRealName());
						if(name.equals("车牌号")){
							drvPlantManageHisInfo.setAltercontenta(drvCaseManageInfo.getCarid());
						}
						else if (name.equals("驾驶证号码")) {
							drvPlantManageHisInfo.setAltercontenta(drvCaseManageInfo.getDrivcarno());
						}
						else if (name.equals("司机姓名")) {
							drvPlantManageHisInfo.setAltercontenta(drvCaseManageInfo.getDrivename());
						}
						else if (name.equals("平台名称")) {
							drvPlantManageHisInfo.setAltercontenta(drvCaseManageInfo.getPlateName());
						}
						else if (name.equals("案件来源")) {
							drvPlantManageHisInfo.setAltercontenta(drvCaseManageInfo.getCasesource());
						}
						else if (name.equals("案件状态")) {
							drvPlantManageHisInfo.setAltercontenta(drvCaseManageInfo.getIsregister());
						}
						else if (name.equals("行政区划")) {
							drvPlantManageHisInfo.setAltercontenta(drvCaseManageInfo.getAreacode());
						}
						else if (name.equals("组织机构")) {
							drvPlantManageHisInfo.setAltercontenta(drvCaseManageInfo.getInstid());
						}
						else if (name.equals("案发时间")) {
							drvPlantManageHisInfo.setAltercontenta(drvCaseManageInfo.getCasetime());
						}
						else if (name.equals("案件事由")) {
							drvPlantManageHisInfo.setAltercontenta(drvCaseManageInfo.getCasereason());
						}
						int result1 = drvCaseManageInfoService.insertHis("com.nasoft.aboutcar.DrvCaseManageMapper.insertDrvPlantManageHisInfo", drvPlantManageHisInfo);
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
	 * 打开修改案件详情
	 * @return
	 */
	@RequestMapping("/drvmanagealter")
	public ModelAndView manageAlter(HttpServletRequest request, HttpServletResponse response){
		
		String caseid = request.getParameter("caseid");
		ModelAndView mv=new ModelAndView();
		try{
			List<Map> comlist = drvCaseManageInfoService.selectAllCompn("com.nasoft.aboutcar.administrativePenalty.selectComName");
			request.getSession().setAttribute("comlist", comlist);
			
			DrvCaseManageInfo drvCaseManageInfo = drvCaseManageInfoService.manageDetail("com.nasoft.aboutcar.DrvCaseManageMapper.manageDetail", caseid);
			mv.addObject("DrvCaseManageInfo", drvCaseManageInfo);
			mv.setViewName("administrativePenalty/drvManageAlter");
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
		
		String caseId = request.getParameter("caseid");
		ModelAndView mv=new ModelAndView();
		try{
			List<Map> drvPlantManageHisInfo = drvCaseManageInfoService.penaltyHistory("com.nasoft.aboutcar.DrvCaseManageMapper.manageHistory", caseId);
			
			for(Map mm :drvPlantManageHisInfo ){
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:MM:SS");
				/*m.put("casetime", dateFormat.format((Date) m.get("casetime")));*/
				mm.put("updatetime", dateFormat.format((Date) mm.get("updatetime")));
			}

			mv.addObject("DrvPlantManageHisInfo", drvPlantManageHisInfo);
			mv.setViewName("administrativePenalty/drvPenaltyHistory");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return mv;
	}
		
	}
	
	
	

