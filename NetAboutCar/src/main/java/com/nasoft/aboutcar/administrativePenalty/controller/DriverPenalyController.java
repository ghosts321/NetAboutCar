package com.nasoft.aboutcar.administrativePenalty.controller;


import java.text.SimpleDateFormat;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.nasoft.aboutcar.administrativePenalty.domain.CaseDealInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvCaseDealInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvPlantCaseInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantCaseDealHis;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantCaseInfo;
import com.nasoft.aboutcar.administrativePenalty.service.DrvPlantCaseInfoService;
import com.nasoft.aboutcar.administrativePenalty.service.PlantCaseInfoService;
import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.car.domain.CarInfo;
import com.nasoft.aboutcar.car.service.CarService;
import com.nasoft.aboutcar.complaint.domain.comComplainInfo;
import com.nasoft.aboutcar.complaint.domain.drvComplainDistribute;
import com.nasoft.aboutcar.complaint.domain.drvComplainInfo;
import com.nasoft.aboutcar.credit.domain.Events;
import com.nasoft.aboutcar.credit.service.EventsService;
import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;
import com.nasoft.aboutcar.msgnotice.domain.MsgNotice;
import com.nasoft.aboutcar.msgnotice.service.MsgNoticeService;
import com.nasoft.aboutcar.platform.domain.Platform;
import com.nasoft.aboutcar.supervise.domain.DrvIllegalInfo;
import com.nasoft.util.DateUtil;
import com.nasoft.util.FtpUtil;



@Controller
@RequestMapping("/drvpenalty")
public class DriverPenalyController extends BaseController {
	
	@Resource
	private DrvPlantCaseInfoService drvplantCaseInfoService;
	@Resource
	private  PlantCaseInfoService plantCaseInfoService;
	@Resource
	private MsgNoticeService msgNoticeService;
	@Resource
	private CarService carService;
	@Resource
	private EventsService eventsService;
	/**
	 * 
	 * 打开行政处罚
	 * @return
	 */
	@RequestMapping("/drvindex")
	public String index(){
		return "administrativePenalty/driverpenaltyIndex";
	}
	
	/**
	 * 
	 * 打开行政处罚列表
	 * @return
	 */
	@RequestMapping("/drvfindAllPunishList")
	public void drvfindAllPunishList(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> map = new HashMap<String, Object>();
		String id = request.getParameter("id");
		String carid=request.getParameter("carid");
		String caseId = request.getParameter("caseId");
		String status = request.getParameter("status");
		String beginTime = request.getParameter("beginTime");
		String endTime = request.getParameter("endTime");
		map.put("carid", carid);
		map.put("id", id);
		map.put("caseId", caseId);
		map.put("iding", status);
		map.put("beginTime", beginTime);		
		if(endTime!=null && !endTime.equals("")){
			int endtime = Integer.parseInt(endTime.substring(9))+1;
			endTime=endTime.substring(0,9)+String.valueOf(endtime);
			map.put("endTime", endTime);	
			  }	
		//String bespeak_date = request.getParameter("bespeak_date");
		//map.put("bespeak_date", bespeak_date);
		List<DrvPlantCaseInfo> DrvplantCaseInfoList = new ArrayList<DrvPlantCaseInfo>();
		List<DrvPlantCaseInfo> DrvplantCaseInfoLists = new ArrayList<DrvPlantCaseInfo>();	
		try {
			DrvplantCaseInfoList = drvplantCaseInfoService.findAllPlantCaseInfo("com.nasoft.aboutcar.DrvPlantCaseInfoMapper.findAllDrvPlantcaseinfo",map);
			
			for(int i=0;i<=DrvplantCaseInfoList.size()-1;i++){				
				DrvPlantCaseInfo DrvPlantCaseInfo = DrvplantCaseInfoList.get(i);
				String caseTime = DrvPlantCaseInfo.getCasetime().substring(0,19);
				String updatetime = DrvPlantCaseInfo.getUpdatetime().substring(0,19);
				DrvPlantCaseInfo.setUpdatetime(updatetime);
				DrvPlantCaseInfo.setCasetime(caseTime);
				DrvplantCaseInfoLists.add(DrvPlantCaseInfo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(DrvplantCaseInfoList.toArray());
		writer(response, array+"");
	}
	
	/**
	 * 打开新增案件
	 * @return
	 */
	@RequestMapping("/drvpenaltyAdd")
	public ModelAndView drvpenaltyAdd(){
		
		ModelAndView mv=new ModelAndView();
		try{
			List<Platform> platformList = plantCaseInfoService.selectAllPlatForm("com.nasoft.aboutcar.administrativePenalty.selectAllPlatForm");
			mv.addObject("platformList", platformList);
			mv.setViewName("administrativePenalty/drvpenaltyAdd");
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 新增案件
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/drvAddCase")
	public String drvAddCase(DrvPlantCaseInfo drvPlantCaseInfo,HttpServletRequest request,@RequestParam(value="compnfile",required=false) MultipartFile compn_file,
			 @RequestParam(value="punishfile",required=false) MultipartFile punish_file,
			   SimpleDateFormat sdf ) throws Exception {
		//解析jdbc配置上传地址
		InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
		Properties p = new Properties();
	    p.load(in);
		String hostname = p.getProperty("ftp.hostname");
		int port = Integer.valueOf(p.getProperty("ftp.port"));
		String username = p.getProperty("ftp.username");
		String password = p.getProperty("ftp.password");
		
		
		int d = (int)(Math.random()*(9999-1000+1))+1000;
		String caseid = "C"+d;
		String punishid = "D"+d;
		drvPlantCaseInfo.setCaseid(caseid);//设置案件ID
		drvPlantCaseInfo.setPunishid(punishid);//设置处罚ID
		MngUserInfo currentUser = getCurrentUser();
		drvPlantCaseInfo.setCreateuserid(currentUser.getUserId());
		drvPlantCaseInfo.setCreateinstid(currentUser.getInstId());
		drvPlantCaseInfo.setCaseuserid(currentUser.getRealName());
		drvPlantCaseInfo.setCaseType("00");
		drvPlantCaseInfo.setDealstatus("04");
		drvPlantCaseInfo.setUpdatetime(DateUtil.DateTimeFormat(new Date()));
		drvPlantCaseInfo.setUpdatetime(DateUtil.DateTimeFormat(new Date()));
		String pathnameE = "upload/administrativePenalty/"+drvPlantCaseInfo.getCaseid()+"/administrative" ;
		String pathnameP = "upload/administrativePenalty/"+drvPlantCaseInfo.getPunishid()+"/administrative" ;
		String survey_filePath = ""; //投诉文件	
		String s1="";
		if(compn_file!=null && !compn_file.equals("")&&compn_file.getSize()>0){
			//获取文件后缀名
			String carFileSuffix = compn_file.getOriginalFilename().substring(compn_file.getOriginalFilename().lastIndexOf("."));     
			//调查文件
			String surveyData =drvPlantCaseInfo.getPunishid();//为上传文件取名字
			String surverFileName = surveyData+carFileSuffix;//组成上传文件全名
			InputStream inputStream  = compn_file.getInputStream();//IO流
			FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathnameE, surverFileName, inputStream);//上传文件
			survey_filePath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathnameE+"/"+surverFileName;//上传的全路径
			s1+=survey_filePath+";";
			System.out.println(s1);
			s1=s1.substring(0, s1.length()-1);
			 //comcomplaininfo.setCompn_file(s1);
			drvPlantCaseInfo.setEvidenceurl(s1);
		}
		
		if(punish_file!=null && !punish_file.equals("")&&punish_file.getSize()>0){
			//获取文件后缀名
			String carFileSuffix = punish_file.getOriginalFilename().substring(punish_file.getOriginalFilename().lastIndexOf("."));     
			//调查文件
			String surveyData =drvPlantCaseInfo.getPunishid();//为上传文件取名字
			String surverFileName = surveyData+carFileSuffix;//组成上传文件全名
			InputStream inputStream  = punish_file.getInputStream();//IO流
			FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathnameE, surverFileName, inputStream);//上传文件
			survey_filePath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathnameE+"/"+surverFileName;//上传的全路径
			s1+=survey_filePath+";";
			System.out.println(s1);
			s1=s1.substring(0, s1.length()-1);
			 //comcomplaininfo.setCompn_file(s1);
			drvPlantCaseInfo.setPunishurl(s1);
		}
		
		
		drvPlantCaseInfo.setCreatetime(DateUtil.DateTimeFormat(new Date()));
		drvPlantCaseInfo.setUpduserid(currentUser.getUserId());
		drvPlantCaseInfo.setUpdinstid(currentUser.getInstId());
		drvPlantCaseInfo.setCreateuserid(currentUser.getUserId());
		drvPlantCaseInfo.setCreateinstid(currentUser.getInstId());
		drvPlantCaseInfo.setUpdatetime(DateUtil.DateTimeFormat(new Date()));
		int result = drvplantCaseInfoService.insert("com.nasoft.aboutcar.DrvPlantCaseInfoMapper.drvplantCaseInfoInsert", drvPlantCaseInfo);
		if(result>0){
			return "save_result";
		}else{
			return "fail";
		}

		
	}
	
	
	/**
	 *删除案件
	 * @return
	 */
	@RequestMapping("/deleteDrvCase")
	public void deleteDrvCase(HttpServletRequest request, HttpServletResponse response){
		
		String caseId = request.getParameter("caseIds");
		String result = "";
		try {
			int results = drvplantCaseInfoService.delDrvCaseInfoByCaseId("com.nasoft.aboutcar.DrvPlantCaseInfoMapper.delDrvCaseDealInfoByCaseId",caseId);
			if(results>0){
				
				result = "success";
			}else{
				result = "fail";
			}
		} catch (Exception e) {
			result = "fail";
			e.printStackTrace();
		}
		writer(response, result);
	}
	
	
	/**
	 * 打开修改案件
	 * @return
	 */
	@RequestMapping("/drvpenaltyAlter")
	public ModelAndView toAlter(HttpServletRequest request, HttpServletResponse response){
		
		String caseid = request.getParameter("caseid");
		ModelAndView mv=new ModelAndView();
		try{
			DrvPlantCaseInfo drvPlantCaseInfo = drvplantCaseInfoService.drvpenaltyDetail("com.nasoft.aboutcar.DrvPlantCaseInfoMapper.drvpenaltyDetail", caseid);
			mv.addObject("drvPlantCaseInfo", drvPlantCaseInfo);
			mv.setViewName("administrativePenalty/drvCaseAlter");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return mv;
	}
	
	/**
	 * 打开案件详情
	 * @return
	 */
	@RequestMapping("/drvpenaltyDetail")
	public ModelAndView drvtrainingDetail(HttpServletRequest request, HttpServletResponse response){
		
		String caseid = request.getParameter("caseid");
		ModelAndView mv=new ModelAndView();
		try{
			DrvPlantCaseInfo drvPlantCaseInfo = drvplantCaseInfoService.drvpenaltyDetail("com.nasoft.aboutcar.DrvPlantCaseInfoMapper.drvpenaltyDetail", caseid);
				
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date casetime = dateFormat.parse(drvPlantCaseInfo.getCasetime());
				drvPlantCaseInfo.setCasetime(dateFormat.format(casetime));
			
			mv.addObject("drvPlantCaseInfo", drvPlantCaseInfo);
			mv.setViewName("administrativePenalty/drvPenaltyDetail");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return mv;
	}
	
	/**
	 * 打开案件详情
	 * @return
	 */
	@RequestMapping("/generalDrvPenaltyDetail")
	public ModelAndView generalDrvPenaltyDetail(HttpServletRequest request, HttpServletResponse response){
		
		String caseid = request.getParameter("caseid");
		ModelAndView mv=new ModelAndView();
		try{

			DrvPlantCaseInfo drvPlantCaseInfo = drvplantCaseInfoService.drvpenaltyDetail("com.nasoft.aboutcar.DrvPlantCaseInfoMapper.drvpenaltyDetail", caseid);
			DrvIllegalInfo drvIllegalInfo = new DrvIllegalInfo();
			drvComplainInfo drvcomplaintinfo = new drvComplainInfo();
			drvComplainDistribute  drvComplainDistribute = new drvComplainDistribute();
			String caseIds = caseid.substring(1);
			if(drvPlantCaseInfo.getCasesource().equals("01")){
				drvIllegalInfo = drvplantCaseInfoService.findDrvIllegalByCaseId("com.nasoft.aboutcar.DrvPlantCaseInfoMapper.findDrvIllegalByCaseId", caseIds);

			}else if(drvPlantCaseInfo.getCasesource().equals("02")){
				 drvcomplaintinfo  = drvplantCaseInfoService.findDrvComplainByCaseId("com.nasoft.aboutcar.DrvPlantCaseInfoMapper.findDrvComplainByCaseId", caseIds);
				 drvComplainDistribute = drvplantCaseInfoService.findDrvComplainDisByCaseId("com.nasoft.aboutcar.DrvPlantCaseInfoMapper.findDrvComplainDisByCaseId", caseIds);

			}
			
			/*SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date casetime = dateFormat.parse(drvPlantCaseInfo.getCasetime());
			drvPlantCaseInfo.setCasetime(dateFormat.format(casetime));*/
			
			String caseTime = drvPlantCaseInfo.getCasetime().substring(0,19);
			String updateTime = "";
			if(drvPlantCaseInfo.getUpdatetime()!=null){
				updateTime = drvPlantCaseInfo.getUpdatetime().substring(0,19);

			}
			drvPlantCaseInfo.setCasetime(caseTime);
			drvPlantCaseInfo.setUpdatetime(updateTime);
			
			
			/*Date updatetime = dateFormat.parse(drvPlantCaseInfo.getUpdatetime());
			drvPlantCaseInfo.setUpdatetime(dateFormat.format(updatetime));*/
			
			mv.addObject("drvcomplaintinfo", drvcomplaintinfo);
			mv.addObject("drvIllegalInfo", drvIllegalInfo);
			mv.addObject("drvPlantCaseInfo", drvPlantCaseInfo);
			mv.addObject("drvComplainDistribute", drvComplainDistribute);
			mv.setViewName("administrativePenalty/acceptDrvPenaltyDetail");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return mv;
	}
	
	
	/**
	 * 李阳
	 * 案件受理立案处理
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("toAcceptRegister")
	public String  toAcceptRegister(DrvPlantCaseInfo drvPlantCaseInfo,HttpServletRequest request, HttpServletResponse response) throws Exception{
		String id = request.getParameter("id");
		String msg="";
		MngUserInfo currentUser = getCurrentUser();
		String caseId = drvPlantCaseInfo.getCaseid();
		DrvPlantCaseInfo drvPlantCaseInfos = drvplantCaseInfoService.drvpenaltyDetail("com.nasoft.aboutcar.DrvPlantCaseInfoMapper.drvpenaltyDetail", caseId);
		String carId = drvPlantCaseInfos.getCarid();
		CarInfo carInfo=carService.findCarInfoByCarId("com.nasoft.aboutcar.car.findCarByCarId", carId);

		DrvCaseDealInfo drvCaseDealInfo = new DrvCaseDealInfo();
		drvCaseDealInfo.setDealStatus("01");
		drvCaseDealInfo.setCaseId(caseId);
		drvCaseDealInfo.setDealUserId(currentUser.getUserId());
		//caseDealInfo.setLastDealUserId(Integer.parseInt(plantCaseInfos.getCaseUserId()));
		drvCaseDealInfo.setDealView(drvPlantCaseInfos.getCasereason());
		drvCaseDealInfo.setCreateUserId(currentUser.getUserId());
		drvCaseDealInfo.setCreateTime(DateUtil.DateTimeFormat(new Date()));
		drvCaseDealInfo.setEndUpdateTime(DateUtil.DateTimeFormat(new Date()));
		if(id.equals("00")){
			drvPlantCaseInfos.setDealstatus("01");
		}else if(id.equals("01")){
			drvPlantCaseInfos.setDealstatus("02");
		}else if(id.equals("02")){
			drvPlantCaseInfos.setDealstatus("04");
			if(carInfo!=null){
				addMsgNotice(request,carInfo.getCertNo(),"行政处罚");				
			}
		}else if(id.equals("03")){
			
			drvPlantCaseInfos.setDealstatus("05");

			Events events = new Events();
			events.setCreate_time(new Date());
			if(drvPlantCaseInfos.getCasesource().equals("01")){
				events.setData_source("稽查执法查扣违章");
			}else if(drvPlantCaseInfos.getCasesource().equals("02")){
				events.setData_source("信访投诉违章");
			}else if(drvPlantCaseInfos.getCasesource().equals("03")){
				events.setData_source("行政处罚");
			}
			String caseIds = caseId.substring(1);
			events.setEvent_no(DateUtil.dateToString(new Date(), DateUtil.SDFyyyyMMddHHmmss2)+"_"+caseIds);
			events.setStorage_date(new Date());
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
			events.setOccur_date(dateFormat.parse(drvPlantCaseInfos.getCasetime()));
			events.setdriver_certno(drvPlantCaseInfos.getDrivcarno());
			events.setEvent_status("未处理");
			events.setEvent_desc("驾驶员违法经营");
			events.setUpdate_time(new Date());
			events.setArCode(drvPlantCaseInfos.getCasereason());
			eventsService.addEvents("com.nasoft.aboutcar.Events.addEvents", events);
		}
		drvPlantCaseInfos.setUpdatetime(DateUtil.DateTimeFormat(new Date()));
		drvPlantCaseInfos.setDealview(drvPlantCaseInfo.getDealview());
		drvPlantCaseInfos.setEvidenceview(drvPlantCaseInfo.getEvidenceview());
		drvPlantCaseInfos.setPunishtype(drvPlantCaseInfo.getPunishtype());
		drvPlantCaseInfos.setPunishcontent(drvPlantCaseInfo.getPunishcontent());
		int result = drvplantCaseInfoService.updateplantCaseInfo("com.nasoft.aboutcar.DrvPlantCaseInfoMapper.updateDrvCaseInfo", drvPlantCaseInfos);
		if(result>0){
			PlantCaseDealHis plantCaseDealHis = new PlantCaseDealHis();
			int results = drvplantCaseInfoService.updateplantCaseInfo("com.nasoft.aboutcar.DrvPlantCaseInfoMapper.updateDrvCaseInfo", drvPlantCaseInfos);
			if(results>0){
				
				
				plantCaseDealHis.setCaseId(caseId);
				plantCaseDealHis.setDealRoleId(currentUser.getRealName());
				plantCaseDealHis.setDealUserId(currentUser.getRealName());
				if(id.equals("00")){
					plantCaseDealHis.setDealStatus("01");
					plantCaseDealHis.setDealContent("受理");
				}else if(id.equals("01")){
					plantCaseDealHis.setDealStatus("02");
					plantCaseDealHis.setDealContent("处理中");
				}else if(id.equals("02")){
					plantCaseDealHis.setDealStatus("03");
					plantCaseDealHis.setDealContent("处罚告知");
				}else if(id.equals("03")){
					
				}
				plantCaseDealHis.setDealView(drvPlantCaseInfo.getDealview());
				plantCaseDealHis.setDealDateTime(DateUtil.DateTimeFormat(new Date()));
				int resultss = plantCaseInfoService.insertPlantCaseDealHis("com.nasoft.aboutcar.administrativePenalty.insertPlantCaseDealHis", plantCaseDealHis);
			
			msg="save_result";
		}else{
			msg="failed";
		}
		}else{
			msg="failed";
		}
		return msg;
	}
	/**
	 * 案件修改
	 * @return
	 */
	@RequestMapping("/drvCaseAlter")
	public ModelAndView drvCaseAlter(HttpServletRequest request, HttpServletResponse response, DrvPlantCaseInfo drvPlantCaseInfo){
		ModelAndView mv=new ModelAndView();
		String msg="";
		//获取当前登录用户
		MngUserInfo currentUser = getCurrentUser();
		
		drvPlantCaseInfo.setCaseuserid(currentUser.getRealName());
		
		drvPlantCaseInfo.setUpdatetime(DateUtil.DateTimeFormat(new Date()));


		try{
			int result = drvplantCaseInfoService.updateplantCaseInfo("com.nasoft.aboutcar.DrvPlantCaseInfoMapper.updateDrvCaseInfo", drvPlantCaseInfo);
			if(result>0){
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
	 * 李阳
	 * 打开受理案件
	 * @return
	 */
	@RequestMapping("/accept")
	public String accept(){
		return "administrativePenalty/acceptDrvPenalty";
	}
	
	/**
	 * 打开新增简易处罚
	 * @return
	 */
	@RequestMapping("/generalAddOpen")
	public ModelAndView generalAddOpen(){
		
		ModelAndView mv=new ModelAndView();
		try{
			List<Platform> platformList = plantCaseInfoService.selectAllPlatForm("com.nasoft.aboutcar.administrativePenalty.selectAllPlatForm");
			mv.addObject("platformList", platformList);
			mv.setViewName("administrativePenalty/generalDvpenaltyAdd");
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
	}
	
	
	/**
	 * 新增一般处罚案件
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/generalCaseAdd")
	public String generalCaseAdd(DrvPlantCaseInfo drvPlantCaseInfo,HttpServletRequest request) throws Exception {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String msg = "";
		int d = (int)(Math.random()*(9999-1000+1))+1000;
		String caseid = "C"+DateUtil.dateToString(new Date(), DateUtil.SDFyyyyMMddHHmmss2);
		String punishid = "D"+DateUtil.dateToString(new Date(), DateUtil.SDFyyyyMMddHHmmss2);
		drvPlantCaseInfo.setCaseid(caseid);//设置案件ID
		drvPlantCaseInfo.setPunishid(punishid);//设置处罚ID
		MngUserInfo currentUser = getCurrentUser();
		drvPlantCaseInfo.setCreateuserid(currentUser.getUserId());
		drvPlantCaseInfo.setCreateinstid(currentUser.getInstId());
		drvPlantCaseInfo.setCaseuserid(currentUser.getRealName());
		drvPlantCaseInfo.setUpdatetime(dateFormat.format(new Date()));
		drvPlantCaseInfo.setDealstatus("00");//添加处理状态为受理
		drvPlantCaseInfo.setCaseType("01");//添加处理状态为一般处罚
		
		try{
			
			int result = drvplantCaseInfoService.insert("com.nasoft.aboutcar.DrvPlantCaseInfoMapper.drvplantCaseInfoInsert", drvPlantCaseInfo);
			if(result>0){
				msg="save_result";
			}else{
				msg="failed";
			}

		}catch(Exception e){
			
			e.printStackTrace();
			msg="failed";
		}


		return msg;
	}
	
	
	/**
	 * 李阳
	 * 受理案件不立案处理
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/toNotAcceptRegister")
	public String  toNotAcceptRegister(DrvPlantCaseInfo drvPlantCaseInfo,HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		String caseId = drvPlantCaseInfo.getCaseid();
		String result = "";
		map.put("caseId", caseId);
		List<CaseDealInfo> caseDealInfoList = new ArrayList<CaseDealInfo>();
		try {
			//删除案件表
			int results = drvplantCaseInfoService.delDrvCaseInfoByCaseId("com.nasoft.aboutcar.DrvPlantCaseInfoMapper.delDrvCaseDealInfoByCaseId",caseId);
			//result = "save_result";
			/*if(results>0){
				caseDealInfoList = plantCaseInfoService.findAllDealCaseInfoByCaseId("com.nasoft.aboutcar.administrativePenalty.findPlantCaseInfoByCaseId",map);
				if(caseDealInfoList.size()>0){
					int resultss = plantCaseInfoService.delCaseDealInfoByCaseId("com.nasoft.aboutcar.administrativePenalty.deleteCaseDealByCaseId",caseId);
					if(resultss>0){
						result = "success";
					}else{
						result = "fail";
					}
				}else{
					result = "success";
				}
				
				
			}else{
				result = "fail";
			}*/
			if(results>0){
				
				result="save_result";
			}
			
		} catch (Exception e) {
			result = "fail";
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 
	 * 驾驶员驾驶证号验证
	 * @return
	 */
	@RequestMapping("getDrvno")
	public void getDrvno(HttpServletRequest request,HttpServletResponse response) {
		String drivcarno = request.getParameter("drivcarno");
		try {
			List<Map> result = drvplantCaseInfoService.getDrvno("com.nasoft.aboutcar.DrvPlantCaseInfoMapper.getDrvno",drivcarno);
			if(result.size()>0){
				writer(response, "success");
			}else{
				writer(response, "erro");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 增加一条消息通知记录
	 * @param request
	 * @param certno
	 * @param msgcontent
	 */
	public void addMsgNotice(HttpServletRequest request,String certno,String msgcontent){
		try {
			MsgNotice msgNotice = new MsgNotice();
			msgNotice.setCertno(certno);
			msgNotice.setIsread("0");
			msgNotice.setMsgcontent(msgcontent);
			MngUserInfo mngUserInfo = (MngUserInfo) request.getSession().getAttribute("mngUserInfo");
			if(null != mngUserInfo){
				msgNotice.setUserid(mngUserInfo.getUserId());
			}
			msgNotice.setCreatetime(new Date());
			msgNoticeService.addMsgNotice("com.nasoft.aboutcar.MsgNoticeMapper.addMsgNotice",msgNotice);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 李阳
	 * 打开受理案件
	 * @return
	 */
	@RequestMapping("/accepting")
	public String accepting(){
		return "administrativePenalty/acceptingDrvPenalty";
	}
	
	
	/**
	 * 打开处罚告知
	 * @return
	 */
	@RequestMapping("/endPenalty")
	public String endPenalty(){
		
		return "administrativePenalty/endDrvPenalty";
	}
	
	/**
	 * 打开结案
	 * @return
	 */
	@RequestMapping("/informPenalty")
	public String informPenalty(){
		
		return "administrativePenalty/informDrvPenalty";
	}
	
	/**
	 * 打开案件修改
	 * @return
	 */
	@RequestMapping("/drvcaseAlterUpdate")
	public String caseAlterUpdate(){
		return "administrativePenalty/caseAlterUpdate";
	}
	
	/**
	 * 打开案件修改历史
	 * @return
	 */
	@RequestMapping("/drvcaseAlterHis")
	public String caseAlterHis(){
		return "administrativePenalty/caseAlterHis";
	}
	
	/**
	 * 案件管理》规范用语查询
	 * @return
	 */
	@RequestMapping("/drvstandardLang")
	public String standardLang(){
		return "administrativePenalty/standardLang";
	}
	
	/**
	 * 规范用语修改
	 * @return
	 */
	@RequestMapping("/drvstandardLangUpdate")
	public String standardLangUpdate(){
		return "administrativePenalty/standardLangUpdate";
	}
	
	/**
	 * 规范用语新增
	 * @return
	 */
	@RequestMapping("/drvstandardLangAdd")
	public String standardLangAdd(){
		return "administrativePenalty/standardLangAdd";
	}
	
	/**
	 * 案件管理》常见意见
	 * @return
	 */
	@RequestMapping("/drvcommonOpin")
	public String commonOpin(){
		return "administrativePenalty/commonOpin";
	}
	
	/**
	 * 常见意见修改
	 * @return
	 */
	@RequestMapping("/drvcommonOpinUpdate")
	public String commonOpinUpdate(){
		return "administrativePenalty/commonOpinUpdate";
	}
	
	/**
	 * 常见意见新增
	 * @return
	 */
	@RequestMapping("/drvcommonOpinAdd")
	public String commonOpinAdd(){
		return "administrativePenalty/commonOpinAdd";
	}
	
	/**
	 * 查询统计》处罚案件查询
	 * @return
	 */
	@RequestMapping("/drvpenaltyQuery")
	public String penaltyQuery(){
		return "administrativePenalty/penaltyQuery";
	}
	
	/**
	 * 查询统计》处罚案件统计
	 * @return
	 */
	@RequestMapping("/drvpenaltyStat")
	public String penaltyStat(){
		return "administrativePenalty/penaltyStat";
	}
	
}
