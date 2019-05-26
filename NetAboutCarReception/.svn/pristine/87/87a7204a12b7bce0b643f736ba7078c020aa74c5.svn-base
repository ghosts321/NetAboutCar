package com.nasoft.SSM.controller.driver;

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

import net.sf.json.JSONArray;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.nasoft.SSM.base.controller.BaseController;
import com.nasoft.SSM.domain.BespeakSum;
import com.nasoft.SSM.domain.CarPermitcert;
import com.nasoft.SSM.domain.DrvAppeals;
import com.nasoft.SSM.domain.DrvBespeak;
import com.nasoft.SSM.domain.DrvCancelapply;
import com.nasoft.SSM.domain.DrvCaseAppeal;
import com.nasoft.SSM.domain.DrvChangeapply;
import com.nasoft.SSM.domain.DrvExamBespeak;
import com.nasoft.SSM.domain.DrvMakeupapp;
import com.nasoft.SSM.domain.DrvPermitapply;
import com.nasoft.SSM.domain.DrvPermitcert;
import com.nasoft.SSM.domain.DrvPlantCaseInfo;
import com.nasoft.SSM.domain.DrvUserinfo;
import com.nasoft.SSM.domain.DrvUserreg;
import com.nasoft.SSM.domain.InstInfo;
import com.nasoft.SSM.domain.MsgNotice;
import com.nasoft.SSM.domain.PageBean;
import com.nasoft.SSM.domain.PlantCaseInfo;
import com.nasoft.SSM.domain.Platform;
import com.nasoft.SSM.domain.PlatformApply;
import com.nasoft.SSM.domain.PlatformUserReg;
import com.nasoft.SSM.domain.drvComplainAppeal;
import com.nasoft.SSM.domain.drvComplainInfo;
import com.nasoft.SSM.service.BnsComplainService;
import com.nasoft.SSM.service.CarPilotApplyService;
import com.nasoft.SSM.service.DrvBespeakService;
import com.nasoft.SSM.service.DrvCancelapplyService;
import com.nasoft.SSM.service.DrvChangeapplyService;
import com.nasoft.SSM.service.DrvExamBespeakService;
import com.nasoft.SSM.service.DrvMakeupappService;
import com.nasoft.SSM.service.DrvPermitapplyService;
import com.nasoft.SSM.service.DrvPermitcertService;
import com.nasoft.SSM.service.DrvPunRecordService;
import com.nasoft.SSM.service.DrvRecordService;
import com.nasoft.SSM.service.DrvUserinfoService;
import com.nasoft.SSM.service.DrvUserregService;
import com.nasoft.SSM.service.InstInfoService;
import com.nasoft.SSM.service.MsgNoticeService;
import com.nasoft.SSM.service.PilotApplyService;
import com.nasoft.SSM.service.PlantCaseInfoService;
import com.nasoft.SSM.service.PlatformApplyService;
import com.nasoft.SSM.service.PlatformUserService;
import com.nasoft.util.DateUtil;
import com.nasoft.util.FtpUtil;

/**
 * 驾驶员业务
 * @author user
 *
 */
@Controller
@RequestMapping("/driver")
public class DriverController extends BaseController{
	
	private static Logger logger=Logger.getLogger(DriverController.class);
	
	private static String _USERTYPE = "0";
	
	@Resource
	private PilotApplyService pilotApplyService;
	@Resource
	private DrvUserinfoService drvUserinfoService;
	@Resource
	private DrvPermitapplyService drvPermitapplyService;
	@Resource
	private MsgNoticeService msgNoticeService;
	@Resource
	private DrvPermitcertService drvPermitcertService;
	@Resource
	private DrvUserregService drvUserregService;
	@Resource
	private DrvRecordService drvRecordService;
	@Resource
	private InstInfoService instInfoService;
	@Resource
	private DrvMakeupappService drvMakeupappService;
	@Resource
	private DrvBespeakService drvBespeakService;
	@Resource
	private CarPilotApplyService carPilotApplyService;
	@Resource
	private DrvExamBespeakService drvExamBespeakService;
	@Resource
	private BnsComplainService bnsComplainService;
	@Resource
	PlatformUserService platformUserService;
	@Resource
	PlatformApplyService platformApplyService;
	@Resource
	DrvCancelapplyService drvCancelapplyService;
	@Resource
	DrvChangeapplyService drvChangeapplyService;
	@Resource
	PlantCaseInfoService plantCaseInfoService;
	@Resource
	DrvPunRecordService drvPunRecordService;
	/**
	 * 打开许可申请
	 * @return
	 */
	@RequestMapping("/toPermitApply")
	public String toPermitApply(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			return "driver/pi";
		}
	}
	
	/**
	 * 打开许可申请
	 * @param request
	 * @return
	 */
	@RequestMapping("/openPilotApply")
	public String openPilotApply(HttpServletRequest request,Model model){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			try {
				String appstatus = "";
				List<DrvPermitapply> drvPermitapplyList = drvPermitapplyService.selectByCertno("com.nasoft.SSM.DrvPermitapply.selectByCertno", userName);
				//DrvCancelapply drvCancelapply = drvCancelapplyService.findDrvCancelapplyByCertNo("com.nasoft.SSM.DrvCancelapply.selectByCertno", userName);
				DrvPermitapply drvPermitapply = new DrvPermitapply();
				if(drvPermitapplyList.size() > 0){
					drvPermitapply = drvPermitapplyList.get(0);
					appstatus = drvPermitapply.getAppstatus();
					if(!"1".equals(appstatus)){
						request.getSession().setAttribute("appstatus", appstatus);
						request.getSession().setAttribute("applytype", drvPermitapply.getApplytype());
						return "driver/drvprogress";
					}
				}
				DrvUserinfo drvUserinfo = drvUserinfoService.selectByCertno("com.nasoft.SSM.DrvUserinfo.selectByCertno", userName);
				if(null != drvUserinfo){
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					if(null != drvUserinfo.getBirthday()){
						model.addAttribute("birthDate", sdf.format(drvUserinfo.getBirthday()));
					}
					if(null != drvUserinfo.getCarddate()){
						model.addAttribute("cardDate", sdf.format(drvUserinfo.getCarddate()));
					}
				}else{
					drvUserinfo = new DrvUserinfo();
					drvUserinfo.setTelno((String) request.getSession().getAttribute("phoneno"));
				}
				model.addAttribute("drvUserinfo", drvUserinfo);
				model.addAttribute("drvPermitapply", drvPermitapply);
				model.addAttribute("userName", userName);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "driver/pilotApply";
		}
	}
	
	/**
	 * 打开个人基本信息
	 * @param request
	 * @return
	 */
	@RequestMapping("/openPersonalInfo")
	public String openPersonalInfo(HttpServletRequest request,Model model){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			if(request.getSession().getAttribute("usertype").equals("0")){
				try {
					DrvUserreg drvUserreg = drvUserregService.isexistUser("com.nasoft.SSM.DrvUserreg.isexistUser", userName);
					model.addAttribute("drvUserreg", drvUserreg);
					
					DrvUserinfo drvUserinfo = drvUserinfoService.selectByCertno("com.nasoft.SSM.DrvUserinfo.selectByCertno", userName);
					model.addAttribute("drvUserinfo", drvUserinfo);
					
					List<DrvPermitapply> drvPermitapplyList = drvPermitapplyService.selectByCertno("com.nasoft.SSM.DrvPermitapply.selectByCertno", userName);
					if(drvPermitapplyList.size() > 0){
						model.addAttribute("drvPermitapply", drvPermitapplyList.get(0));
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				return "driver/personalInfo";
			}else if(request.getSession().getAttribute("usertype").equals("1")){
				try {
					PlatformUserReg platformUserReg = platformUserService.findPlatformUserRegById("com.nasoft.aboutcar.platFormMapper.selectPlatFormUserById",userName);
					model.addAttribute("platformUserReg", platformUserReg);

					Platform platform = platformApplyService.findPlatformByCreditCode("com.nasoft.aboutcar.PlatformMapper.findPlatformByCreditCode", userName);
					List<PlatformApply> permitapplyList = platformApplyService.findPlatformtApplyByNo("com.nasoft.aboutcar.PlatformMapper.findComPermitApplyByCertNo", userName);
					if(null != permitapplyList && permitapplyList.size()>0){
						PlatformApply platformApply	=permitapplyList.get(0);
						model.addAttribute("platformApply", platformApply);
					}
					model.addAttribute("platform", platform);

				} catch (Exception e) {
					e.printStackTrace();
				}
				
				return "terrace/terraceInfo";
			}
		}
		return "";
	}
	
	/**
	 * 打开我的主页
	 * @param request
	 * @return
	 */
	@RequestMapping("/openMyPage")
	public String openMyPage(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			List<DrvPermitcert> drvPermitcertList = new ArrayList<DrvPermitcert>();
			CarPermitcert carPermitcert = new CarPermitcert();
			Map<String, Object> recordMap = new HashMap<String,Object>();
			try {
				drvPermitcertList = drvPermitcertService.selectByCertno("com.nasoft.SSM.DrvPermitcert.selectByCertno",userName);
				if(drvPermitcertList.size() > 0){
					request.getSession().setAttribute("drvPermitcert", drvPermitcertList.get(0));
				}
				recordMap = drvRecordService.findRecordInfoByCert("com.nasoft.SSM.DrvRecord.findRecordInfoByCert", userName);
				List<CarPermitcert> certList = carPilotApplyService.findCarCertByCertNo("com.nasoft.aboutcar.carMapper.findCarCertByCertNo", userName);
				if(certList.size() > 0){
					carPermitcert = certList.get(0);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getSession().setAttribute("carPermitcert", carPermitcert);
			request.getSession().setAttribute("drvRecord", recordMap);
			return "driver/mypage";
		}
	}
	
	/**
	 * 打开消息通知
	 * @param request
	 * @return
	 */
	@RequestMapping("/openMessage")
	public String openMessage(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			List<MsgNotice> msgNoticeList = new ArrayList<MsgNotice>();
			try {
				msgNoticeList = msgNoticeService.selectAll("com.nasoft.SSM.MsgNotice.selectAll",userName);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getSession().setAttribute("msgNoticeList", msgNoticeList);
			
			return "driver/message";
		}
	}
	
	/**
	 * 获取未读消息个数
	 * @param request
	 * @return
	 */
	@RequestMapping("/getMsgCount")
	@ResponseBody
	public int getMsgCount(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		int count = 0;
		if (StringUtils.isNotBlank(userName)) {
			try {
				count = msgNoticeService.selectMsgCount("com.nasoft.SSM.MsgNotice.selectMsgCount",userName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return count;
	}
	/**
	 * 将用户所有未读信息标记为已读
	 * @param request
	 * @return
	 */
	@RequestMapping("/readMsg")
	public String readMessage(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			try {
				msgNoticeService.readMsg("com.nasoft.SSM.MsgNotice.readMsg",userName);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "redirect:openMessage.action";
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
			return "driver/compensateApply";
		}
	}
	
	/**
	 * 打开变更申请
	 * @param request
	 * @return
	 */
	@RequestMapping("/openChangeApply")
	public String openChangeApply(HttpServletRequest request,Model model){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			try {
				String permit = "1";
				DrvChangeapply drvChangeapply = drvChangeapplyService.selectByCertno("com.nasoft.SSM.DrvChangeapply.selectByCertno", userName);
				if(null != drvChangeapply){
					String appstatus = drvChangeapply.getAppstatus();
					if(!"1".equals(appstatus)){
						request.getSession().setAttribute("appstatus", appstatus);
						request.getSession().setAttribute("applytype", drvChangeapply.getApplytype());
						return "driver/drvprogress";
					}
					model.addAttribute("drvPermitapply", drvChangeapply);
				}else{
					List<DrvPermitapply> drvPermitapplyList = drvPermitapplyService.selectByCertno("com.nasoft.SSM.DrvPermitapply.selectByCertno", userName);
					if(drvPermitapplyList.size() > 0){
						model.addAttribute("drvPermitapply", drvPermitapplyList.get(0));
						if(!"7".equals(drvPermitapplyList.get(0).getAppstatus())){
							permit = "0";
						}
					}
				}
				
				DrvUserinfo drvUserinfo = drvUserinfoService.selectByCertno("com.nasoft.SSM.DrvUserinfo.selectByCertno", userName);
				if(null != drvUserinfo){
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					if(null != drvUserinfo.getCarddate()){
						model.addAttribute("cardDate", sdf.format(drvUserinfo.getCarddate()));
					}
					model.addAttribute("drvUserinfo", drvUserinfo);
				}
				model.addAttribute("userName", userName);
				model.addAttribute("permit", permit);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "driver/driverChangeApply";
		}
	}
	
	/**
	 * 添加驾驶员资质变更申请信息
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/addChangeApply")
	public void addChangeApply(HttpServletRequest request,HttpServletResponse response,DrvUserinfo drvUserinfo,
			DrvChangeapply drvChangeapply,String cardDate,@RequestParam(value="photoFile",required=false) MultipartFile photoFile,
			@RequestParam(value="certFile",required=false) MultipartFile[] certFile,@RequestParam(value="drivecardFile",required=false) MultipartFile drivecardFile) throws Exception{
		logger.info("addChangeApply:"+drvUserinfo.getUsername());
		try {
			
			//用户信息表
			String areaCode = (String) request.getSession().getAttribute("areaCode");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//			drvUserinfo.setBirthday(sdf.parse(birthDate));
			if(StringUtils.isNotBlank(cardDate)){
				drvUserinfo.setCarddate(sdf.parse(cardDate));
			}
			drvUserinfo.setCreatedatetime(new Date());
			drvUserinfo.setCreateinstid(1);
			drvUserinfo.setCreateuserid(1);
			drvUserinfo.setAreacode(areaCode);
			
			//驾驶员变更申请表
			InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
		    Properties p = new Properties();
		    p.load(in);
            
			String hostname = p.getProperty("ftp.hostname");
			int port = Integer.valueOf(p.getProperty("ftp.port"));
			String username = p.getProperty("ftp.username");
			String password = p.getProperty("ftp.password");
			String pathname = "upload/driver/"+drvUserinfo.getCertno(); 
			String photoPath = "";
			String certPath = "";
			String drivecardPath = "";
			if(null != photoFile){
				String filename = "personChange_"+drvUserinfo.getCertno()+photoFile.getOriginalFilename().substring(photoFile.getOriginalFilename().lastIndexOf(".")); 
				InputStream inputStream  = photoFile.getInputStream();
				Boolean flag = FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, filename, inputStream);
				if(flag){
					photoPath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+filename;
				}
			}
			if(certFile.length > 0){
				for(int i =0; i < certFile.length; i++){ 
					MultipartFile file = certFile[i];
		            if (!file.isEmpty()) { 
		            	String filename = "certChange"+i+"_"+drvUserinfo.getCertno()+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")); 
						InputStream inputStream  = file.getInputStream();
						Boolean flag = FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, filename, inputStream);
						if(flag){
							certPath += "#ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+filename;
						}
		            }           
		        }
			}
			if(null != drivecardFile){
				String filename = "drivecardChange_"+drvUserinfo.getCertno()+drivecardFile.getOriginalFilename().substring(drivecardFile.getOriginalFilename().lastIndexOf("."));  
				InputStream inputStream  = drivecardFile.getInputStream();
				Boolean flag = FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, filename, inputStream);
				if(flag){
					drivecardPath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+filename;
				}
			}
			drvChangeapply.setAppstatus("0");
			drvChangeapply.setSource("1");
			drvChangeapply.setApplytype("2");
			drvChangeapply.setUpdinstid(1);
			drvChangeapply.setUpddatetime(new Date());
			drvChangeapply.setApplydate(new Date());
			drvChangeapply.setUpduserid(1);
			drvChangeapply.setPhoto(photoPath);
			if(StringUtils.isNotBlank(certPath)){
				certPath = certPath.substring(1);
			}
			drvChangeapply.setCertphoto(certPath);
			drvChangeapply.setDrivecardphoto(drivecardPath);
			
			drvChangeapplyService.addChangeApply(drvUserinfo, drvChangeapply);
			
            writer(response, "success");
		} catch (Exception e) {
	        writer(response, "error");
			e.printStackTrace();
		}
	}
	
	/**
	 * 打开注销申请
	 * @param request
	 * @return
	 */
	@RequestMapping("/openCancelApply")
	public String openCancelApply(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			return "driver/cancelApply";
		}
	}
	/**
	 * 添加注销信息
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/addCancelApply")
	public String addCancelApply(HttpServletRequest request ,HttpServletResponse response,DrvCancelapply drvCancelapply) throws Exception{
		String certno = (String) request.getSession().getAttribute("userName");//获取身份证号
		List<DrvPermitapply> selectByCertno = drvPermitapplyService.selectByCertno("com.nasoft.SSM.DrvPermitapply.selectByCertno", certno);
		DrvUserinfo drvUserinfo=drvUserinfoService.selectByCertno("com.nasoft.SSM.DrvUserinfo.selectByCertno", certno);
		List<DrvPermitcert> drvPermitcert = drvPermitcertService.selectByCertno("com.nasoft.SSM.DrvPermitcert.selectByCertno", certno);
		DrvPermitapply drvPermitapply = selectByCertno.get(0);   
		String[] split = drvPermitcert.get(0).getSenddate().split("-");    //证书的颁发时间
		String sendYear = split[0];
		String sendMonth=split[1];
		String sendDay=split[2];
		String[] split3 = drvPermitcert.get(0).getEnddate().split("-");    //证书的有效时间
		String endYear = split3[0];
		String endMonth=split3[1];
		String endDay=split3[2];
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");	//获取当前时间
		String now = dateFormat.format(new Date());
		String[] split2 = now.split("-");
		String nowYear = split2[0];
		String nowMonth = split2[1];
		String nowDay = split2[2];
		String[] split4 = request.getParameter("cardDate").split("-");
		String cardDateYear=split4[0];
		String cardDateMonth=split4[1];
		String cardDateDay=split4[2];
		/*DrvCancelapply drvCancelapply=new DrvCancelapply();*/
	/*	logger.info(drvPermitcert.get(0).getSenddate());*/
		
		 if(!(Integer.parseInt(sendDay)==Integer.parseInt(cardDateDay)&&Integer.parseInt(sendMonth)==Integer.parseInt(cardDateMonth)&& Integer.parseInt(sendYear)==Integer.parseInt(cardDateYear))){
			request.setAttribute("responseMessage", "驾驶员的营运资格证书颁发时间错误");
		}else if(Integer.parseInt(endYear)<Integer.parseInt(nowYear)){
			request.setAttribute("responseMessage", "驾驶员的营运资格证书已经失效，无法申请注销");
		}else if(Integer.parseInt(endMonth)<Integer.parseInt(nowMonth)){
			request.setAttribute("responseMessage", "驾驶员的营运资格证书已经失效，无法申请注销");
		}else if((Integer.parseInt(endMonth)==Integer.parseInt(nowMonth))&&(Integer.parseInt(endDay)<Integer.parseInt(nowDay))){
			request.setAttribute("responseMessage", "驾驶员的营运资格证书已经失效，无法申请注销");
		}else{
			if(drvPermitapply.getAppstatus().equals("7")){//7-发证   
				try {
					DrvCancelapply	drvCancelapply1=drvCancelapplyService.findDrvCancelapplyByCertNo("com.nasoft.SSM.DrvCancelapply.selectByCertno",certno);	//判断用户在注销表中存在
					if(null!=drvCancelapply1){
						 request.setAttribute("responseMsg", " 您已经办理预约");
					}else{
					drvCancelapply.setAppstatus("0");//未审核
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					String cardDate = request.getParameter("cardDate");
					drvCancelapply.setCertdate(sdf.parse(cardDate));	//颁发时间
					drvCancelapply.setUpddatetime(DateUtil.getDateTime());		//修改时间
					drvCancelapplyService.addDrvCancelapply("com.nasoft.SSM.DrvCancelapply.addDrvCancelapply",drvCancelapply);
					request.setAttribute("responseMsg", "预约注销成功");
				} 
					}catch (Exception e) {
			        writer(response, "error");
					e.printStackTrace();
				}
			}else {
				 request.setAttribute("responseMsg", "您无权预约注销，请先通过审核");
			}
		}
			return "driver/cancelApply";
			
			
	}
	
	/**
	 * 打开换证申请
	 * @param request
	 * @return
	 */
	@RequestMapping("/openRenewalApply")
	public String openRenewalApply(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			return "driver/renewalApply";
		}
	}
	
	/**
	 * 添加驾驶员换证申请
	 * @param request
	 * @param drvMakeupapp
	 * @return
	 */
	@RequestMapping("/addRenewalApply")
	public void addRenewalApply(HttpServletRequest request, HttpServletResponse response, DrvMakeupapp drvMakeupapp){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String firstdate = request.getParameter("firstdate");
		drvMakeupapp.setUpddatetime(DateUtil.getDateTime());
		drvMakeupapp.setAppstatus("0");//(0未验证、1已通过、2已发证)
		drvMakeupapp.setApplydate(DateUtil.getDateTime());
		try {
			drvMakeupapp.setCertdate(sdf.parse(firstdate));//初领证时间
			//判断是否重复申请
			DrvMakeupapp drvMakeupappByCertNo = drvMakeupappService.findDrvMakeupappByCertNo("com.nasoft.SSM.DrvMakeupapp.selectByCertno", drvMakeupapp.getCertno());
			if(null != drvMakeupappByCertNo){
				writer(response, "exist");
				return;
			}
			drvMakeupappService.addDrvMakeupapp("com.nasoft.SSM.DrvMakeupapp.addDrvMakeupapp", drvMakeupapp);
			writer(response, "success");
		} catch (Exception e) {
			e.printStackTrace();
			try {
				writer(response, "error");
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
	}
	
	/**
	 * 打开考试预约
	 * @param request
	 * @return
	 */
	@RequestMapping("/openExamBespeak")
	public String openExamBespeak(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			return "driver/examBespeak";
		}
	}
	
	/**
	 * 获取预约年月下拉框
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getBespeakYear")
	public void getBespeakYear(HttpServletRequest request, HttpServletResponse response){
		try {
			List<DrvExamBespeak> drvExamBespeaklist = drvExamBespeakService.getBespeakYear("com.nasoft.SSM.DrvExamBespeak.getBespeakYear", new DrvExamBespeak());
			List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
			//添加下拉框默认选择项
			HashMap<String, Object> defaultmap = new HashMap<String, Object>();
			defaultmap.put("id", "0");
			defaultmap.put("name", "请选择...");
			list.add(defaultmap);
			
			if(drvExamBespeaklist != null){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
				for(DrvExamBespeak  drvExamBespeak: drvExamBespeaklist){
					if(null == drvExamBespeak){
						continue;
					}
					String yearmonth = drvExamBespeak.getYear()+"-"+drvExamBespeak.getMonth();
					Date stringToDate = sdf.parse(yearmonth);
					String currentdate = sdf.format(DateUtil.getDate());//格式化当前时间为（yyyy-MM）
					if(stringToDate.before(sdf.parse(currentdate))){//小于当前日期不显示
						continue;
					}
					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("id", yearmonth);
					map.put("name", yearmonth);
					list.add(map);
				}
			}
			JSONArray array = JSONArray.fromObject(list);
			writer(response, array.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 查询可预约状况
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/getMngExamBespeakSum")
	public void getMngExamBespeakSum(HttpServletRequest request,HttpServletResponse response){
		String date = request.getParameter("date");
		String certno = (String) request.getSession().getAttribute("userName");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("date", date);
		map.put("certno", certno);
		try {
			if(date.equals("0")){
				String result = "[{\"empty\":\"empty\"}]" ;
				writer(response,JSONObject.parse(result).toString());
				return;
			}
			List<DrvExamBespeak> list = drvExamBespeakService.getDrvBespeakSum("com.nasoft.SSM.DrvExamBespeak.getDrvBespeakSum", map);
			List<DrvExamBespeak> examBespeakList = new ArrayList<DrvExamBespeak>();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date currentDate = DateUtil.getDate();
			for(DrvExamBespeak drvExamBespeak : list){
				String bespeakdate = drvExamBespeak.getBespeak_date();
				if(sdf.parse(bespeakdate).after(currentDate)){
					examBespeakList.add(drvExamBespeak);
				}
			}
			JSONArray array = JSONArray.fromObject(examBespeakList);
			writer(response, array.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 保存用户考试预约信息
	 * @param request
	 * @param response
	 * @param drvExamBespeak
	 * @throws Exception 
	 */
	@RequestMapping("/addDrvExamBespeak")
	public void addDrvExamBespeak(HttpServletRequest request, HttpServletResponse response,DrvExamBespeak drvExamBespeak) throws Exception{
		String certno = (String) request.getSession().getAttribute("userName");
		String exam_type = drvExamBespeak.getExam_type();//考试类型
		String quanguobespeaktime = drvExamBespeak.getQuanguobespeak_time();//全国预约时段
		String difangbespeaktime = drvExamBespeak.getDifangbespeak_time();//地方预约时段
		
		drvExamBespeak.setCreate_time(DateUtil.getDateTime());
		drvExamBespeak.setUpdate_time(DateUtil.getDateTime());
		drvExamBespeak.setCertno(certno);
		
		try {
			if(exam_type.equals("1")){//全国
				//System.out.println(drvExamBespeak.getQuanguobespeak_id().toString());
				drvExamBespeak.setBespeak_id(drvExamBespeak.getQuanguobespeak_id());
				/*List<DrvExamBespeak> findDrvExamBespeakById = drvExamBespeakService.findDrvExamBespeakById("com.nasoft.SSM.DrvExamBespeak.findDrvExamBespeakById",drvExamBespeak.getBespeak_id());
				if(findDrvExamBespeakById != null && !findDrvExamBespeakById.isEmpty()){
					writer(response, "exist");
					return;
				}*/
				drvExamBespeak.setBespeak_time(quanguobespeaktime);
				switch (quanguobespeaktime) {
				case "1":
					drvExamBespeak.setMorning_count(drvExamBespeak.getQuanguomorning_count()-1);
					drvExamBespeak.setAfternoon_count(drvExamBespeak.getQuanguoafternoon_count());
					break;
				case "2":
					drvExamBespeak.setAfternoon_count(drvExamBespeak.getQuanguoafternoon_count()-1);
					drvExamBespeak.setMorning_count(drvExamBespeak.getQuanguomorning_count());
					break;
				} 
				drvExamBespeakService.addDrvExamBespeak("com.nasoft.SSM.DrvExamBespeak.addDrvExamBespeak", "com.nasoft.SSM.DrvExamBespeak.updateBespeakData",drvExamBespeak);
			}else if(exam_type.equals("2")){//地方
				drvExamBespeak.setBespeak_id(drvExamBespeak.getDifangbespeak_id());
				/*List<DrvExamBespeak> findDrvExamBespeakById = drvExamBespeakService.findDrvExamBespeakById("com.nasoft.SSM.DrvExamBespeak.findDrvExamBespeakById",drvExamBespeak.getBespeak_id());
				if(findDrvExamBespeakById != null && !findDrvExamBespeakById.isEmpty()){
					writer(response, "exist");
					return;
				}*/
				drvExamBespeak.setBespeak_time(difangbespeaktime);
				switch (difangbespeaktime) {
				case "1":
					drvExamBespeak.setMorning_count(drvExamBespeak.getDifangmorning_count()-1);
					drvExamBespeak.setAfternoon_count(drvExamBespeak.getDifangafternoon_count());
					break;
				case "2":
					drvExamBespeak.setAfternoon_count(drvExamBespeak.getDifangafternoon_count()-1);
					drvExamBespeak.setMorning_count(drvExamBespeak.getDifangmorning_count());
					break;
				} 
				drvExamBespeakService.addDrvExamBespeak("com.nasoft.SSM.DrvExamBespeak.addDrvExamBespeak", "com.nasoft.SSM.DrvExamBespeak.updateBespeakData",drvExamBespeak);
			}else{//全国-地方
				drvExamBespeak.setExam_type("1");
				drvExamBespeak.setBespeak_id(drvExamBespeak.getQuanguobespeak_id());
				/*List<DrvExamBespeak> findDrvExamBespeakById = drvExamBespeakService.findDrvExamBespeakById("com.nasoft.SSM.DrvExamBespeak.findDrvExamBespeakById",drvExamBespeak.getBespeak_id());
				if(findDrvExamBespeakById != null && !findDrvExamBespeakById.isEmpty()){
					writer(response, "exist");
					return;
				}*/
				drvExamBespeak.setBespeak_time(quanguobespeaktime);
				switch (quanguobespeaktime) {
				case "1":
					drvExamBespeak.setMorning_count(drvExamBespeak.getQuanguomorning_count()-1);
					drvExamBespeak.setAfternoon_count(drvExamBespeak.getQuanguoafternoon_count());
					break;
				case "2":
					drvExamBespeak.setAfternoon_count(drvExamBespeak.getQuanguoafternoon_count()-1);
					drvExamBespeak.setMorning_count(drvExamBespeak.getQuanguomorning_count());
					break;
				}
				drvExamBespeakService.addDrvExamBespeak("com.nasoft.SSM.DrvExamBespeak.addDrvExamBespeak", "com.nasoft.SSM.DrvExamBespeak.updateBespeakData",drvExamBespeak);
				
				drvExamBespeak.setExam_type("2");
				drvExamBespeak.setBespeak_id(drvExamBespeak.getDifangbespeak_id());
				drvExamBespeak.setBespeak_time(difangbespeaktime);
				switch (difangbespeaktime) {
				case "1":
					drvExamBespeak.setMorning_count(drvExamBespeak.getDifangmorning_count()-1);
					drvExamBespeak.setAfternoon_count(drvExamBespeak.getDifangafternoon_count());
					break;
				case "2":
					drvExamBespeak.setAfternoon_count(drvExamBespeak.getDifangafternoon_count()-1);
					drvExamBespeak.setMorning_count(drvExamBespeak.getDifangmorning_count());
					break;
				}
				drvExamBespeakService.addDrvExamBespeak("com.nasoft.SSM.DrvExamBespeak.addDrvExamBespeak", "com.nasoft.SSM.DrvExamBespeak.updateBespeakData",drvExamBespeak);
			}
		
			writer(response, "success");
		} catch (Exception e) {
				e.printStackTrace();
				try {
					writer(response, "error");
				} catch (Exception e1) {
					e1.printStackTrace();
				}
		}
	}
	
	/**
	 * 进入详细进度页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/drvprogress")
	public String drvprogress(HttpServletRequest request,String appstatus,Integer applytype){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			request.getSession().setAttribute("appstatus", appstatus);
			request.getSession().setAttribute("applytype", applytype);
			return "driver/drvprogress";
		}
	}
	
	/**
	 * 打开办理进度
	 * @param request
	 * @return
	 */
	@RequestMapping("/openProgress")
	public String openProgress(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			try {
				List<DrvPermitapply> permitapplyList = drvPermitapplyService.selectByCertno("com.nasoft.SSM.DrvPermitapply.selectProgressByCertno", userName);
				/*DrvCancelapply drvCancelapply = drvCancelapplyService.findDrvCancelapplyByCertNo("com.nasoft.SSM.DrvCancelapply.selectByCertno", userName);
				if(drvCancelapply!=null){
					if(drvCancelapply.getAppstatus().equals("2")){
						//注销审批已通过
						permitapplyList.get(0).setAppstatus("8");
						
					}
				}*/
				request.getSession().setAttribute("permitapplyList", permitapplyList);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "driver/progress";
		}
		
	}
	
	/**
	 * 打开申请详细信息页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/openDetail")
	public String openDetail(HttpServletRequest request,String applyid,String applytype){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			try {
				DrvUserinfo drvUserinfo = drvUserinfoService.selectByCertno("com.nasoft.SSM.DrvUserinfo.selectByCertno", userName);
				request.getSession().setAttribute("drv", drvUserinfo);
				if("2".equals(applytype)){
					DrvChangeapply changeapply = drvChangeapplyService.selectByApplyid("com.nasoft.SSM.DrvChangeapply.selectByApplyid", Integer.valueOf(applyid));
					request.getSession().setAttribute("permitapply", changeapply);
				}else{
					DrvPermitapply permitapply = drvPermitapplyService.selectByApplyid("com.nasoft.SSM.DrvPermitapply.selectByApplyid", Integer.valueOf(applyid));
					request.getSession().setAttribute("permitapply", permitapply);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "driver/applyDetail";
		}
		
	}
	
	/**
	 * 添加驾驶员资质申请信息
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/addPilotApply")
	public void addPilotApply(HttpServletRequest request,HttpServletResponse response,DrvUserinfo drvUserinfo,
			DrvPermitapply drvPermitapply,String cardDate,@RequestParam(value="photoFile",required=false) MultipartFile photoFile,
			@RequestParam(value="certFile",required=false) MultipartFile[] certFile,@RequestParam(value="drivecardFile",required=false) MultipartFile drivecardFile) throws Exception{
		logger.info("addPilotApply:"+drvUserinfo.getUsername());
		try {
			
			//用户信息表
			String areaCode = (String) request.getSession().getAttribute("areaCode");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//			drvUserinfo.setBirthday(sdf.parse(birthDate));
			if(StringUtils.isNotBlank(cardDate)){
				drvUserinfo.setCarddate(sdf.parse(cardDate));
			}
			drvUserinfo.setCreatedatetime(new Date());
			drvUserinfo.setCreateinstid(1);
			drvUserinfo.setCreateuserid(1);
			drvUserinfo.setAreacode(areaCode);
			
			//驾驶员申请表
			InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
		    Properties p = new Properties();
		    p.load(in);
            
			String hostname = p.getProperty("ftp.hostname");
			int port = Integer.valueOf(p.getProperty("ftp.port"));
			String username = p.getProperty("ftp.username");
			String password = p.getProperty("ftp.password");
			String pathname = "upload/driver/"+drvUserinfo.getCertno(); 
			String photoPath = "";
			String certPath = "";
			String drivecardPath = "";
			if(null != photoFile){
				String filename = "person_"+drvUserinfo.getCertno()+photoFile.getOriginalFilename().substring(photoFile.getOriginalFilename().lastIndexOf(".")); 
				InputStream inputStream  = photoFile.getInputStream();
				Boolean flag = FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, filename, inputStream);
				if(flag){
					photoPath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+filename;
				}
			}
			if(certFile.length > 0){
				for(int i =0; i < certFile.length; i++){ 
					MultipartFile file = certFile[i];
		            if (!file.isEmpty()) { 
		            	String filename = "cert"+i+"_"+drvUserinfo.getCertno()+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")); 
						InputStream inputStream  = file.getInputStream();
						Boolean flag = FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, filename, inputStream);
						if(flag){
							certPath += "#ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+filename;
						}
		            }           
		        }
			}
			if(null != drivecardFile){
				String filename = "drivecard_"+drvUserinfo.getCertno()+drivecardFile.getOriginalFilename().substring(drivecardFile.getOriginalFilename().lastIndexOf("."));  
				InputStream inputStream  = drivecardFile.getInputStream();
				Boolean flag = FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, filename, inputStream);
				if(flag){
					drivecardPath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+filename;
				}
			}
			drvPermitapply.setAppstatus("0");
			drvPermitapply.setSource("1");
			drvPermitapply.setApplytype("1");
			drvPermitapply.setUpdinstid(1);
			drvPermitapply.setUpddatetime(new Date());
			drvPermitapply.setApplydate(new Date());
			drvPermitapply.setUpduserid(1);
			drvPermitapply.setPhoto(photoPath);
			if(StringUtils.isNotBlank(certPath)){
				certPath = certPath.substring(1);
			}
			drvPermitapply.setCertphoto(certPath);
			drvPermitapply.setDrivecardphoto(drivecardPath);
			
			drvPermitapplyService.addDrvApply(drvUserinfo, drvPermitapply);
			
            writer(response, "success");
		} catch (Exception e) {
	        writer(response, "error");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("findInstInfoByAreacode")
	public void findInstInfoByAreacode(HttpServletRequest request,HttpServletResponse response){
		
		try {
			String areaCode = (String) request.getSession().getAttribute("areaCode");
			List<InstInfo> list=instInfoService.findInstInfoByAreacode("com.nasoft.SSM.instInfo.findInstInfoByAreacode",areaCode);
			JSONArray array = JSONArray.fromObject(list);
			writer(response, array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/toLeftTree")
	public String toLeftTree(){
		return "system/leftTree";
	}
	@RequestMapping("/toChangeApply")
	public String toChangeApply(){
		return "driver/changeApply";
	}
	@RequestMapping("/toGrzx")
	public String toGrzx(){
		return "driver/personalInfo";
	}
	@RequestMapping("/toUpload")
	public String toUpload(){
		return "driver/uploadTest";
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
        return " driver/uploadTest";  
    }
	/**
	 * 打开预约申请
	 * @param request
	 * @return
	 */
	@RequestMapping("/openBespeak")
	public String openBespeak(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			 
			return "driver/bespeak";
		}
		
	}
	
	/**
	 * 查询可预约状况
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/getBespeakSum")
	public void getBespeakSum(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String date = request.getParameter("date");
		System.out.println(date);
		List<BespeakSum> list = drvBespeakService.selectbespeak("com.nasoft.SSM.DrvBespeak.selectByDate", date);
		 JSONArray array = JSONArray.fromObject(list);
			writer(response, array+"");
	}
	
	/**
	 * 查询可预约状况
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/getDisinctDate")
	public void getDisinctDate(HttpServletRequest request,HttpServletResponse response) throws Exception{
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<BespeakSum> BespeakSumlist = drvBespeakService.selectByDistinctDate("com.nasoft.SSM.DrvBespeak.selectByDistinctDate", new BespeakSum());
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
	 * 添加预约
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/addBespeak")
	public String addBespeak(HttpServletRequest request,HttpServletResponse response) throws Exception{
		//ModelAndView mv = new ModelAndView();
		DrvBespeak drvBespeak = new DrvBespeak();
		BespeakSum bespeakSum = new BespeakSum();
		DrvPermitapply drvPermitapply =new DrvPermitapply();
		String bespeakDate = request.getParameter("besDate");//riqi
		String detailDate = request.getParameter("detailDate");//shijian  0-am  1-pm
		String DrvId = (String) request.getSession().getAttribute("userName");
		List<DrvPermitapply> apps= drvPermitapplyService.selectByCertno("com.nasoft.SSM.DrvPermitapply.selectByCertno", DrvId);
		drvPermitapply =apps.get(0);
		
		List<BespeakSum> list = drvBespeakService.selectbespeak("com.nasoft.SSM.DrvBespeak.selectByDate", bespeakDate);
		BespeakSum bs = list.get(0);
		
		if(drvPermitapply.getAppstatus().equals("4")|| drvPermitapply.getAppstatus().equals("5")){//4-考试通过   
			try {
				//drvPermitapply.setAppstatus("6");
				
				bespeakSum.setBespeakId(bs.getBespeakId());
				drvBespeak.setApplyId(drvPermitapply.getApplyid());
				drvBespeak.setBespeakId(bs.getBespeakId());
				drvBespeak.setBespeakTime(bespeakDate);
				drvBespeak.setDriverBespeakId(bs.getBespeakId().toString());
				drvBespeak.setCertno(drvPermitapply.getCertno());
				drvBespeak.setCreateTime(getStringDate());
				drvBespeak.setCreateUser(drvPermitapply.getUpduserid());
				drvBespeak.setUpdateTime(getStringDate());
				drvBespeak.setUpdateUser(drvPermitapply.getUpduserid());
				if(detailDate.equals("0")){
					bespeakSum.setMorningCount(bs.getMorningCount()-1);
					bespeakSum.setAfternoonCount(bs.getAfternoonCount());
					drvBespeak.setBespeakTime("1");

				}else{
					bespeakSum.setAfternoonCount(bs.getAfternoonCount()-1);
					bespeakSum.setMorningCount(bs.getMorningCount());
					drvBespeak.setBespeakTime("2");

				}
				 drvBespeakService.addDrvSpeak("com.nasoft.SSM.DrvBespeak.addDrvBespeak", drvBespeak);
				 //drvPermitapplyService.updateDrvPermitapply("com.nasoft.SSM.DrvPermitapply.updateDrvPermitapply", drvPermitapply);
				int result2 = drvBespeakService.updateOrderInfo("com.nasoft.SSM.DrvBespeak.updateOrderInfo", bespeakSum);
				 if(result2>0){
					 request.setAttribute("responseMsg", "success");
					}else{
						 request.setAttribute("responseMsg","error" );
 	
				    }
	            
			} catch (Exception e) {
		        writer(response, "error");
				e.printStackTrace();
			}
		}else if(drvPermitapply.getAppstatus().equals("6")){
			 request.setAttribute("responseMsg", " 您已经办理预约");

			 //mv.addObject("responseMsg", " 您已经办理预约");

		}
		else{
			 request.setAttribute("responseMsg", "您无权预约窗口，请先通过审核");

			//mv.addObject("responseMsg", "您无权预约窗口，请先通过审核");

	     //   writer(response, "您无权预约窗口，请先通过审核，或者您已经办理预约");

		}
		return "driver/bespeak";
		
	}
	
	
	
	
	
	
	
	
	/**
	 * 打开补发申请
	 * @param request
	 * @return
	 */
	@RequestMapping("/openReissueApply")
	public String openReissueApply(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			try {
				List<DrvPermitapply> drvPermitapplyList = drvPermitapplyService.selectByCertno("com.nasoft.SSM.DrvPermitapply.selectByCertno", userName);
				if(null != drvPermitapplyList && drvPermitapplyList.size()>0){
				//	回显申请信息
					DrvPermitapply drvPermitapply=drvPermitapplyList.get(0);
						request.setAttribute("drvPermitapply", drvPermitapply);
						return "driver/reissueApply";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "system/userLogin";
		}
	}
	
	/**
	 * 添加驾驶员补发申请
	 * @param request
	 * @param drvMakeupapp
	 * @return
	 */
	@RequestMapping("/addReissueApply")
	public String addReissueApply(HttpServletRequest request, HttpServletResponse response){
		String userName = (String) request.getSession().getAttribute("userName");
		String remark = (String) (String)request.getParameter("remark");
		try {
			List<DrvPermitapply> drvPermitapplyList = drvPermitapplyService.selectByCertno("com.nasoft.SSM.DrvPermitapply.selectByCertno", userName);
			if(null != drvPermitapplyList && drvPermitapplyList.size()>0){
				DrvPermitapply drvPermitapply=drvPermitapplyList.get(0);
				drvPermitapply.setDescription(remark);
				drvPermitapply.setApplytype("5");//补办
				drvPermitapply.setAppstatus("0");//补办

				drvPermitapplyService.updateDrvPermitapply("com.nasoft.SSM.DrvPermitapply.updateDrvPermitapply", drvPermitapply);
			}
		} catch (Exception e) {
			try {
				writer(response,"error");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		 
		return "driver/progress";
		}
//	/** 
//     * form表单提交 Date类型数据绑定 
//     * <功能详细描述> 
//     * @param binder 
//     * @see [类、类#方法、类#成员] 
//     */  
//	@InitBinder    
//	public void initBinder(WebDataBinder binder) {    
//	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");    
//	        dateFormat.setLenient(false);    
//	        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));    
//	}
	
	/**
	 * 打开投诉列表
	 * @param request
	 * @return
	 */
	@RequestMapping("openComplain")
	public String openComplain(HttpServletRequest request){
		  PageBean pagebean = new PageBean();
		  String pageDQ = request.getParameter("pageDQ");
		   if(pageDQ!=null && !pageDQ.equals("")){
			   pagebean.setPageDQ(Integer.parseInt(pageDQ));
		    }
		      try {
				List<Map> pageZS =  bnsComplainService.drvCount("com.nasoft.SSM.BnsComplain.drvPageCount");
				String ZS = pageZS.get(0).get("ZS").toString();
				pagebean.setPageZS(Integer.parseInt(ZS));
			  }catch (Exception e1) {
				e1.printStackTrace();
			  }
			try {
				int pageInt = pagebean.getPageInt();
				List<Map> bnsComplainList = bnsComplainService.selectDrvComplain("com.nasoft.SSM.BnsComplain.selectDrvComplain",pageInt);
				if(bnsComplainList.size()>0){
					for(Map m :bnsComplainList ){
						SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						m.put("compn_time", dateFormat.format((Date) m.get("compn_time")));
						m.put("idea_time", dateFormat.format((Date) m.get("idea_time")));
					}
				}
				request.getSession().setAttribute("pagebean", pagebean);
				request.getSession().setAttribute("list", bnsComplainList);
			}catch (Exception e) {
				e.printStackTrace();
			}
			return "driver/complainList";
		
	}
	
	/**
	 * 打开驾驶员申诉的页面
	 * @param request
	 * @param response
	 * @return
	 */
	/*@RequestMapping("showDrvAppeal")
	public String showDrvAppeal(HttpServletRequest request, HttpServletResponse response){
		String complain_code = request.getParameter("complain_code");
		List<Map> drvAppealList = new ArrayList<Map>();	
		try{
			drvAppealList  = (List<Map>)bnsComplainService.findDrvAppealbyId("com.nasoft.SSM.BnsComplain.findDrvAppealbyId", complain_code);
			for(Map m :drvAppealList ){
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				m.put("compn_time", dateFormat.format((Date) m.get("compn_time")));
				//m.put("enddate", dateFormat.format((Date) m.get("enddate")));
			}
			request.getSession().setAttribute("drvAppealList", drvAppealList);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "driver/drvAppealComit";
	}*/
	
	/**
	 * 驾驶员申诉提交
	 * @param request
	 * @param response
	 * @return
	 */
/*	@RequestMapping("drvAppealComit")
	public void drvAppealComit(HttpServletRequest request,HttpServletResponse response,
			drvComplainAppeal  drvcomplainappeal,drvComplainInfo drvcomplaintinfo,
			   @RequestParam(value="appealfile",required=false) MultipartFile appeal_file,
			   SimpleDateFormat sdf ) throws Exception{
		InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");//获取配置文件
	    Properties p = new Properties();//实例化配置文件
	    DrvPlantCaseInfo drvplant = new DrvPlantCaseInfo();
	    p.load(in);//加载配置文件
		String hostname = p.getProperty("ftp.hostname");//获取上传服务器地址
		int port = Integer.valueOf(p.getProperty("ftp.port"));//获取服务器端口号
		String username = p.getProperty("ftp.username");//服务器登录名
		String password = p.getProperty("ftp.password");//服务器密码
		String userName = (String) request.getSession().getAttribute("userName");
		String comnName  = bnsComplainService.findcomnName("com.nasoft.SSM.BnsComplain.findComname",userName);
		Date date = new Date();
	    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    SimpleDateFormat sf1 = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sf.format(date);
		int id =Integer.parseInt(newdate.substring(11,13)+newdate.substring(14,16)+newdate.substring(17));
		drvplant.setIsappeal("01");
		drvplant.setCaseid("C"+drvcomplaintinfo.getDrv_complain_info_id());
		drvplant.setUpdatetime(sf.format(new Date()));
		drvcomplaintinfo.setCompn_state("5");
		drvcomplainappeal.setId(id);	
		drvcomplainappeal.setDrv_complain_info_id(drvcomplaintinfo.getDrv_complain_info_id());
		drvcomplainappeal.setAppl_peo(comnName);
		drvcomplainappeal.setAppl_time(sf.format(date));
		String pathname = "upload/drvcomplaint/"+drvcomplaintinfo.getComplain_code()+"/appeal";//拼接上传服务器后文件的路径
		String survey_filePath = "";  //投诉文件	路径
		String s1="";
	if(appeal_file!=null && !appeal_file.equals("") &&appeal_file.getSize()>0 ){	
				//获取文件后缀名
				String carFileSuffix = appeal_file.getOriginalFilename().substring(appeal_file.getOriginalFilename().lastIndexOf("."));     
				int surveyData =drvcomplaintinfo.getDrv_complain_info_id();//为上传文件取名字
				String appealFileName = surveyData+carFileSuffix;//组成上传文件全名
				InputStream inputStream  = appeal_file.getInputStream();//IO流
				FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, appealFileName, inputStream);//上传文件
				survey_filePath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+appealFileName;//上传的全路径
				s1+=survey_filePath+";";
				System.out.println(s1);
			s1=s1.substring(0, s1.length()-1);
			System.out.println(s1);
			drvcomplainappeal.setAppeal_file(s1);
		}
		try {
			int result2 =bnsComplainService.updateDrvPlant("com.nasoft.SSM.BnsComplain.updateDrvPlant", drvplant);
			int result = bnsComplainService.drvUpdate("com.nasoft.SSM.BnsComplain.drvcomit",drvcomplaintinfo);
			int result1 = bnsComplainService.drvAppealComit("com.nasoft.SSM.BnsComplain.drvAppealComit",drvcomplainappeal);
			if(result>0&&result1>0){
				writer(response, "success");
			}else{
				writer(response, "error");
			}
		} catch (Exception e) {
			writer(response, "error");
			e.printStackTrace();
		}
	
	}*/
	/**
	 * 打开处罚信息
	 * @param request
	 * @return
	 */
	@RequestMapping("/openPenaltyInfo")
	public String openPenaltyInfo(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			return "system/userLogin";
		} else {
			return "driver/penaltyInfo";
		}
	}
	
	/**
	 * 打开申诉
	 * @param request
	 * @return
	 */
	@RequestMapping("/openAppeal")
	public String openAppeal(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			return "system/userLogin";
		} else {
			return "driver/appeal";
		}
	}
	
	public String getStringDate(){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(new Date());
		
	}
	/**
	 * 注销时用户名的验证
	 * @param request
	 * @param response
	 */
	@RequestMapping("/validateUsername")
	public void validateUsername(HttpServletRequest request,HttpServletResponse response){
		String certno = (String) request.getSession().getAttribute("userName");//获取身份证号
		String data=null;
		String json = (String) request.getParameter("username");
		try {
			DrvUserinfo drvUserinfo=drvUserinfoService.selectByCertno("com.nasoft.SSM.DrvUserinfo.selectByCertno", certno);
			 if(!drvUserinfo.getUsername().equals(json)){
					data="0";	//用户名错误
				}else{
					data="1";	//用户名正确
				}
			 PrintWriter out;
			 out = response.getWriter();
			 out.write(data.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 注销时身份证号的验证
	 * @param request
	 * @param response
	 */
	@RequestMapping("/validateCertno")
	public void validateCertno(HttpServletRequest request, HttpServletResponse response){
		String certno = (String) request.getSession().getAttribute("userName");//获取身份证号
		String data=null;
		String json = (String) request.getParameter("certno");
		try {
			DrvUserinfo drvUserinfo=drvUserinfoService.selectByCertno("com.nasoft.SSM.DrvUserinfo.selectByCertno", certno);
			if(!drvUserinfo.getCertno().equals(json)){
				data="0";	//身份证号填写错误
			}else{
				data="1";	//身份证号填写正确
			}
			 PrintWriter out;
			 out = response.getWriter();
			 out.write(data.toString());
		} catch (Exception e) {
		e.printStackTrace();
		}
	}
	/**
	 * 驾驶员注销时驾驶员编码的验证
	 * @param request
	 * @param response
	 */
	@RequestMapping("/validatePermitcert")
	public void validatePermitcert(HttpServletRequest request,HttpServletResponse response){
		String certno = (String) request.getSession().getAttribute("userName");//获取身份证号
		String data=null;
		String json = (String) request.getParameter("pcertno");
		try {
			List<DrvPermitcert> drvPermitcert = drvPermitcertService.selectByCertno("com.nasoft.SSM.DrvPermitcert.selectByCertno", certno);
			if(!drvPermitcert.get(0).getPcertno().equals(json)){
				data="0"; 	//驾驶员运营资格证书编码填写错误
			}else{
				data="1";	//驾驶员运营资格证书编码填写正确
			}
			 PrintWriter out;
			 out = response.getWriter();
			 out.write(data.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	@RequestMapping("/validatePermitcertDate")
	public void validatePermitcertDate(HttpServletRequest request,HttpServletResponse response){
		String certno = (String) request.getSession().getAttribute("userName");//获取身份证号
		String data=null;
		String json = (String) request.getParameter("pcertno");
		try {
			List<DrvPermitcert> drvPermitcert = drvPermitcertService.selectByCertno("com.nasoft.SSM.DrvPermitcert.selectByCertno", certno);
			if(!drvPermitcert.get(0).getSenddate().equals(json)){
				data="0"; 	//驾驶员运营资格证书编码填写错误
			}else{
				data="1";	//驾驶员运营资格证书编码填写正确
			}
			 PrintWriter out;
			 out = response.getWriter();
			 out.write(data.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 打开行政处罚信息
	 * @param request
	 * @return
	 */
	@RequestMapping("/openDrvCaseInfo")
	public String openDrvCaseInfo(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			return "system/userLogin";
		} else {
			List<DrvPlantCaseInfo> drvCaseInfoList = new ArrayList<DrvPlantCaseInfo>();
			try {
				
				drvCaseInfoList = plantCaseInfoService.findByusername("com.nasoft.aboutcar.plantCaseInfoMapper.findByusername", userName);
				for(DrvPlantCaseInfo m :drvCaseInfoList ){
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					Date casetime =df.parse(m.getCasetime());
					Date updatetime = df.parse(m.getUpdatetime());
					m.setUpdatetime(df.format(updatetime));
					m.setCasetime(df.format(casetime));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getSession().setAttribute("drvCaseInfoList", drvCaseInfoList);
			
			return "driver/drvCaseInfo";
		}
	}
	
	/**
     * 行政处罚信息申诉
     */
	@RequestMapping("openappealDetail")
public ModelAndView openappealDetail(HttpServletRequest request,HttpServletResponse response,String caseid){
		
		ModelAndView mv=new ModelAndView();
		try {
			DrvPlantCaseInfo plantCaseInfo =plantCaseInfoService.findBycaseid("com.nasoft.aboutcar.plantCaseInfoMapper.findBycaseid", caseid);
			mv.addObject("plantCaseInfo", plantCaseInfo);
			mv.setViewName("driver/appealDetail");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 行政处罚申诉提交
	 * @param request
	 * @param response
	 * @return
	 */
	
	@RequestMapping("addappealDetail")
	public void addappealDetail(HttpServletRequest request,HttpServletResponse response,
			String caseid,String appealuserid,String appealcontent
			  /* @RequestParam(value="appealfile",required=false) MultipartFile[] appeal_file,
			   SimpleDateFormat sdf */) {
		/*InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");//获取配置文件
	    Properties p = new Properties();//实例化配置文件
	    p.load(in);//加载配置文件
		String hostname = p.getProperty("ftp.hostname");//获取上传服务器地址
		int port = Integer.valueOf(p.getProperty("ftp.port"));//获取服务器端口号
		String username = p.getProperty("ftp.username");//服务器登录名
		String password = p.getProperty("ftp.password");//服务器密码
		String pathname = "upload/comcomplaint/"+comcomplaintinfo.getComplain_code()+"/appeal";//拼接上传服务器后文件的路径
		String survey_filePath = "";  //投诉文件	路径
		String s1="";
	if(appeal_file.length>0){	
			for (int i = 0; i < appeal_file.length; i++) {
				//获取文件后缀名
				String carFileSuffix = appeal_file[i].getOriginalFilename().substring(appeal_file[i].getOriginalFilename().lastIndexOf("."));     
				int surveyData =comcomplaintinfo.getComplain_info_id();//为上传文件取名字
				String appealFileName = surveyData+carFileSuffix;//组成上传文件全名
				InputStream inputStream  = appeal_file[i].getInputStream();//IO流
				FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, appealFileName, inputStream);//上传文件
				survey_filePath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+appealFileName;//上传的全路径
				s1+=survey_filePath+";";
				System.out.println(s1);
			}
		
			s1=s1.substring(0, s1.length()-1);
			System.out.println(s1);
		}*/
		DrvCaseAppeal plantCaseAppeal = new DrvCaseAppeal();
	    plantCaseAppeal.setCaseid(caseid);
		plantCaseAppeal.setAppealuserid(appealuserid);
		plantCaseAppeal.setAppealcontent(appealcontent);
		try {
			plantCaseInfoService.addDrvAppeal("com.nasoft.aboutcar.plantCaseInfoMapper.addDrvAppeal", plantCaseAppeal);
			plantCaseInfoService.updateCaseInfo("com.nasoft.aboutcar.plantCaseInfoMapper.updateDrvCaseInfo", caseid);
			plantCaseInfoService.updateCaseDeal("com.nasoft.aboutcar.plantCaseInfoMapper.updateDrvCaseDeal", caseid);

				writer(response, "success");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	
	
	@RequestMapping("/openPunishment")
	public ModelAndView drvPunishment(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mv=new ModelAndView();
	try {
		String certno = (String) request.getSession().getAttribute("userName");
		List<Map> list=drvPunRecordService.findAllRecord("com.nasoft.SSM.DrvPunRecord.findAllRecord",certno);
		
		mv.addObject("list", list);
		mv.setViewName("driver/punishment");
	} catch (Exception e) {
		e.printStackTrace();
	}
	return mv;
	}
	@RequestMapping("appeal")
	public ModelAndView appeal(HttpServletRequest request,HttpServletResponse repsonse){
		ModelAndView mv=new ModelAndView();
		try {
			String certno = request.getParameter("certno");
			String punText = request.getParameter("punText");
			Map<String,String> map=new HashMap<String,String>();
			map.put("certno", certno);
			map.put("punText",punText);
		List<Map>	list=drvPunRecordService.findAllRecord("com.nasoft.SSM.DrvPunRecord.findDetailAPpeal", map);
		List<Map> listType=drvPunRecordService.findAllIndicType("com.nasoft.SSM.DrvPunRecord.findIndicType",certno);
		mv.addObject("list", list);
		mv.addObject("listType",listType);
		mv.setViewName("driver/appealInfo2");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
		
	}
	@RequestMapping("/toAppeal")
	public ModelAndView toAppeal(HttpServletRequest request,HttpServletResponse response){
		String indicCode = request.getParameter("indic_code");
		request.getSession().setAttribute("indicCode", indicCode);
		String indicText = request.getParameter("indicText");
		ModelAndView mv=new ModelAndView();
		mv.addObject("indicText", "indicText");
		mv.setViewName("driver/toAppeal");
		return mv;
	}
	@RequestMapping("/addAppeal")
	public void addAppeal(HttpServletRequest request,HttpServletResponse response){
		String msg=null;
		try {
			String certno = request.getParameter("certno");
			String drvName = request.getParameter("username");
			String appealText=request.getParameter("appealText");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sdf02 = new SimpleDateFormat("yyyyMMddhhmmss");
			DrvAppeals drvAppeals=new DrvAppeals();
			drvAppeals.setAppealDate(new Date());
			drvAppeals.setAppealStatus("0");
			drvAppeals.setAppealText(appealText);
			drvAppeals.setCertno(certno);
			drvAppeals.setDrvName(drvName);
			drvAppeals.setAppealNo(sdf02.format(new Date()));
			drvPunRecordService.addAppeal("com.nasoft.SSM.DrvPunRecord.addAppeal",drvAppeals);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		
		
	}
}
