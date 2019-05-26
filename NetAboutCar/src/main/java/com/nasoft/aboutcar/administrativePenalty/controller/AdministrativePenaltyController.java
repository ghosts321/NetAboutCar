package com.nasoft.aboutcar.administrativePenalty.controller;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.io.IOException;
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

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.nasoft.aboutcar.administrativePenalty.domain.CaseDealInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvPlantCaseInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantCaseDealHis;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantCaseInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantPunishHistoryInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.StandardTermInfo;
import com.nasoft.aboutcar.administrativePenalty.service.DrvPlantCaseInfoService;
import com.nasoft.aboutcar.administrativePenalty.service.PlantCaseInfoService;
import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.complaint.domain.comComplainInfo;
import com.nasoft.aboutcar.complaint.domain.drvComplainDistribute;
import com.nasoft.aboutcar.credit.domain.Events;
import com.nasoft.aboutcar.credit.service.EventsService;
import com.nasoft.aboutcar.exam.domain.MngExamBespeak;
import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;
import com.nasoft.aboutcar.msgnotice.domain.MsgNotice;
import com.nasoft.aboutcar.msgnotice.service.MsgNoticeService;
import com.nasoft.aboutcar.pilotapply.service.DrvExamresultService;
import com.nasoft.aboutcar.platform.domain.Platform;
import com.nasoft.aboutcar.supervise.domain.CarIllegalInfo;
import com.nasoft.aboutcar.supervise.domain.DrvIllegalInfo;
import com.nasoft.util.DateUtil;
import com.nasoft.util.FtpUtil;

import net.sf.json.JSONArray;

/**
 * 行政处罚
 * @author wanglei
 * @version 0.0.1
 * @date 2017/3/9 16:11
 *
 */
@Controller
@RequestMapping("/penalty")
public class AdministrativePenaltyController extends BaseController {
	
	
	@Resource
	private  PlantCaseInfoService plantCaseInfoService;
	@Resource
	private MsgNoticeService msgNoticeService;
	@Resource
	private EventsService eventsService;
	@Resource
	private DrvPlantCaseInfoService drvplantCaseInfoService;
	/**
	 * 李阳
	 * 打开行政处罚
	 * @return
	 */
	@RequestMapping("/index")
	public String index(){
		return "administrativePenalty/penaltyIndex";
	}
	
	/**
	 * 李阳
	 * 打开处罚列表
	 * @return
	 */
	@RequestMapping("/findAllPunishList")
	public void findAllPunishList(HttpServletRequest request, HttpServletResponse response,PlantCaseInfo plantCaseInfo){
		Map<String, Object> map = new HashMap<String, Object>();
		//获取处理状态  根据处理状态查询
		String id = request.getParameter("id");
		String iding = request.getParameter("status");
		String caseId = request.getParameter("caseId");
		plantCaseInfo.setCaseId(caseId);
		plantCaseInfo.setId(id);
		plantCaseInfo.setIding(iding);
		String beginTime = request.getParameter("beginTime");
		String endTime = request.getParameter("endTime");
		map.put("id", id);
		map.put("iding", iding);
		map.put("caseId", caseId);
		map.put("beginTime", beginTime);
		
		if(endTime!=null && !endTime.equals("")){
			int endtime = Integer.parseInt(endTime.substring(9))+1;
			endTime=endTime.substring(0,9)+String.valueOf(endtime);
			map.put("endTime", endTime);	
			  }

		List<PlantCaseInfo> plantCaseInfoList = new ArrayList<PlantCaseInfo>();
		List<PlantCaseInfo> plantCaseInfoLists = new ArrayList<PlantCaseInfo>();

		try {
			plantCaseInfoList = plantCaseInfoService.findAllPlantCaseInfo("com.nasoft.aboutcar.administrativePenalty.findAllPlantcaseinfo",map);
			String updateTime = "";
			for(int i=0;i<=plantCaseInfoList.size()-1;i++){
			
			PlantCaseInfo plantCaseInfos = plantCaseInfoList.get(i);
			String caseTime = plantCaseInfos.getCaseTime().substring(0,19);
			if( plantCaseInfos.getUpdateTime()!=null){
				updateTime = plantCaseInfos.getUpdateTime().substring(0,19);

			}
			plantCaseInfos.setCaseTime(caseTime);
			plantCaseInfos.setUpdateTime(updateTime);
			plantCaseInfoLists.add(plantCaseInfos);
		}
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(plantCaseInfoLists.toArray());
		writer(response, array+"");
	}
	
	
	/**
	 * 打开新增简易处罚
	 * @return
	 */
	@RequestMapping("/penaltyAdd")
	public ModelAndView trainingAdd(HttpServletRequest request, HttpServletResponse response){
		
		String caseId = request.getParameter("caseId");
		ModelAndView mv=new ModelAndView();
		try{
			List<Platform> platformList = plantCaseInfoService.selectAllPlatForm("com.nasoft.aboutcar.administrativePenalty.selectAllPlatForm");
			mv.addObject("platformList", platformList);
			mv.setViewName("administrativePenalty/penaltyAdd");
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
		
	}
	
	/**
	 * 新增简易处罚案件
	 * @param request
	 * @param response
	 * @return
	 * @throws IOExceptionn 
	 */
	@RequestMapping("/addCase")
	public String addCase(HttpServletRequest request,HttpServletResponse response,PlantCaseInfo plantCaseInfo,
			 @RequestParam(value="compnfile",required=false) MultipartFile tsFile,
			 @RequestParam(value="punishfile",required=false) MultipartFile dcFile,
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
		String caseId = "C"+d;
		String punishId = "D"+d;
		plantCaseInfo.setCaseId(caseId);//设置案件ID
		plantCaseInfo.setPunishId(punishId);//设置处罚ID
		MngUserInfo currentUser = getCurrentUser();
		plantCaseInfo.setInstId(currentUser.getInstId());
		plantCaseInfo.setCaseType("00");
		plantCaseInfo.setDealStatus("04");
		plantCaseInfo.setCaseUserId(currentUser.getRealName());
		plantCaseInfo.setIsAppeal("00");
		
		
		plantCaseInfo.setCreateTime(DateUtil.DateTimeFormat(new Date()));
		plantCaseInfo.setUpdUserId(currentUser.getUserId()+"");
		plantCaseInfo.setUpdInstId(currentUser.getInstId());
		plantCaseInfo.setCreateUserId(currentUser.getUserId());
		plantCaseInfo.setCreateInstId(currentUser.getInstId());
		plantCaseInfo.setUpdateTime(DateUtil.DateTimeFormat(new Date()));

		
		String pathname = "upload/administrativePenalty/"+plantCaseInfo.getCaseId();//上传基础路径
		String survey_filePath = ""; //投诉文件	
		String s1="";
		if(tsFile!=null && !tsFile.equals("")&&tsFile.getSize()>0){
			//获取文件后缀名
			String carFileSuffix = tsFile.getOriginalFilename().substring(tsFile.getOriginalFilename().lastIndexOf("."));     
			//投诉文件
			String tsfileDate="tsfile"+sdf.format(new Date());
			String tsFileName = tsfileDate+carFileSuffix;//组成上传文件全名
			InputStream inputStream  = tsFile.getInputStream();//IO流
			Boolean flag = FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, tsFileName, inputStream);//上传文件
			survey_filePath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+tsFileName;//上传的全路径
			s1+=survey_filePath+";";
			System.out.println(s1);
			s1=s1.substring(0, s1.length()-1);
			 //comcomplaininfo.setCompn_file(s1);
			plantCaseInfo.setEvidenceUrl(s1);
		}
		
		if(dcFile!=null && !dcFile.equals("")&&dcFile.getSize()>0){
			//获取文件后缀名
			String carFileSuffix = dcFile.getOriginalFilename().substring(dcFile.getOriginalFilename().lastIndexOf("."));     
			//调查文件
			String dcfileData =plantCaseInfo.getPunishId();//为上传文件取名字
			String dcFileName = dcfileData+carFileSuffix;//组成上传文件全名
			InputStream inputStream  = dcFile.getInputStream();//IO流
			FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, dcFileName, inputStream);//上传文件
			survey_filePath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+dcFileName;//上传的全路径
			s1+=survey_filePath+";";
			System.out.println(s1);
			s1=s1.substring(0, s1.length()-1);
			 //comcomplaininfo.setCompn_file(s1);
			plantCaseInfo.setPunishUrl(s1);
		}
		
		int result = plantCaseInfoService.insert("com.nasoft.aboutcar.administrativePenalty.plantCaseInfoInsert", plantCaseInfo);
		if(result>0){
			return "save_result";
			
		}else{
			return "fail";
		}

		
	}
	
	/**
	 * 打开新增一般处罚
	 * @return
	 */
	@RequestMapping("/generalAddOpen")
	public ModelAndView generalAddOpen(HttpServletRequest request,HttpServletResponse response){
		String caseId = request.getParameter("caseId");
		ModelAndView mv=new ModelAndView();
		try{
			List<Platform> platformList = plantCaseInfoService.selectAllPlatForm("com.nasoft.aboutcar.administrativePenalty.selectAllPlatForm");
			mv.addObject("platformList", platformList);
			mv.setViewName("administrativePenalty/generalCaseAdd");
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
	public String generalCaseAdd(PlantCaseInfo plantCaseInfo,HttpServletRequest request) throws Exception {
		
		int d = (int)(Math.random()*(9999-1000+1))+1000;
		String caseId = "C"+DateUtil.dateToString(new Date(), DateUtil.SDFyyyyMMddHHmmss2);
		String punishId = "D"+DateUtil.dateToString(new Date(), DateUtil.SDFyyyyMMddHHmmss2);
		//添加监狱处罚案件表
		plantCaseInfo.setCaseId(caseId);//设置案件ID
		plantCaseInfo.setPunishId(punishId);//设置处罚ID
		MngUserInfo currentUser = getCurrentUser();
		plantCaseInfo.setCaseType("01");
		plantCaseInfo.setDealStatus("00");
		plantCaseInfo.setCaseUserId(currentUser.getRealName());
		
		plantCaseInfo.setCreateTime(DateUtil.DateTimeFormat(new Date()));
		plantCaseInfo.setUpdUserId(currentUser.getUserId()+"");
		plantCaseInfo.setUpdInstId(currentUser.getInstId());
		plantCaseInfo.setCreateUserId(currentUser.getUserId());
		plantCaseInfo.setCreateInstId(currentUser.getInstId());
		plantCaseInfo.setUpdateTime(DateUtil.DateTimeFormat(new Date()));
		
		int result = plantCaseInfoService.insert("com.nasoft.aboutcar.administrativePenalty.plantCaseInfoInsert", plantCaseInfo);
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
	@RequestMapping("/deleteCase")
	public void deleteCase(HttpServletRequest request, HttpServletResponse response){
		
		String caseId = request.getParameter("caseIds");
		String result = "";
		try {
			int results = plantCaseInfoService.delPlantCaseInfoByCaseId("com.nasoft.aboutcar.administrativePenalty.deleteCaseInfoByCaseId",caseId);
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
	@RequestMapping("/toAlterCase")
	public ModelAndView toAlterCase(HttpServletRequest request, HttpServletResponse response){
		
		String caseId = request.getParameter("caseId");
		ModelAndView mv=new ModelAndView();
		try{
			List<Map> comlist = plantCaseInfoService.selectAllCompn("com.nasoft.aboutcar.administrativePenalty.selectComName");
			request.getSession().setAttribute("comlist", comlist);
			
			PlantCaseInfo plantCaseInfo = plantCaseInfoService.findPlantCaseInfoByCaseId("com.nasoft.aboutcar.administrativePenalty.findPlantCaseInfoByCaseId", caseId);
			List<Platform> platformList = plantCaseInfoService.selectAllPlatForm("com.nasoft.aboutcar.administrativePenalty.selectAllPlatForm");
			mv.addObject("platformList", platformList);
			mv.addObject("plantCaseInfo", plantCaseInfo);
			mv.setViewName("administrativePenalty/caseAlterUpdate");
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
		//return "administrativePenalty/caseAlterUpdate";
	}
	
	/**
	 * 打开案件详情
	 * @return
	 */
	@RequestMapping("/penaltyDetail")
	public ModelAndView trainingDetail(HttpServletRequest request, HttpServletResponse response){
		String caseId = request.getParameter("caseId");
		ModelAndView mv=new ModelAndView();
		try{
			PlantCaseInfo plantCaseInfo = plantCaseInfoService.findPlantCaseInfoByCaseId("com.nasoft.aboutcar.administrativePenalty.findPlantCaseInfoByCaseId", caseId);
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
			Date casetime = dateFormat.parse(plantCaseInfo.getCaseTime());
			plantCaseInfo.setCaseTime(dateFormat.format(casetime));
			
			mv.addObject("plantCaseInfo", plantCaseInfo);
			mv.setViewName("administrativePenalty/penaltyDetail");
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
		
		//return "administrativePenalty/penaltyDetail";
	}
	
	/**
	 * 修改案件
	 * @return
	 * @throws IOException 
	 */
	
	@RequestMapping("/updatePlantCaseInfo")
	public ModelAndView updatePlantCaseInfo(HttpServletRequest request,HttpServletResponse response,PlantCaseInfo plantCaseInfo,
			 @RequestParam(value="compnfile",required=false) MultipartFile tsFile,
			 @RequestParam(value="punishfile",required=false) MultipartFile dcFile,
			   SimpleDateFormat sdf) throws IOException{
		
		
		//解析jdbc配置上传地址
		InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
		Properties p = new Properties();
		p.load(in);
		String hostname = p.getProperty("ftp.hostname");
		int port = Integer.valueOf(p.getProperty("ftp.port"));
		String username = p.getProperty("ftp.username");
		String password = p.getProperty("ftp.password");
		ModelAndView mv=new ModelAndView();
		String msg="";
		//获取当前登录用户
		MngUserInfo currentUser = getCurrentUser();
		plantCaseInfo.setUpdUserId(currentUser.getUserId()+"");
		plantCaseInfo.setUpdateTime(DateUtil.DateTimeFormat(new Date()));
		String pathname = "upload/administrativePenalty/"+plantCaseInfo.getCaseId();//上传基础路径
		String survey_filePath = ""; //投诉文件	
		String s1="";
		if(tsFile!=null && !tsFile.equals("")&&tsFile.getSize()>0){
			//获取文件后缀名
			String carFileSuffix = tsFile.getOriginalFilename().substring(tsFile.getOriginalFilename().lastIndexOf("."));     
			//投诉文件
			String tsfileDate="tsfile"+sdf.format(new Date());
			String tsFileName = tsfileDate+carFileSuffix;//组成上传文件全名
			InputStream inputStream  = tsFile.getInputStream();//IO流
			Boolean flag = FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, tsFileName, inputStream);//上传文件
			survey_filePath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+tsFileName;//上传的全路径
			s1+=survey_filePath+";";
			System.out.println(s1);
			s1=s1.substring(0, s1.length()-1);
			 //comcomplaininfo.setCompn_file(s1);
			plantCaseInfo.setEvidenceUrl(s1);
		}
		
		if(dcFile!=null && !dcFile.equals("")&&dcFile.getSize()>0){
			//获取文件后缀名
			String carFileSuffix = dcFile.getOriginalFilename().substring(dcFile.getOriginalFilename().lastIndexOf("."));     
			//调查文件
			String dcfileData =plantCaseInfo.getPunishId();//为上传文件取名字
			String dcFileName = dcfileData+carFileSuffix;//组成上传文件全名
			InputStream inputStream  = dcFile.getInputStream();//IO流
			FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, dcFileName, inputStream);//上传文件
			survey_filePath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+dcFileName;//上传的全路径
			s1+=survey_filePath+";";
			System.out.println(s1);
			s1=s1.substring(0, s1.length()-1);
			 //comcomplaininfo.setCompn_file(s1);
			plantCaseInfo.setPunishUrl(s1);
		}
		try{
			int result = plantCaseInfoService.updateplantCaseInfo("com.nasoft.aboutcar.administrativePenalty.updateplantCaseInfo", plantCaseInfo);
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
		return "administrativePenalty/acceptPenalty";
	}
	
	/**
	 * 李阳
	 * 打开处理案件
	 * @return
	 */
	@RequestMapping("/accepting")
	public String accepting(){
		return "administrativePenalty/acceptingPenalty";
	}
	
	/**
	 * 李阳
	 * 打开受理案件详情
	 * @return
	 */
	@RequestMapping("/toAccept")
	public ModelAndView toAccept(HttpServletRequest request, HttpServletResponse response){
		
		String caseId = request.getParameter("caseId");
		ModelAndView mv=new ModelAndView();
		try{
			drvComplainDistribute  drvComplainDistribute = new drvComplainDistribute();
			PlantCaseInfo plantCaseInfo = plantCaseInfoService.findPlantCaseInfoByCaseId("com.nasoft.aboutcar.administrativePenalty.findPlantCaseInfoByCaseId", caseId);
			String caseIds = caseId.substring(1);
			comComplainInfo comComplainInfo = plantCaseInfoService.findComplainByCaseId("com.nasoft.aboutcar.administrativePenalty.findComplainByCaseId", caseIds);
			DrvIllegalInfo drvIllegalInfo = plantCaseInfoService.findDrvIllegalByCaseId("com.nasoft.aboutcar.administrativePenalty.findDrvIllegalByCaseId", caseIds);
			 drvComplainDistribute = drvplantCaseInfoService.findDrvComplainDisByCaseId("com.nasoft.aboutcar.DrvPlantCaseInfoMapper.findDrvComplainDisByCaseId", caseIds);

			String caseTime = plantCaseInfo.getCaseTime().substring(0,19);
			String updateTime = plantCaseInfo.getUpdateTime().substring(0,19);
			plantCaseInfo.setCaseTime(caseTime);
			plantCaseInfo.setUpdateTime(updateTime);
			mv.addObject("plantCaseInfo", plantCaseInfo);
			mv.addObject("drvIllegalInfo", drvIllegalInfo);
			mv.addObject("comcomplaintinfo", comComplainInfo);
			mv.setViewName("administrativePenalty/penaltyAcceptDetails");
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
		//return "administrativePenalty/penaltyAcceptDetails";
	}
	
	
	/**
	 * 李阳
	 * 案件受理立案处理
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("toAcceptRegister")
	public String  toAcceptRegister(PlantCaseInfo plantCaseInfo,PlantPunishHistoryInfo plantPunishHistoryInfo,HttpServletRequest request, HttpServletResponse response) throws Exception{
		String id = request.getParameter("id");
		String msg="";
		MngUserInfo currentUser = getCurrentUser();
		String caseId = plantCaseInfo.getCaseId();
		PlantCaseInfo plantCaseInfos = plantCaseInfoService.findPlantCaseInfoByCaseId("com.nasoft.aboutcar.administrativePenalty.findPlantCaseInfoByCaseId", caseId);		
		Platform platForm = plantCaseInfoService.findPlatFormByCaseId("com.nasoft.aboutcar.administrativePenalty.findPlatFormByCaseId", caseId);
		
		CaseDealInfo caseDealInfo = new CaseDealInfo();
		caseDealInfo.setDealStatus("01");
		caseDealInfo.setCaseId(caseId);
		caseDealInfo.setDealUserId(currentUser.getUserId());
		caseDealInfo.setDealView(plantCaseInfo.getCaseReason());
		caseDealInfo.setCreateUserId(currentUser.getUserId());
		caseDealInfo.setCreateTime(DateUtil.DateTimeFormat(new Date()));
		caseDealInfo.setEndUpdateTime(DateUtil.DateTimeFormat(new Date()));
		if(id.equals("00")){
			plantCaseInfos.setDealStatus("01");
		}else if(id.equals("01")){
			plantCaseInfos.setDealStatus("02");
		}else if(id.equals("02")){
			plantCaseInfos.setDealStatus("04");
			if(platForm!=null){
				addMsgNotice(request,platForm.getCreditCode(),"您有一条处罚信息，处罚内容为：");				
			}
			
		}else if(id.equals("03")){
			plantCaseInfos.setDealStatus("05");

			Events events = new Events();
			events.setCreate_time(new Date());
			if(plantCaseInfos.getSource().equals("01")){
				events.setData_source("稽查执法查扣违章");
			}else if(plantCaseInfos.getSource().equals("02")){
				events.setData_source("信访投诉违章");
			}else if(plantCaseInfos.getSource().equals("00")){
				events.setData_source("行政处罚");
			}
			String caseIds = caseId.substring(1);
			events.setEvent_no(DateUtil.dateToString(new Date(), DateUtil.SDFyyyyMMddHHmmss2)+"_"+caseIds);
			events.setStorage_date(new Date());
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
			events.setOccur_date(dateFormat.parse(plantCaseInfos.getCaseTime()));
			if(platForm!=null){
				events.setcom_creditcode(platForm.getCreditCode());
			}
			events.setEvent_status("未处理");
			events.setEvent_desc("平台违章经营");
			if(platForm!=null){
				events.setcom_creditcode(platForm.getCreditCode());				
			}
			events.setUpdate_time(new Date());
			events.setArCode(plantCaseInfos.getCaseReason());
			eventsService.addEvents("com.nasoft.aboutcar.Events.addEvents", events);

		}
		plantCaseInfos.setUpdateTime(DateUtil.DateTimeFormat(new Date()));
		plantCaseInfos.setDealView(plantCaseInfo.getDealView());
		plantCaseInfos.setEvidenceView(plantCaseInfo.getEvidenceView());
		plantCaseInfos.setPunishType(plantCaseInfo.getPunishType());
		plantCaseInfos.setPunishContent(plantCaseInfo.getPunishContent());
		//更新平台案件表
		int result = plantCaseInfoService.updateplantCaseInfo("com.nasoft.aboutcar.administrativePenalty.updateplantCaseInfo", plantCaseInfos);
				
		//添加处理历史表
		if(result>0){
			PlantCaseDealHis plantCaseDealHis = new PlantCaseDealHis();
			int results = plantCaseInfoService.updateplantCaseInfo("com.nasoft.aboutcar.administrativePenalty.updateplantCaseInfo", plantCaseInfos);
			if(results>0){
				
					
					plantCaseDealHis.setCaseId(caseId);
					plantCaseDealHis.setDealRoleId(currentUser.getRealName());
					plantCaseDealHis.setDealUserId(currentUser.getRealName());
					plantCaseDealHis.setDealView("");
					if(id.equals("00")){
						plantCaseDealHis.setDealStatus("01");
						plantCaseDealHis.setDealContent("受理");
					}else if(id.equals("01")){
						plantCaseDealHis.setDealStatus("02");
						plantCaseDealHis.setDealContent("处理中");
					}else if(id.equals("02")){
						plantCaseDealHis.setDealStatus("03");
						plantCaseDealHis.setDealContent("处罚告知");
					}
					plantCaseDealHis.setDealView(plantCaseInfo.getDealView());
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
	 * 李阳
	 * 受理案件不立案处理
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/toNotAcceptRegister")
	public String  toNotAcceptRegister(PlantCaseInfo plantCaseInfo,HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		String caseId = plantCaseInfo.getCaseId();
		String result = "";
		map.put("caseId", caseId);
		List<CaseDealInfo> caseDealInfoList = new ArrayList<CaseDealInfo>();
		try {
			//删除案件表
			int results = plantCaseInfoService.delPlantCaseInfoByCaseId("com.nasoft.aboutcar.administrativePenalty.deleteCaseInfoByCaseId",caseId);
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
	 * 李阳
	 * 打开行政处罚
	 * @return
	 */
	@RequestMapping("/toShowHis")
	public ModelAndView toShowHis(HttpServletRequest request, HttpServletResponse response){
		
		String caseId = request.getParameter("caseId");
		ModelAndView mv=new ModelAndView();
		try{
			//PlantCaseInfo plantCaseInfo = plantCaseInfoService.findPlantCaseInfoByCaseId("com.nasoft.aboutcar.administrativePenalty.findPlantCaseInfoByCaseId", caseId);
			mv.addObject("caseId", caseId);
			mv.setViewName("administrativePenalty/toShowHis");
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
		//return "administrativePenalty/penaltyAcceptDetails";
	}
	
	
	/**
	 * 李阳
	 * 打开平台处理历史表
	 * @return
	 */
	@RequestMapping("/findAllPlantCaseHis")
	public void findAllPlantCaseHis(HttpServletRequest request, HttpServletResponse response,PlantCaseInfo plantCaseInfo,DrvPlantCaseInfo drvPlantCaseInfo){
		Map<String, Object> map = new HashMap<String, Object>();
		String caseId = "";
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(plantCaseInfo.getCaseId()!=null){
			caseId = plantCaseInfo.getCaseId();
		}
		if(drvPlantCaseInfo.getCarid()!=null){
			caseId = drvPlantCaseInfo.getCaseid();
		}
		List<PlantCaseDealHis> plantCaseInfoList = new ArrayList<PlantCaseDealHis>();
		List<PlantCaseDealHis> plantCaseInfoLists = new ArrayList<PlantCaseDealHis>();
		String dealDateTime;
		try {
			plantCaseInfoList = plantCaseInfoService.findAllPlantCaseHis("com.nasoft.aboutcar.administrativePenalty.findAllPlantCaseHis",caseId);
			
			for (int i = 0; i < plantCaseInfoList.size(); i++) {
				PlantCaseDealHis plantcaseHis = plantCaseInfoList.get(i);
				Date dealTime = df.parse(plantcaseHis.getDealDateTime()); 
				plantcaseHis.setDealDateTime(df.format(dealTime));	
				plantCaseInfoLists.add(plantcaseHis);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(plantCaseInfoLists.toArray());
		writer(response, array+"");
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
	 * 打开处罚告知
	 * @return
	 */
	@RequestMapping("/endPenalty")
	public String endPenalty(){
		
		return "administrativePenalty/endPenalty";
	}
	
	
	/**
	 * 打开结案
	 * @return
	 */
	@RequestMapping("/informPenalty")
	public String informPenalty(){
		
		return "administrativePenalty/informPenalty";
	}
	
	
	/**
	 * 打开案件修改
	 * @return
	 */
	@RequestMapping("/caseAlterUpdate")
	public String caseAlterUpdate(){
		
		return "administrativePenalty/caseAlterUpdate";
	}
	
	/**
	 * 打开案件修改历史
	 * @return
	 */
	@RequestMapping("/caseAlterHis")
	public String caseAlterHis(){
		return "administrativePenalty/caseAlterHis";
	}
	
	
	/**
	 * 查询处罚内容
	 * @return
	 *//*
	@RequestMapping("/tremSelect")
	public ModelAndView tremSelect(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mv=new ModelAndView();
		try{
			List<StandardTermInfo> standardTermList = plantCaseInfoService.selectAllTerm("com.nasoft.aboutcar.administrativePenalty.selectAllTerm");
			mv.addObject("standardTermList", standardTermList);
			mv.setViewName("administrativePenalty/termIndex");
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
		
	}*/
	
	
	/**
	 * 平台查询处罚内容
	 * @return
	 */
	@RequestMapping("/tremIndex")
	public String tremIndex(HttpServletRequest request, HttpServletResponse response){
		
		return "administrativePenalty/termIndex";
	}
	
	/**
	 * 驾驶员查询处罚内容
	 * @return
	 */
	@RequestMapping("/tremsIndex")
	public String tremsIndex(HttpServletRequest request, HttpServletResponse response){
		
		return "administrativePenalty/termsIndex";
	}
	
	/**
	 * 查询处罚内容
	 * @return
	 */
	@RequestMapping("/tremSelect")
	public void tremSelect(HttpServletRequest request, HttpServletResponse response){
		
		List<StandardTermInfo>standardTermList = new ArrayList<StandardTermInfo>();

		try {
			standardTermList = plantCaseInfoService.selectAllTerm("com.nasoft.aboutcar.administrativePenalty.selectAllTerm");

		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(standardTermList.toArray());
		writer(response, array+"");
	}
	
	
	/**
	 * 打开修改案件
	 * @return
	 */
	@RequestMapping("/toFindTsfw")
	public ModelAndView toFindTsfw(HttpServletRequest request, HttpServletResponse response){
		
		String caseId = request.getParameter("caseId");
		ModelAndView mv=new ModelAndView();
		try{
			List<Map> comlist = plantCaseInfoService.selectAllCompn("com.nasoft.aboutcar.administrativePenalty.selectComName");
			request.getSession().setAttribute("comlist", comlist);
			
			PlantCaseInfo plantCaseInfo = plantCaseInfoService.findPlantCaseInfoByCaseId("com.nasoft.aboutcar.administrativePenalty.findPlantCaseInfoByCaseId", caseId);
			List<Platform> platformList = plantCaseInfoService.selectAllPlatForm("com.nasoft.aboutcar.administrativePenalty.selectAllPlatForm");
			mv.addObject("platformList", platformList);
			mv.addObject("plantCaseInfo", plantCaseInfo);
			mv.setViewName("administrativePenalty/caseAlterUpdate");
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
		//return "administrativePenalty/caseAlterUpdate";
	}
	
	/**
	 * 案件管理》规范用语查询
	 * @return
	 */
	@RequestMapping("/standardLang")
	public String standardLang(){
		return "administrativePenalty/standardLang";
	}
	
	/**
	 * 规范用语修改
	 * @return
	 */
	@RequestMapping("/standardLangUpdate")
	public String standardLangUpdate(){
		return "administrativePenalty/standardLangUpdate";
	}
	
	/**
	 * 规范用语新增
	 * @return
	 */
	@RequestMapping("/standardLangAdd")
	public String standardLangAdd(){
		return "administrativePenalty/standardLangAdd";
	}
	
	/**
	 * 案件管理》常见意见
	 * @return
	 */
	@RequestMapping("/commonOpin")
	public String commonOpin(){
		return "administrativePenalty/commonOpin";
	}
	
	/**
	 * 常见意见修改
	 * @return
	 */
	@RequestMapping("/commonOpinUpdate")
	public String commonOpinUpdate(){
		return "administrativePenalty/commonOpinUpdate";
	}
	
	/**
	 * 常见意见新增
	 * @return
	 */
	@RequestMapping("/commonOpinAdd")
	public String commonOpinAdd(){
		return "administrativePenalty/commonOpinAdd";
	}
	
	/**
	 * 查询统计》处罚案件查询
	 * @return
	 */
	@RequestMapping("/penaltyQuery")
	public String penaltyQuery(){
		return "administrativePenalty/penaltyQuery";
	}
	
	/**
	 * 查询统计》处罚案件统计
	 * @return
	 */
	@RequestMapping("/penaltyStat")
	public String penaltyStat(){
		return "administrativePenalty/penaltyStat";
	}
	
	
	/**
	 * 驾驶员综合信息查询
	 * @return
	 */
	@RequestMapping("/driverindex")
	public String driverIndex(){
		return "supervise/driverIndex";
	}
	
	@RequestMapping("drvFindAll")
	public void drvFindAll(HttpServletRequest request,HttpServletResponse response){
		String name = request.getParameter("name");
		String pcertno = request.getParameter("pcertno");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("pcertno", pcertno);
		List<Map> m = new ArrayList<Map>();
		try {
		 m = (List<Map>) plantCaseInfoService.drvfindall("com.nasoft.aboutcar.administrativePenalty.drvfindall",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(m.toArray());
		writer(response, array.toString());
		
	}
	
	/**
	 * 平台综合信息查询
	 * @return
	 */
	@RequestMapping("/plantindex")
	public String plantIndex(){
		return "supervise/plantIndex";
	}
	
	
	/**高名曜暄
	 * 打开车辆综合信息查询页面
	 * @return
	 */
	@RequestMapping("/carindex")
	public String carIndex(){	
		return "supervise/carIndex";
	}
	
	/**高名曜暄
	 * 车辆综合信息查询的查询
	 * @return
	 */
	@RequestMapping("/findCarInfo")
	public void findCarInfo(HttpServletRequest request,HttpServletResponse response){	
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			String carnum = request.getParameter("carnum");
			String certno = request.getParameter("certno");
			map.put("carnum", carnum);
			map.put("certno", certno);
			List<Map> ComList = new ArrayList<Map>();
			ComList = (List<Map>) plantCaseInfoService.findAllCar("com.nasoft.aboutcar.administrativePenalty.findAllCar",map);
			JSONArray array = JSONArray.fromObject(ComList.toArray());
			writer(response, array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
}
