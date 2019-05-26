package com.nasoft.aboutcar.complaint.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
















import com.nasoft.aboutcar.administrativePenalty.domain.DrvPlantCaseInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantCaseInfo;
import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.complaint.domain.comBlackList;
import com.nasoft.aboutcar.complaint.domain.comComplainAppeal;
import com.nasoft.aboutcar.complaint.domain.comComplainDispose;
import com.nasoft.aboutcar.complaint.domain.comComplainDistribute;
import com.nasoft.aboutcar.complaint.domain.comComplainInfo;
import com.nasoft.aboutcar.complaint.domain.comDisAppeal;
import com.nasoft.aboutcar.complaint.domain.drvBlackList;
import com.nasoft.aboutcar.complaint.domain.drvComplainAppeal;
import com.nasoft.aboutcar.complaint.domain.drvComplainDispose;
import com.nasoft.aboutcar.complaint.domain.drvComplainDistribute;
import com.nasoft.aboutcar.complaint.domain.drvComplainInfo;
import com.nasoft.aboutcar.complaint.domain.drvDisAppeal;
import com.nasoft.aboutcar.complaint.service.ComplaintService;
import com.nasoft.aboutcar.complaint.service.drvComplaintService;
import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;
import com.nasoft.aboutcar.supervise.domain.DrvIllegalInfo;
import com.nasoft.util.DateUtil;
import com.nasoft.util.FtpUtil;


@Controller
@RequestMapping("/drvcomplaint")
public class drvComplaint extends BaseController {
       
	@Resource
	drvComplaintService drvcomplaintservice;
	ComplaintService complaintservice;

	/**
	 * 打开驾驶员投诉录入首页
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("drvindex")
	public String drvindex(HttpServletRequest request,HttpServletResponse response){
		List<Map> comlist;
		try {
			comlist = drvcomplaintservice.selectAllCompn("com.nasoft.aboutcar.drvComplaintMapper.selectComName");
			request.getSession().setAttribute("comlist", comlist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "complaint/drvindex";
	}
	
	/**
	 * 打开驾驶员投诉受理首页
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("drvacceptindex")
	public String drvacceptindex(HttpServletRequest request,HttpServletResponse response){	
		return "complaint/drvacceptindex";
	}
	
	
	/**
	 * 打开驾驶员投诉处理首页
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("drvhandleindex")
	public String drvhandleindex(HttpServletRequest request,HttpServletResponse response){	
		return "complaint/drvhandleindex";
	}
	
	/**
	 * 打开驾驶员投诉录入页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("toDrvAdd")
	public String toDrvAdd(HttpServletRequest request,HttpServletResponse response){	
		return "complaint/drvadd";	
	}
	
	
	/**
	 * 打开修改投诉页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("showDrvUpdate")
	public ModelAndView showDrvUpdate(HttpServletRequest request, HttpServletResponse response){
		String complain_code = request.getParameter("complain_code");
		ModelAndView mv=new ModelAndView();
		List<Map> comlist;
		try{
			comlist = drvcomplaintservice.selectAllCompn("com.nasoft.aboutcar.drvComplaintMapper.selectComName");
		    request.getSession().setAttribute("comlist", comlist);
			drvComplainInfo drvcomplaintinfo = drvcomplaintservice.findcompcodebyId("com.nasoft.aboutcar.drvComplaintMapper.findcompcodebyId", complain_code);
			if(drvcomplaintinfo.getCompn_file()!=null && !drvcomplaintinfo.getCompn_file().equals("")){
				int compn = drvcomplaintinfo.getCompn_file().lastIndexOf("/")+1;
				String compn_file = drvcomplaintinfo.getCompn_file().substring(compn);
				mv.addObject("compn_file",compn_file);
				}
			mv.addObject("drvcomplaintinfo", drvcomplaintinfo);
			mv.setViewName("complaint/drvupdateindex");
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 打开驾驶员申诉首页
	 * @param request
	 * @param response
	 * @return
	 */
/*	@RequestMapping("drvAppealIndex")
	public String drvAppealIndex(){
		return "complaint/drvAppealIndex";
	}*/
	
	/**
	 * 打开驾驶员投诉信息查询
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("openDrvSelect")
	public String openDrvSelect(){
		return "complaint/drvSelectIndex";
	}
	
	
	/**
	 * 驾驶员投诉录入页的查询
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("findDrvComplaint")
	public void findDrvComplaint(HttpServletRequest request,HttpServletResponse response){
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			String complain_code = request.getParameter("complain_code");
			String car_number = request.getParameter("car_number");
			String begin_time = request.getParameter("begin_time");
			String end_time = request.getParameter("end_time");
			if(end_time!=null && !end_time.equals("")){
				int endtime = Integer.parseInt(end_time.substring(9))+1;
				end_time=end_time.substring(0,9)+String.valueOf(endtime);
				map.put("end_time", end_time);	
				  }	
			map.put("begin_time", begin_time);
			map.put("complain_code", complain_code);
			map.put("car_number", car_number);
			List<Map> ComList = new ArrayList<Map>();
			ComList = (List<Map>) drvcomplaintservice.findDrvComplaint("com.nasoft.aboutcar.drvComplaintMapper.findDrvComplaint",map);
			for(Map m :ComList ){
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				m.put("compn_time", dateFormat.format((Date) m.get("compn_time")));
				//m.put("enddate", dateFormat.format((Date) m.get("enddate")));
			}
			JSONArray array = JSONArray.fromObject(ComList);
			writer(response, array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 驾驶员申诉页面的查询
	 * @param request
	 * @param response
	 * @return
	 */
/*	@RequestMapping("findDrvAppeal")
	public void findDrvAppeal(HttpServletRequest request,HttpServletResponse response){
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			String complain_code = request.getParameter("complain_code");
			String car_number = request.getParameter("car_number");
			String begin_time = request.getParameter("begin_time");
			String end_time = request.getParameter("end_time");
			if(end_time!=null && !end_time.equals("")){
				int endtime = Integer.parseInt(end_time.substring(9))+1;
				end_time=end_time.substring(0,9)+String.valueOf(endtime);
				map.put("end_time", end_time);	
				  }	
			map.put("begin_time", begin_time);
			map.put("complain_code", complain_code); 
			map.put("car_number", car_number);
			List<Map> ComList = new ArrayList<Map>();
			ComList = (List<Map>) drvcomplaintservice.findDrvAppeal("com.nasoft.aboutcar.drvComplaintMapper.findDrvAppeal",map);
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
	}*/
	
	/**
	 * 申诉处理
	 * @param request
	 * @param response
	 * @return
	 */
/*	@RequestMapping("drvappealsuccess")
	public ModelAndView drvappealsuccess(HttpServletRequest request,HttpServletResponse response,drvComplainInfo drvcomplaintinfo,
			   drvComplainAppeal drvcomplainappeal, @RequestParam(value="compnfile",required=false) MultipartFile[] compn_file,
			   SimpleDateFormat sdf ){
		ModelAndView mv=new ModelAndView();
		String msg="";
		String id = request.getParameter("id");
		Date date = new Date();
	    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    SimpleDateFormat sf1 = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sf.format(date);
		MngUserInfo currentUser = getCurrentUser();
		DrvPlantCaseInfo drvplant = new DrvPlantCaseInfo();
		if(id!=null && id.equals("1")){
		drvplant.setIsappeal("02");
		drvplant.setCaseid("C"+drvcomplaintinfo.getDrv_complain_info_id());
		drvplant.setUpdatetime(sf.format(new Date()));
		drvcomplainappeal.setAppl_dis_peo(currentUser.getUserName());
		drvcomplainappeal.setAppl_dis_result("1");
		drvcomplainappeal.setAppl_dis_time(sf.format(date));
		drvcomplainappeal.setDrv_complain_info_id(drvcomplaintinfo.getDrv_complain_info_id());
		drvcomplaintinfo.setCompn_state("6");
		try {
			int result2 = drvcomplaintservice.updateDrvPlant("com.nasoft.aboutcar.drvComplaintMapper.updateDrvPlant",drvplant);
			int result = drvcomplaintservice.drvUpdate("com.nasoft.aboutcar.drvComplaintMapper.drvcomit",drvcomplaintinfo);
			int result1 = drvcomplaintservice.drvAppealComit("com.nasoft.aboutcar.drvComplaintMapper.drvappealcomit",drvcomplainappeal);
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
		drvplant.setIsappeal("03");
		drvplant.setCaseid("C"+drvcomplaintinfo.getDrv_complain_info_id());
		drvplant.setUpdatetime(sf.format(new Date()));
		drvcomplainappeal.setAppl_dis_peo(currentUser.getUserName());
		drvcomplainappeal.setAppl_dis_result("0");
		drvcomplainappeal.setAppl_dis_time(sf.format(date));
		drvcomplainappeal.setDrv_complain_info_id(drvcomplaintinfo.getDrv_complain_info_id());
		drvcomplaintinfo.setCompn_state("8");
		try {
			int result2 = drvcomplaintservice.updateDrvPlant("com.nasoft.aboutcar.drvComplaintMapper.updateDrvPlant",drvplant);
			int result = drvcomplaintservice.drvUpdate("com.nasoft.aboutcar.drvComplaintMapper.drvcomit",drvcomplaintinfo);
			int result1 = drvcomplaintservice.drvAppealComit("com.nasoft.aboutcar.drvComplaintMapper.drvappealcomit",drvcomplainappeal);
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
	}*/
	

	/**
	 * 驾驶员投诉受理页的查询
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("findDrvAccept")
	public void findDrvAccept(HttpServletRequest request,HttpServletResponse response){
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			String complain_code = request.getParameter("complain_code");
			String car_number = request.getParameter("car_number");
			String begin_time = request.getParameter("begin_time");
			String end_time = request.getParameter("end_time");
			if(end_time!=null && !end_time.equals("")){
				int endtime = Integer.parseInt(end_time.substring(9))+1;
				end_time=end_time.substring(0,9)+String.valueOf(endtime);
				map.put("end_time", end_time);	
				  }	
			map.put("begin_time", begin_time);
			map.put("complain_code", complain_code);
			map.put("car_number", car_number);
			/*MngUserInfo MngUserInfo = getCurrentUser();
			map.put("roleid", MngUserInfo.getRoleId());
			map.put("instid", MngUserInfo.getInstId());
			map.put("areacode", MngUserInfo.getAreaCode());*/
			List<Map> ComList = new ArrayList<Map>();
			ComList = (List<Map>) drvcomplaintservice.finddrvaccept("com.nasoft.aboutcar.drvComplaintMapper.findDrvAccept",map);
			for(Map m :ComList ){
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				m.put("compn_time", dateFormat.format((Date) m.get("compn_time")));
				m.put("create_time", dateFormat.format((Date) m.get("create_time")));
			}
			JSONArray array = JSONArray.fromObject(ComList);
			writer(response, array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 驾驶员投诉信息查询
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("drvselect")
	public void drvselect(HttpServletRequest request,HttpServletResponse response){
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			String complain_code = request.getParameter("complain_code");
			String car_number = request.getParameter("car_number");
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
			map.put("car_number", car_number);
			List<Map> ComList = new ArrayList<Map>();
			ComList = (List<Map>) drvcomplaintservice.selectdrv("com.nasoft.aboutcar.drvComplaintMapper.selectdrv",map);
			for(Map m :ComList ){
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				m.put("compn_time", dateFormat.format((Date) m.get("compn_time")));
				//m.put("enddate", dateFormat.format((Date) m.get("enddate")));
			}
			JSONArray array = JSONArray.fromObject(ComList);
			writer(response, array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 驾驶员投诉信息统计
	 * @return
	 */
	@RequestMapping("drvComplaintStatistics")
	public String drvComplaintStatistics(HttpServletRequest request,String driver_licence,String beginTime,String endTime){
		try {
			Map m = new HashMap();
			m.put("driver_licence", driver_licence);
			m.put("beginTime", beginTime);
			m.put("endTime", endTime);
			Map map = drvcomplaintservice.selectdrvStatistics("com.nasoft.aboutcar.drvComplaintMapper.drvComplaintStatistics",m);
			//List<Map> addressList = complaintservice.selectAllCompn("com.nasoft.aboutcar.ComplaintMapper.selectAllCompn");
	        request.getSession().setAttribute("map", map);
	       // request.getSession().setAttribute("m", m);
	       // request.getSession().setAttribute("addressList", addressList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "complaint/drvComplaintStatistics";
	}
	
	
	/**
	 * 驾驶员投诉处理页面的查询
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("findDrvHandle")
	public void findDrvHandle(HttpServletRequest request,HttpServletResponse response){
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			String complain_code = request.getParameter("complain_code");
			String car_number = request.getParameter("car_number");
			String begin_time = request.getParameter("begin_time");
			String end_time = request.getParameter("end_time");
			if(end_time!=null && !end_time.equals("")){
				int endtime = Integer.parseInt(end_time.substring(9))+1;
				end_time=end_time.substring(0,9)+String.valueOf(endtime);
				map.put("end_time", end_time);	
				  }	
			map.put("begin_time", begin_time);
			map.put("car_number", car_number);		
			map.put("complain_code", complain_code);
			List<Map> ComList = new ArrayList<Map>();
			ComList = (List<Map>) drvcomplaintservice.findDrvHandle("com.nasoft.aboutcar.drvComplaintMapper.findDrvHandle",map);
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
	 * 驾驶员投诉录入
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("addDrvComplaint")
	public ModelAndView addDrvComplaint(HttpServletRequest request,HttpServletResponse response,drvComplainInfo drvcomplaininfo,
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
	    int drv_complain_info_id =Integer.parseInt( newdate.substring(11,13)+newdate.substring(14,16)+newdate.substring(17));
	    String complaintcode = "D"+nowdate;
	    drvcomplaininfo.setCreate_user(currentUser.getUserName());
	    drvcomplaininfo.setCreate_time(sf.format(new Date()));
	    drvcomplaininfo.setCompn_time(compn_time);
	    drvcomplaininfo.setCompn_state("1");
	    drvcomplaininfo.setComplain_code(complaintcode);
	    drvcomplaininfo.setDrv_complain_info_id(drv_complain_info_id);
		//String pathname = "upload/drvcomplaint/"+drvcomplaininfo.getComplain_code()+"/complaint" ;
	    String pathname="upload/driver/";
		String survey_filePath = "";  //投诉文件	
		String s1="";	
	if(compn_file!=null && !compn_file.equals("") &&compn_file.getSize()>0){
		//获取文件后缀名
		String carFileSuffix = compn_file.getOriginalFilename().substring(compn_file.getOriginalFilename().lastIndexOf("."));     
		//调查文件
		int surveyData =drvcomplaininfo.getDrv_complain_info_id();//为上传文件取名字
		String surverFileName = surveyData+carFileSuffix;//组成上传文件全名
		InputStream inputStream  = compn_file.getInputStream();//IO流
		FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, surverFileName, inputStream);//上传文件
		survey_filePath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+surverFileName;//上传的全路径
		s1+=survey_filePath+";";
		System.out.println(s1);
		s1=s1.substring(0, s1.length()-1);
		drvcomplaininfo.setCompn_file(s1);
		}
	    try {
	    	drvcomplaintservice.addDrvComplaint("com.nasoft.aboutcar.drvComplaintMapper.addDrvComplaint", drvcomplaininfo);
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
	 * 驾驶员投诉处理
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("toHandleComit")
	public ModelAndView toHandleComit(HttpServletRequest request,HttpServletResponse response,
			drvComplainDispose drvcomplaintdispose,drvComplainInfo drvcomplaintinfo,
			   @RequestParam(value="surveyfile",required=false) MultipartFile survey_file,
			   SimpleDateFormat sdf ) throws Exception{
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
		DrvPlantCaseInfo drvplantcase = new DrvPlantCaseInfo();
		Date date = new Date();
	    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    SimpleDateFormat sf1 = new SimpleDateFormat("yyyy-MM-dd");
	    PlantCaseInfo plantcaseinfo = new PlantCaseInfo();
		String newdate = sf.format(date);
		int id =Integer.parseInt( newdate.substring(11,13)+newdate.substring(14,16)+newdate.substring(17));
		if(drvcomplaintdispose.getDis_type()!="0" && !drvcomplaintdispose.getDis_type().equals("0")){
			drvcomplaintdispose.setIs_integrity("1");
		}else{
			drvcomplaintdispose.setIs_integrity("0");
		}
		String drv_license= drvcomplaintinfo.getDriver_licence();
		//先查询是否加入过黑名单
		List<Map> result2 = drvcomplaintservice.selectblack("com.nasoft.aboutcar.drvComplaintMapper.selectblack",drv_license);
		//根据投诉状态判断是投诉处理还是申诉待处理
		if(drvcomplaintinfo.getCompn_state().equals("6")||drvcomplaintinfo.getCompn_state()=="6"){
			//加入黑名单情况下
			  drvBlackList blacklist = new drvBlackList();
			if(drvcomplaintdispose.getIs_blacklist()=="1" || drvcomplaintdispose.getIs_blacklist().equals("1")){
				  //其次判断曾经是否加入过黑名单
				  //如果曾经没加入则现在加入
				  if(result2.size()==0){
						blacklist.setDrv_license(drvcomplaintinfo.getDriver_licence());
						blacklist.setDrv_id(drvcomplaintinfo.getDriver_licence());
						blacklist.setDrv_name(drvcomplaintinfo.getDriver_name());
						blacklist.setStatus("0");
						blacklist.setStorage_date(new Date());
						blacklist.setCreate_time(sf.format(new Date()));
						blacklist.setStorager(currentUser.getUserName());
					int  result3 = drvcomplaintservice.insertblack("com.nasoft.aboutcar.drvComplaintMapper.insertblack",blacklist);	
				  //如果曾经加入过黑名单那么就更新黑名单表
				  }else{		  
						blacklist.setDrv_license(drvcomplaintinfo.getDriver_licence());
						blacklist.setDrv_id(drvcomplaintinfo.getDriver_licence());
						blacklist.setDrv_name(drvcomplaintinfo.getDriver_name());
						blacklist.setStatus("0");
						blacklist.setStorage_date(new Date());
						blacklist.setStorager(currentUser.getUserName());
						int  result3 = drvcomplaintservice.updatetblack("com.nasoft.aboutcar.drvComplaintMapper.updatetblack",blacklist);
				  }
				//不加入黑名单的情况
			}else if(drvcomplaintdispose.getIs_blacklist()=="0" || drvcomplaintdispose.getIs_blacklist().equals("0")){		
				//如果曾经加入过黑名单那么就将黑名单表状态更改为移除
				if(result2.size()==1){
					blacklist.setStatus("1");
					blacklist.setDrv_license(drvcomplaintinfo.getDriver_licence());
					int result4 = drvcomplaintservice.deleteblack("com.nasoft.aboutcar.drvComplaintMapper.deleteblack",blacklist);			
				}
			}
			String disidea = request.getParameter("disidea");
			drvDisAppeal drvdisappeal = new drvDisAppeal();
			drvdisappeal.setId(id);
			drvdisappeal.setDrv_complain_info_id(drvcomplaintinfo.getDrv_complain_info_id());
			drvdisappeal.setDisappeal_idea(drvcomplaintdispose.getDis_idea());
			drvcomplaintdispose.setAppl_idea_peo(currentUser.getUserName());
			drvcomplaintdispose.setAppl_idea_time(sf.format(date));
			drvcomplaintdispose.setDrv_complain_info_id(drvcomplaintinfo.getDrv_complain_info_id());
			drvcomplaintdispose.setDis_idea(disidea);
			drvcomplaintinfo.setCompn_state("7");
			//String pathname = "upload/drvcomplaint/"+drvcomplaintinfo.getComplain_code()+"/handle" ;
			 String pathname="upload/driver/";
			String survey_filePath = "";  //投诉文件	
			String s1="";	
		if(survey_file!=null && !survey_file.equals("") &&survey_file.getSize()>0){
			//获取文件后缀名
			String carFileSuffix = survey_file.getOriginalFilename().substring(survey_file.getOriginalFilename().lastIndexOf("."));     
			//调查文件
			int surveyData =drvcomplaintinfo.getDrv_complain_info_id();//为上传文件取名字
			String surverFileName = surveyData+carFileSuffix;//组成上传文件全名
			InputStream inputStream  = survey_file.getInputStream();//IO流
			FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, surverFileName, inputStream);//上传文件
			survey_filePath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+surverFileName;//上传的全路径
			s1+=survey_filePath+";";
			System.out.println(s1);
			s1=s1.substring(0, s1.length()-1);
			drvcomplaintdispose.setSurvey_file(s1);
			}
			try {
				drvcomplaintservice.saveDisAppeal("com.nasoft.aboutcar.drvComplaintMapper.saveDisAppeal",drvdisappeal);
				int result = drvcomplaintservice.drvUpdate("com.nasoft.aboutcar.drvComplaintMapper.drvcomit",drvcomplaintinfo);
				int result1 = drvcomplaintservice.toHandleComit("com.nasoft.aboutcar.drvComplaintMapper.drvDisposeUpdate",drvcomplaintdispose);
				if(result>0 && result1>0){
					msg="success";
				}else{	
					msg="failed";
				}
			} catch (Exception e) {
				msg="failed";
				e.printStackTrace();
			}		
		}else{
	       //如果是投诉状态为待处理时加入黑名单直接加入黑名单
			   drvBlackList blacklist = new drvBlackList();
				if(drvcomplaintdispose.getIs_blacklist()=="1" || drvcomplaintdispose.getIs_blacklist().equals("1")){
					  //其次判断曾经是否加入过黑名单
					  //如果曾经没加入则现在加入
					  if(result2.size()==0){
							blacklist.setDrv_license(drvcomplaintinfo.getDriver_licence());
							blacklist.setDrv_id(drvcomplaintinfo.getDriver_licence());
							blacklist.setDrv_name(drvcomplaintinfo.getDriver_name());
							blacklist.setStatus("0");
							blacklist.setStorage_date(new Date());
							blacklist.setStorager(currentUser.getUserName());
						int  result3 = drvcomplaintservice.insertblack("com.nasoft.aboutcar.drvComplaintMapper.insertblack",blacklist);	
					  //如果曾经加入过黑名单那么就更新黑名单表
					  }else{		  
							blacklist.setDrv_license(drvcomplaintinfo.getDriver_licence());
							blacklist.setDrv_id(drvcomplaintinfo.getDriver_licence());
							blacklist.setDrv_name(drvcomplaintinfo.getDriver_name());
							blacklist.setStatus("0");
							blacklist.setStorage_date(new Date());
							blacklist.setStorager(currentUser.getUserName());
							int  result3 = drvcomplaintservice.updatetblack("com.nasoft.aboutcar.drvComplaintMapper.updatetblack",blacklist);
					  }
					//不加入黑名单的情况下
				}else if(drvcomplaintdispose.getIs_blacklist()=="0" || drvcomplaintdispose.getIs_blacklist().equals("0")){		
					//如果曾经加入过黑名单那么就将黑名单表状态更改为移除
					if(result2.size()==1){
						blacklist.setStatus("1");
						blacklist.setDrv_license(drvcomplaintinfo.getDriver_licence());
						int result4 = drvcomplaintservice.deleteblack("com.nasoft.aboutcar.drvComplaintMapper.deleteblack",blacklist);			
					}
				}
				//处理类型非0的都需要向行政处罚表里添加数据
			if(drvcomplaintdispose.getDis_type().equals("4")){
				drvplantcase.setCaseid("C"+drvcomplaintinfo.getDrv_complain_info_id());
				drvplantcase.setPunishid("D"+drvcomplaintinfo.getDrv_complain_info_id());
				drvplantcase.setPlateName(drvcomplaintinfo.getCar_company());
				drvplantcase.setCarid(drvcomplaintinfo.getCar_number());
				drvplantcase.setCasetime(drvcomplaintinfo.getCompn_time());
				drvplantcase.setCasereason(drvcomplaintinfo.getCompn_reason());
				drvplantcase.setCaseType("01");
				drvplantcase.setDealstatus("00");
				drvplantcase.setCreateinstid(currentUser.getUserName());
				drvplantcase.setCaseuserid(currentUser.getRealName());
				drvplantcase.setUpdatetime(sf.format(new Date()));
				drvplantcase.setDrivename(drvcomplaintinfo.getDriver_name());
				drvplantcase.setDrivcarno(drvcomplaintinfo.getDriver_licence());
				drvplantcase.setIsappeal("00");
				drvplantcase.setCasesource("02");
				int result5= drvcomplaintservice.insertdrvplant("com.nasoft.aboutcar.drvComplaintMapper.insertdrvplant",drvplantcase);
			}		
		drvcomplaintinfo.setCompn_state("4");
		drvcomplaintdispose.setId(id);
		drvcomplaintdispose.setDrv_complain_info_id(drvcomplaintinfo.getDrv_complain_info_id());
		drvcomplaintdispose.setIdea_peo(currentUser.getUserName());
		drvcomplaintdispose.setIdea_time(sf.format(date));
		//String pathname = "upload/drvcomplaint/"+drvcomplaintinfo.getComplain_code()+"/handle" ;
		 String pathname="upload/driver/";
		String survey_filePath = "";  //投诉文件	
		String s1="";	
	if(survey_file!=null && !survey_file.equals("") &&survey_file.getSize()>0){
		//获取文件后缀名
		String carFileSuffix = survey_file.getOriginalFilename().substring(survey_file.getOriginalFilename().lastIndexOf("."));     
		//调查文件
		int surveyData =drvcomplaintinfo.getDrv_complain_info_id();//为上传文件取名字
		String surverFileName = surveyData+carFileSuffix;//组成上传文件全名
		InputStream inputStream  = survey_file.getInputStream();//IO流
		FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, surverFileName, inputStream);//上传文件
		survey_filePath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+surverFileName;//上传的全路径
		s1+=survey_filePath+";";
		System.out.println(s1);
		s1=s1.substring(0, s1.length()-1);
		drvcomplaintdispose.setSurvey_file(s1);
		}
		try {
			int result = drvcomplaintservice.drvUpdate("com.nasoft.aboutcar.drvComplaintMapper.drvcomit",drvcomplaintinfo);
			int result1 = drvcomplaintservice.toHandleComit("com.nasoft.aboutcar.drvComplaintMapper.toHandleComit",drvcomplaintdispose);
			if(result>0 &&result1>0){
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
	 * 驾驶员投诉受理
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("drvAcceptComit")
	public ModelAndView drvAcceptComit(HttpServletRequest request,HttpServletResponse response,drvComplainInfo drvcomplaintinfo,
			   drvComplainDistribute drvcomplaindistribute, @RequestParam(value="compnfile",required=false) MultipartFile[] compn_file,
			   SimpleDateFormat sdf ){	
		ModelAndView mv=new ModelAndView();
		String msg="";
		Date date = new Date();
	    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    SimpleDateFormat sf1 = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sf.format(date);
		int id =Integer.parseInt( newdate.substring(11,13)+newdate.substring(14,16)+newdate.substring(17));
		MngUserInfo currentUser = getCurrentUser();
		drvcomplaintinfo.setCompn_state("3");
		drvcomplaindistribute.setDistri_time(sf.format(date));
		drvcomplaindistribute.setDistri_peo(currentUser.getUserName());	
		drvcomplaindistribute.setDrv_complain_info_id(drvcomplaintinfo.getDrv_complain_info_id());
		drvcomplaindistribute.setId(id);
		try {
			int result = drvcomplaintservice.drvUpdate("com.nasoft.aboutcar.drvComplaintMapper.drvcomit",drvcomplaintinfo);
			int result1 = drvcomplaintservice.drvAcceptComit("com.nasoft.aboutcar.drvComplaintMapper.drvAcceptComit",drvcomplaindistribute);
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
	 * 保存修改驾驶员投诉记录
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 */
	   @RequestMapping("drvUpdate")
	   public ModelAndView drvUpdate(HttpServletRequest request, HttpServletResponse response,drvComplainInfo drvcomplaintinfo,
			 @RequestParam(value="compnfile",required=false) MultipartFile compnfile) throws IOException{
		InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
	    Properties p = new Properties();
	    p.load(in);
		String hostname = p.getProperty("ftp.hostname");
		int port = Integer.valueOf(p.getProperty("ftp.port"));
		String username = p.getProperty("ftp.username");
		String password = p.getProperty("ftp.password");
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss" );
		String msg="";
		//String complain_code =  request.getParameter("complain_code");
		ModelAndView mv=new ModelAndView();
		Date date = new Date();
		MngUserInfo currentUser = getCurrentUser();
		drvcomplaintinfo.setUpdate_user(currentUser.getUserName());
		drvcomplaintinfo.setUpdate_time(sf.format(date));
		//complaintinfo.setComplain_code(complain_code);
		//String pathname = "upload/drvcomplaint/"+drvcomplaintinfo.getComplain_code()+"/complaint";
		 String pathname="upload/driver/";
		String survey_filePath = "";  //投诉文件	
		String s1="";
		String compn_file = request.getParameter("compn_file");
		//如果前台传来的文件内容为空而数据库中有文件数据则证明修改内容里没有修改投诉文件所以只需要将原数据从新插入数据库即可否则会将原来的数据覆盖掉
		if(compnfile==null && compnfile.equals("") && compn_file!=null && !compn_file.equals("")){		
			drvcomplaintinfo.setCompn_file(compn_file);
		}
	if(compnfile!=null && !compnfile.equals("") &&compnfile.getSize()>0){
		//获取文件后缀名
		String carFileSuffix = compnfile.getOriginalFilename().substring(compnfile.getOriginalFilename().lastIndexOf("."));     
		//调查文件
		int surveyData =drvcomplaintinfo.getDrv_complain_info_id();//为上传文件取名字
		String surverFileName = surveyData+carFileSuffix;//组成上传文件全名
		InputStream inputStream  = compnfile.getInputStream();//IO流
		FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, surverFileName, inputStream);//上传文件
		survey_filePath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+surverFileName;//上传的全路径
		s1+=survey_filePath+";";
		System.out.println(s1);
		s1=s1.substring(0, s1.length()-1);
		drvcomplaintinfo.setCompn_file(s1);
		}
		try {
			int result = drvcomplaintservice.drvUpdate("com.nasoft.aboutcar.drvComplaintMapper.drvUpdate",drvcomplaintinfo);
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
	 * 提交驾驶员投诉
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("drvComit")
	public ModelAndView drvComit(HttpServletRequest request,HttpServletResponse response,drvComplainInfo drvcomplaintinfo,
			   @RequestParam(value="compnfile",required=false) MultipartFile[] compn_file,
			   SimpleDateFormat sdf ){
		ModelAndView mv=new ModelAndView();
		String msg="";
		drvcomplaintinfo.setCompn_state("2");
		try {
			int result = drvcomplaintservice.drvUpdate("com.nasoft.aboutcar.drvComplaintMapper.drvcomit",drvcomplaintinfo);
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
	 * 打开驾驶员投诉提交页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("toDrvComit")
	public ModelAndView toDrvComit(HttpServletRequest request, HttpServletResponse response){
		String complain_code = request.getParameter("complain_code");
		ModelAndView mv=new ModelAndView();
		try{
			drvComplainInfo drvcomplaintinfo = drvcomplaintservice.findcompcodebyId("com.nasoft.aboutcar.drvComplaintMapper.findcompcodebyId", complain_code);
			mv.addObject("drvcomplaintinfo", drvcomplaintinfo);
			mv.setViewName("complaint/drvComit");
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 删除记录
	 * @param request
	 * @param response
	 * @return
	 */
	
	@RequestMapping("comDrvDel")
	public void comDrvDle(HttpServletRequest request,HttpServletResponse response){	
		String compids = request.getParameter("compids");
		String result = "";
		try {
			drvcomplaintservice.comDel("com.nasoft.aboutcar.drvComplaintMapper.comDrvDel",compids);
			result = "success";
		} catch (Exception e) {
			result = "fail";
			e.printStackTrace();
		}
		writer(response, result);
	}
	
	/**
	 * 驾驶员投诉反馈
	 * @param request
	 * @param response
	 * @return
	 */
	
	@RequestMapping("drvFeedBack")
	public void drvFeedBack(HttpServletRequest request,HttpServletResponse response){	
		String compids = request.getParameter("compids");
		String result = "";
		try {
			drvcomplaintservice.drvFeedBack("com.nasoft.aboutcar.drvComplaintMapper.drvFeedBack",compids);
			result = "success";
		} catch (Exception e) {
			result = "fail";
			e.printStackTrace();
		}
		writer(response, result);
	}
	
	/**
	 * 打开驾驶员投诉受理页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("showdrvaccept")
	public ModelAndView showdrvaccept(HttpServletRequest request, HttpServletResponse response){
		String complain_code = request.getParameter("complain_code");
		ModelAndView mv=new ModelAndView();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try{
			drvComplainInfo drvcomplaintinfo = drvcomplaintservice.findcompcodebyId("com.nasoft.aboutcar.drvComplaintMapper.findcompcodebyId", complain_code);
			 Date create_time = dateFormat.parse(drvcomplaintinfo.getCreate_time());
			 drvcomplaintinfo.setCreate_time(dateFormat.format(create_time));
			mv.addObject("drvcomplaintinfo", drvcomplaintinfo);
			mv.setViewName("complaint/drvAcceptComit");
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
	}
	
	
	/**
	 * 打开驾驶员投诉处理页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("showDrvHandle")
	public ModelAndView showDrvHandle(HttpServletRequest request, HttpServletResponse response){
		String complain_code = request.getParameter("complain_code");
		ModelAndView mv=new ModelAndView();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try{
			drvComplainInfo drvcomplaintinfo = drvcomplaintservice.findcompcodebyId("com.nasoft.aboutcar.drvComplaintMapper.findcompcodebyId", complain_code);
			int drv_complain_info_id = drvcomplaintinfo.getDrv_complain_info_id();
			/*if(drvcomplaintinfo.getCompn_state().equals("6")){
				drvComplainDispose drvcomplaindispose = drvcomplaintservice.finddisposebyId("com.nasoft.aboutcar.drvComplaintMapper.finddisposetbyId", drv_complain_info_id);
				mv.addObject("drvcomplaindispose", drvcomplaindispose);			
			}*/
			drvComplainDistribute drvcomplaindistribute = drvcomplaintservice.findacceptbyId("com.nasoft.aboutcar.drvComplaintMapper.findacceptbyId",drv_complain_info_id);
			Date distri_time = dateFormat.parse(drvcomplaindistribute.getDistri_time());
			drvcomplaindistribute.setDistri_time(dateFormat.format(distri_time));
			 Date create_time = dateFormat.parse(drvcomplaintinfo.getCreate_time());
			 drvcomplaintinfo.setCreate_time(dateFormat.format(create_time));
			mv.addObject("drvcomplaintinfo", drvcomplaintinfo);
			mv.addObject("drvcomplaindistribute", drvcomplaindistribute);
			mv.setViewName("complaint/drvHandleComit");
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 打开驾驶员申诉中的处理详情
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("drvAppealDetail")
	public ModelAndView drvAppealDetail(HttpServletRequest request, HttpServletResponse response){
		String complain_code = request.getParameter("complain_code");
		ModelAndView mv=new ModelAndView();
		try{
			drvComplainInfo drvcomplaintinfo = drvcomplaintservice.findcompcodebyId("com.nasoft.aboutcar.drvComplaintMapper.findcompcodebyId", complain_code);
			int drv_complain_info_id=drvcomplaintinfo.getDrv_complain_info_id();
			drvComplainDispose drvcomplaindispose = drvcomplaintservice.finddisposebyId("com.nasoft.aboutcar.drvComplaintMapper.finddisposetbyId",drv_complain_info_id);
			mv.addObject("drvcomplaindispose",drvcomplaindispose);
			mv.addObject("drvcomplaintinfo", drvcomplaintinfo);
			mv.setViewName("complaint/drvAppealDetail");
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
	}
	
	
	/**
	 * 打开驾驶员申诉受理页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("showDrvAppeal")
	public ModelAndView showDrvAppeal(HttpServletRequest request, HttpServletResponse response){
		String complain_code = request.getParameter("complain_code");
		ModelAndView mv=new ModelAndView();
		try{
			String date= DateUtil.DateTimeFormat(new Date());

			drvComplainInfo drvcomplaintinfo = drvcomplaintservice.findcompcodebyId("com.nasoft.aboutcar.drvComplaintMapper.findcompcodebyId", complain_code);
			int drv_complain_info_id = drvcomplaintinfo.getDrv_complain_info_id();
			drvComplainAppeal drvplainappeal = drvcomplaintservice.findDrvAppealbyId("com.nasoft.aboutcar.drvComplaintMapper.findDrvAppealbyId",drv_complain_info_id);
			mv.addObject("drvcomplaintinfo", drvcomplaintinfo);
			mv.addObject("drvplainappeal", drvplainappeal);
			mv.setViewName("complaint/drvAppealComit");
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
	}
	
	
	/**
	 * 打开驾驶员查询的详情信息
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("openDrvDetail")
	public ModelAndView openDrvDetail(HttpServletRequest request, HttpServletResponse response){
		String complain_code = request.getParameter("complain_code");
		ModelAndView mv=new ModelAndView();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try{
			drvComplainInfo drvcomplaintinfo = drvcomplaintservice.findcompcodebyId("com.nasoft.aboutcar.drvComplaintMapper.findcompcodebyId",complain_code);
			 Date create_time = dateFormat.parse(drvcomplaintinfo.getCreate_time());
			 drvcomplaintinfo.setCreate_time(dateFormat.format(create_time));
			int drv_complain_info_id =drvcomplaintinfo.getDrv_complain_info_id();
			if(drvcomplaintinfo.getCompn_state().equals("3")){
				drvComplainDistribute drvcomplaindistribute = drvcomplaintservice.findacceptbyId("com.nasoft.aboutcar.drvComplaintMapper.findacceptbyId",drv_complain_info_id);
				Date distri_time = dateFormat.parse(drvcomplaindistribute.getDistri_time());
				drvcomplaindistribute.setDistri_time(dateFormat.format(distri_time));
				mv.addObject("drvcomplaindistribute", drvcomplaindistribute);
			}else if(drvcomplaintinfo.getCompn_state().equals("4")){
				drvComplainDispose drvcomplaindispose = drvcomplaintservice.finddisposebyId("com.nasoft.aboutcar.drvComplaintMapper.finddisposetbyId", drv_complain_info_id);
				drvComplainDistribute drvcomplaindistribute = drvcomplaintservice.findacceptbyId("com.nasoft.aboutcar.drvComplaintMapper.findacceptbyId",drv_complain_info_id);
				Date idea_time = dateFormat.parse(drvcomplaindispose.getIdea_time());
				Date distri_time = dateFormat.parse(drvcomplaindistribute.getDistri_time());
				drvcomplaindispose.setIdea_time(dateFormat.format(idea_time));
				drvcomplaindistribute.setDistri_time(dateFormat.format(distri_time));
				mv.addObject("drvcomplaindistribute", drvcomplaindistribute);
				mv.addObject("drvcomplaindispose", drvcomplaindispose);
			}else if(drvcomplaintinfo.getCompn_state().equals("5")|| drvcomplaintinfo.getCompn_state().equals("6")||drvcomplaintinfo.getCompn_state().equals("7")){
			   drvComplainAppeal drvcomplainappeal = drvcomplaintservice.findDrvAppealbyId("com.nasoft.aboutcar.drvComplaintMapper.findDrvAppealbyId", drv_complain_info_id);
			   drvComplainDispose drvcomplaindispose = drvcomplaintservice.finddisposebyId("com.nasoft.aboutcar.drvComplaintMapper.finddisposetbyId", drv_complain_info_id);
				drvComplainDistribute drvcomplaindistribute = drvcomplaintservice.findacceptbyId("com.nasoft.aboutcar.drvComplaintMapper.findacceptbyId",drv_complain_info_id);
				mv.addObject("drvcomplaindistribute", drvcomplaindistribute);
			   mv.addObject("drvcomplainappeal", drvcomplainappeal);
			   mv.addObject("drvcomplaindispose", drvcomplaindispose);
			}else if (drvcomplaintinfo.getCompn_state().equals("8")){
				drvComplainDispose drvcomplaindispose = drvcomplaintservice.finddisposebyId("com.nasoft.aboutcar.drvComplaintMapper.finddisposetbyId", drv_complain_info_id);
				drvComplainDistribute drvcomplaindistribute = drvcomplaintservice.findacceptbyId("com.nasoft.aboutcar.drvComplaintMapper.findacceptbyId",drv_complain_info_id);
				Date idea_time = dateFormat.parse(drvcomplaindispose.getIdea_time());
				Date distri_time = dateFormat.parse(drvcomplaindistribute.getDistri_time());
				drvcomplaindispose.setIdea_time(dateFormat.format(idea_time));
				drvcomplaindistribute.setDistri_time(dateFormat.format(distri_time));
				if(drvcomplaindispose.getAppl_idea_peo()!=null && !drvcomplaindispose.getAppl_idea_peo().equals("")){
			      drvComplainAppeal drvcomplainappeal = drvcomplaintservice.findDrvAppealbyId("com.nasoft.aboutcar.drvComplaintMapper.findDrvAppealbyId", drv_complain_info_id);
			      mv.addObject("drvcomplaindistribute", drvcomplaindistribute);
			      mv.addObject("drvcomplainappeal", drvcomplainappeal);
				   mv.addObject("drvcomplaindispose", drvcomplaindispose);
				}else{
					mv.addObject("drvcomplaindistribute", drvcomplaindistribute);
					  mv.addObject("drvcomplaindispose", drvcomplaindispose);
				}
			}
		mv.addObject("drvcomplaintinfo", drvcomplaintinfo);
		mv.setViewName("complaint/selectDrvDetail");	
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
	}
	
	
	
	/**
	 * 打开驾驶员投诉查询的处理历史
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("openDrvHistory")
	public ModelAndView openDrvHistory(HttpServletRequest request, HttpServletResponse response){
		String complain_code = request.getParameter("complain_code");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		ModelAndView mv=new ModelAndView();
		try{
			drvComplainInfo drvcomplaintinfo = drvcomplaintservice.findcompcodebyId("com.nasoft.aboutcar.drvComplaintMapper.findcompcodebyId",complain_code);
			 int drv_complain_info_id =drvcomplaintinfo.getDrv_complain_info_id();
			 Date create_time = dateFormat.parse(drvcomplaintinfo.getCreate_time());
			 drvcomplaintinfo.setCreate_time(dateFormat.format(create_time));
			if(drvcomplaintinfo.getCompn_state().equals("3")){
				drvComplainDistribute drvcomplaindistribute = drvcomplaintservice.findacceptbyId("com.nasoft.aboutcar.drvComplaintMapper.findacceptbyId",drv_complain_info_id);
				Date distri_time = dateFormat.parse(drvcomplaindistribute.getDistri_time());
				drvcomplaindistribute.setDistri_time(dateFormat.format(distri_time));
				mv.addObject("drvcomplaindistribute", drvcomplaindistribute);	
			}else if(drvcomplaintinfo.getCompn_state().equals("4")){
				drvComplainDispose drvcomplaindispose = drvcomplaintservice.finddisposebyId("com.nasoft.aboutcar.drvComplaintMapper.finddisposetbyId", drv_complain_info_id);
				drvComplainDistribute drvcomplaindistribute = drvcomplaintservice.findacceptbyId("com.nasoft.aboutcar.drvComplaintMapper.findacceptbyId",drv_complain_info_id);
				Date idea_time = dateFormat.parse(drvcomplaindispose.getIdea_time());
				Date distri_time = dateFormat.parse(drvcomplaindistribute.getDistri_time());
				drvcomplaindispose.setIdea_time(dateFormat.format(idea_time));
				drvcomplaindistribute.setDistri_time(dateFormat.format(distri_time));
				mv.addObject("drvcomplaindistribute", drvcomplaindistribute);
				mv.addObject("drvcomplaindispose", drvcomplaindispose);
			}else if(drvcomplaintinfo.getCompn_state().equals("5")|| drvcomplaintinfo.getCompn_state().equals("6")||drvcomplaintinfo.getCompn_state().equals("7")){
				drvComplainDispose drvcomplaindispose = drvcomplaintservice.finddisposebyId("com.nasoft.aboutcar.drvComplaintMapper.finddisposetbyId", drv_complain_info_id);
				 if(drvcomplaintinfo.getCompn_state().equals("7")){
					   drvDisAppeal drvdisappeal = 	drvcomplaintservice.findDisAppealbyID("com.nasoft.aboutcar.drvComplaintMapper.findDisAppealbyID",drv_complain_info_id);
					   Date appl_idea_time = dateFormat.parse(drvcomplaindispose.getAppl_idea_time());
					   drvcomplaindispose.setAppl_idea_time(dateFormat.format(appl_idea_time));
					   mv.addObject("drvdisappeal", drvdisappeal);
				   }
			   drvComplainAppeal drvcomplainappeal = drvcomplaintservice.findDrvAppealbyId("com.nasoft.aboutcar.drvComplaintMapper.findDrvAppealbyId", drv_complain_info_id);
				drvComplainDistribute drvcomplaindistribute = drvcomplaintservice.findacceptbyId("com.nasoft.aboutcar.drvComplaintMapper.findacceptbyId",drv_complain_info_id);
				Date appl_time = dateFormat.parse(drvcomplainappeal.getAppl_time());
				Date idea_time = dateFormat.parse(drvcomplaindispose.getIdea_time());
				Date distri_time = dateFormat.parse(drvcomplaindistribute.getDistri_time());
				drvcomplaindispose.setIdea_time(dateFormat.format(idea_time));
				drvcomplaindistribute.setDistri_time(dateFormat.format(distri_time));
				drvcomplainappeal.setAppl_time(dateFormat.format(appl_time));
				mv.addObject("drvcomplaindistribute", drvcomplaindistribute);
			   mv.addObject("drvcomplainappeal", drvcomplainappeal);
			   mv.addObject("drvcomplaindispose", drvcomplaindispose);
			}else if (drvcomplaintinfo.getCompn_state().equals("8")){
				drvComplainDispose drvcomplaindispose = drvcomplaintservice.finddisposebyId("com.nasoft.aboutcar.drvComplaintMapper.finddisposetbyId", drv_complain_info_id);
				drvComplainDistribute drvcomplaindistribute = drvcomplaintservice.findacceptbyId("com.nasoft.aboutcar.drvComplaintMapper.findacceptbyId",drv_complain_info_id);
				if(drvcomplaindispose.getAppl_idea_peo()!=null && !drvcomplaindispose.getAppl_idea_peo().equals("")){
			     drvComplainAppeal drvcomplainappeal = drvcomplaintservice.findDrvAppealbyId("com.nasoft.aboutcar.drvComplaintMapper.findDrvAppealbyId", drv_complain_info_id);
				drvDisAppeal drvdisappeal = 	drvcomplaintservice.findDisAppealbyID("com.nasoft.aboutcar.drvComplaintMapper.findDisAppealbyID",drv_complain_info_id);
				Date appl_idea_time = dateFormat.parse(drvcomplaindispose.getAppl_idea_time());
				drvcomplaindispose.setAppl_idea_time(dateFormat.format(appl_idea_time));
			    Date appl_time = dateFormat.parse(drvcomplainappeal.getAppl_time());
				Date idea_time = dateFormat.parse(drvcomplaindispose.getIdea_time());
				Date distri_time = dateFormat.parse(drvcomplaindistribute.getDistri_time());
				drvcomplaindispose.setIdea_time(dateFormat.format(idea_time));
				drvcomplaindistribute.setDistri_time(dateFormat.format(distri_time));
				drvcomplainappeal.setAppl_time(dateFormat.format(appl_time));
				  mv.addObject("drvdisappeal", drvdisappeal);
			      mv.addObject("drvcomplaindistribute", drvcomplaindistribute);
			      mv.addObject("drvcomplainappeal", drvcomplainappeal);
				   mv.addObject("drvcomplaindispose", drvcomplaindispose);
				}else{
					Date idea_time = dateFormat.parse(drvcomplaindispose.getIdea_time());
					Date distri_time = dateFormat.parse(drvcomplaindistribute.getDistri_time());
					drvcomplaindispose.setIdea_time(dateFormat.format(idea_time));
					drvcomplaindistribute.setDistri_time(dateFormat.format(distri_time));
					mv.addObject("drvcomplaindistribute", drvcomplaindistribute);
					  mv.addObject("drvcomplaindispose", drvcomplaindispose);
				}
			}
			mv.addObject("drvcomplaintinfo", drvcomplaintinfo);
			mv.setViewName("complaint/openDrvHistory");	
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 打开驾驶员受理页中的处理历史
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("showDrvAcceptHistory")
	public ModelAndView showDrvAcceptHistory(HttpServletRequest request, HttpServletResponse response){
		String complain_code = request.getParameter("complain_code");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		ModelAndView mv=new ModelAndView();
		try{
			drvComplainInfo drvcomplaintinfo = drvcomplaintservice.findcompcodebyId("com.nasoft.aboutcar.drvComplaintMapper.findcompcodebyId", complain_code);
			Date create_time = dateFormat.parse(drvcomplaintinfo.getCreate_time());
			drvcomplaintinfo.setCreate_time(dateFormat.format(create_time));
			mv.addObject("drvcomplaintinfo", drvcomplaintinfo);
			mv.setViewName("complaint/drvaccepthistory");
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 打开驾驶员处理页中的处理历史
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("showDrvHandleHistory")
	public ModelAndView showDrvHandleHistory(HttpServletRequest request, HttpServletResponse response){
		String complain_code = request.getParameter("complain_code");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		ModelAndView mv=new ModelAndView();
		try{
			drvComplainInfo drvcomplaintinfo = drvcomplaintservice.findcompcodebyId("com.nasoft.aboutcar.drvComplaintMapper.findcompcodebyId", complain_code);
			int drv_complain_info_id=drvcomplaintinfo.getDrv_complain_info_id();
			drvComplainDistribute drvcomplaindistribute = drvcomplaintservice.findacceptbyId("com.nasoft.aboutcar.drvComplaintMapper.findacceptbyId",drv_complain_info_id);
			Date create_time = dateFormat.parse(drvcomplaintinfo.getCreate_time());
			drvcomplaintinfo.setCreate_time(dateFormat.format(create_time));
			Date distri_time = dateFormat.parse(drvcomplaindistribute.getDistri_time());
			drvcomplaindistribute.setDistri_time(dateFormat.format(distri_time));
			 if(drvcomplaintinfo.getCompn_state().equals("4")){
				drvComplainDispose drvcomplaindispose = drvcomplaintservice.finddisposebyId("com.nasoft.aboutcar.drvComplaintMapper.finddisposetbyId", drv_complain_info_id);
				Date idea_time = dateFormat.parse(drvcomplaindispose.getIdea_time());
				drvcomplaindispose.setIdea_time(dateFormat.format(idea_time));
				mv.addObject("drvcomplaindispose", drvcomplaindispose);
			}else if(drvcomplaintinfo.getCompn_state().equals("5")|| drvcomplaintinfo.getCompn_state().equals("6")||drvcomplaintinfo.getCompn_state().equals("7")){
			   drvComplainAppeal drvcomplainappeal = drvcomplaintservice.findDrvAppealbyId("com.nasoft.aboutcar.drvComplaintMapper.findDrvAppealbyId", drv_complain_info_id);
			   drvComplainDispose drvcomplaindispose = drvcomplaintservice.finddisposebyId("com.nasoft.aboutcar.drvComplaintMapper.finddisposetbyId", drv_complain_info_id);
			   if(drvcomplaintinfo.getCompn_state().equals("7")){
				   drvDisAppeal drvdisappeal = 	drvcomplaintservice.findDisAppealbyID("com.nasoft.aboutcar.drvComplaintMapper.findDisAppealbyID",drv_complain_info_id);
				   Date appl_idea_time = dateFormat.parse(drvcomplaindispose.getAppl_idea_time());
				   drvcomplaindispose.setAppl_idea_time(dateFormat.format(appl_idea_time));
				   mv.addObject("drvdisappeal", drvdisappeal);
			   }
			   Date appl_time = dateFormat.parse(drvcomplainappeal.getAppl_time());
			   Date idea_time = dateFormat.parse(drvcomplaindispose.getIdea_time());
			   drvcomplainappeal.setAppl_time(dateFormat.format(appl_time));
			   drvcomplaindispose.setIdea_time(dateFormat.format(idea_time));
			   mv.addObject("drvcomplainappeal", drvcomplainappeal);
			   mv.addObject("drvcomplaindispose", drvcomplaindispose);
			}else if (drvcomplaintinfo.getCompn_state().equals("8")){
				drvComplainDispose drvcomplaindispose = drvcomplaintservice.finddisposebyId("com.nasoft.aboutcar.drvComplaintMapper.finddisposetbyId", drv_complain_info_id);
				   Date idea_time = dateFormat.parse(drvcomplaindispose.getIdea_time());
				   drvcomplaindispose.setIdea_time(dateFormat.format(idea_time));
				if(drvcomplaindispose.getAppl_idea_peo()!=null && !drvcomplaindispose.getAppl_idea_peo().equals("")){
			      drvComplainAppeal drvcomplainappeal = drvcomplaintservice.findDrvAppealbyId("com.nasoft.aboutcar.drvComplaintMapper.findDrvAppealbyId", drv_complain_info_id);
				   drvDisAppeal drvdisappeal = 	drvcomplaintservice.findDisAppealbyID("com.nasoft.aboutcar.drvComplaintMapper.findDisAppealbyID",drv_complain_info_id);
				   Date appl_idea_time = dateFormat.parse(drvcomplaindispose.getAppl_idea_time());
				   Date appl_time = dateFormat.parse(drvcomplainappeal.getAppl_time());
				   drvcomplaindispose.setAppl_idea_time(dateFormat.format(appl_idea_time));
				   drvcomplainappeal.setAppl_time(dateFormat.format(appl_time));
				   mv.addObject("drvdisappeal", drvdisappeal);  
			      mv.addObject("drvcomplainappeal", drvcomplainappeal);
				   mv.addObject("drvcomplaindispose", drvcomplaindispose);
				}else{
					  mv.addObject("drvcomplaindispose", drvcomplaindispose);
				}
			}
			mv.addObject("drvcomplaindistribute",drvcomplaindistribute);
			mv.addObject("drvcomplaintinfo", drvcomplaintinfo);
			mv.setViewName("complaint/drvHandleHistory");
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 打开驾驶员投诉信息处理查询
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("openDrvHandleSelect")
	public String openDrvHandleSelect(){
		return "complaint/drvHandleSelect";
	}
	
	/**
	 * 驾驶员投诉信息处理查询
	 * @return
	 */
	@RequestMapping("drvHandleSelect")
	public void drvHandleSelect(HttpServletRequest request,HttpServletResponse response,String allot_depme,String begin_time,String end_time){
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
			List<Map> HandleList = drvcomplaintservice.drvHandleSelect("com.nasoft.aboutcar.drvComplaintMapper.drvHandleSelect",map);
	        JSONArray array = JSONArray.fromObject(HandleList);
	        writer(response, array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
     * 驾驶员投诉待处理信息列表
     */
	@RequestMapping("drvDaichuliList")
	public String drvDaichuliList(HttpServletRequest request,HttpServletResponse response){
		String allot_depme = request.getParameter("allot_depme");
		String begin_time = request.getParameter("begin_time");
		String end_time = request.getParameter("end_time");
		request.getSession().setAttribute("begin_time", begin_time);
		request.getSession().setAttribute("allot_depme", allot_depme);
		request.getSession().setAttribute("end_time", end_time);
		return "complaint/drvDaichuliDetail";
	}
	
	/**
     * 驾驶证号验证
     */
	@RequestMapping("reg")
	public void reg(HttpServletRequest request,HttpServletResponse response){
	 String driver_licence = request.getParameter("driver_licence");	 
	try {
		List<Map> result = drvcomplaintservice.reg("com.nasoft.aboutcar.drvComplaintMapper.reg",driver_licence);
		 if(result.size()>0){	 
			 writer(response, "success");
		 }else{
			 writer(response, "erro");
		  }
	} catch (Exception e) {
		 writer(response, "faile");
		e.printStackTrace();
	  }
			
	}
	
	@RequestMapping("drvDaichuliDetail")
	public void drvDaichuliDetail(HttpServletRequest request,HttpServletResponse response) throws Exception{
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
			m = (List<Map>) drvcomplaintservice.drvDaichuliDetail("com.nasoft.aboutcar.drvComplaintMapper.drvDaichuliDetail",map);			
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
     * 驾驶员投诉已完成信息列表
     */
	@RequestMapping("drvYiwanchengList")
	public String drvYiwanchengList(HttpServletRequest request,HttpServletResponse response,String str){	
		/*String allot_depme="";  
		String begintime="";  
		String endtime="";  		
		if(str!=null&&!str.equals("")){
		    int x=0;
		  for (int i = 0; i < str.length(); i++) {			
  		   if(str.substring(i,i+1).equals(";")){
				x++;
			 }
		   }
		 String str1;
		  for (int i = 0; i <x; i++) {
			 allot_depme= str.substring(0,str.indexOf(";"));
			 str1=str.substring(str.indexOf(";")+1);
			 begintime = str1.substring(0,str1.indexOf(";"));
			 endtime = str1.substring(str1.indexOf(";")+1);
		  }
		  
		}
		request.getSession().setAttribute("begin_time", begintime);
		request.getSession().setAttribute("allot_depme", allot_depme);
		request.getSession().setAttribute("end_time", endtime);	*/
		String allot_depme = request.getParameter("allot_depme");
		String begin_time = request.getParameter("begin_time");
		String end_time = request.getParameter("end_time");
		request.getSession().setAttribute("begin_time", begin_time);
		request.getSession().setAttribute("allot_depme", allot_depme);
		request.getSession().setAttribute("end_time", end_time);
		return "complaint/drvYiwanchengDetail";
	}
	
	@RequestMapping("drvYiwanchengDetail")
	public void drvYiwanchengDetail(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String allot_depme = request.getParameter("allot_depme");
		String beigin = request.getParameter("allot_depme");
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
			m = (List<Map>) drvcomplaintservice.drvDaichuliDetail("com.nasoft.aboutcar.drvComplaintMapper.drvYiwanchengDetail",map);			
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
