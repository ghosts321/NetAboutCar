package com.nasoft.SSM.controller.system;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nasoft.SSM.base.controller.BaseController;
import com.nasoft.SSM.domain.BnsComplain;
import com.nasoft.SSM.domain.CarPermitApply;
import com.nasoft.SSM.domain.DrvPermitapply;
import com.nasoft.SSM.domain.DrvUserreg;
import com.nasoft.SSM.domain.PageBean;
import com.nasoft.SSM.domain.PilotUser;
import com.nasoft.SSM.domain.Platform;
import com.nasoft.SSM.domain.PlatformUserReg;
import com.nasoft.SSM.service.AreaCodeService;
import com.nasoft.SSM.service.BnsComplainService;
import com.nasoft.SSM.service.CarPilotApplyService;
import com.nasoft.SSM.service.DrvPermitapplyService;
import com.nasoft.SSM.service.DrvUserregService;
import com.nasoft.SSM.service.PilotUserService;
import com.nasoft.SSM.service.PlatformApplyService;
import com.nasoft.SSM.service.PlatformUserService;
import com.nasoft.util.Encryption;
import com.nasoft.util.PropsUtil;
import com.nasoft.util.StringUtil;


@Controller
@RequestMapping("/system")
public class SystemController extends BaseController {

	private SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	private static Logger logger = Logger.getLogger(SystemController.class);
	
	@Resource
	private PilotUserService pilotUserService;
	@Resource
	private DrvUserregService drvUserregService;
	@Resource
	private PlatformUserService platformUserService;
	@Resource
	private AreaCodeService areaCodeService;
	@Resource
	private BnsComplainService bnsComplainService;
	@Resource
	private PlatformApplyService platformApplyService;
	@Resource
	private DrvPermitapplyService drvPermitapplyService;
	@Resource
	private CarPilotApplyService carPilotApplyService;
	
	/**
	 * 打开登录页面
	 */
	@RequestMapping("openLogin")
	public String openLogin(HttpServletRequest request) {
		String usertype = request.getParameter("usertype");
		
		if (usertype != null && !"".equals(usertype)) {
			request.setAttribute("usertype", usertype);
		}
		
		return "system/userLogin";
	}
	
	/**
	 * 登录
	 * @throws Exception 
	 */
	@RequestMapping("/userLogin")
	public void userLogin(HttpServletRequest request,HttpServletResponse response,DrvUserreg drvUserreg) throws Exception {
		try {
			String usertype = request.getParameter("usertype");
			String areaName = (String) request.getSession().getAttribute("areaName");
			if(StringUtils.isNotBlank(areaName)){
				logger.info("certno:"+drvUserreg.getCertno()+",passWord:"+drvUserreg.getPassword());
				String pass = Encryption.md5(drvUserreg.getPassword());
				drvUserreg.setPassword(pass);
				drvUserreg.setAreaname(areaName);
				DrvUserreg duser = drvUserregService.findByUserInfo("com.nasoft.SSM.DrvUserreg.findByUserInfo", drvUserreg);
				if (null != duser) {
					request.getSession().setAttribute("userName", duser.getCertno());
					request.getSession().setAttribute("phoneno", duser.getPhoneno());
					request.getSession().setAttribute("usertype", usertype);
					writer(response, "success");
					if(usertype.equals("0")){//驾驶员用户
						List<DrvPermitapply> drvPermitapplyList = drvPermitapplyService.selectByCertno("com.nasoft.SSM.DrvPermitapply.selectByCertno", duser.getCertno());
						if(drvPermitapplyList.size() > 0){
							request.getSession().setAttribute("appstatus", drvPermitapplyList.get(0).getAppstatus());
						}
					}
				}else{
					writer(response, "error");
				}
			}else{
				writer(response, "nosession");
			}
		} catch (Exception e) {
			writer(response, "error");
			e.printStackTrace();
		}
	}
	
	/**
	 * 平台登录
	 * @throws Exception 
	 */
	@RequestMapping("/platFormUserLogin")
	public void platFormUserLogin(HttpServletRequest request,HttpServletResponse response,PlatformUserReg platFormUser) throws Exception {
		try {
			String usertype = request.getParameter("usertype");
			String areaName = (String) request.getSession().getAttribute("areaName");
			String areaCode = (String) request.getSession().getAttribute("areaCode");
			if(StringUtils.isNotBlank(areaName)){
				String pass = Encryption.md5(platFormUser.getPassWord());
				platFormUser.setPassWord(pass);
				PlatformUserReg p=platformUserService.findPlatformUserRegByIdAndPwd("com.nasoft.aboutcar.platFormMapper.selectPlatFormUserByIdAndPwd", platFormUser);
				if (null != p) {
					request.getSession().setAttribute("userName", p.getCreditCode());
					request.getSession().setAttribute("usertype", usertype);
					writer(response, "success");
				}else{
					writer(response, "error");
				}
			}else{
				writer(response, "nosession");
			}
		} catch (Exception e) {
			writer(response, "error");
			e.printStackTrace();
		}
	}
	
	/**
	 * 退出
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/loginout")
	public String loginout(HttpServletRequest request,Model model){
		//获取配置文件中的地区region
		String region = PropsUtil.loadPropsToMap("region.properties").get("region");
		request.getSession().invalidate();
		if(StringUtil.isNotEmpty(region)){
			if(region.equals("tianjin")){//地区为天津
				return "forward:/system/openMain.action";
			}else if(region.equals("henan")){
				return "redirect:/index_henan.jsp";			
			}
		}
		return "redirect:/index_henan.jsp";
	}
	
	/**
	 * 打开用户注册页面
	 * @return
	 */
	@RequestMapping("/openReg")
	public String openReg(){
		return "system/userReg";
	}
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request){
		request.getSession().invalidate();
		//获取配置文件中的地区region
		String region = PropsUtil.loadPropsToMap("region.properties").get("region");
		if(StringUtil.isNotEmpty(region)){
			request.getSession().setAttribute("region", region);
			if(region.equals("tianjin")){//地区为天津
				return "forward:/system/openMain.action";
			}else if(region.equals("henan")){
				return "redirect:/index_henan.jsp";			
			}
		}
		return "redirect:/index_henan.jsp";
	}
	/**
	 * 用户注册
	 */
	@RequestMapping("/userReg")
	public String userReg(HttpServletRequest request,HttpServletResponse response,DrvUserreg drvUserreg) {
		try {
			logger.info("用户注册：userName:"+drvUserreg.getCertno()+",passWord:"+drvUserreg.getPassword());
			String areaName = (String) request.getSession().getAttribute("areaName");
			DrvUserreg p=drvUserregService.isexistUser("com.nasoft.SSM.DrvUserreg.isexistUser", drvUserreg.getCertno());
			if(null == p){
				String pass = Encryption.md5(drvUserreg.getPassword());
				drvUserreg.setPassword(pass);
				drvUserreg.setPwderrtimes(3);
				drvUserreg.setRegdatetime(new Date());
				drvUserreg.setStatus("1");
				drvUserreg.setAreaname(areaName);
				drvUserregService.addDrvUserreg("com.nasoft.SSM.DrvUserreg.addDrvUserreg", drvUserreg);
			}
			request.getSession().setAttribute("userName", drvUserreg.getCertno());
			request.getSession().setAttribute("phoneno", drvUserreg.getPhoneno());
			request.getSession().setAttribute("usertype", "0");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "system/main";
	}
	/**
	 * 判断用户是否存在
	 */
	@RequestMapping("/isexistUser")
	public void isexistUser(HttpServletRequest request,HttpServletResponse response,String certno){
		try{
			PrintWriter out = response.getWriter();
			DrvUserreg p=drvUserregService.isexistUser("com.nasoft.SSM.DrvUserreg.isexistUser", certno);
			
			if(p!=null){
				out.print("1");
			}else{
				out.print("0");
			}
			out.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 平台用户注册
	 */
	@RequestMapping("/PlatFormUserReg")
	public String PlatFormUserReg(HttpServletRequest request, PlatformUserReg platformUser) {
		try {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			logger.info("平台用户注册：userName:"+platformUser.getCreditCode()+",passWord:"+platformUser.getPassWord());
			
			
			
			PlatformUserReg p=platformUserService.findPlatformUserRegById("com.nasoft.aboutcar.platFormMapper.selectPlatFormUserById", platformUser.getCreditCode());
			if(p==null){
				String pass = Encryption.md5(platformUser.getPassWord());
				platformUser.setPassWord(pass);
				platformUser.setRegDateTime(sdf.format(new Date()));
				platformUser.setStatus("1");
				platformUser.setPwdErrTimes(0);
				platformUser.setSmsSendCount(0);
				platformUser.setSmsErrCount(0);
			    platformUserService.addPlatformUser("com.nasoft.aboutcar.platFormMapper.addPlatFormUser", platformUser);
			    request.getSession().setAttribute("userName", platformUser.getCreditCode());
			    request.getSession().setAttribute("usertype", "1");
			    return "system/main";
			}else{
				request.getSession().setAttribute("userName", platformUser.getCreditCode());
				request.getSession().setAttribute("usertype", "1");
				return "system/main";
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	/**
	 * 判断平台用户是否存在
	 */
	@RequestMapping("/isexistPlatFormUser")
	public void isexistPlatFormUser(HttpServletRequest request,HttpServletResponse response,String creditCode){
		try{
			PrintWriter out = response.getWriter();
			PlatformUserReg p=platformUserService.findPlatformUserRegById("com.nasoft.aboutcar.platFormMapper.selectPlatFormUserById", creditCode);
			
			if(p!=null){
				out.print("1");
			}else{
				out.print("0");
			}
			out.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 获取手机验证码
	 * @return 
	 */
	@RequestMapping("/ajaxGetPhoneCheckode")
	public Map<String, Object> ajaxGetPhoneCheckode() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("message", "true");
		
		return map;
	}
	
	/**
	 * 添加用户
	 */
	@RequestMapping("/addPilotUser")
	public String addPilotUser(HttpServletRequest request,HttpServletResponse response,PilotUser pilotUser){
		logger.info("addPilotUser"+pilotUser.getUserName());
		try {
			//判断此用户是否存在
			pilotUser.setRegDate(sdf.format(new Date()));
			pilotUser.setStatus("1");
			pilotUserService.addPilotUser("com.nasoft.SSM.PilotUser.addPilotUser", pilotUser);
			request.getSession().setAttribute("userName", pilotUser.getUserName());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "system/default";
	}
	
	/**
	 * 去个人中心页面
	 */
	@RequestMapping("/gerenCenter")
	public String toGeRenCenter(){
		return "driver/forwardPage";
	}
	
	@RequestMapping("/toMain")
	public String toMain(HttpServletRequest request,String userType){
		request.getSession().setAttribute("userType", userType);
		return "system/main";
	}
	
	/**
	 * 去主页
	 */
	@RequestMapping("/openMain")
	public String openMain(HttpServletRequest request, HttpServletResponse response, Model model){
		String region = (String) request.getSession().getAttribute("region");
		if(null==region){
			//获取配置文件中的地区region
			region = PropsUtil.loadPropsToMap("region.properties").get("region");
			request.getSession().setAttribute("region", region);
		}
		String areaName = request.getParameter("areaName");
		if(StringUtil.isEmpty(areaName)){
			areaName = request.getSession().getAttribute("areaName")+"";
		}
		String areaCode="";
		try {
			areaName = URLDecoder.decode(areaName, "UTF-8");
			if(region.equals("tianjin")){
				areaName = "天津市";
			}
		    areaCode=areaCodeService.findAreaCodeByAreaName("com.nasoft.aboutcar.areaCodeMapper.findAreaCodeByAreaName", areaName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("areaName："+areaName);
		logger.info("areaCode："+areaCode);
		request.getSession().setAttribute("areaName", areaName);
		request.getSession().setAttribute("areaCode", areaCode);
		request.getSession().setAttribute("menuno", "0");
		 
		return "system/main";
	}
	
	/**
	 * 打开首页
	 * @return
	 */
	@RequestMapping("/openFirstPage")
	public String openFirstPage(HttpServletRequest request){
	    return "system/firstpage";
	}
	
	/**
	 * 打开业务办理页
	 * @return
	 */
	@RequestMapping("/openBussDeal")
	public String openBussDeal(HttpServletRequest request){
		return "system/bussDeal";
	}
	
	/**
	 * 打开投诉结果公示页
	 * @return
	 */
	@RequestMapping("/openfeedBack")
	public String openfeedBack(HttpServletRequest request){
			List<Map> complainList = new ArrayList<Map>();
			PageBean pagebean = new PageBean();//分页类实例化
			String pageDQ = request.getParameter("pageDQ");
			if(pageDQ!=null && !pageDQ.equals("")){
				pagebean.setPageDQ(Integer.parseInt(pageDQ));//设置当前页码
			}
			try {
				List<Map> pageZS = bnsComplainService.pageCount("com.nasoft.SSM.BnsComplain.pageCount");//查询数据总数
				String ZS =  pageZS.get(0).get("ZS").toString();
				pagebean.setPageZS(Integer.parseInt(ZS));//设置数据总数
				
			} catch (Exception e1) {
				e1.printStackTrace(); 
			}						
			int pageInt = pagebean.getPageInt();//获得需要从数据库截取的数据数	
			try {
				complainList = bnsComplainService.selectAllAppeal("com.nasoft.SSM.BnsComplain.selectAllAppeal",pageInt);
				for(Map m :complainList ){
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					m.put("compn_time", dateFormat.format((Date) m.get("compn_time")));
					m.put("idea_time", dateFormat.format((Date) m.get("idea_time")));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getSession().setAttribute("pagebean", pagebean);
			request.getSession().setAttribute("complainList", complainList);		
			return "terrace/appealInfo";		
	}
	
	@RequestMapping("/openBussPlatform")
	public String openBussPlatform(HttpServletRequest request){
		return "system/bussPlatform";
	}
	
	@RequestMapping("/openBussDriver")
	public String openBussDriver(HttpServletRequest request){
		return "system/bussDriver";
	}
	
	@RequestMapping("/openBussVehicle")
	public String openBussVehicle(HttpServletRequest request){
		
		return "system/bussVehicle";
	}
	
	/**
	 * 打开APP下载页
	 * @return
	 */
	@RequestMapping("/openAPPDownload")
	public String openAPPDownload(){
		return "app/appDownload";
	}
	/**
	 * 打开投诉页面
	 * @return
	 */
	@RequestMapping("/openComplain")
	public String openComplain(HttpServletRequest request){
		try {
			List<Platform> platformList = platformApplyService.selectAllPlatForm("com.nasoft.aboutcar.PlatformMapper.selectAllPlatForm");
			request.setAttribute("platformList", platformList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "system/complain";
	}
	
	/**
	 * 添加投诉信息
	 * @param request
	 * @param bnsComplain
	 * @return
	 */
	@RequestMapping("/addBnsComplain")
	public void addBnsComplain(HttpServletRequest request, HttpServletResponse response, BnsComplain bnsComplain){
		try {
			bnsComplain.setCreateTime(new Date());
			bnsComplain.setUpdateTime(new Date());
			bnsComplainService.addBnsComplain("com.nasoft.SSM.BnsComplain.addBnsComplain", bnsComplain);
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
	 * 打开修改密码页面
	 * @return
	 */
	@RequestMapping("/openChangePassword")
	public String openChangePassword(){
		return "system/changePassword";
	}

	/**
	 * 修改密码
	 * @param request
	 * @param response
	 */
	@RequestMapping("/changePassword")
	public void changePassword(HttpServletRequest request, HttpServletResponse response){
		String usertype = (String) request.getSession().getAttribute("usertype");//用户类型（0：驾驶员，1：平台）
		String userName = (String) request.getSession().getAttribute("userName");		
		String oldpassword = request.getParameter("oldpassword");//旧密码
		String newpassword = request.getParameter("newpassword");//新密码
		String areaName = (String) request.getSession().getAttribute("areaName");//区域名
		
		String md5OldPassword = Encryption.md5(oldpassword);
		String md5NewPassword = Encryption.md5(newpassword);
		try{
			if(StringUtils.isNotBlank(areaName)){
				if(usertype.equals("0")){//驾驶员用户
					DrvUserreg drvUserreg = new DrvUserreg();
					drvUserreg.setAreaname(areaName);
					drvUserreg.setCertno(userName);
					drvUserreg.setPassword(md5OldPassword);
					DrvUserreg duser = drvUserregService.findByUserInfo("com.nasoft.SSM.DrvUserreg.findByUserInfo", drvUserreg);
					if (null != duser) {
						drvUserreg.setPassword(md5NewPassword);
						drvUserregService.changePassword("com.nasoft.SSM.DrvUserreg.changePassword", drvUserreg);
						writer(response, "success");
					}else{
						writer(response, "error");
					}
				}else{//平台用户
					PlatformUserReg platFormUser = new PlatformUserReg();
					platFormUser.setCreditCode(userName);
					platFormUser.setPassWord(md5OldPassword);
					PlatformUserReg platformUserReg = platformUserService.findPlatformUserRegByIdAndPwd("com.nasoft.aboutcar.platFormMapper.selectPlatFormUserByIdAndPwd", platFormUser);
					if (null != platformUserReg) {
						platFormUser.setPassWord(md5NewPassword);
						platformUserService.changePassword("com.nasoft.aboutcar.platFormMapper.changePassword", platFormUser);
						writer(response, "success");
					}else{
						writer(response, "error");
					}
				}
			}else{
				writer(response, "nosession");
			}
		}catch (Exception e) {
			try {
				writer(response, "fail");
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}
	
	@Test
	public void test(){
		Map<String, String> loadPropsToMap = PropsUtil.loadPropsToMap("region.properties");
		System.out.println(loadPropsToMap.toString());
	}
	public static void main(String[] args) {
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println(sdf.format(new Date()));
	}
}
