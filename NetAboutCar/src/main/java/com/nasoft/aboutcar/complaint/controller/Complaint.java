package com.nasoft.aboutcar.complaint.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
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

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.nasoft.aboutcar.administrativePenalty.domain.PlantCaseInfo;
import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.complaint.domain.comBlackList;
import com.nasoft.aboutcar.complaint.domain.comComplainAppeal;
import com.nasoft.aboutcar.complaint.domain.comComplainDispose;
import com.nasoft.aboutcar.complaint.domain.comComplainDistribute;
import com.nasoft.aboutcar.complaint.domain.comComplainInfo;
import com.nasoft.aboutcar.complaint.domain.comDisAppeal;
import com.nasoft.aboutcar.complaint.service.ComplaintService;
import com.nasoft.aboutcar.exam.domain.MngExamBespeak;
import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;
import com.nasoft.util.DateTime;
import com.nasoft.util.DateUtil;
import com.nasoft.util.FtpUtil;


@Controller
@RequestMapping("/complaint")
public class Complaint extends BaseController {
	
	@Resource
	ComplaintService complaintservice;

	/**
	 * 打开投诉录入首页
	 * @param request
	 * @param response
	 * @return
	 */
	
	@RequestMapping("index")
	public String index(HttpServletRequest request,HttpServletResponse response){	
		return "complaint/index";
	}
	
	/**
	 * 打开录入页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("toAdd")
	public String toAdd(HttpServletRequest request){
	    try {
			List<Map> comlist = complaintservice.selectAllCompn("com.nasoft.aboutcar.ComplaintMapper.selectComName");
			request.getSession().setAttribute("comlist", comlist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "complaint/add";
	}
	
	/**
	 * 打开投诉受理首页
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("acceptindex")
	public String acceptindex(){
		
		return "complaint/acceptindex";
	}
	
	/**
	 * 打开投诉处理首页
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("handleindex")
	public String handleindex(){
		return "complaint/handleindex";
	}
	
	/**
	 * 打开平台申诉首页
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("appealindex")
	public String appealindex(){
		return "complaint/appealindex";
	}
	
	/**
	 * 打开平台投诉信息处理查询
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("openComHandleSelect")
	public String openComHandleSelect(){
		return "complaint/comHandleSelect";
	}
	
	/**
	 * 打开平台投诉信息查询
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("openComSelect")
	public String openComSelect(){
		return "complaint/comSelectIndex";
	}
	
	
	/**
	 * 投诉录入
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("addComplaint")
	public ModelAndView addComplaint(HttpServletRequest request,HttpServletResponse response,comComplainInfo comcomplaininfo,
			   @RequestParam(value="compnfile",required=false) MultipartFile compn_file,
			   SimpleDateFormat sdf ) throws IOException{
		InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
	    Properties p = new Properties();
	    p.load(in);
		String hostname = p.getProperty("ftp.hostname");
		int port = Integer.valueOf(p.getProperty("ftp.port"));
		String username = p.getProperty("ftp.username");
		String password = p.getProperty("ftp.password");
		ModelAndView mv=new ModelAndView();
		String msg="";
		String compn_time = request.getParameter("compn_time");
		MngUserInfo currentUser = getCurrentUser();
	    Date date = new Date();
	    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    SimpleDateFormat sf1 = new SimpleDateFormat("yyyy-MM-dd");
	    String newdate = sf.format(date);
	    String nowdate =  newdate.substring(0,4) +newdate.substring(5,7) + newdate.substring(8,10) + newdate.substring(11,13)+
	    		          newdate.substring(14,16)+newdate.substring(17);
	    System.out.println(nowdate);
	    int complain_info_id =Integer.parseInt( newdate.substring(11,13)+newdate.substring(14,16)+newdate.substring(17));
	    String complaintcode = "T"+nowdate;
	    comcomplaininfo.setComplain_code(complaintcode);
	    comcomplaininfo.setCreate_user(currentUser.getUserName());
	    comcomplaininfo.setCreate_time(sf.format(new Date()));
	    comcomplaininfo.setCompn_time(compn_time);
	    comcomplaininfo.setCompn_state("1");
	    comcomplaininfo.setComplain_code(complaintcode);
	    comcomplaininfo.setComplain_info_id(complain_info_id);
	    String pathname = "upload/platform/";
	    //String pathname = "/upload/platform/";
		String survey_filePath = ""; //投诉文件	
		String s1="";
		if(compn_file!=null && !compn_file.equals("")&&compn_file.getSize()>0){
			//获取文件后缀名
			String carFileSuffix = compn_file.getOriginalFilename().substring(compn_file.getOriginalFilename().lastIndexOf("."));     
			//调查文件
			int surveyData =comcomplaininfo.getComplain_info_id();//为上传文件取名字
			String surverFileName = surveyData+carFileSuffix;//组成上传文件全名
			InputStream inputStream  = compn_file.getInputStream();//IO流
			FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, surverFileName, inputStream);//上传文件
			survey_filePath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+surverFileName;//上传的全路径
			s1+=survey_filePath+";";
			System.out.println(s1);
			s1=s1.substring(0, s1.length()-1);
			comcomplaininfo.setCompn_file(s1);
		}
	    try {
			complaintservice.addComplaint("com.nasoft.aboutcar.ComplaintMapper.addComplaint", comcomplaininfo);
			msg="success";
		} catch (Exception e) {
			msg="failed";
			e.printStackTrace();
		}
	    mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
	 }
	
	/**
	 * 提交投诉
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("comitcomp")
	public ModelAndView comitcomp(HttpServletRequest request,HttpServletResponse response,comComplainInfo comcomplaintinfo,
			   @RequestParam(value="compnfile",required=false) MultipartFile[] compn_file,
			   SimpleDateFormat sdf ){
		ModelAndView mv=new ModelAndView();
		String msg="";
		comcomplaintinfo.setCompn_state("2");

		try {
			int result = complaintservice.updatecomp("com.nasoft.aboutcar.ComplaintMapper.comitcomp",comcomplaintinfo);
			if(result>0){
				msg="success";
			}else{	
				msg="failed";
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
	 * 投诉处理
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("tohandlecomit")
	public ModelAndView tohandlecomit(HttpServletRequest request,HttpServletResponse response,
			comComplainDispose comcomplaintdispose,comComplainInfo comcomplaintinfo,
			   @RequestParam(value="surveyfile",required=false) MultipartFile survey_file,
			   SimpleDateFormat sdf) throws Exception{
		InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
	    Properties p = new Properties();
	    p.load(in);
		String hostname = p.getProperty("ftp.hostname");
		int port = Integer.valueOf(p.getProperty("ftp.port"));
		String username = p.getProperty("ftp.username");
		String password = p.getProperty("ftp.password");
		ModelAndView mv=new ModelAndView();
		String msg="";
		MngUserInfo currentUser = getCurrentUser();
		Date date = new Date();
		PlantCaseInfo plantcaseinfo = new PlantCaseInfo();
	    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    SimpleDateFormat sf1 = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sf.format(date);
		//对id进行截串
		int complain_dispose_id =Integer.parseInt( newdate.substring(11,13)+newdate.substring(14,16)+newdate.substring(17));
		 //判断处理类型从而考虑是否纳入诚信考核（处理类型非0的都纳入诚信考核）
		if(!comcomplaintdispose.getDis_type().equals("") && !comcomplaintdispose.getDis_type().equals("0")){
			comcomplaintdispose.setIs_integrity("1");
		}else{
			comcomplaintdispose.setIs_integrity("0");
		}		
		String compn_compy= comcomplaintinfo.getCompn_compy();//获取平台名称
		//判断该投诉状态是处于投诉待处理还是处于申诉待处理
		if(comcomplaintinfo.getCompn_state()=="6" ||comcomplaintinfo.getCompn_state().equals("6")){
			String disidea = request.getParameter("disidea");
			comDisAppeal comdisappeal = new comDisAppeal();
			comdisappeal.setId(complain_dispose_id);
			comdisappeal.setComplain_info_id(comcomplaintinfo.getComplain_info_id());
			comdisappeal.setDisappeal_idea(comcomplaintdispose.getDis_idea());
			comcomplaintdispose.setAppl_idea_peo(currentUser.getUserName());
			comcomplaintdispose.setAppl_idea_time(sf.format(date));
			comcomplaintdispose.setComplain_info_id(comcomplaintinfo.getComplain_info_id());
			comcomplaintdispose.setDis_idea(disidea);
			comcomplaintinfo.setCompn_state("7");//将投诉状态更改为申诉待反馈
			//String pathname = "upload/comcomplaint/"+comcomplaintinfo.getComplain_code()+"/handle";//设置文件上传路径
			String pathname="upload/platform/";
			String survey_filePath = "";  //投诉文件	
			String s1="";
			if(survey_file!=null && !survey_file.equals("")&&survey_file.getSize()>0){
				//获取文件后缀名
				String carFileSuffix = survey_file.getOriginalFilename().substring(survey_file.getOriginalFilename().lastIndexOf("."));     
				//调查文件
				int surveyData =comcomplaintdispose.getComplain_dispose_id();//为上传文件取名字
				String surverFileName = surveyData+carFileSuffix;//组成上传文件全名
				InputStream inputStream  = survey_file.getInputStream();//IO流
				FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, surverFileName, inputStream);//上传文件
				survey_filePath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+surverFileName;//上传的全路径
				s1+=survey_filePath+";";
				s1=s1.substring(0, s1.length()-1);
				comcomplaintdispose.setSurvey_file(s1);
			}
			try {
				complaintservice.saveDisAppeal("com.nasoft.aboutcar.ComplaintMapper.saveDisAppeal",comdisappeal);
				int result = complaintservice.updatecomp("com.nasoft.aboutcar.ComplaintMapper.comitcomp",comcomplaintinfo);
				int result1 = complaintservice.tohandlecomit("com.nasoft.aboutcar.ComplaintMapper.disposeUpdate",comcomplaintdispose);
				if(result>0 && result1>0){
					msg="success";
				}else{	
					msg="failed";
				}
			} catch (Exception e) {
				msg="failed";
				e.printStackTrace();
			}
		//这个else属于投诉状态为投诉待处理的时候进行的操作
		}else{
			//因为是第一次处理，所以判断处理类型为非0的情况下都需要向行政处罚表添加内容
			if(comcomplaintdispose.getDis_type().equals("4")){
				plantcaseinfo.setCaseId("C"+comcomplaintinfo.getComplain_info_id());
				plantcaseinfo.setPunishId("D"+comcomplaintinfo.getComplain_info_id());
				plantcaseinfo.setPlateName(compn_compy);
				plantcaseinfo.setSource("02");
				plantcaseinfo.setCaseTime(comcomplaintinfo.getCompn_time());
				plantcaseinfo.setCaseReason(comcomplaintinfo.getCompn_reason());
				plantcaseinfo.setCaseType("01");
				plantcaseinfo.setDealStatus("00");
				plantcaseinfo.setCreateInstId(currentUser.getUserName());
				plantcaseinfo.setUpdateTime(sf.format(new Date()));
				plantcaseinfo.setIsAppeal("00");
				plantcaseinfo.setInstId(currentUser.getInstId());
				plantcaseinfo.setCreateUserId(currentUser.getUserId());
				plantcaseinfo.setCaseUserId(currentUser.getRealName());	
				int result2 = complaintservice.insertplantcase("com.nasoft.aboutcar.ComplaintMapper.insertplantcase",plantcaseinfo);
			}	
			comcomplaintinfo.setCompn_state("4");//将投诉状态更改为待反馈状态
			comcomplaintdispose.setComplain_dispose_id(complain_dispose_id);
			comcomplaintdispose.setComplain_info_id(comcomplaintinfo.getComplain_info_id());
			comcomplaintdispose.setIdea_peo(currentUser.getUserName());
			comcomplaintdispose.setIdea_time(sf.format(date));
			//String pathname = "upload/comcomplaint/"+comcomplaintinfo.getComplain_code()+"/handle" ;
			String pathname="upload/platform/";
			String survey_filePath = "";  //投诉文件	
			String s1="";
			if(survey_file!=null && !survey_file.equals("")&&survey_file.getSize()>0){
				//获取文件后缀名
				String carFileSuffix = survey_file.getOriginalFilename().substring(survey_file.getOriginalFilename().lastIndexOf("."));     
				//调查文件
				int surveyData =comcomplaintdispose.getComplain_dispose_id();//为上传文件取名字
				String surverFileName = surveyData+carFileSuffix;//组成上传文件全名
				InputStream inputStream  = survey_file.getInputStream();//IO流
				FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, surverFileName, inputStream);//上传文件
				survey_filePath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+surverFileName;//上传的全路径
				s1+=survey_filePath+";";
				System.out.println(s1);
				s1=s1.substring(0, s1.length()-1);
				comcomplaintdispose.setSurvey_file(s1);
			}
			try {
				int result = complaintservice.updatecomp("com.nasoft.aboutcar.ComplaintMapper.comitcomp",comcomplaintinfo);
				int result1 = complaintservice.tohandlecomit("com.nasoft.aboutcar.ComplaintMapper.tohandlecomit",comcomplaintdispose);
				if(result>0&&result1>0){
					msg="success";
				}else{	
					msg="failed";
				}
			} catch (Exception e) {
				msg="failed";
				e.printStackTrace();
			}
		}
		mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 投诉受理
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("acceptcomit")
	public ModelAndView acceptcomit(HttpServletRequest request,HttpServletResponse response,comComplainInfo comcomplaintinfo,
			   comComplainDistribute complaindistribute, @RequestParam(value="compnfile",required=false) MultipartFile[] compn_file,
			   SimpleDateFormat sdf ){	
		ModelAndView mv=new ModelAndView();
		String msg="";
		Date date = new Date();
	    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    SimpleDateFormat sf1 = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sf.format(date);
		int complain_distribute_id =Integer.parseInt( newdate.substring(11,13)+newdate.substring(14,16)+newdate.substring(17));
		MngUserInfo currentUser = getCurrentUser();
		comcomplaintinfo.setCompn_state("3");
		complaindistribute.setDistri_time(sf.format(date));
		complaindistribute.setDistri_peo(currentUser.getUserName());	
		complaindistribute.setComplain_info_id(comcomplaintinfo.getComplain_info_id());
		complaindistribute.setComplain_distribute_id(complain_distribute_id);	
		try {
			int result = complaintservice.updatecomp("com.nasoft.aboutcar.ComplaintMapper.comitcomp",comcomplaintinfo);
			int result1 = complaintservice.acceptcomit("com.nasoft.aboutcar.ComplaintMapper.acceptcomit",complaindistribute);
			if(result>0&&result1>0){
				msg="success";
			}else{	
				msg="failed";
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
	 * 申诉处理
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("appealsuccess")
	public ModelAndView appealsuccess(HttpServletRequest request,HttpServletResponse response,comComplainInfo comcomplaintinfo,
			   comComplainAppeal complainappeal, SimpleDateFormat sdf ){
		ModelAndView mv=new ModelAndView();
		String msg="";
		String id = request.getParameter("id");
		
		Date date = new Date();
	    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    SimpleDateFormat sf1 = new SimpleDateFormat("yyyy-MM-dd");
		MngUserInfo currentUser = getCurrentUser();
		String caseId = "C"+comcomplaintinfo.getComplain_info_id();
		PlantCaseInfo plantcaseinfo = new PlantCaseInfo();
		if(id!=null && id.equals("1")){
		plantcaseinfo.setIsAppeal("02");
		plantcaseinfo.setUpdateTime(sf.format(new Date()));
		plantcaseinfo.setCaseId(caseId);
		complainappeal.setAppl_dis_peo(currentUser.getUserName());
		complainappeal.setAppl_dis_result("1");
		complainappeal.setAppl_dis_time(sf.format(date));
		complainappeal.setComplain_info_id(comcomplaintinfo.getComplain_info_id());
		comcomplaintinfo.setCompn_state("6");
		try {
			int result2 = complaintservice.updateplant("com.nasoft.aboutcar.ComplaintMapper.updateplant",plantcaseinfo);
			int result = complaintservice.updatecomp("com.nasoft.aboutcar.ComplaintMapper.comitcomp",comcomplaintinfo);
			int result1 = complaintservice.appealcomit("com.nasoft.aboutcar.ComplaintMapper.appealcomit",complainappeal);
			if(result>0&&result1>0){
				msg="success";
			}else{	
				msg="failed";
			}
		} catch (Exception e) {
			msg="failed";
			e.printStackTrace();
		}
	}else{
		plantcaseinfo.setIsAppeal("03");
		plantcaseinfo.setUpdateTime(sf.format(new Date()));
		plantcaseinfo.setCaseId(caseId);
		complainappeal.setAppl_dis_peo(currentUser.getUserName());
		complainappeal.setAppl_dis_result("0");
		complainappeal.setAppl_dis_time(sf.format(date));
		complainappeal.setComplain_info_id(comcomplaintinfo.getComplain_info_id());
		comcomplaintinfo.setCompn_state("8");
		try {
			int result2 = complaintservice.updateplant("com.nasoft.aboutcar.ComplaintMapper.updateplant",plantcaseinfo);
			int result = complaintservice.updatecomp("com.nasoft.aboutcar.ComplaintMapper.comitcomp",comcomplaintinfo);
			int result1 = complaintservice.appealcomit("com.nasoft.aboutcar.ComplaintMapper.appealcomit",complainappeal);
			if(result>0&&result1>0){
				msg="success";
			}else{	
				msg="failed";
			}
		} catch (Exception e) {
			msg="failed";
			e.printStackTrace();
		}
		
	}
		mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
	}
		
	/**
	 * 查询
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("findAllComplaint")
	public void findAllComplaint(HttpServletRequest request,HttpServletResponse response){
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			String complain_code = request.getParameter("complain_code");
			String compn_compy = request.getParameter("compn_compy");
			String begin_time = request.getParameter("begin_time");
			String end_time = request.getParameter("end_time");
			if(end_time!=null && !end_time.equals("")){
				int endtime = Integer.parseInt(end_time.substring(9))+1;
				end_time=end_time.substring(0,9)+String.valueOf(endtime);
				map.put("end_time", end_time);	
				  }	
			map.put("begin_time", begin_time);
			map.put("complain_code", complain_code);
			map.put("compn_compy", compn_compy);
			List<Map> ComList = new ArrayList<Map>();
			ComList = (List<Map>) complaintservice.findAllComplaint("com.nasoft.aboutcar.ComplaintMapper.findAllComplaint",map);
			for(Map m :ComList ){
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				m.put("compn_time", dateFormat.format((Date) m.get("compn_time")));
			}
			JSONArray array = JSONArray.fromObject(ComList);
			writer(response, array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	/**
	 * 受理页面的查询
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("findaccept")
	public void findaccept(HttpServletRequest request,HttpServletResponse response){
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			String complain_code = request.getParameter("complain_code");
			String compn_compy = request.getParameter("compn_compy");
			String begin_time = request.getParameter("begin_time");
			String end_time = request.getParameter("end_time");
			if(end_time!=null && !end_time.equals("")){
				int endtime = Integer.parseInt(end_time.substring(9))+1;
				end_time=end_time.substring(0,9)+String.valueOf(endtime);
				map.put("end_time", end_time);			
				  }	
			map.put("begin_time", begin_time);
			map.put("complain_code", complain_code);
			map.put("compn_compy", compn_compy);
			List<Map> ComList = new ArrayList<Map>();
			ComList = (List<Map>) complaintservice.findaccept("com.nasoft.aboutcar.ComplaintMapper.findaccept",map);
			for(Map m :ComList ){
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				m.put("create_time", dateFormat.format((Date) m.get("create_time")));
				m.put("compn_time", dateFormat.format((Date) m.get("compn_time")));
			}
			JSONArray array = JSONArray.fromObject(ComList);
			writer(response, array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	/**
	 * 处理页面的查询
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("findhandle")
	public void findhandle(HttpServletRequest request,HttpServletResponse response){
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			String complain_code = request.getParameter("complain_code");
			String compn_compy = request.getParameter("compn_compy");
			String begin_time = request.getParameter("begin_time");
			String end_time = request.getParameter("end_time");
			if(end_time!=null && !end_time.equals("")){
				int endtime = Integer.parseInt(end_time.substring(9))+1;
				end_time=end_time.substring(0,9)+String.valueOf(endtime);
				map.put("end_time", end_time);	
				
				  }	
			map.put("begin_time", begin_time);
			map.put("complain_code", complain_code);
			map.put("compn_compy", compn_compy);
			List<Map> ComList = new ArrayList<Map>();
			ComList = (List<Map>) complaintservice.findhandle("com.nasoft.aboutcar.ComplaintMapper.findhandle",map);
			for(Map m :ComList ){
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				m.put("compn_time", dateFormat.format((Date) m.get("compn_time")));
				m.put("distri_time", dateFormat.format((Date) m.get("distri_time")));
			}
			JSONArray array = JSONArray.fromObject(ComList);
			writer(response, array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	/**
	 * 平台申诉页面的查询
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("findappela")
	public void findappeal(HttpServletRequest request,HttpServletResponse response){
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			String complain_code = request.getParameter("complain_code");
			String compn_compy = request.getParameter("compn_compy");
			String begin_time = request.getParameter("begin_time");
			String end_time = request.getParameter("end_time");
			if(end_time!=null && !end_time.equals("")){
				int endtime = Integer.parseInt(end_time.substring(9))+1;
				end_time=end_time.substring(0,9)+String.valueOf(endtime);
				map.put("end_time", end_time);	
				  }	
			map.put("begin_time", begin_time);
				
			map.put("complain_code", complain_code); 
			map.put("compn_compy", compn_compy);
			List<Map> ComList = new ArrayList<Map>();
			ComList = (List<Map>) complaintservice.findappeal("com.nasoft.aboutcar.ComplaintMapper.findappeal",map);
			for(Map m :ComList ){
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				m.put("compn_time", dateFormat.format((Date) m.get("compn_time")));
				m.put("appl_time", dateFormat.format((Date) m.get("appl_time")));
			}
			JSONArray array = JSONArray.fromObject(ComList);
			writer(response, array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	/**
	 * 平台投诉信息查询
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("comselect")
	public void comselect(HttpServletRequest request,HttpServletResponse response){
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			String complain_code = request.getParameter("complain_code");
			String compn_compy = request.getParameter("compn_compy");
			String begin_time = request.getParameter("begin_time");
			String end_time = request.getParameter("end_time");
			String compn_state = request.getParameter("compn_state");
			if(end_time!=null && !end_time.equals("")){
			int endtime = Integer.parseInt(end_time.substring(9))+1;
			end_time=end_time.substring(0,9)+String.valueOf(endtime);
			map.put("end_time", end_time);	
			  }		
			map.put("compn_state", compn_state);
			map.put("begin_time", begin_time);	
			map.put("complain_code", complain_code);
			map.put("compn_compy", compn_compy);
			List<Map> ComList = new ArrayList<Map>();
			ComList = (List<Map>) complaintservice.selectcom("com.nasoft.aboutcar.ComplaintMapper.selectcom",map);
			for(Map m :ComList ){
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				m.put("compn_time", dateFormat.format((Date)m.get("compn_time")));
			}
			JSONArray array = JSONArray.fromObject(ComList);
			writer(response, array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	/**
	 * 平台投诉信息统计
	 * @return
	 */
	@RequestMapping("comComplaintStatistics")
	public String comComplaintStatistics(HttpServletRequest request,String compn_compy,String beginTime,String endTime){
		try {
			Map m = new HashMap();
			m.put("compn_compy", compn_compy);
			m.put("beginTime", beginTime);
			m.put("endTime", endTime);
			Map map = complaintservice.selectComStatistics("com.nasoft.aboutcar.ComplaintMapper.comComplaintStatistics",m);
			List<Map> addressList = complaintservice.selectAllCompn("com.nasoft.aboutcar.ComplaintMapper.selectComName");
	        request.getSession().setAttribute("map", map);
	        request.getSession().setAttribute("m", m);
	        request.getSession().setAttribute("addressList", addressList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "complaint/comComplaintStatistics";
	}
	
	
	
	/**
	 * 平台投诉信息处理查询
	 * @return
	 */
	@RequestMapping("comHandleSelect")
	public void comHandleSelect(HttpServletRequest request,HttpServletResponse response,String allot_depme,String begin_time,String end_time){
		try {
			Map map = new HashMap();
			map.put("allot_depme", allot_depme);
			map.put("begin_time", begin_time);
			if(end_time!=null && !end_time.equals("")){
				int endtime = Integer.parseInt(end_time.substring(9))+1;
				end_time=end_time.substring(0,9)+String.valueOf(endtime);
				map.put("end_time", end_time);	
				System.out.println(end_time);
				  }	
			List<Map> HandleList = complaintservice.comHandleSelect("com.nasoft.aboutcar.ComplaintMapper.comHandleSelect",map);
	        JSONArray array = JSONArray.fromObject(HandleList);
	        writer(response, array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 删除记录
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("comDel")
	public void comDle(HttpServletRequest request,HttpServletResponse response){	
		String compids = request.getParameter("compids");
		String result = "";
		try {
			complaintservice.comDel("com.nasoft.aboutcar.ComplaintMapper.comDel",compids);
			result = "success";
		} catch (Exception e) {
			result = "fail";
			e.printStackTrace();
		}
		writer(response, result);
	}
	
	/**
	 * 投诉反馈
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("feedback")
	public void feedback(HttpServletRequest request,HttpServletResponse response){	
		String compids = request.getParameter("compids");
		String result = "";
		try {
			complaintservice.feedback("com.nasoft.aboutcar.ComplaintMapper.feedback",compids);
			result = "success";
		} catch (Exception e) {
			result = "fail";
			e.printStackTrace();
		}
		writer(response, result);
	}
	/**
	 * 打开修改投诉页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("showUpdate")
	public ModelAndView showUpdate(HttpServletRequest request, HttpServletResponse response){
		String complain_code = request.getParameter("complain_code");
		ModelAndView mv=new ModelAndView();
		try{
			List<Map> comlist = complaintservice.selectAllCompn("com.nasoft.aboutcar.ComplaintMapper.selectComName");
			request.getSession().setAttribute("comlist", comlist);
			comComplainInfo comcomplaintinfo = complaintservice.findcompcodebyId("com.nasoft.aboutcar.ComplaintMapper.findcompcodebyId",complain_code);
			if(comcomplaintinfo.getCompn_file()!=null && !comcomplaintinfo.getCompn_file().equals("")){
			int compn = comcomplaintinfo.getCompn_file().lastIndexOf("/")+1;
			String compn_file = comcomplaintinfo.getCompn_file().substring(compn);
			mv.addObject("compn_file",compn_file);
			}
			mv.addObject("comcomplaintinfo", comcomplaintinfo);
			mv.setViewName("complaint/updateindex");
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
	}	
	/**
	 * 打开受理页中的处理历史
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("showaccepthistory")
	public ModelAndView showaccepthistory(HttpServletRequest request, HttpServletResponse response){
		String complain_code = request.getParameter("complain_code");
		ModelAndView mv=new ModelAndView();
		try{
			comComplainInfo comcomplaintinfo = complaintservice.findcompcodebyId("com.nasoft.aboutcar.ComplaintMapper.findcompcodebyId", complain_code);	
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date create_time = dateFormat.parse(comcomplaintinfo.getCreate_time());
			comcomplaintinfo.setCreate_time(dateFormat.format(create_time));
			mv.addObject("comcomplaintinfo", comcomplaintinfo);
			mv.setViewName("complaint/accepthistory");
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
	}
	/**
	 * 打开处理页中的处理历史
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("showhandlehistory")
	public ModelAndView showhandlehistory(HttpServletRequest request, HttpServletResponse response){
		String complain_code = request.getParameter("complain_code");
		ModelAndView mv=new ModelAndView();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try{
			comComplainInfo comcomplaintinfo = complaintservice.findcompcodebyId("com.nasoft.aboutcar.ComplaintMapper.findcompcodebyId", complain_code);
			int complain_info_id=comcomplaintinfo.getComplain_info_id();
			comComplainDistribute complaindistribute = complaintservice.findacceptbyId("com.nasoft.aboutcar.ComplaintMapper.findacceptbyId",complain_info_id);
			Date create_time = dateFormat.parse(comcomplaintinfo.getCreate_time());
			Date distri_time= dateFormat.parse(complaindistribute.getDistri_time());
			complaindistribute.setDistri_time(dateFormat.format(distri_time));	
			comcomplaintinfo.setCreate_time(dateFormat.format(create_time));
			if(comcomplaintinfo.getCompn_state().equals("4")){
		    comComplainDispose comcomplaindispose = complaintservice.finddisposebyId("com.nasoft.aboutcar.ComplaintMapper.finddisposetbyId", complain_info_id);
		    Date idea_time = dateFormat.parse(comcomplaindispose.getIdea_time());
		    comcomplaindispose.setIdea_time(dateFormat.format(idea_time));
			mv.addObject("comcomplaindispose", comcomplaindispose);
			}else if(comcomplaintinfo.getCompn_state().equals("5")|| comcomplaintinfo.getCompn_state().equals("6")||comcomplaintinfo.getCompn_state().equals("7")){
				comComplainDispose comcomplaindispose = complaintservice.finddisposebyId("com.nasoft.aboutcar.ComplaintMapper.finddisposetbyId", complain_info_id);
				   if(comcomplaintinfo.getCompn_state().equals("7")){
					   comDisAppeal comdisappeal = 	complaintservice.findDisAppealbyID("com.nasoft.aboutcar.ComplaintMapper.findDisAppealbyID",complain_info_id);
					   Date appl_idea_time = dateFormat.parse(comcomplaindispose.getAppl_idea_time());
					   comcomplaindispose.setAppl_idea_time(dateFormat.format(appl_idea_time));
					   mv.addObject("comdisappeal", comdisappeal);
				   }
			   comComplainAppeal comcomplainappeal = complaintservice.findappealbyId("com.nasoft.aboutcar.ComplaintMapper.findappealbyId", complain_info_id);
			   Date appl_time = dateFormat.parse(comcomplainappeal.getAppl_time());
			   Date idea_time = dateFormat.parse(comcomplaindispose.getIdea_time());
			   comcomplaindispose.setIdea_time(dateFormat.format(idea_time));
			   comcomplainappeal.setAppl_time(dateFormat.format(appl_time));
			   mv.addObject("comcomplainappeal", comcomplainappeal);
			   mv.addObject("comcomplaindispose", comcomplaindispose);
			}else if (comcomplaintinfo.getCompn_state().equals("8")){
				comComplainDispose comcomplaindispose = complaintservice.finddisposebyId("com.nasoft.aboutcar.ComplaintMapper.finddisposetbyId", complain_info_id);
				Date idea_time = dateFormat.parse(comcomplaindispose.getIdea_time());
				 comcomplaindispose.setIdea_time(dateFormat.format(idea_time));
				if(comcomplaindispose.getAppl_idea_peo()!=null && !comcomplaindispose.getAppl_idea_peo().equals("")){
				 comDisAppeal comdisappeal = 	complaintservice.findDisAppealbyID("com.nasoft.aboutcar.ComplaintMapper.findDisAppealbyID",complain_info_id);
			      comComplainAppeal comcomplainappeal = complaintservice.findappealbyId("com.nasoft.aboutcar.ComplaintMapper.findappealbyId", complain_info_id);
			      Date appl_time = dateFormat.parse(comcomplainappeal.getAppl_time());
			      Date appl_idea_time = dateFormat.parse(comcomplaindispose.getAppl_idea_time());
				  comcomplaindispose.setAppl_idea_time(dateFormat.format(appl_idea_time));
			      comcomplainappeal.setAppl_time(dateFormat.format(appl_time));
			      mv.addObject("comdisappeal", comdisappeal); 
			      mv.addObject("comcomplainappeal", comcomplainappeal);
				   mv.addObject("comcomplaindispose", comcomplaindispose);
				}else{
					 mv.addObject("comcomplaindispose", comcomplaindispose);		
				}
			}
			mv.addObject("complaindistribute",complaindistribute);
			mv.addObject("comcomplaintinfo", comcomplaintinfo);
			mv.setViewName("complaint/handlehistory");	
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
	}
	/**
	 * 打开平台申诉中的处理详情
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("appealDetail")
	public ModelAndView appealDetail(HttpServletRequest request, HttpServletResponse response){
		String complain_code = request.getParameter("complain_code");
		ModelAndView mv=new ModelAndView();
		try{
			comComplainInfo comcomplaintinfo = complaintservice.findcompcodebyId("com.nasoft.aboutcar.ComplaintMapper.findcompcodebyId", complain_code);
			int complain_info_id=comcomplaintinfo.getComplain_info_id();
			comComplainDispose complaindispose = complaintservice.finddisposebyId("com.nasoft.aboutcar.ComplaintMapper.finddisposetbyId",complain_info_id);
			
			mv.addObject("complaindispose",complaindispose);
			mv.addObject("comcomplaintinfo", comcomplaintinfo);
			mv.setViewName("complaint/appealDetail");
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 打开投诉提交页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("tocomit")
	public ModelAndView tocomit(HttpServletRequest request, HttpServletResponse response){
		String complain_code = request.getParameter("complain_code");
		ModelAndView mv=new ModelAndView();
		try{
			comComplainInfo comcomplaintinfo = complaintservice.findcompcodebyId("com.nasoft.aboutcar.ComplaintMapper.findcompcodebyId", complain_code);
			mv.addObject("comcomplaintinfo", comcomplaintinfo);
			mv.setViewName("complaint/comitindex");
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
	}
	/**
	 * 打开平台查询的详情信息
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("openComDetail")
	public ModelAndView openComDetail(HttpServletRequest request, HttpServletResponse response){
		String complain_code = request.getParameter("complain_code");
		ModelAndView mv=new ModelAndView();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try{
			comComplainInfo comcomplaintinfo = complaintservice.findcompcodebyId("com.nasoft.aboutcar.ComplaintMapper.findcompcodebyId",complain_code);
			Date create_time = dateFormat.parse(comcomplaintinfo.getCreate_time());
			comcomplaintinfo.setCreate_time(dateFormat.format(create_time));
			int complain_info_id =comcomplaintinfo.getComplain_info_id();
			if(comcomplaintinfo.getCompn_state().equals("3")){
				comComplainDistribute comcomplaindistribute = complaintservice.findacceptbyId("com.nasoft.aboutcar.ComplaintMapper.findacceptbyId",complain_info_id);
				Date distri_time = dateFormat.parse(comcomplaindistribute.getDistri_time());
				comcomplaindistribute.setDistri_time(dateFormat.format(distri_time));
				mv.addObject("comcomplaindistribute", comcomplaindistribute);
			}else if(comcomplaintinfo.getCompn_state().equals("4")){
				comComplainDispose comcomplaindispose = complaintservice.finddisposebyId("com.nasoft.aboutcar.ComplaintMapper.finddisposetbyId", complain_info_id);
				comComplainDistribute comcomplaindistribute = complaintservice.findacceptbyId("com.nasoft.aboutcar.ComplaintMapper.findacceptbyId",complain_info_id);
				Date idea_time = dateFormat.parse(comcomplaindispose.getIdea_time());
				Date distri_time = dateFormat.parse(comcomplaindistribute.getDistri_time());
				comcomplaindistribute.setDistri_time(dateFormat.format(distri_time));
				comcomplaindispose.setIdea_time(dateFormat.format(idea_time));
				mv.addObject("comcomplaindistribute", comcomplaindistribute);
				mv.addObject("comcomplaindispose", comcomplaindispose);
			}else if(comcomplaintinfo.getCompn_state().equals("5")|| comcomplaintinfo.getCompn_state().equals("6")||comcomplaintinfo.getCompn_state().equals("7")){
			   comComplainAppeal comcomplainappeal = complaintservice.findappealbyId("com.nasoft.aboutcar.ComplaintMapper.findappealbyId", complain_info_id);
			   comComplainDispose comcomplaindispose = complaintservice.finddisposebyId("com.nasoft.aboutcar.ComplaintMapper.finddisposetbyId", complain_info_id);
			   comComplainDistribute comcomplaindistribute = complaintservice.findacceptbyId("com.nasoft.aboutcar.ComplaintMapper.findacceptbyId",complain_info_id);
				mv.addObject("comcomplaindistribute", comcomplaindistribute);
			   mv.addObject("comcomplainappeal", comcomplainappeal);
			   mv.addObject("comcomplaindispose", comcomplaindispose);
			}else if (comcomplaintinfo.getCompn_state().equals("8")){
				comComplainDispose comcomplaindispose = complaintservice.finddisposebyId("com.nasoft.aboutcar.ComplaintMapper.finddisposetbyId", complain_info_id);
				comComplainDistribute comcomplaindistribute = complaintservice.findacceptbyId("com.nasoft.aboutcar.ComplaintMapper.findacceptbyId",complain_info_id);
				Date idea_time = dateFormat.parse(comcomplaindispose.getIdea_time());
				Date distri_time = dateFormat.parse(comcomplaindistribute.getDistri_time());
				comcomplaindistribute.setDistri_time(dateFormat.format(distri_time));
				comcomplaindispose.setIdea_time(dateFormat.format(idea_time));
				if(comcomplaindispose.getAppl_idea_peo()!=null && !comcomplaindispose.getAppl_idea_peo().equals("")){
			      comComplainAppeal comcomplainappeal = complaintservice.findappealbyId("com.nasoft.aboutcar.ComplaintMapper.findappealbyId", complain_info_id);
			      mv.addObject("comcomplaindistribute", comcomplaindistribute);
			      mv.addObject("comcomplainappeal", comcomplainappeal);
				   mv.addObject("comcomplaindispose", comcomplaindispose);
				}else{
					mv.addObject("comcomplaindistribute", comcomplaindistribute);
					  mv.addObject("comcomplaindispose", comcomplaindispose);
						
				}
			}
			mv.addObject("comcomplaintinfo", comcomplaintinfo);
			mv.setViewName("complaint/selectComDetail");	
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 打开平台查询的处理历史
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("openComHistory")
	public ModelAndView openComHistory(HttpServletRequest request, HttpServletResponse response){
		String complain_code = request.getParameter("complain_code");
		ModelAndView mv=new ModelAndView();
		try{
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			comComplainInfo comcomplaintinfo = complaintservice.findcompcodebyId("com.nasoft.aboutcar.ComplaintMapper.findcompcodebyId",complain_code);
			Date create_time = dateFormat.parse(comcomplaintinfo.getCreate_time());
			comcomplaintinfo.setCreate_time(dateFormat.format(create_time));
			int complain_info_id =comcomplaintinfo.getComplain_info_id();
			if(comcomplaintinfo.getCompn_state().equals("3")){
				comComplainDistribute comcomplaindistribute = complaintservice.findacceptbyId("com.nasoft.aboutcar.ComplaintMapper.findacceptbyId",complain_info_id);
				Date distri_time = dateFormat.parse(comcomplaindistribute.getDistri_time());
				comcomplaindistribute.setDistri_time(dateFormat.format(distri_time));
				mv.addObject("comcomplaindistribute", comcomplaindistribute);
			}else if(comcomplaintinfo.getCompn_state().equals("4")){
				comComplainDispose comcomplaindispose = complaintservice.finddisposebyId("com.nasoft.aboutcar.ComplaintMapper.finddisposetbyId", complain_info_id);
				comComplainDistribute comcomplaindistribute = complaintservice.findacceptbyId("com.nasoft.aboutcar.ComplaintMapper.findacceptbyId",complain_info_id);
				Date idea_time = dateFormat.parse(comcomplaindispose.getIdea_time());
				Date distri_time = dateFormat.parse(comcomplaindistribute.getDistri_time());
				comcomplaindistribute.setDistri_time(dateFormat.format(distri_time));
				comcomplaindispose.setIdea_time(dateFormat.format(idea_time));
				mv.addObject("comcomplaindistribute", comcomplaindistribute);
				mv.addObject("comcomplaindispose", comcomplaindispose);
			}else if(comcomplaintinfo.getCompn_state().equals("5")|| comcomplaintinfo.getCompn_state().equals("6")||comcomplaintinfo.getCompn_state().equals("7")){
				comComplainDispose comcomplaindispose = complaintservice.finddisposebyId("com.nasoft.aboutcar.ComplaintMapper.finddisposetbyId", complain_info_id);
				if(comcomplaintinfo.getCompn_state().equals("7")){
					   comDisAppeal comdisappeal = 	complaintservice.findDisAppealbyID("com.nasoft.aboutcar.ComplaintMapper.findDisAppealbyID",complain_info_id);
					   Date appl_idea_time = dateFormat.parse(comcomplaindispose.getAppl_idea_time());
					   comcomplaindispose.setAppl_idea_time(dateFormat.format(appl_idea_time));
					   mv.addObject("comdisappeal", comdisappeal);
				   }
			   comComplainAppeal comcomplainappeal = complaintservice.findappealbyId("com.nasoft.aboutcar.ComplaintMapper.findappealbyId", complain_info_id);
			   comComplainDistribute comcomplaindistribute = complaintservice.findacceptbyId("com.nasoft.aboutcar.ComplaintMapper.findacceptbyId",complain_info_id);
			    Date idea_time = dateFormat.parse(comcomplaindispose.getIdea_time());
				Date distri_time = dateFormat.parse(comcomplaindistribute.getDistri_time());
				Date appl_time = dateFormat.parse(comcomplainappeal.getAppl_time());
				comcomplainappeal.setAppl_time(dateFormat.format(appl_time));
				comcomplaindistribute.setDistri_time(dateFormat.format(distri_time));
				comcomplaindispose.setIdea_time(dateFormat.format(idea_time));
				mv.addObject("comcomplaindistribute", comcomplaindistribute);
			   mv.addObject("comcomplainappeal", comcomplainappeal);
			   mv.addObject("comcomplaindispose", comcomplaindispose);
			}else if (comcomplaintinfo.getCompn_state().equals("8")){
				comComplainDispose comcomplaindispose = complaintservice.finddisposebyId("com.nasoft.aboutcar.ComplaintMapper.finddisposetbyId", complain_info_id);
				comComplainDistribute comcomplaindistribute = complaintservice.findacceptbyId("com.nasoft.aboutcar.ComplaintMapper.findacceptbyId",complain_info_id);
				if(comcomplaindispose.getAppl_idea_peo()!=null && !comcomplaindispose.getAppl_idea_peo().equals("")){
				 comDisAppeal comdisappeal = 	complaintservice.findDisAppealbyID("com.nasoft.aboutcar.ComplaintMapper.findDisAppealbyID",complain_info_id);
			     comComplainAppeal comcomplainappeal = complaintservice.findappealbyId("com.nasoft.aboutcar.ComplaintMapper.findappealbyId", complain_info_id);
			     Date appl_idea_time = dateFormat.parse(comcomplaindispose.getAppl_idea_time());
			     Date idea_time = dateFormat.parse(comcomplaindispose.getIdea_time());
				Date distri_time = dateFormat.parse(comcomplaindistribute.getDistri_time());
				Date appl_time = dateFormat.parse(comcomplainappeal.getAppl_time());
				comcomplaindispose.setAppl_idea_time(dateFormat.format(appl_idea_time));
				comcomplainappeal.setAppl_time(dateFormat.format(appl_time));
				comcomplaindistribute.setDistri_time(dateFormat.format(distri_time));
				comcomplaindispose.setIdea_time(dateFormat.format(idea_time));
				mv.addObject("comdisappeal", comdisappeal);
			      mv.addObject("comcomplaindistribute", comcomplaindistribute);
			      mv.addObject("comcomplainappeal", comcomplainappeal);
				   mv.addObject("comcomplaindispose", comcomplaindispose);
				}else{
				 Date idea_time = dateFormat.parse(comcomplaindispose.getIdea_time());
				Date distri_time = dateFormat.parse(comcomplaindistribute.getDistri_time());
				comcomplaindistribute.setDistri_time(dateFormat.format(distri_time));
				comcomplaindispose.setIdea_time(dateFormat.format(idea_time));
				mv.addObject("comcomplaindistribute", comcomplaindistribute);
			    mv.addObject("comcomplaindispose", comcomplaindispose);
				}
			}
			mv.addObject("comcomplaintinfo", comcomplaintinfo);
			mv.setViewName("complaint/openComHistory");	
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
	}
	/**
	 * 打开投诉受理页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("showaccept")
	public ModelAndView showaccept(HttpServletRequest request, HttpServletResponse response){
		String complain_code = request.getParameter("complain_code");
		ModelAndView mv=new ModelAndView();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try{
			comComplainInfo comcomplaintinfo = complaintservice.findcompcodebyId("com.nasoft.aboutcar.ComplaintMapper.findcompcodebyId", complain_code);
			Date create_time = dateFormat.parse(comcomplaintinfo.getCreate_time());
			comcomplaintinfo.setCreate_time(dateFormat.format(create_time));
			mv.addObject("comcomplaintinfo", comcomplaintinfo);
			mv.setViewName("complaint/acceptcomit");
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 打开投诉处理页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("showhandle")
	public ModelAndView showhandle(HttpServletRequest request, HttpServletResponse response){
		String complain_code = request.getParameter("complain_code");
		ModelAndView mv=new ModelAndView();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try{
			comComplainInfo comcomplaintinfo = complaintservice.findcompcodebyId("com.nasoft.aboutcar.ComplaintMapper.findcompcodebyId", complain_code);
			int complain_info_id = comcomplaintinfo.getComplain_info_id();
			/*if(comcomplaintinfo.getCompn_state().equals("6")){
				comComplainDispose comcomplaindispose = complaintservice.finddisposebyId("com.nasoft.aboutcar.ComplaintMapper.finddisposetbyId", complain_info_id);
				mv.addObject("comcomplaindispose", comcomplaindispose);			
			}*/
			comComplainDistribute comcomplaindistribute = complaintservice.findacceptbyId("com.nasoft.aboutcar.ComplaintMapper.findacceptbyId",complain_info_id);
			Date create_time = dateFormat.parse(comcomplaintinfo.getCreate_time());
			Date distri_time = dateFormat.parse(comcomplaindistribute.getDistri_time());
			comcomplaindistribute.setDistri_time(dateFormat.format(distri_time));
			comcomplaintinfo.setCreate_time(dateFormat.format(create_time));
			mv.addObject("comcomplaintinfo", comcomplaintinfo);
			mv.addObject("comcomplaindistribute", comcomplaindistribute);
			mv.setViewName("complaint/handlecomit");
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 打开申诉受理页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("showappeal")
	public ModelAndView showappeal(HttpServletRequest request, HttpServletResponse response){
		String complain_code = request.getParameter("complain_code");
		ModelAndView mv=new ModelAndView();
		try{
			comComplainInfo comcomplaintinfo = complaintservice.findcompcodebyId("com.nasoft.aboutcar.ComplaintMapper.findcompcodebyId", complain_code);
			int complain_info_id = comcomplaintinfo.getComplain_info_id();
			comComplainAppeal complainappeal = complaintservice.findappealbyId("com.nasoft.aboutcar.ComplaintMapper.findappealbyId",complain_info_id);
			mv.addObject("complainappeal", complainappeal);
			mv.addObject("comcomplaintinfo", comcomplaintinfo);
			mv.setViewName("complaint/appealcomit");
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 修改投诉记录
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("updatecomp")
	public ModelAndView updatecomp(HttpServletRequest request, HttpServletResponse response,comComplainInfo comcomplaintinfo,
			@RequestParam(value="compnfile",required=false) MultipartFile compnfile ) throws IOException{
		InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
	    Properties p = new Properties();
	    p.load(in);
		String hostname = p.getProperty("ftp.hostname");
		int port = Integer.valueOf(p.getProperty("ftp.port"));
		String username = p.getProperty("ftp.username");
		String password = p.getProperty("ftp.password");
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String msg="";
		Date date = new Date();
		//String complain_code =  request.getParameter("complain_code");
		ModelAndView mv=new ModelAndView();
		MngUserInfo currentUser = getCurrentUser();
		comcomplaintinfo.setUpdate_user(currentUser.getUserName());
		comcomplaintinfo.setUpdate_time(sf.format(date));
		//complaintinfo.setComplain_code(complain_code);
	    //String pathname = "upload/comcomplaint/"+comcomplaintinfo.getComplain_code()+"/complaint";
		String pathname="upload/platform/";
			String survey_filePath = "";  //投诉文件	
			String s1="";
			String compn_file = request.getParameter("compn_file");
			if(compnfile==null && compnfile.equals("") && compn_file!=null && !compn_file.equals("")){		
				comcomplaintinfo.setCompn_file(compn_file);
			}
			if(compnfile!=null && !compnfile.equals("")&&compnfile.getSize()>0){
				//获取文件后缀名
				String carFileSuffix = compnfile.getOriginalFilename().substring(compnfile.getOriginalFilename().lastIndexOf("."));     
				//调查文件
				int surveyData =comcomplaintinfo.getComplain_info_id();//为上传文件取名字
				String surverFileName = surveyData+carFileSuffix;//组成上传文件全名
				InputStream inputStream  = compnfile.getInputStream();//IO流
				FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, surverFileName, inputStream);//上传文件
				survey_filePath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+surverFileName;//上传的全路径
				s1+=survey_filePath+";";
				System.out.println(s1);
				s1=s1.substring(0, s1.length()-1);
				comcomplaintinfo.setCompn_file(s1);
			}
		try {
			int result = complaintservice.updatecomp("com.nasoft.aboutcar.ComplaintMapper.updatecomp",comcomplaintinfo);
			if(result>0){
				msg="success";
			}else{	
				msg="failed";
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
     * 驾驶员投诉待处理信息列表
     */
	@RequestMapping("comDaichuliList")
	public ModelAndView carDaichuliList(HttpServletRequest request,HttpServletResponse response){
		String allot_depme = request.getParameter("allot_depme");
		String begin_time = request.getParameter("begin_time");
		String end_time = request.getParameter("end_time");
		ModelAndView mv=new ModelAndView();
		mv.addObject("allot_depme",allot_depme);
		mv.addObject("begin_time",begin_time);
		mv.addObject("end_time",end_time);
		mv.setViewName("complaint/comHandleIndex");
		return mv;
	}
	
	
	/**
     * 驾驶员投诉待处理信息列表
     */
	@RequestMapping("comDaichuliDetails")
	public void comDaichuliDetails(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String allot_depme = request.getParameter("allot_depme");
		String allotdepme = new String(allot_depme.getBytes("ISO-8859-1"),"utf-8");
		String complain_code = request.getParameter("complain_code");
		String begin_time = request.getParameter("begin_time");
		String end_time = request.getParameter("end_time");
		Map<String, Object> map = new HashMap<String, Object>();
		if(end_time!=null && !end_time.equals("")){
			int endtime = Integer.parseInt(end_time.substring(9))+1;
			end_time=end_time.substring(0,9)+String.valueOf(endtime);
			map.put("end_time", end_time);	
			System.out.println(end_time);
			  }	
		map.put("complain_code", complain_code);
		map.put("begin_time", begin_time);
		map.put("allotdepme", allotdepme);
		List<Map> m = new ArrayList<Map>();
		try {
			m = (List<Map>) complaintservice.comDaichuliDetails("com.nasoft.aboutcar.ComplaintMapper.comDaichuliDetail",map);			
			for( Map m1 : m){
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				m1.put("compn_time", df.format((Date) m1.get("compn_time")));
				m1.put("distri_time", df.format((Date) m1.get("distri_time")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(m.toArray());
		writer(response, array.toString());
		
	}
	
	
	/**
     * 驾驶员投诉待处理信息列表
     */
	@RequestMapping("comEndList")
	public ModelAndView comEndList(HttpServletRequest request,HttpServletResponse response){
		String allot_depme = request.getParameter("allot_depme");
		String begin_time = request.getParameter("begin_time");
		String end_time = request.getParameter("end_time");
		ModelAndView mv=new ModelAndView();
		mv.addObject("allot_depme",allot_depme);
		mv.addObject("begin_time",begin_time);
		mv.addObject("end_time",end_time);
		mv.setViewName("complaint/comEndIndex");
		return mv;
	}
	
	
	/**
     * 驾驶员投诉待处理信息列表
     */
	@RequestMapping("comEndDetails")
	public void comEndDetails(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String allot_depme = request.getParameter("allot_depme");
		String allotdepme = new String(allot_depme.getBytes("ISO-8859-1"),"utf-8");
		String complain_code = request.getParameter("complain_code");
		String begin_time = request.getParameter("begin_time");
		String end_time = request.getParameter("end_time");
		Map<String, Object> map = new HashMap<String, Object>();
		if(end_time!=null && !end_time.equals("")){
			int endtime = Integer.parseInt(end_time.substring(9))+1;
			end_time=end_time.substring(0,9)+String.valueOf(endtime);
			map.put("end_time", end_time);	
			System.out.println(end_time);
			  }	
		map.put("complain_code", complain_code);
		map.put("begin_time", begin_time);
		map.put("allotdepme", allotdepme);
		List<Map> m = new ArrayList<Map>();
		try {
			m = (List<Map>) complaintservice.comEndDetails("com.nasoft.aboutcar.ComplaintMapper.comEndDetails",map);			
			for( Map m1 : m){
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				m1.put("compn_time", df.format((Date) m1.get("compn_time")));
				m1.put("distri_time", df.format((Date) m1.get("distri_time")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(m.toArray());
		writer(response, array.toString());
		
	}
	
	
}
