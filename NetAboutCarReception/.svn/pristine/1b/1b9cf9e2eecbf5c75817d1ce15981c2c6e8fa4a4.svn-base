package com.nasoft.SSM.controller.terrace;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nasoft.SSM.base.controller.BaseController;
import com.nasoft.SSM.domain.BnsComplain;
import com.nasoft.SSM.domain.CarInfo;
import com.nasoft.SSM.domain.CarPermitcert;
import com.nasoft.SSM.domain.ComAppealD;
import com.nasoft.SSM.domain.ComAppeals;
import com.nasoft.SSM.domain.ComScoreRecord;
import com.nasoft.SSM.domain.DrvContract;
import com.nasoft.SSM.domain.DrvPermitapply;
import com.nasoft.SSM.domain.DrvPermitcert;
import com.nasoft.SSM.domain.DrvPlantCaseInfo;
import com.nasoft.SSM.domain.DrvRecord;
import com.nasoft.SSM.domain.DrvUserinfo;
import com.nasoft.SSM.domain.MsgNotice;
import com.nasoft.SSM.domain.PageBean;
import com.nasoft.SSM.domain.PlantCaseAppeal;
import com.nasoft.SSM.domain.PlantCaseInfo;
import com.nasoft.SSM.domain.Platform;
import com.nasoft.SSM.domain.PlatformApply;
import com.nasoft.SSM.domain.comComplainAppeal;
import com.nasoft.SSM.domain.comComplainInfo;
import com.nasoft.SSM.domain.drvBlackList;
import com.nasoft.SSM.domain.drvComplainDispose;
import com.nasoft.SSM.domain.drvComplainInfo;
import com.nasoft.SSM.domain.drvDisAppeal;
import com.nasoft.SSM.service.BnsComplainService;
import com.nasoft.SSM.service.CarPilotApplyService;
import com.nasoft.SSM.service.DrvPermitcertService;
import com.nasoft.SSM.service.DrvRecordService;
import com.nasoft.SSM.service.DrvUserinfoService;
import com.nasoft.SSM.service.MsgNoticeService;
import com.nasoft.SSM.service.PlantCaseInfoService;
import com.nasoft.SSM.service.PlatformApplyService;
import com.nasoft.util.DateUtil;
import com.nasoft.util.FtpUtil;

/**
 * 平台业务
 * @author user
 *
 */
@Controller
@RequestMapping("/terrace")
public class TerraceController extends BaseController{
	
	
	private static Logger logger=Logger.getLogger(TerraceController.class);
	
	private static String _USERTYPE = "1";
	@Resource
	private DrvUserinfoService drvUserinfoService;
	@Resource
	private DrvPermitcertService drvPermitcertService;
	@Resource
	private CarPilotApplyService carPilotApplyService;
	@Resource
    private PlatformApplyService platformApplyService;	
	@Resource
	private DrvRecordService drvRecordService;
	@Resource
	private MsgNoticeService msgNoticeService;
	@Resource
	private BnsComplainService bnsComplainService;
	@Resource
	private PlantCaseInfoService plantCaseInfoService;
	
	/**
	 * 打开许可申请
	 * @param request
	 * @return
	 */
	@RequestMapping("/openPilotApplyList")
	public String openPilotApplyList(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			try {
				List<PlatformApply> permitapplyList = platformApplyService.findPlatformtApplyByNo("com.nasoft.aboutcar.PlatformMapper.findComPermitApplyByCertNo", userName);
				if(null != permitapplyList && permitapplyList.size()>0){
					//如果已经申请过，把之前申请的信息回显回来
					if(permitapplyList.get(0).getApplyType().equals("1") && permitapplyList.get(0).getAppStatus().equals("-1")){
						
						Platform platform=platformApplyService.findPlatformByCreditCode("com.nasoft.aboutcar.PlatformMapper.findPlatformByCreditCode", userName);
						PlatformApply platformApply=permitapplyList.get(0);
						request.setAttribute("platform", platform);
						request.setAttribute("platformApply", platformApply);
						//return "terrace/pilotApplyUpdate";
						return "terrace/pilotApply";
					}else{
						request.setAttribute("permitapplyList", permitapplyList);
						return "terrace/progressList";
					}
				}else{
						return "terrace/pilotApply";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return null;
		}
	}
	
	/**
	 * 打开许可申请详情
	 * @param request
	 * @return
	 */
	@RequestMapping("/openPilotApply")
	public String openPilotApply(){
		return "terrace/pilotApply";
	}
	
	/**
	 * 打开补办申请
	 * @param request
	 * @return
	 */
	@RequestMapping("/openCompensateApplyList")
	public String openCompensateApplyList(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			return "terrace/compensateApplyList";
		}
	}
	
	/**
	 * 打开补办申请详情
	 * @param request
	 * @return
	 */
	@RequestMapping("/openCompensateApply")
	public String openCompensateApply(){
		return "terrace/compensateApply";
	}
	
	/**
	 * 打开变更申请
	 * @param request
	 * @return
	 */
	@RequestMapping("/openChangeApplyList")
	public String openChangeApplyList(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			return "terrace/driverChangeApplyList";
		}
	}
	
	/**
	 * 打开变更申请详情
	 * @param request
	 * @return
	 */
	@RequestMapping("/openChangeApply")
	public String openChangeApply(String applyId,HttpServletRequest request,RedirectAttributes attr){
		String userName = (String) request.getSession().getAttribute("userName");
		try {
			PlatformApply changeApply = platformApplyService.findComChangeApplyByApplyid("com.nasoft.aboutcar.PlatformMapper.findComChangeApplyByApplyid",applyId);
			if(null != changeApply){
				String appStatus = changeApply.getAppStatus();
				if(appStatus.equals("0")||appStatus.equals("1")){//申请状态为正在申请或已通过则打开办理进度
					attr.addAttribute("appstatus", appStatus);
					attr.addAttribute("applyType", changeApply.getApplyType());
					return "redirect:openProgress.action";
				}
			}
			Platform platform=platformApplyService.findPlatformByCreditCode("com.nasoft.aboutcar.PlatformMapper.findPlatformByCreditCode", userName);
			PlatformApply platformApply=platformApplyService.findComPermitApplyByApplyid("com.nasoft.aboutcar.PlatformMapper.findComPermitApplyByApplyid", applyId);
			request.setAttribute("platform", platform);
			request.setAttribute("platformApply", platformApply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "terrace/comChangeApply";
	}
	
	/**
	 * 打开注销申请列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/openCancelApplyList")
	public String openCancelApplyList(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			//return "terrace/openCancelApply";
			return "redirect:/terrace/openCancelApply.action";
		}
	}
	/**
	 * 打开申请注销详情
	 * @param request
	 * @return
	 *  
	 */
	@RequestMapping("/openCancelApply")
	public String openCancelApply(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		try {
			List<PlatformApply> permitapplyList = platformApplyService.findPlatformtApplyByNo("com.nasoft.aboutcar.PlatformMapper.findComPermitApplyByCertNo", userName);
			if(null != permitapplyList && permitapplyList.size()>0){
			//	回显申请信息
					Platform platform=platformApplyService.findPlatformByCreditCode("com.nasoft.aboutcar.PlatformMapper.findPlatformByCreditCode", userName);
					PlatformApply platformApply=permitapplyList.get(0);
					request.setAttribute("platform", platform);
					request.setAttribute("platformApply", platformApply);
					return "terrace/cancelApply";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
				return "terrace/cancelApply";
	}
	
	/**
	 * 提交申请注销表单
	 * @param request
	 * @return
	 */
	@RequestMapping("/commitCancelApply")
	public String commitCancelApply(HttpServletRequest request,HttpServletResponse response){
		String userName = (String) request.getSession().getAttribute("userName");
		String deactiveInfo = (String)request.getParameter("remark");
		
		try {
			List<PlatformApply>  permitapplyList = platformApplyService.findPlatformtApplyByNo("com.nasoft.aboutcar.PlatformMapper.findComPermitApplyByCertNo", userName);
			if(null != permitapplyList && permitapplyList.size()>0){
				PlatformApply platformApply=permitapplyList.get(0);
				platformApplyService.deletePermitApplyByApplyId("com.nasoft.aboutcar.PlatformMapper.deletePermitApplyByApplyId", platformApply.getApplyId());
				PlatformApply  pa = new PlatformApply();
				BeanUtils.copyProperties(pa, platformApply);
				pa.setAppStatus("3");
				pa.setDeactiveInfo(deactiveInfo); 
				platformApplyService.addPlatformtApply("com.nasoft.aboutcar.PlatformMapper.insertPlatformApply", pa);
			}else{
				writer(response, "error");
				
			}
		}catch(Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//最后返回到进度查询
		return "terrace/progress";
	}
	/**
	 * 添加平台资质申请信息
	 * @param request
	 * @param pilotApply
	 * @return
	 */
	@RequestMapping("/addPilotApply")
	@Transactional(rollbackFor=Exception.class)
	public void addPilotApply(HttpServletRequest request,HttpServletResponse response,Platform platform,PlatformApply platformApply,
			@RequestParam(value="annexFile",required=false) MultipartFile annexFile){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmssSSS");
		SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		//首先判断是否已经申请过
		try {
			String userName = (String) request.getSession().getAttribute("userName");
			List<PlatformApply> pa = platformApplyService.findPlatformtApplyByNo("com.nasoft.aboutcar.PlatformMapper.findComPermitApplyByCertNo", userName);
			if(null != pa && pa.size()>0){
				PlatformApply p=pa.get(0);
				if(p.getApplyType().equals("1") && p.getAppStatus().equals("-1")){
					platformApplyService.deletePlatformByCreditCode("com.nasoft.aboutcar.PlatformMapper.deletePlatformByCreditCode", platformApply.getCreditCode());
					platformApplyService.deletePermitApplyByApplyId("com.nasoft.aboutcar.PlatformMapper.deletePermitApplyByApplyId", platformApply.getApplyId());
					addPilotApply(response, platform, platformApply, annexFile, sdf,sdf2);
				}else{
					writer(response, "cunzai");
					return;
				}
			}else{
				addPilotApply(response, platform, platformApply, annexFile, sdf,sdf2);
			}
		} catch (Exception e2) {
			try {
				platformApplyService.deletePlatformByCreditCode("com.nasoft.aboutcar.PlatformMapper.deletePlatformByCreditCode", platform.getCreditCode());
				platformApplyService.deletePermitApplyByApplyId("com.nasoft.aboutcar.PlatformMapper.deletePermitApplyByApplyId", platformApply.getApplyId());
				writer(response, "error");
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			e2.printStackTrace();
		}
	}

	private void addPilotApply(HttpServletResponse response, Platform platform,
			PlatformApply platformApply, MultipartFile annexFile,
			SimpleDateFormat sdf, SimpleDateFormat sdf2) throws IOException,
			Exception {
		InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
	    Properties p = new Properties();
	    p.load(in);
        
		String hostname = p.getProperty("ftp.hostname");
		int port = Integer.valueOf(p.getProperty("ftp.port"));
		String username = p.getProperty("ftp.username");
		String password = p.getProperty("ftp.password");
		String pathname = "upload/platform/"+platform.getCreditCode(); 
		
		String annexFilePath = "";  //附件路径
		
		if(null!=annexFile){
			    //获取文件后缀名
			    String annexFileSuffix = annexFile.getOriginalFilename().substring(annexFile.getOriginalFilename().lastIndexOf("."));     
			    String annexDate="annex"+sdf.format(new Date());
				String annexDateZipFileName = annexDate+annexFileSuffix;
				
				InputStream inputStream  = annexFile.getInputStream();
				FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, annexDateZipFileName, inputStream);
				annexFilePath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+annexDateZipFileName;
			    System.out.println(annexFilePath);
		}
		//platformApply.setApplyId("A"+sdf.format(new Date()));
		platformApply.setApplyType("1");
		platformApply.setAnnex(annexFilePath);
		platformApply.setApplyDate(sdf2.format(new Date()));
		
		platform.setCreateDate(sdf2.format(new Date()));
		platform.setUpdDateTime(sdf2.format(new Date()));
		platformApplyService.addPlatform("com.nasoft.aboutcar.PlatformMapper.insertPlatform", platform);
		platformApplyService.addPlatformtApply("com.nasoft.aboutcar.PlatformMapper.insertPlatformApply", platformApply);
		writer(response, "success");
	}
	/**
	 * 增加变更申请
	 * @param request
	 * @param response
	 * @param platform 平台基本信息
	 * @param platformApply 平台申请信息
	 * @param annexFile 上传附件
	 */
	@RequestMapping("/addChangeApply")
	public void addChangeApply(HttpServletRequest request,HttpServletResponse response,Platform platform,PlatformApply platformApply,
			@RequestParam(value="annexFile",required=false) MultipartFile annexFile){
		String applyid = platformApply.getApplyId();
		//判断是否已存在变更申请
		try {
			PlatformApply changeApply = platformApplyService.findComChangeApplyByApplyid("com.nasoft.aboutcar.PlatformMapper.findComChangeApplyByApplyid", applyid);
			if(null != changeApply){//存在则删除重新添加
				platformApplyService.deletePermitApplyByApplyId("com.nasoft.aboutcar.PlatformMapper.deleteChangeApplyByApplyId",applyid);
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		//读取文件服务器参数
		InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
	    Properties p = new Properties();
	    try {
			p.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}
		String hostname = p.getProperty("ftp.hostname");
		int port = Integer.valueOf(p.getProperty("ftp.port"));
		String username = p.getProperty("ftp.username");
		String password = p.getProperty("ftp.password");
		String pathname = "upload/platform/"+platform.getCreditCode(); 
		
		String annexFilePath = "";  //附件路径
		//生成上传文件名
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmssSSS");
		if(null!=annexFile){
		    //获取文件后缀名
		    String annexFileSuffix = annexFile.getOriginalFilename().substring(annexFile.getOriginalFilename().lastIndexOf("."));     
		    String annexDate="annex"+sdf.format(new Date());
			String annexDateZipFileName = annexDate+annexFileSuffix;
			
			InputStream inputStream = null;
			try {
				inputStream = annexFile.getInputStream();
			} catch (IOException e) {
				e.printStackTrace();
			}
			FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, annexDateZipFileName, inputStream);
			annexFilePath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+annexDateZipFileName;
		    System.out.println(annexFilePath);
		}
		
		SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		platformApply.setApplyType("2");//申请类型设置为变更
		platformApply.setAnnex(annexFilePath);
		platformApply.setApplyDate(sdf2.format(new Date()));
		
		platform.setUpdDateTime(sdf2.format(new Date()));
		try {
			platformApplyService.updatePlatform("com.nasoft.aboutcar.PlatformMapper.updatePlatform", platform);
			platformApplyService.addPlatformtApply("com.nasoft.aboutcar.PlatformMapper.insertPlatformApply", platformApply);
			writer(response, "success");
		} catch (Exception e) {
			e.printStackTrace();
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
				List<PlatformApply> permitapplyList = platformApplyService.findPlatformtApplyByNo("com.nasoft.aboutcar.PlatformMapper.findComPermitApplyByCertNo", userName);
				request.setAttribute("permitapplyList", permitapplyList);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "terrace/progressList";
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
		//获取http参数-申请类型
		String applyType = request.getParameter("applyType");
		//获取申请状态
		String appstatus = request.getParameter("appstatus");
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			/*String appstatus = "";
			String applytype = "";
			try {
				List<PlatformApply> platformApply = platformApplyService.findPlatformtApplyByNo("com.nasoft.aboutcar.PlatformMapper.findComPermitApplyByCertNo", userName);
				
				if(null != platformApply){
					appstatus = platformApply.get(0).getAppStatus();
					applytype = platformApply.get(0).getApplyType();
				}else{
					return "terrace/pilotApply";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}*/
			request.setAttribute("appstatus", appstatus);
			request.setAttribute("applytype", applyType);
			return "terrace/progress";
		}
	}
	/**
	 * 打开申请详细信息页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/openPlatDetail")
	public String openPlatDetail(HttpServletRequest request,String applyid,String applyType){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			try {
				Platform platform=platformApplyService.findPlatformByCreditCode("com.nasoft.aboutcar.PlatformMapper.findPlatformByCreditCode", userName);
				HashMap<String, Object> map = new HashMap<>();
				map.put("applyType", applyType);
				map.put("applyid", applyid);
				PlatformApply platformApply=platformApplyService.findComPermitApplyByMap("com.nasoft.aboutcar.PlatformMapper.findComPermitApplyByMap", map);
				request.getSession().setAttribute("platform", platform);
				request.getSession().setAttribute("platformApply", platformApply);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "terrace/platDetail";
		}
		
	}
	
	/**
	 * 打开备案管理
	 * @param request
	 * @return
	 */
	@RequestMapping("/openRecord")
	public String openRecord(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			
			return "terrace/record";
		}
	}
	
	@RequestMapping("/addRecord")
	public void addRecord(HttpServletRequest request,HttpServletResponse response,String certno,String startDate,String endDate,
			String type,@RequestParam(value="contractFile",required=false) MultipartFile contractFile) throws Exception{
		logger.info("addRecord:"+certno);
		try {
			String userName = (String) request.getSession().getAttribute("userName");
			//备案表
			DrvRecord record = new DrvRecord();
			record.setCertno(certno);
			record.setCreditcode(userName);
			CarInfo carInfo=carPilotApplyService.findCarInfoByCertNo("com.nasoft.aboutcar.carMapper.findCarByCertNo", certno);
			if(null != carInfo){
				record.setCarid(carInfo.getCarId());
			}
			List<DrvPermitcert> drvPermitcertList = drvPermitcertService.selectByCertno("com.nasoft.SSM.DrvPermitcert.selectByCertno",certno);
			if(drvPermitcertList.size() > 0){//此驾驶员是否已有营运证书
				record.setPcertno(drvPermitcertList.get(0).getPcertno());
			}
			record.setStatus("0");
			record.setCreatedate(new Date());
			
			//合同表
			DrvContract contract = new DrvContract();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			if(StringUtils.isNotBlank(startDate)){
				contract.setStartdate(sdf.parse(startDate));
			}
			if(StringUtils.isNotBlank(endDate)){
				contract.setEnddate(sdf.parse(endDate));
			}
			contract.setType(type);
			contract.setCreatedate(new Date());
			
			InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
		    Properties p = new Properties();
		    p.load(in);
            
			String hostname = p.getProperty("ftp.hostname");
			int port = Integer.valueOf(p.getProperty("ftp.port"));
			String username = p.getProperty("ftp.username");
			String password = p.getProperty("ftp.password");
			String pathname = "upload/contract/"; 
			String contractPath = "";
			if(null != contractFile){
				String filename = "contract_"+new Date().getTime()+contractFile.getOriginalFilename().substring(contractFile.getOriginalFilename().lastIndexOf(".")); 
				InputStream inputStream  = contractFile.getInputStream();
				Boolean flag = FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, filename, inputStream);
				if(flag){
					contractPath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+filename;
				}
			}
			if(StringUtils.isNotBlank(contractPath)){
				contract.setUrl(contractPath);
				drvRecordService.addDrvRecord(contract, record);
				writer(response, "success");
			}else{
				writer(response, "error");
			}
		} catch (Exception e) {
	        writer(response, "error");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/drivervalidate")
	public void drivervalidate(HttpServletRequest request,HttpServletResponse response,String certno){
		try{
			String result = "0";
			PrintWriter out = response.getWriter();
			DrvUserinfo drvUserinfo = drvUserinfoService.selectByCertno("com.nasoft.SSM.DrvUserinfo.selectByCertno", certno);
			if(null != drvUserinfo){//是否存在此驾驶员
				List<DrvPermitcert> drvPermitcertList = drvPermitcertService.selectByCertno("com.nasoft.SSM.DrvPermitcert.selectByCertno",certno);
				if(drvPermitcertList.size() > 0){//此驾驶员是否已有营运证书
					CarInfo carInfo=carPilotApplyService.findCarInfoByCertNo("com.nasoft.aboutcar.carMapper.findCarByCertNo", certno);
					if(null != carInfo){//此驾驶员是否已有绑定车辆
						List<CarPermitcert> carPermitcertList=carPilotApplyService.findCarCertByCertNo("com.nasoft.aboutcar.carMapper.findCarCertByCertNo", certno);
						if(carPermitcertList.size() > 0){//此驾驶员是否已有车辆运输证
							DrvRecord drvRecord = drvRecordService.findRecordByCertNo("com.nasoft.SSM.DrvRecord.findRecordByCertNo", certno);
							if(null == drvRecord){//此驾驶员是否已有备案信息
								result = "1";
							}else{
								result = "驾驶员已有备案信息";
							}
						}else{
							result = "驾驶员车辆没有车辆运输证";
						}
					}else{
						result = "驾驶员没有绑定车辆";
					}
				}else{
					result = "驾驶员没有营运证书";
				}
			}else{
				result = "没有查到驾驶员信息";
			}
			out.print(result);
			out.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 打开投诉信息
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/openComplainInfo")
	public String openComplainInfo(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		Map<String, Object> map = new HashMap<String, Object>();
		PageBean pagebean = new PageBean(); 
		String pageDQ = request.getParameter("pageDQ");
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);			
			return "system/userLogin";
		} else {
			if(pageDQ!=null&&!pageDQ.equals("")){
				pagebean.setPageDQ(Integer.parseInt(pageDQ));
			}
			List<Map> complainList = new ArrayList<Map>();
			try {
				String comnName  = bnsComplainService.findcomnName("com.nasoft.SSM.BnsComplain.findComname",userName);
				List<Map> ZS = bnsComplainService.findcomZS("com.nasoft.SSM.BnsComplain.findcomZS",comnName);
				pagebean.setPageZS(Integer.parseInt(ZS.get(0).get("ZS").toString()));
				int pageInt = pagebean.getPageInt();
				map.put("comnName", comnName);
				map.put("pageInt", pageInt);
				complainList = bnsComplainService.selectAllComplain("com.nasoft.SSM.BnsComplain.selectAllComplain",map);
				for(Map m :complainList ){
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					m.put("compn_time", dateFormat.format((Date) m.get("compn_time")));
					//m.put("enddate", dateFormat.format((Date) m.get("enddate")));
				}
				request.getSession().setAttribute("pagebean", pagebean);
				request.getSession().setAttribute("complainList", complainList);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "terrace/complainInfo";
		}
	}
	

	@RequestMapping("/toLeftTree")
	public String toLeftTree(){
		return "system/leftTree";
	}
	@RequestMapping("/toChangeApply")
	public String toChangeApply(){
		return "terrace/changeApply";
	}
	@RequestMapping("/toGrzx")
	public String toGrzx(){
		return "terrace/personalInfo";
	}
	@RequestMapping("/toUpload")
	public String toUpload(){
		return "terrace/uploadTest";
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
        return " terrace/uploadTest";  
    }  
	
	/**
	 * 驾驶员投诉处理
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("toHandleComit")
	@Transactional
	public void toHandleComit(HttpServletRequest request,HttpServletResponse response,
			drvComplainDispose drvcomplaintdispose,drvComplainInfo drvcomplaintinfo,
			   @RequestParam(value="surveyfile",required=false) MultipartFile survey_file,
			   SimpleDateFormat sdf ) throws Exception{
		InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");//获取配置文件
	    Properties p = new Properties();//实例化配置文件
	    p.load(in);//加载配置文件
		String hostname = p.getProperty("ftp.hostname");//获取上传服务器地址
		int port = Integer.valueOf(p.getProperty("ftp.port"));//获取服务器端口号
		String username = p.getProperty("ftp.username");//服务器登录名
		String password = p.getProperty("ftp.password");//服务器密码
		//ModelAndView mv=new ModelAndView();
		DrvPlantCaseInfo drvplantcase = new DrvPlantCaseInfo();
		String msg="";
		String userName = (String) request.getSession().getAttribute("userName");
		String comnName  = bnsComplainService.findcomnName("com.nasoft.SSM.BnsComplain.findComname",userName);
		Date date = new Date();
	    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    SimpleDateFormat sf1 = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sf.format(date);
		int id =Integer.parseInt( newdate.substring(11,13)+newdate.substring(14,16)+newdate.substring(17));
		if(drvcomplaintdispose.getDis_type()!="0" && !drvcomplaintdispose.getDis_type().equals("0")){
			drvcomplaintdispose.setIs_integrity("1");
		}else{
			drvcomplaintdispose.setIs_integrity("0");
		}
		String drv_license= drvcomplaintinfo.getDriver_licence();
		//先查询是否加入过黑名单
		List<Map> result2 = bnsComplainService.selectblack("com.nasoft.SSM.BnsComplain.selectblack",drv_license);
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
						blacklist.setCreate_time(sf.format(new Date()));
						blacklist.setStorage_date(new Date());
						blacklist.setStorager(comnName);
					int  result3 = bnsComplainService.insertblack("com.nasoft.SSM.BnsComplain.insertblack",blacklist);	
				  //如果曾经加入过黑名单那么就更新黑名单表
				  }else{		  
						blacklist.setDrv_license(drvcomplaintinfo.getDriver_licence());
						blacklist.setDrv_id(drvcomplaintinfo.getDriver_licence());
						blacklist.setDrv_name(drvcomplaintinfo.getDriver_name());
						blacklist.setStatus("0");
						blacklist.setStorage_date(new Date());
						blacklist.setStorager(comnName);
						int  result3 = bnsComplainService.updatetblack("com.nasoft.SSM.BnsComplain.updatetblack",blacklist);
				  }
				//不加入黑名单的情况
			}else if(drvcomplaintdispose.getIs_blacklist()=="0" || drvcomplaintdispose.getIs_blacklist().equals("0")){		
				//如果曾经加入过黑名单那么就将黑名单表状态更改为移除
				if(result2.size()==1){
					blacklist.setStatus("1");
					blacklist.setDrv_license(drvcomplaintinfo.getDriver_licence());
					int result4 = bnsComplainService.deleteblack("com.nasoft.SSM.BnsComplain.deleteblack",blacklist);			
				}
			}
			String disidea = request.getParameter("disidea");
			drvDisAppeal drvdisappeal = new drvDisAppeal();
			drvdisappeal.setId(id);
			drvdisappeal.setDrv_complain_info_id(drvcomplaintinfo.getDrv_complain_info_id());
			drvdisappeal.setDisappeal_idea(drvcomplaintdispose.getDis_idea());
			drvcomplaintdispose.setAppl_idea_peo(comnName);
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
				bnsComplainService.saveDisAppeal("com.nasoft.SSM.BnsComplain.saveDisAppeal",drvdisappeal);
				int result = bnsComplainService.drvUpdate("com.nasoft.SSM.BnsComplain.drvcomit",drvcomplaintinfo);
				int result1 = bnsComplainService.toHandleComit("com.nasoft.SSM.BnsComplain.drvDisposeUpdate",drvcomplaintdispose);
				if(result>0 && result1>0){
					writer(response, "success");
				}else{	
					writer(response, "error");
				}
			} catch (Exception e) {
				writer(response, "error");
				e.printStackTrace();
			}
			
		}else{
			   drvBlackList blacklist = new drvBlackList();
				if(drvcomplaintdispose.getIs_blacklist()=="1" || drvcomplaintdispose.getIs_blacklist().equals("1")){
					  //其次判断曾经是否加入过黑名单
					  //如果曾经没加入则现在加入
					  if(result2.size()==0){
							blacklist.setDrv_license(drvcomplaintinfo.getDriver_licence());
							blacklist.setDrv_id(drvcomplaintinfo.getDriver_licence());
							blacklist.setDrv_name(drvcomplaintinfo.getDriver_name());
							blacklist.setStatus("0");
							blacklist.setCreate_time(sf.format(new Date()));
							blacklist.setStorage_date(new Date());
							blacklist.setStorager(comnName);
						int  result3 = bnsComplainService.insertblack("com.nasoft.SSM.BnsComplain.insertblack",blacklist);	
					  //如果曾经加入过黑名单那么就更新黑名单表
					  }else{		  
							blacklist.setDrv_license(drvcomplaintinfo.getDriver_licence());
							blacklist.setDrv_id(drvcomplaintinfo.getDriver_licence());
							blacklist.setDrv_name(drvcomplaintinfo.getDriver_name());
							blacklist.setStatus("0");
							blacklist.setStorage_date(new Date());
							blacklist.setStorager(comnName);
							int  result3 = bnsComplainService.updatetblack("com.nasoft.SSM.BnsComplain.updatetblack",blacklist);
					  }
					//不加入黑名单的情况
				}else if(drvcomplaintdispose.getIs_blacklist()=="0" || drvcomplaintdispose.getIs_blacklist().equals("0")){		
					//如果曾经加入过黑名单那么就将黑名单表状态更改为移除
					if(result2.size()==1){
						blacklist.setStatus("1");
						blacklist.setDrv_license(drvcomplaintinfo.getDriver_licence());
						int result4 = bnsComplainService.deleteblack("com.nasoft.SSM.BnsComplain.deleteblack",blacklist);			
					}
				}
			if(!drvcomplaintdispose.getDis_type().equals("0")){
				drvplantcase.setCaseid("C"+drvcomplaintinfo.getDrv_complain_info_id());
				drvplantcase.setPunishid("D"+drvcomplaintinfo.getDrv_complain_info_id());
				drvplantcase.setPlateName(drvcomplaintinfo.getCar_company());
				drvplantcase.setCarid(drvcomplaintinfo.getCar_number());
				drvplantcase.setCasetime(drvcomplaintinfo.getCompn_time());
				drvplantcase.setCasereason(drvcomplaintinfo.getCompn_reason());
				drvplantcase.setCaseType("01");
				drvplantcase.setDealstatus("00");
				drvplantcase.setCreateinstid(comnName);
				drvplantcase.setCaseuserid(comnName);
				drvplantcase.setUpdatetime(sf.format(new Date()));
				drvplantcase.setDrivename(drvcomplaintinfo.getDriver_name());
				drvplantcase.setDrivcarno(drvcomplaintinfo.getDriver_licence());
				drvplantcase.setIsappeal("00");
				drvplantcase.setCasesource("02");
			int result6 = bnsComplainService.insertdrvplant("com.nasoft.SSM.BnsComplain.insertdrvplant",drvplantcase);
			}
		//drvplantcase.setInstId(currentUser.getInstId());
		//drvplantcase.setCreateUserId(currentUser.getUserId());
		drvcomplaintinfo.setCompn_state("8");
		drvcomplaintdispose.setId(id);
		drvcomplaintdispose.setDrv_complain_info_id(drvcomplaintinfo.getDrv_complain_info_id());
		drvcomplaintdispose.setIdea_peo(comnName);
		drvcomplaintdispose.setIdea_time(sf.format(date));
		//String pathname = "upload/drvcomplaint/"+drvcomplaintinfo.getComplain_code()+"/survey";//拼接上传服务器后文件的路径
		 String pathname="upload/driver/";
		String survey_filePath = "";  //投诉文件	路径
		String s1="";
		if(survey_file!=null && !survey_file.equals("") &&survey_file.getSize()>0){
				//获取文件后缀名
				String carFileSuffix = survey_file.getOriginalFilename().substring(survey_file.getOriginalFilename().lastIndexOf("."));     
				int surveyData =drvcomplaintinfo.getDrv_complain_info_id();//为上传文件取名字
				String surveyFileName = surveyData+carFileSuffix;//组成上传文件全名
				InputStream inputStream  = survey_file.getInputStream();//IO流
				FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, surveyFileName, inputStream);//上传文件
				survey_filePath = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+surveyFileName;//上传的全路径
				s1+=survey_filePath+";";
				System.out.println(s1);
				s1=s1.substring(0, s1.length()-1);
				System.out.println(s1);
				drvcomplaintdispose.setSurvey_file(s1);			
			}
		try {
			int result = bnsComplainService.drvUpdate("com.nasoft.SSM.BnsComplain.drvcomit",drvcomplaintinfo);
			int result1 = bnsComplainService.toHandleComit("com.nasoft.SSM.BnsComplain.toHandleComit",drvcomplaintdispose);
			if(result>0&&result1>0){
				writer(response, "success");
			}else{	
				writer(response, "error");
			}
		} catch (Exception e) {
			writer(response, "error");
			e.printStackTrace();
		}
	}
}
	
	
	/**
	 * 打开驾驶员投诉处理页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("showDrvHandle")
	public String showDrvHandle(HttpServletRequest request, HttpServletResponse response){
		String complain_code = request.getParameter("complain_code");
		ModelAndView mv=new ModelAndView();
		try{
			drvComplainInfo	 drvcomplaintinfo = bnsComplainService.findcompcodebyId("com.nasoft.SSM.BnsComplain.findcompcodebyId", complain_code);
			int drv_complain_info_id = drvcomplaintinfo.getDrv_complain_info_id();
			if(drvcomplaintinfo.getCompn_state().equals("6")){
				drvComplainDispose drvcomplaindispose = bnsComplainService.finddisposebyId("com.nasoft.SSM.BnsComplain.finddisposetbyId", drv_complain_info_id);
				request.getSession().setAttribute("drvcomplaindispose", drvcomplaindispose);		
			}
			request.getSession().setAttribute("drvcomplaintinfo", drvcomplaintinfo);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "terrace/drvHandle";
	}
	
	/**
	 * 打开平台投诉信息页面
	 * @param request
	 * @return
	 */
/*	@RequestMapping("/openAppeal")
	public String openAppeal(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);		
			return "system/userLogin";
		} else {
			List<Map> complainList = new ArrayList<Map>();
			try {
				String comnName  = bnsComplainService.findcomnName("com.nasoft.SSM.BnsComplain.findComname",userName);
				complainList = bnsComplainService.selectAllAppeal("com.nasoft.SSM.BnsComplain.selectAllAppeal", comnName);
				for(Map m :complainList ){
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					m.put("compn_time", dateFormat.format((Date) m.get("compn_time")));
					m.put("idea_time", dateFormat.format((Date) m.get("idea_time")));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getSession().setAttribute("complainList", complainList);		
			return "terrace/appealInfo";
		}
	}*/
	
	/**
	 * 打开平台申诉的页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("showAppeal")
	public String showAppeal(HttpServletRequest request, HttpServletResponse response){
		String complain_code = request.getParameter("complain_code");
		List<Map> appealList = new ArrayList<Map>();
		
		try{
			//comComplainInfo	 appealList = bnsComplainService.findcompbyId("com.nasoft.SSM.BnsComplain.findcompbyId", complain_code);
			appealList  = (List<Map>)bnsComplainService.findAppealbyId("com.nasoft.SSM.BnsComplain.findAppealbyId", complain_code);
			for(Map m :appealList ){
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				m.put("compn_time", dateFormat.format((Date) m.get("compn_time")));
				//m.put("enddate", dateFormat.format((Date) m.get("enddate")));
			}
			request.getSession().setAttribute("appealList", appealList);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "terrace/appealComit";
	}
	
	/**
	 * 平台申诉提交
	 * @param request
	 * @param response
	 * @return
	 */
	
	@RequestMapping("appealComit")
	public void appealComit(HttpServletRequest request,HttpServletResponse response,
			comComplainAppeal  comcomplainappeal,comComplainInfo comcomplaintinfo,
			   @RequestParam(value="appealfile",required=false) MultipartFile[] appeal_file,
			   SimpleDateFormat sdf ) throws Exception{
		InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");//获取配置文件
	    Properties p = new Properties();//实例化配置文件
	    p.load(in);//加载配置文件
		String hostname = p.getProperty("ftp.hostname");//获取上传服务器地址
		int port = Integer.valueOf(p.getProperty("ftp.port"));//获取服务器端口号
		String username = p.getProperty("ftp.username");//服务器登录名
		String password = p.getProperty("ftp.password");//服务器密码

		//ModelAndView mv=new ModelAndView();
		//String msg="";
		PlantCaseInfo plantcaseinfo = new PlantCaseInfo();
		String userName = (String) request.getSession().getAttribute("userName");
		String comnName  = bnsComplainService.findcomnName("com.nasoft.SSM.BnsComplain.findComname",userName);
		Date date = new Date();
	    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    SimpleDateFormat sf1 = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sf.format(date);
		String caseId ="C"+comcomplaintinfo.getComplain_info_id();
		int id =Integer.parseInt( newdate.substring(11,13)+newdate.substring(14,16)+newdate.substring(17));
		plantcaseinfo.setIsAppeal("01");
		plantcaseinfo.setCaseId(caseId);
		plantcaseinfo.setUpdateTime(sf.format(new Date()));
		comcomplaintinfo.setCompn_state("5");
		comcomplainappeal.setComplain_appeal_id(id);
		comcomplainappeal.setComplain_info_id(comcomplaintinfo.getComplain_info_id());
		comcomplainappeal.setAppl_peo(comnName);
		comcomplainappeal.setAppl_time(sf.format(date));
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
			comcomplainappeal.setAppeal_file(s1);
		}
		try {
			int result2 = bnsComplainService.updateplant("com.nasoft.SSM.BnsComplain.updateplant",plantcaseinfo);
			int result = bnsComplainService.comUpdate("com.nasoft.SSM.BnsComplain.comUpdate",comcomplaintinfo);
			int result1 = bnsComplainService.appealComit("com.nasoft.SSM.BnsComplain.appealComit",comcomplainappeal);
			if(result>0&&result1>0){
				writer(response, "success");
			}else{
				writer(response, "error");
			}
		} catch (Exception e) {
			writer(response, "error");
			e.printStackTrace();
		}
	
	}
	
	/**
	 * 打开行政处罚信息
	 * @param request
	 * @return
	 */
	@RequestMapping("/openPlantCaseInfo")
	public String openPlantCaseInfo(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			return "system/userLogin";
		} else {
			List<PlantCaseInfo> plantCaseInfoList = new ArrayList<PlantCaseInfo>();
			try {
				String comnName  = plantCaseInfoService.findComname("com.nasoft.aboutcar.plantCaseInfoMapper.findComname",userName);
				plantCaseInfoList = plantCaseInfoService.findBycomname("com.nasoft.aboutcar.plantCaseInfoMapper.findBycomname", comnName);
				for(PlantCaseInfo m :plantCaseInfoList ){
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					Date casetime =df.parse(m.getCaseTime());
					Date updatetime = df.parse(m.getUpdateTime());
					m.setUpdateTime(df.format(updatetime));
					m.setCaseTime(df.format(casetime));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getSession().setAttribute("plantCaseInfoList", plantCaseInfoList);
			
			return "terrace/PlantCaseInfo";
		}
	}
	
	/**
     * 行政处罚信息申诉
     */
	@RequestMapping("openappealDetail")
public ModelAndView openappealDetail(HttpServletRequest request,HttpServletResponse response,String caseId){
		
		ModelAndView mv=new ModelAndView();
		try {
			PlantCaseInfo plantCaseInfo =plantCaseInfoService.findBycaseId("com.nasoft.aboutcar.plantCaseInfoMapper.findBycaseId", caseId);
			mv.addObject("plantCaseInfo", plantCaseInfo);
			mv.setViewName("terrace/appealDetail");
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
			String caseId,String appealuserid,String appealcontent
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
		PlantCaseAppeal plantCaseAppeal = new PlantCaseAppeal();
		PlantCaseInfo plantCaseInfo = new PlantCaseInfo();
		plantCaseAppeal.setUpdateTime(DateUtil.DateTimeFormat(new Date()));
		plantCaseInfo.setUpdateTime(DateUtil.DateTimeFormat(new Date()));
	    plantCaseAppeal.setCaseId(caseId);
		plantCaseAppeal.setAppealuserid(appealuserid);
		plantCaseAppeal.setAppealcontent(appealcontent);
		try {
			plantCaseInfoService.addPlantAppeal("com.nasoft.aboutcar.plantCaseInfoMapper.addPlantAppeal", plantCaseAppeal);
			plantCaseInfoService.updateCaseInfo("com.nasoft.aboutcar.plantCaseInfoMapper.updateCaseInfo", caseId);
			plantCaseInfoService.updateCaseDeal("com.nasoft.aboutcar.plantCaseInfoMapper.updateCaseDeal", caseId);
				writer(response, "success");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	
	/**
	 * 打开处分信息
	 * @param request
	 * @return
	 */
	@RequestMapping("/openPunishInfo")
	public String openPunishInfo(HttpServletRequest request){
		String userName = (String) request.getSession().getAttribute("userName");
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			return "system/userLogin";
		} else {
			List<Map<String,Object>> punishInfoList = new ArrayList<Map<String,Object>>();
			try {
				punishInfoList = platformApplyService.findPunishInfo("com.nasoft.aboutcar.PlatformMapper.findPunishInfo", userName);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getSession().setAttribute("punishInfoList", punishInfoList);
			
			return "terrace/punishInfo";
		}
	}
	
	/**
	 * 打开处分详情信息页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/openPunishDetail")
	public String openPunishDetail(HttpServletRequest request,String creditcode){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			try {
				Platform platform=platformApplyService.findPlatformByCreditCode("com.nasoft.aboutcar.PlatformMapper.findPlatformByCreditCode", creditcode);
				List<ComScoreRecord> comScoreRecordList=platformApplyService.findComScoreRecord("com.nasoft.aboutcar.PlatformMapper.findComScoreRecord", creditcode);
				request.getSession().setAttribute("platform", platform);
				request.getSession().setAttribute("comScoreRecordList", comScoreRecordList);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "terrace/punishDetail";
		}
	}
	
	/**
	 * 打开处分申诉申请页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/openPunishAppeal")
	public String openPunishAppeal(HttpServletRequest request,String creditcode,String rec_no,String indic_text,String comName){
		String userName = (String) request.getSession().getAttribute("userName");
		
		//如果没有登录 跳转到登录页面
		if (null == userName || "".equals(userName)) {
			request.setAttribute("usertype", _USERTYPE);
			
			return "system/userLogin";
		} else {
			try {
				request.getSession().setAttribute("creditcode", creditcode);
				request.getSession().setAttribute("rec_no", rec_no);
				if(StringUtils.isNotBlank(indic_text)){
					indic_text=URLDecoder.decode(indic_text,"UTF-8");
				}
				request.getSession().setAttribute("indic_text", indic_text);
				if(StringUtils.isNotBlank(comName)){
					comName=URLDecoder.decode(comName,"UTF-8");
				}
				request.getSession().setAttribute("comName", comName);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			return "terrace/punishAppeal";
		}
	}
	
	/**
	 * 添加平台申诉信息
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/addPunishAppeal")
	public void addPunishAppeal(HttpServletRequest request,HttpServletResponse response,ComAppeals comAppeals,ComAppealD comAppealD,@RequestParam(value="appealFile",required=false) MultipartFile appealFile) throws Exception{
		try {
			
			InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
		    Properties p = new Properties();
		    p.load(in);
            
			String hostname = p.getProperty("ftp.hostname");
			int port = Integer.valueOf(p.getProperty("ftp.port"));
			String username = p.getProperty("ftp.username");
			String password = p.getProperty("ftp.password");
			String pathname = "upload/credit/appeal"; 
			String appeal_file = "";
			if(null != appealFile){
				String filename = "appeal_"+comAppealD.getRec_no()+appealFile.getOriginalFilename().substring(appealFile.getOriginalFilename().lastIndexOf(".")); 
				InputStream inputStream  = appealFile.getInputStream();
				Boolean flag = FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, filename, inputStream);
				if(flag){
					appeal_file = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+filename;
				}
			}
			
			//平台记分申诉记录表
			ComAppeals appeals = platformApplyService.findComAppealsByCreditcode("com.nasoft.aboutcar.PlatformMapper.findComAppealsByCreditcode", comAppeals.getCreditcode());
			String appeal_no = "";
			if(null == appeals){
				comAppeals.setAppeal_date(new Date());
				comAppeals.setAppeal_no(DateUtil.dateToString(new Date(), DateUtil.SDFyyyyMMddHHmmss2));
				comAppeals.setCreate_time(new Date());
				comAppeals.setAppeal_file(appeal_file);
				platformApplyService.addComAppeals("com.nasoft.aboutcar.PlatformMapper.addComAppeals", comAppeals);
				appeal_no = comAppeals.getAppeal_no();
			}else{
				appeal_no = appeals.getAppeal_no();
			}
			
			//平台记分申诉项目表
			comAppealD.setAppeal_file(appeal_file);
			comAppealD.setAppeal_no(appeal_no);
			comAppealD.setAppeal_status("未处理");
			comAppealD.setCreate_time(new Date());
			platformApplyService.addComAppealD("com.nasoft.aboutcar.PlatformMapper.addComAppealD", comAppealD);
			
			//平台记分表
			Map map = new HashMap();
			map.put("rec_no", comAppealD.getRec_no());
			map.put("appeal_no", appeal_no);
			platformApplyService.updateComScoreRecord("com.nasoft.aboutcar.PlatformMapper.updateComScoreRecord", map);
			
            writer(response, "success");
		} catch (Exception e) {
	        writer(response, "error");
			e.printStackTrace();
		}
	}
}
