package com.nasoft.SSM.controller.vehicle;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import sun.invoke.empty.Empty;

import com.mysql.jdbc.StringUtils;
import com.nasoft.SSM.base.ZipUtils;
import com.nasoft.SSM.base.controller.BaseController;
import com.nasoft.SSM.domain.BespeakSum;
import com.nasoft.SSM.domain.CancelApply;
import com.nasoft.SSM.domain.CarChangeApply;
import com.nasoft.SSM.domain.CarInfo;
import com.nasoft.SSM.domain.CarPermitApply;
import com.nasoft.SSM.domain.CarPermitcert;
import com.nasoft.SSM.domain.InstInfo;
import com.nasoft.SSM.domain.PilotBespeak;
import com.nasoft.SSM.service.AreaCodeService;
import com.nasoft.SSM.service.CarPilotApplyService;
import com.nasoft.SSM.service.DrvBespeakService;
import com.nasoft.SSM.service.InstInfoService;
import com.nasoft.SSM.service.PilotBespeakService;
import com.nasoft.util.DateUtil;
import com.nasoft.util.FtpUtil;

import net.sf.json.JSONArray;

/**
 * 机动车业务
 * @author user
 *
 */
@Controller
@RequestMapping("/vehicle")
public class VehicleController extends BaseController{
	
	private static Logger logger=Logger.getLogger(VehicleController.class);
	
	private static String _USERTYPE = "0";
	
	 
	@Resource
	private CarPilotApplyService carPilotApplyService;
	
	@Resource
	private AreaCodeService areaCodeService;
	
	@Resource
	private InstInfoService instInfoService;
	@Resource
	private PilotBespeakService pilotBespeakService;
	@Resource
	private DrvBespeakService drvBespeakService;
	/**
	 * 打开许可申请
	 * @param request
	 * @return
	 */
	@RequestMapping("/openPilotApply")
	public String openPilotApply(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			try {
				Map map = new HashMap();
				map.put("certNo", userName);
				map.put("applyType", "1");//申请状态
				List<CarPermitApply> permitapplyList = carPilotApplyService.findAllCarPermitApplyByCertNo("com.nasoft.aboutcar.carMapper.findAllCarPermitApplyByCertNo", map);
				if(null != permitapplyList && permitapplyList.size()>0){
					//如果不通过
					if(permitapplyList.get(0).getApplyType().equals("1") && permitapplyList.get(0).getAppStatus().equals("-1")){
						
						CarInfo carInfo=carPilotApplyService.findCarInfoByCertNo("com.nasoft.aboutcar.carMapper.findCarByCertNo", userName);
						CarPermitApply carPermitApply=permitapplyList.get(0);
						
						request.setAttribute("carInfo", carInfo);
						request.setAttribute("carPermitApply", carPermitApply);
						return "vehicle/pilotApplyUpdate";
					}else{
						return "redirect:openProgressList.action";
					} 
				    
				}else{
					return "vehicle/pilotApply";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return null;
		}
	}
	
	
	/**
	 * 打开车辆外勘
	 * @param request
	 * @return
	 */
	@RequestMapping("/openExternalExploration")
	public String openExternalExploration(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			String flag = "0";
			Map map = new HashMap();
			map.put("certNo", userName);
			map.put("applyType", "1");//申请状态
			try {
				List<CarPermitApply> carPermitApplyList = carPilotApplyService.findAllCarPermitApplyByCertNo("com.nasoft.aboutcar.carMapper.findAllCarPermitApplyByCertNo", map);
				if(carPermitApplyList.size()>0){
					CarPermitApply ca=carPermitApplyList.get(0);
					if(ca.getAppStatus().equals("1") || ca.getAppStatus().equals("-2")){//车辆认证已通过或车辆外勘不通过
						flag = "1";
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("flag", flag);
			return "vehicle/externalExploration";
		}
	}
	
	/**
	 * 上传车辆外勘资料
	 * @param request
	 * @return
	 */
	@RequestMapping("/addExternalExploration")
	public void addExternalExploration(HttpServletRequest request,HttpServletResponse response,@RequestParam(value="externalexplorationFile",required=false) MultipartFile externalexplorationFile){
		logger.info("上传车辆外勘资料..");
		String userName = (String) request.getSession().getAttribute("userName");
		try {
			InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
		    Properties p = new Properties();
		    p.load(in);
            
			String hostname = p.getProperty("ftp.hostname");
			int port = Integer.valueOf(p.getProperty("ftp.port"));
			String username = p.getProperty("ftp.username");
			String password = p.getProperty("ftp.password");
			String pathname = "upload/car/"+userName; 
			String externalexplorationPath = "";
			if(null != externalexplorationFile){
				String filename = "externalExploration"+externalexplorationFile.getOriginalFilename().substring(externalexplorationFile.getOriginalFilename().lastIndexOf(".")); 
				InputStream inputStream  = externalexplorationFile.getInputStream();
				Boolean flag = FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, filename, inputStream);
				if(flag){
					externalexplorationPath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+filename;
				}
			}
			
			Map map = new HashMap();
			map.put("certNo", userName);
			map.put("applyType", "1");//申请状态
			List<CarPermitApply> carPermitApplyList = carPilotApplyService.findAllCarPermitApplyByCertNo("com.nasoft.aboutcar.carMapper.findAllCarPermitApplyByCertNo", map);
			if(carPermitApplyList.size()>0){
				CarPermitApply ca=carPermitApplyList.get(0);
				ca.setExternalExploration(externalexplorationPath);
				ca.setAppStatus("1");
				carPilotApplyService.updateExternalExploration("com.nasoft.aboutcar.carMapper.updateExternalExploration", ca);
			
			}
			writer(response, "success");
		} catch (Exception e) {
			try {
				writer(response, "error");
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		 
	}
	
	/**
	 * 打开变更车辆性质页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/openChangeProperty")
	public String openChangeProperties(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			String flag = "0";
			Map map = new HashMap();
			map.put("certNo", userName);
			map.put("applyType", "1");//申请状态
			try {
				List<CarPermitApply> carPermitApplyList = carPilotApplyService.findAllCarPermitApplyByCertNo("com.nasoft.aboutcar.carMapper.findAllCarPermitApplyByCertNo", map);
				if(carPermitApplyList.size()>0){
					CarPermitApply ca=carPermitApplyList.get(0);
					if(ca.getAppStatus().equals("2") || ca.getAppStatus().equals("-3")){//车辆外勘已通过或变更车辆性质不通过
						flag = "1";
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("flag", flag);
			return "vehicle/changeProperty";
		}
	}
	
	/**
	 * 上传车辆变更性质文件
	 * @param request
	 * @return
	 */
	@RequestMapping("/addChangeProperty")
	public void addChangeProperty(HttpServletRequest request,HttpServletResponse response,@RequestParam(value="changePropertyFile",required=false) MultipartFile changePropertyFile){
		logger.info("上传车辆变更性质文件..");
		String userName = (String) request.getSession().getAttribute("userName");
		try {
			InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
		    Properties p = new Properties();
		    p.load(in);
            
			String hostname = p.getProperty("ftp.hostname");
			int port = Integer.valueOf(p.getProperty("ftp.port"));
			String username = p.getProperty("ftp.username");
			String password = p.getProperty("ftp.password");
			String pathname = "upload/car/"+userName; 
			String changePropertyPath = "";
			if(null != changePropertyFile){
				String filename = "changeProperty"+changePropertyFile.getOriginalFilename().substring(changePropertyFile.getOriginalFilename().lastIndexOf(".")); 
				InputStream inputStream  = changePropertyFile.getInputStream();
				Boolean flag = FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, filename, inputStream);
				if(flag){
					changePropertyPath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+filename;
				}
			}
			
			Map map = new HashMap();
			map.put("certNo", userName);
			map.put("applyType", "1");//申请状态
			List<CarPermitApply> carPermitApplyList = carPilotApplyService.findAllCarPermitApplyByCertNo("com.nasoft.aboutcar.carMapper.findAllCarPermitApplyByCertNo", map);
			if(carPermitApplyList.size()>0){
				CarPermitApply ca=carPermitApplyList.get(0);
				ca.setChangeProperty(changePropertyPath);
				ca.setAppStatus("2");
				carPilotApplyService.updateChangeProperty("com.nasoft.aboutcar.carMapper.updateChangeProperty", ca);
			}
			writer(response, "success");
		} catch (Exception e) {
			try {
				writer(response, "error");
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		 
	}
	
	/**
	 * 打开补办申请
	 * @param request
	 * @return
	 */
	@RequestMapping("/openCompensateApply")
	public String openCompensateApply(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			try {
				List<CarPermitcert> carPermitcertList = carPilotApplyService.findCarCertByCertNo("com.nasoft.aboutcar.carMapper.findCarCertByCertNo", userName);
				if(carPermitcertList.size() > 0){
					Map map = new HashMap();
					map.put("certNo", userName);
					map.put("applyType", "5");//补办状态
					List<CarPermitApply> permitapplyList = carPilotApplyService.findAllCarPermitApplyByCertNo("com.nasoft.aboutcar.carMapper.findAllCarPermitApplyByCertNo", map);
					if(permitapplyList.size() > 0 && !permitapplyList.get(0).getAppStatus().equals("2")){//此用户下存在补办申请没有发证
						return "redirect:openProgressList.action";
					}
					request.setAttribute("carPermitcert", carPermitcertList.get(0));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "vehicle/compensateApply";
		}
	}
	
	/**
	 * 添加车辆运输证补办信息
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/addCompensateApply")
	public void addCompensateApply(HttpServletRequest request,HttpServletResponse response,String applyId,String remark) throws Exception{
		logger.info("添加车辆运输证补办信息..");
		String userName = (String) request.getSession().getAttribute("userName");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		try {
			List<CarPermitcert> carPermitcertList = carPilotApplyService.findCarCertByCertNo("com.nasoft.aboutcar.carMapper.findCarCertByCertNo", userName);
			if(carPermitcertList.size() > 0){
				CarPermitApply carPermitApply = carPilotApplyService.findCarApplyByApplyId("com.nasoft.aboutcar.carMapper.findCarApplyByApplyId", carPermitcertList.get(0).getApplyId());
				carPermitApply.setApplyId(applyId);
				carPermitApply.setApplyDate(sdf.format(new Date()));
				carPermitApply.setApplyType("4");//补办
				carPermitApply.setAppStatus("3");//已通过审核		
				carPermitApply.setCreateDate(sdf.format(new Date()));
				carPermitApply.setUpdDateTime(sdf.format(new Date()));
				carPermitApply.setRemark(remark);
				carPilotApplyService.addCarPermitApply("com.nasoft.aboutcar.carMapper.insertCarPermitApply", carPermitApply);
			}
			
            writer(response, "success");
		} catch (Exception e) {
	        writer(response, "error");
			e.printStackTrace();
		}
	}
	
	/**
	 * 打开车辆变更申请
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/openChangeApply")
	public String openChangeApply(HttpServletRequest request,String applyid) throws Exception{
		String userName = (String) request.getSession().getAttribute("userName");
		Map map = new HashMap();
		map.put("certNo", userName);
		
		List<CarChangeApply> carChangeApply=null;
		List<CarPermitApply> carPermitApplyList= carPilotApplyService.findAllCarPermitApplyByCertNo("com.nasoft.aboutcar.carMapper.findAllCarPermitApplyByCertNo", map);
		String appStatus = carPermitApplyList.get(0).getAppStatus();
		carChangeApply=carPilotApplyService.findAllCarChangeApplyByApplyId("com.nasoft.aboutcar.carMapper.findAllCarChangeApplyByApplyId",carPermitApplyList.get(0).getApplyId());
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
			//如果登陆了但是没有先申请
		}  else if(carPermitApplyList.size()==0){
			
			return "vehicle/pilotApply";
		}else if(carPermitApplyList.get(0).getAppStatus().equals("1") || carPermitApplyList.get(0).getAppStatus().equals("2")
				|| carPermitApplyList.get(0).getAppStatus().equals("3") || carPermitApplyList.get(0).getAppStatus().equals("4")  ){
		
			 request.setAttribute("responseMsg", "您无权进行申请，由于您还未发证！");
			 return "vehicle/carChangeApply";
		}else if(carChangeApply.size()!=0){
			if(carChangeApply.get(0).getApplyType().equals("1")  || carChangeApply.get(0).equals("0")){
				 request.setAttribute("responseMsg", "您已经申请变更了！");
					return "redirect:openProgressList.action";
			}
		}
			CarInfo carinfo = carPilotApplyService.findCarInfoByCertNo("com.nasoft.aboutcar.carMapper.findCarByCertNo", userName);
			request.setAttribute("carInfo", carinfo);
			 String carid = carinfo.getCarId();
				CarPermitApply carPermitApply = carPilotApplyService.findCarApplyByCarId("com.nasoft.aboutcar.carMapper.findCarApplyByCarId", carid);
				request.setAttribute("carPermitApply", carPermitApply);
			
		
		return "vehicle/carChangeApply";
	}
	
	/**
	 * 打开注销申请详情
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/openCancelApply")
	public String openCancelApply(HttpServletRequest request) throws Exception{
		String userName = (String) request.getSession().getAttribute("userName");
		Map map = new HashMap();
		map.put("certNo", userName);
	
		List<CancelApply> cancelApplyList= carPilotApplyService.findAllCancelApplyByPcertNo("com.nasoft.aboutcar.carMapper.findAllCancelApplyByPcertNo", map);
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);	
			return "system/userLogin";
		}else {
			 if(cancelApplyList!=null&&cancelApplyList.size()>0){
				 return "redirect:openCancelProgressList.action";
			 }	
			CarInfo carinfo = carPilotApplyService.findCarInfoByCertNo("com.nasoft.aboutcar.carMapper.findCarByCertNo", userName);
		    CarPermitcert carpermitcert = carPilotApplyService.findCarCertByuserName("com.nasoft.aboutcar.carMapper.findCarCertByuserName",userName );
		    request.getSession().setAttribute("carinfo", carinfo);
		    request.getSession().setAttribute("carpermitcert", carpermitcert);
			return "vehicle/cancelApply";
		}
		
	}
	
	/**
	 * 打开办理进度列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/openProgressList")
	public String openProgressList(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			try {
				Map map = new HashMap();
				map.put("certNo", userName);
				List<CarPermitApply> permitapplyList = carPilotApplyService.findAllCarPermitApplyByCertNo("com.nasoft.aboutcar.carMapper.findAllCarPermitApplyByCertNo", map);
					request.setAttribute("permitapplyList",permitapplyList);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "vehicle/progressList";
		}
	}
	
	/**
	 * 打开办理进度
	 * @param request
	 * @return
	 */
	@RequestMapping("/openProgress")
	public String openProgress(HttpServletRequest request,String applyId,String applytype){
		String userName = (String) request.getSession().getAttribute("userName");
		CarPermitApply carPermitApply=null;
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			String appstatus = "";
			try {
				if(applytype.equals("2")){
					List<CarChangeApply> carChangeApplyList = carPilotApplyService.findAllCarChangeApplyByApplyId("com.nasoft.aboutcar.carMapper.findAllCarChangeApplyByApplyId", applyId);				
					request.setAttribute("permitapply", carChangeApplyList.get(0));
				}else{
					carPermitApply = carPilotApplyService.findCarApplyByApplyId("com.nasoft.aboutcar.carMapper.findCarApplyByApplyId", applyId);
					if(carPermitApply.getAppStatus().equals("-6")|| carPermitApply.getAppStatus().equals("6")){
						carPermitApply.setAppStatus("5");
					}
					request.setAttribute("permitapply", carPermitApply);
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "vehicle/progress";
		}
	}
	
	/**
	 * 打开申请详细信息页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/openCarDetail")
	public String openCarDetail(HttpServletRequest request,String applyid){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			try {
				CarInfo carInfo = carPilotApplyService.findCarInfoByCertNo("com.nasoft.aboutcar.carMapper.findCarByCertNo", userName);
				CarPermitApply carPermitApply = carPilotApplyService.findCarApplyByApplyId("com.nasoft.aboutcar.carMapper.findCarApplyByApplyId", applyid);
				request.getSession().setAttribute("carInfo", carInfo);
				request.getSession().setAttribute("carPermitApply", carPermitApply);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "vehicle/carDetail";
		}
		
	}
	
	/**
	 * 添加车辆资质申请信息
	 * @param request
	 * @param pilotApply
	 * @return
	 */
	@Transactional(rollbackFor=Exception.class)
	@RequestMapping("/addPilotApply")
	public void addPilotApply(HttpServletRequest request,HttpServletResponse response,CarInfo carInfo,CarPermitApply carPermitApply,
			@RequestParam(value="carFile",required=false) MultipartFile[] carFile,
			@RequestParam(value="xszFile",required=false) MultipartFile[] xszFile){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmssSSS");
		SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		carPermitApply.setApplyDate(sdf2.format(new Date()));
		carInfo.setReceiveDate(sdf2.format(new Date()));
		//首先判断是否已经申请过
		logger.info("添加车辆资质申请..");
		try {
			String userName = (String) request.getSession().getAttribute("userName");
			Map map = new HashMap();
			map.put("certNo", userName);
			map.put("applyType", "1");//申请状态
			List<CarPermitApply> carPermitApplyList= carPilotApplyService.findAllCarPermitApplyByCertNo("com.nasoft.aboutcar.carMapper.findAllCarPermitApplyByCertNo", map);
			if(null != carPermitApplyList && carPermitApplyList.size()>0){
				CarPermitApply ca=carPermitApplyList.get(0);
				//如果不通过 
				if(ca.getApplyType().equals("1") && ca.getAppStatus().equals("-1")){
					carPilotApplyService.deleteCarInfoByCarId("com.nasoft.aboutcar.carMapper.deleteCarInfoByCarId", ca.getCarId());
					carPilotApplyService.deleteCarPilotApplyByCarId("com.nasoft.aboutcar.carMapper.deleteCarPilotApplyByCarId", ca.getCarId());
					addPilotApply(response, carInfo, carPermitApply, carFile, xszFile,sdf, sdf2);
				}else{
					writer(response, "cunzai");
					return;
				}
			}else{
				addPilotApply(response, carInfo, carPermitApply, carFile, xszFile,sdf, sdf2);
			}
		} catch (Exception e2) {
			try {
				carPilotApplyService.deleteCarInfoByCarId("com.nasoft.aboutcar.carMapper.deleteCarInfoByCarId", carInfo.getCarId());
				carPilotApplyService.deleteCarPilotApplyByCarId("com.nasoft.aboutcar.carMapper.deleteCarPilotApplyByCarId", carInfo.getCarId());
				writer(response, "error");
			} catch (Exception e) {
				e.printStackTrace();
			}
			e2.printStackTrace();
		}
		 
	}
	
	/**
	 * 网约车资质变更申请
	 * @param request
	 * @return
	 * @throws
	 */
	@RequestMapping("/carChangeApply")
	 public void driverChangeApply(HttpServletRequest request,HttpServletResponse response, CarInfo carInfo,
			       CarPermitApply carPermitApply,
			       @RequestParam(value="carFile",required=false) MultipartFile[] carFile,
				   @RequestParam(value="xszFile",required=false) MultipartFile[] xszFile) throws Exception{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmssSSS");
		SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		carPermitApply.setApplyDate(sdf2.format(new Date()));
		 
		InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
	    Properties p = new Properties();
	    p.load(in);
		String hostname = p.getProperty("ftp.hostname");
		int port = Integer.valueOf(p.getProperty("ftp.port"));
		String username = p.getProperty("ftp.username");
		String password = p.getProperty("ftp.password");
		String pathname = "upload/car/"+carInfo.getCertNo(); 
		String carFilePath = "";  //车辆照片
		String xszFilePath = "";  //行驶证照片
		
		String s1="";
		String s2="";
		
	if(carFile.length>0 && xszFile.length>0){
			
			
			for (int i = 0; i < carFile.length; i++) {
				//获取文件后缀名
				String carFileSuffix = carFile[i].getOriginalFilename().substring(carFile[i].getOriginalFilename().lastIndexOf("."));     
				
				//车辆照片
				String carPohtoDate="carPhoto"+sdf.format(new Date());
				String carFileName = carPohtoDate+carFileSuffix;
				
				InputStream inputStream  = carFile[i].getInputStream();
				FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, carFileName, inputStream);
				carFilePath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+carFileName;
				s1+=carFilePath+";";
				System.out.println(s1);
			}
		
			for (int i = 0; i < xszFile.length; i++) {
				//获取文件后缀名
				String xszFileSuffix = xszFile[i].getOriginalFilename().substring(xszFile[i].getOriginalFilename().lastIndexOf("."));     
				
				 //行驶证照片
				String xszPohtoDate="xszPhoto"+sdf.format(new Date());
				String xszFileName = xszPohtoDate+xszFileSuffix;
				InputStream inputStream2  = xszFile[i].getInputStream();
				FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, xszFileName, inputStream2);
				xszFilePath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+xszFileName;
				s2+=xszFilePath+";";
				System.out.println(s2);
			}
			s1=s1.substring(0, s1.length()-1);
			s2=s2.substring(0, s2.length()-1);
		}
		carPermitApply.setCarPhoto(s1);
		carPermitApply.setDrivePhoto(s2);
		carPermitApply.setApplyType("2");
		carPermitApply.setApplyDate(sdf2.format(new Date()));
		carPermitApply.setCreateDate(sdf2.format(new Date()));
		carPermitApply.setUpdDateTime(sdf2.format(new Date()));
		carPilotApplyService.updateCarInfo("com.nasoft.aboutcar.carMapper.updateCarInfo", carInfo);
		List<CarChangeApply> findAllCarChangeApplyList = carPilotApplyService.findAllCarChangeApplyByApplyId("com.nasoft.aboutcar.carMapper.findAllCarChangeApplyByApplyId", carPermitApply.getApplyId());
		if(findAllCarChangeApplyList.size()>0){
			CarChangeApply carChangeApply = findAllCarChangeApplyList.get(0);
			carChangeApply.setAppStatus("0");
			carPilotApplyService.updateCarChangeApply("com.nasoft.aboutcar.carMapper.updateCarChangeApply",carChangeApply);
		}else{
			carPilotApplyService.addCarChangeApply("com.nasoft.aboutcar.carMapper.addCarChangeApply", carPermitApply);
			
		}
		carPermitApply.setApplyType("1");
		carPilotApplyService.updateCarPermitApply("com.nasoft.aboutcar.carMapper.updateCarPermitApply", carPermitApply);
		writer(response, "success");
						
	 }

	
	
	private void addPilotApply(HttpServletResponse response, CarInfo carInfo,
			CarPermitApply carPermitApply, MultipartFile[] carFile,
			MultipartFile[] xszFile, SimpleDateFormat sdf, SimpleDateFormat sdf2)
			throws IOException, Exception {
		InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
	    Properties p = new Properties();
	    p.load(in);
        
		String hostname = p.getProperty("ftp.hostname");
		int port = Integer.valueOf(p.getProperty("ftp.port"));
		String username = p.getProperty("ftp.username");
		String password = p.getProperty("ftp.password");
		String pathname = "upload/car/"+carInfo.getCertNo(); 
		
		
		String carFilePath = "";  //车辆照片
		String xszFilePath = "";  //行驶证照片
		
		String s1="";
		String s2="";
		
		if(carFile.length>0 && xszFile.length>0){
			
			
			for (int i = 0; i < carFile.length; i++) {
				//获取文件后缀名
				String carFileSuffix = carFile[i].getOriginalFilename().substring(carFile[i].getOriginalFilename().lastIndexOf("."));     
				
				//车辆照片
				String carPohtoDate="carPhoto"+sdf.format(new Date());
				String carFileName = carPohtoDate+carFileSuffix;
				
				InputStream inputStream  = carFile[i].getInputStream();
				FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, carFileName, inputStream);
				carFilePath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+carFileName;
				s1+=carFilePath+";";
				System.out.println(s1);
			}
			
			for (int i = 0; i < xszFile.length; i++) {
				//获取文件后缀名
				String xszFileSuffix = xszFile[i].getOriginalFilename().substring(xszFile[i].getOriginalFilename().lastIndexOf("."));     
				
				 //行驶证照片
				String xszPohtoDate="xszPhoto"+sdf.format(new Date());
				String xszFileName = xszPohtoDate+xszFileSuffix;
				InputStream inputStream2  = xszFile[i].getInputStream();
				FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, xszFileName, inputStream2);
				xszFilePath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+xszFileName;
				s2+=xszFilePath+";";
				System.out.println(s2);
			}
			
			/*//只能上传rar,zip文件
			if((".rar".equals(carFileSuffix) || ".zip".equals(xszFileSuffix)) && 
					(".rar".equals(xszFileSuffix) || ".zip".equals(xszFileSuffix))){
				String carPohtoDate="carPhoto"+sdf.format(new Date());
				String carZipFileName = carPohtoDate+carFileSuffix;
				InputStream inputStream  = carFile.getInputStream();
				FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, carZipFileName, inputStream);
				
				
				//打开连接解压文件
				FtpUtil.openClient(hostname, port, username, password, pathname);
				
				ZipUtils zipUtils=new ZipUtils();
				
				//要解压的文件，解压输出目录
			    zipUtils.unZip(fptFullPath+carZipFileName, fptFullPath+carPohtoDate);
			    logger.info("carZipFileName="+carZipFileName+",车辆照片存放目录："+carPohtoDate);
			    File file=new File(fptFullPath+carPohtoDate);
				for(File f:file.listFiles()){
					carFilePath+=fptFullPath+carPohtoDate+f.getName()+",";
				}
				carFilePath=carFilePath.substring(0, carFilePath.length()-1);
				
				FtpUtil.closeClient(hostname, port, username, password, pathname);
			    logger.info("carFilePath:"+carFilePath);
			    
			    String xszPohtoDate="xszPhoto"+sdf.format(new Date());
				String xszZipFileName = xszPohtoDate+xszFileSuffix;
				InputStream inputStream2  = xszFile.getInputStream();
				FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, xszZipFileName, inputStream2);
				//要解压的文件，解压输出目录
				//打开连接解压文件
				FtpUtil.openClient(hostname, port, username, password, pathname);
				zipUtils.unZip(fptFullPath+xszZipFileName,fptFullPath+xszPohtoDate);
			    logger.info("carZipFileName="+xszZipFileName+",行驶证照片存放目录："+xszPohtoDate);
			    File file2=new File(fptFullPath+xszPohtoDate);
				for(File f:file2.listFiles()){
					xszFilePath+=fptFullPath+xszPohtoDate+f.getName()+",";
				}
				xszFilePath=xszFilePath.substring(0, xszFilePath.length()-1);
			    logger.info("xszFilePath:"+xszFilePath);
				
			}else{
				//车辆照片
				String carPohtoDate="carPhoto"+sdf.format(new Date());
				String carFileName = carPohtoDate+carFileSuffix;
				
				InputStream inputStream  = carFile.getInputStream();
				FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, carFileName, inputStream);
				carFilePath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+carFileName;
			    System.out.println(carFilePath);
			    
			    //行驶证照片
				String xszPohtoDate="xszPhoto"+sdf.format(new Date());
				String xszFileName = xszPohtoDate+xszFileSuffix;
				InputStream inputStream2  = xszFile.getInputStream();
				FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, xszFileName, inputStream2);
				xszFilePath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+xszFileName;
				System.out.println(xszFilePath);
			}*/
			s1=s1.substring(0, s1.length()-1);
			s2=s2.substring(0, s2.length()-1);
		}
		carPermitApply.setCarPhoto(s1);
		carPermitApply.setDrivePhoto(s2);
		
		if(carInfo.getBelongs()==null){
			//驾驶员
			carInfo.setBelongs("1");
		}
		carPermitApply.setApplyDate(sdf2.format(new Date()));
		carPermitApply.setCreateDate(sdf2.format(new Date()));
		carPermitApply.setUpdDateTime(sdf2.format(new Date()));
		
		carPilotApplyService.addCarInfo("com.nasoft.aboutcar.carMapper.insertCarInfo", carInfo);
		carPilotApplyService.addCarPermitApply("com.nasoft.aboutcar.carMapper.insertCarPermitApply", carPermitApply);
		writer(response, "success");
	}
	
	
	
	
	@RequestMapping("/toLeftTree")
	public String toLeftTree(){
		return "system/leftTree";
	}
	@RequestMapping("/toChangeApply")
	public String toChangeApply(){
		return "vehicle/changeApply";
	}
	@RequestMapping("/toGrzx")
	public String toGrzx(){
		return "vehicle/personalInfo";
	}
	@RequestMapping("/toUpload")
	public String toUpload(){
		return "vehicle/uploadTest";
	}
	
	@RequestMapping(value = "upload", method = RequestMethod.POST)  
    public String upload(HttpServletRequest request)  throws IllegalStateException, IOException {  
        // 设置上下方文  
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(  
                request.getSession().getServletContext());  
        String path = request.getSession().getServletContext().getRealPath("upload");  
        // 检查form是否有enctype="multipart/form-data"  
        if (multipartResolver.isMultipart(request)) {  
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;  
  
            Iterator<String> iter = multiRequest.getFileNames();  
            while (iter.hasNext()) {  
  
                // 由CommonsMultipartFile继承而来,拥有上面的方法.  
                MultipartFile file = multiRequest.getFile(iter.next());  
                if (file != null) {  
                    String fileName = file.getOriginalFilename();  
  
                    File localFile = new File(path+"/"+fileName);  
                    System.err.println(localFile);
                    file.transferTo(localFile);  
                }   
  
            }     
        }  
        return " vehicle/uploadTest";  
    }  
	
	
	/**
	 * 获取区域信息
	 * @param request
	 * @param response
	 */

	  @RequestMapping({"getAreaCode"})
	  public void getAreaCode(HttpServletRequest request, HttpServletResponse response) {
		   try{
			    String code = request.getParameter("codeParam");
			    Map map = new HashMap();
			    map.put("pareaCode", code);
			    List areaInfoList = this.areaCodeService.findAreaList("com.nasoft.aboutcar.areaCodeMapper.findAreaListByCode", map);
			    JSONArray array = JSONArray.fromObject(areaInfoList);
				writer(response, array+"");
		  } catch (Exception e) {
			e.printStackTrace();
		 }
	  }
	  @RequestMapping("findAllInstInfo")
		public void findAllInstInfo(HttpServletRequest request,HttpServletResponse response){
			
			try {
				String areaCode=(String) request.getSession().getAttribute("areaCode");
				List<InstInfo> list=instInfoService.findInstInfoByAreacode("com.nasoft.SSM.instInfo.findInstInfoByAreacode",areaCode);
				JSONArray array = JSONArray.fromObject(list);
				writer(response, array+"");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	  
	  /**
		 * 打开预约申请
		 * @param request
		 * @return
		 */
		@RequestMapping("/openDrvBespeak")
		public String openDrvBespeak(HttpServletRequest request){
			String userName = (String) request.getSession().getAttribute("userName");
			
			//如果没有登录 跳转到登录页面
			if (null == userName || "".equals(userName)) {
				request.setAttribute("usertype", _USERTYPE);
				
				return "system/userLogin";
			} else {
				 
				return "vehicle/devBespeak";
			}
			
		}
		
		/**
		 * 查询可预约状况
		 * @param request
		 * @return
		 * @throws Exception 
		 */
		@RequestMapping("/getDrvBespeakSum")
		public void getDrvBespeakSum(HttpServletRequest request,HttpServletResponse response) throws Exception{
			String date = request.getParameter("date");
			List<BespeakSum> list = pilotBespeakService.selectbespeak("com.nasoft.SSM.PilotBespeak.selectByDrvDate", date);
			 JSONArray array = JSONArray.fromObject(list);
				writer(response, array+"");
		}

		/**
		 * 查询可预约状况
		 * @param request
		 * @return
		 * @throws Exception 
		 */
		@RequestMapping("/getDrvDisinctDate")
		public void getDrvDisinctDate(HttpServletRequest request,HttpServletResponse response) throws Exception{
			List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
			List<BespeakSum> BespeakSumlist = pilotBespeakService.selectByDistinctDate("com.nasoft.SSM.PilotBespeak.selectByDistinctDate", new BespeakSum());
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", "0");
			map.put("name", "请选择...");
			list.add(map);
			
			if(BespeakSumlist != null){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
				for(BespeakSum  bespeakSum: BespeakSumlist){
					HashMap<String, Object> mapp = new HashMap<String, Object>();
					String yearmonth = bespeakSum.getYear()+"-"+bespeakSum.getMonth();
					Date stringToDate = sdf.parse(yearmonth);
					 
					String currentdate = sdf.format(DateUtil.getDate());//格式化当前时间为（yyyy-MM）
					if(stringToDate.before(sdf.parse(currentdate))){//小于当前日期不显示
						continue;
					}
					mapp.put("id", yearmonth);
					mapp.put("name", yearmonth);
					list.add(mapp);
					}
			}
			
			 JSONArray array = JSONArray.fromObject(list);
				writer(response, array+"");
		}

		
		/**
		 * 添加车辆预约
		 * @param request
		 * @return
		 * @throws Exception 
		 */
		@RequestMapping("/addDrvBespeak")
		public String addDrvBespeak(HttpServletRequest request,HttpServletResponse response) throws Exception{
			PilotBespeak pilotBespeak = new PilotBespeak();
			BespeakSum bespeakSum = new BespeakSum();
			CarPermitApply carPermitApply =new CarPermitApply();
			CarInfo car = new CarInfo();
			String bespeakDate = request.getParameter("besDate");//riqi
			String detailDate = request.getParameter("detailDate");//shijian  0-am  1-pm
			String DrvId = (String) request.getSession().getAttribute("userName");
			car = carPilotApplyService.findCarInfoByCertNo("com.nasoft.aboutcar.carMapper.findCarByCertNo", DrvId);
			List<CarPermitApply> apps= pilotBespeakService.selectCarInfo("com.nasoft.SSM.PilotBespeak.selectByCertno", car.getCarId());
			carPermitApply =apps.get(0);
			if(carPermitApply.getAppStatus().equals("3") || carPermitApply.getAppStatus().equals("-4")){//3-通过    
				try {
					
					//carPermitApply.setAppStatus("4");
					List<BespeakSum> list = pilotBespeakService.selectbespeak("com.nasoft.SSM.PilotBespeak.selectByDrvDate", bespeakDate);
					BespeakSum bs = list.get(0);
					
					bespeakSum.setBespeakId(bs.getBespeakId());
					pilotBespeak.setApplyId(carPermitApply.getApplyId());
					pilotBespeak.setBespeakId(bs.getBespeakId());
					pilotBespeak.setBespeakTime(bespeakDate);
					pilotBespeak.setCarBespeakId(bs.getBespeakId().toString());
					pilotBespeak.setCarid(carPermitApply.getCarId());
					pilotBespeak.setCreateTime(getStringDate());
					pilotBespeak.setCreateUser(carPermitApply.getCreateMan());
					pilotBespeak.setUpdateTime(getStringDate());
					pilotBespeak.setUpdateUser(carPermitApply.getCreateMan());
					if(detailDate.equals("0")){
						bespeakSum.setMorningCount(bs.getMorningCount()-1);
						bespeakSum.setAfternoonCount(bs.getAfternoonCount());
						pilotBespeak.setBespeakTime("1");

					}else{
						bespeakSum.setAfternoonCount(bs.getAfternoonCount()-1);
						bespeakSum.setMorningCount(bs.getMorningCount());
						pilotBespeak.setBespeakTime("2");

					}
					pilotBespeakService.addDrvSpeak("com.nasoft.SSM.PilotBespeak.addPilotBespeak", pilotBespeak);
					//carPilotApplyService.updateCarPermitApply("com.nasoft.aboutcar.carMapper.updateCarPermitApply", carPermitApply);
					int result2 = drvBespeakService.updateOrderInfo("com.nasoft.SSM.PilotBespeak.updateOrderInfo", bespeakSum);
					
					 if(result2>0){
						 carPermitApply.setAppStatus("3");
						 carPilotApplyService.updateCarPermitApply("com.nasoft.aboutcar.carMapper.updateCarPermitApplyByStatus", carPermitApply);
							request.setAttribute("responseMsg", "预约成功");
						//return "vehicle/devBespeak"	;	
						}else{
							request.setAttribute("responseMsg", "error");
						//	return "vehicle/devBespeak"	;	
					    }
				//	drvBespeakService.addDrvSpeak();
					
				} catch (Exception e) {
					e.printStackTrace();
					request.setAttribute("responseMsg", "error");
				}
			}else if(carPermitApply.getAppStatus().equals("4")){
				request.setAttribute("responseMsg", "您已办理预约，请您按时办理");

			}else{
				request.setAttribute("responseMsg", "您无权预约窗口，您已预约请先通过审核");
			} return "vehicle/devBespeak";
		}
		
		/**
		 * 打开注销申请列表
		 * @param request
		 * @return
		 * @throws Exception 
		 */
		@RequestMapping("/openCancelApplyList")
		public String openCancelApplyList(HttpServletRequest request) throws Exception{
			String userName = (String) request.getSession().getAttribute("userName");
			
			//如果没有登录 跳转到登录页面
			if (null == userName || "".equals(userName)) {
				request.setAttribute("usertype", _USERTYPE);
				return "system/userLogin";
			} 
			
			else {
				//return "terrace/openCancelApply";
				return "redirect:/terrace/openCancelApply.action";
			}
		}
		
		
		/**
		 * 打开注销办理进度列表
		 * @param request
		 * @return
		 */
		@RequestMapping("/openCancelProgressList")
		public String openCancelProgressList(HttpServletRequest request){
			String userName = (String) request.getSession().getAttribute("userName");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
			//如果没有登录 跳转到登录页面
			if (null == userName || "".equals(userName)) {
				request.setAttribute("usertype", _USERTYPE);
				
				return "system/userLogin";
			} else {
				try {
					Map map = new HashMap();
					map.put("certNo", userName);
					List<CancelApply> cancelapplyList = carPilotApplyService.findAllCancelApplyByPcertNo("com.nasoft.aboutcar.carMapper.findAllCancelApplyByPcertNo", map);
					//for (int i = 0; i <cancelapplyList.size(); i++) {
					//sdf.format(cancelapplyList.get(i).getCreateDate());
						
					//}
					request.setAttribute("cancelapplyList", cancelapplyList);
				} catch (Exception e) {
					e.printStackTrace();
				}
				return "vehicle/cancelProgressList";
			}
		}

		@RequestMapping("/openCancelProgress")
		public String openCancelProgress(HttpServletRequest request,String pcertNo){
			String userName = (String) request.getSession().getAttribute("userName");
			//如果没有登录 跳转到登录页面
			if (null == userName || "".equals(userName)) {
				request.setAttribute("usertype", _USERTYPE);
				
				return "system/userLogin";
			} else {
				String appstatus = "";
				try {
					CancelApply cancelApply = carPilotApplyService.findCancelApplyByCancelPcertno("com.nasoft.aboutcar.carMapper.findCancelApplyByCancelPcertno", pcertNo);
					
					if(null != cancelApply){
						appstatus = cancelApply.getAppStatus();
					}else{
						return "vehicle/cancelApply";
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				request.setAttribute("appstatus", appstatus);
				return "vehicle/cancelProgress";
			}
		}
		
		/**
		 * 添加车辆注销申请信息
		 * @param request
		 * @return 
		 * @return
		 * @throws Exception 
		 */
		@RequestMapping("/addCancelApply")
		public void addCancelApply (HttpServletRequest request,HttpServletResponse response,CancelApply cancelApply) throws Exception{
			String userName = (String) request.getSession().getAttribute("userName");
			//首先判断是否已经申请过
			/*if (null == userName || "".equals(userName)) {
				request.setAttribute("usertype", _USERTYPE);
				
				return;
			} else {*/
					logger.info("添加车辆注销申请..");
					try {
						
						Map map = new HashMap();
						map.put("certNo", userName);
						map.put("applyType", "1");//申请状态
						List<CancelApply>  cancelApplyList= carPilotApplyService.findAllCancelApplyByPcertNo("com.nasoft.aboutcar.carMapper.findAllCancelApplyByPcertNo", map);
						if(null != cancelApplyList && cancelApplyList.size()>0){
							CancelApply ca=cancelApplyList.get(0);
							//如果不通过
							if(ca.getApplyType().equals("1") && ca.getAppStatus().equals("-2")){
								carPilotApplyService.deleteCancelApplyByCancelId("com.nasoft.aboutcar.carMapper.deleteCancelApplyByCancelId", ca.getCancelId());
								addCancelApply(response,cancelApply);
							}else{
								writer(response, "cunzai");	}
						}else{
							addCancelApply(response,cancelApply);

						}
					} catch (Exception e2) {
						try {
							carPilotApplyService.deleteCancelApplyByCancelId("com.nasoft.aboutcar.carMapper.deleteCancelApplyByCancelId", cancelApply.getCancelId());
							writer(response, "error");
						} catch (Exception e) {
							e.printStackTrace();
						}
						e2.printStackTrace();
					}
			
		}
		
		private void addCancelApply(HttpServletResponse response,CancelApply cancelApply)throws Exception{
			carPilotApplyService.insertCancelApply("com.nasoft.aboutcar.carMapper.insertCancelApply", cancelApply);
			
			writer(response, "success");
			
		}
		
	  
	  public static void main(String[] args) {
		  SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmssSSS");
		  System.out.println(sdf.format(new Date()));
		  ZipUtils zipUtils=new ZipUtils();
		  try {
			zipUtils.unZip("ftp:\\zhoupengfei:Zhou.@10.80.1.236\\upload\\car\\42068319940624181X\\carPhoto20161116011326098.zip", "c:/opt/");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
	}
	  public String getStringDate(){
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			return sdf.format(new Date());
			
		}
	  
	  @RequestMapping("/validateMancompany")
	  public String validateMancompany(HttpServletRequest request,HttpServletResponse response){
		 String msg=null;
		  String manCompany = request.getParameter("manCompany").toString();
		  if(manCompany==null){
			  msg="0";
		  }
		  return msg;
	  }
	 
	  @RequestMapping("/validateHLW")
	  public void validateWidth(HttpServletRequest request,HttpServletResponse response){
		  String msg="1";
		  String num = request.getParameter("num").toString();
		  try {
			  PrintWriter out;
			  out = response.getWriter();
			  if(Integer.parseInt(num)<0 || Integer.parseInt(num)>10){
				  msg="0";
			  }else{
				  String[] string = num.split(".");
				  int length = string.length;
				  if( length!=0){
					  int weishu = num.split(".")[1].length();
					  if(weishu>1){
						  msg="0";
					  }
				  }
			  }
			  out.write(msg.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
	  }
	  
	  @RequestMapping("/validateTel")
	  public void validateTel(HttpServletRequest request,HttpServletResponse response){
		  String num = request.getParameter("num").toString();
		  String msg="1";
		  int start = Integer.parseInt(num.substring(0,2));
		  try {
			  PrintWriter out;
			  out = response.getWriter();
			  if(num.length()>11 || num.length()<11){
				  msg="0";
			  }else if(start!=13 && start!=15 && start!=17 && start!=18){
				  msg="2";
			  }
			  out.write(msg.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	  }
	  @RequestMapping("openPlatPilotApply")
	  public String openPlatPilotApply(HttpServletRequest request,HttpServletResponse response){
		  String userName = (String) request.getSession().getAttribute("userName");
			
			//如果没有登录 跳转到登录页面
			if (null == userName || "".equals(userName)) {
				request.setAttribute("usertype", _USERTYPE);
				
				return "system/userLogin";
			} else {
				try {
					Map map = new HashMap();
					map.put("certNo", userName);
					map.put("applyType", "1");//申请状态
					List<CarPermitApply> permitapplyList = carPilotApplyService.findAllCarPermitApplyByCertNo("com.nasoft.aboutcar.carMapper.findAllCarPermitApplyByCertNo", map);
					if(null != permitapplyList && permitapplyList.size()>0){
						//如果不通过
						if(permitapplyList.get(0).getApplyType().equals("1") && permitapplyList.get(0).getAppStatus().equals("-1")){
							
							CarInfo carInfo=carPilotApplyService.findCarInfoByCertNo("com.nasoft.aboutcar.carMapper.findCarByCertNo", userName);
							CarPermitApply carPermitApply=permitapplyList.get(0);
							
							request.setAttribute("carInfo", carInfo);
							request.setAttribute("carPermitApply", carPermitApply);
							return "vehicle/pilotApplyUpdate";
						}else{
							return "redirect:openProgressList.action";
						} 
					    
					}else{
						return "vehicle/platPilotApply";
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				return null;
			}
	  }
}
