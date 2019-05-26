package com.nasoft.aboutcar.pilotapply.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
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
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.mngarchive.domain.MngArchive;
import com.nasoft.aboutcar.mngarchive.service.MngArchiveService;
import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;
import com.nasoft.aboutcar.mnguserinfo.service.MngUserInfoService;
import com.nasoft.aboutcar.msgnotice.domain.MsgNotice;
import com.nasoft.aboutcar.msgnotice.service.MsgNoticeService;
import com.nasoft.aboutcar.pilotapply.domain.DrvApprove;
import com.nasoft.aboutcar.pilotapply.domain.DrvCancelapply;
import com.nasoft.aboutcar.pilotapply.domain.DrvChangeapply;
import com.nasoft.aboutcar.pilotapply.domain.DrvExamplan;
import com.nasoft.aboutcar.pilotapply.domain.DrvExamresult;
import com.nasoft.aboutcar.pilotapply.domain.DrvMakeupapp;
import com.nasoft.aboutcar.pilotapply.domain.DrvPermitapply;
import com.nasoft.aboutcar.pilotapply.domain.DrvPermitcert;
import com.nasoft.aboutcar.pilotapply.domain.DrvRecord;
import com.nasoft.aboutcar.pilotapply.domain.DrvUserinfo;
import com.nasoft.aboutcar.pilotapply.service.DrvApproveService;
import com.nasoft.aboutcar.pilotapply.service.DrvCancelapplyService;
import com.nasoft.aboutcar.pilotapply.service.DrvChangeapplyService;
import com.nasoft.aboutcar.pilotapply.service.DrvExamplanService;
import com.nasoft.aboutcar.pilotapply.service.DrvExamresultService;
import com.nasoft.aboutcar.pilotapply.service.DrvMakeupappService;
import com.nasoft.aboutcar.pilotapply.service.DrvPermitapplyService;
import com.nasoft.aboutcar.pilotapply.service.DrvPermitcertService;
import com.nasoft.aboutcar.pilotapply.service.DrvRecordService;
import com.nasoft.aboutcar.pilotapply.service.DrvUsercheckService;
import com.nasoft.aboutcar.pilotapply.service.DrvUserinfoService;
import com.nasoft.util.StringUtil;

@Controller
@RequestMapping("/pilotApply")
public class PilotApplyController extends BaseController {

	@Resource
	private DrvPermitapplyService drvPermitapplyService;
	@Resource
	private DrvExamresultService drvExamresultService;
	@Resource
	private DrvExamplanService drvExamplanService;
	@Resource
	private DrvPermitcertService drvPermitcertService;
	@Resource
	private DrvUsercheckService drvUsercheckService;
	@Resource
	private DrvApproveService drvApproveService;
	@Resource
	private DrvRecordService drvRecordService;
	@Resource
	private MsgNoticeService msgNoticeService;
	@Resource
	private DrvUserinfoService drvUserinfoService;
	@Resource
	private MngArchiveService mngArchiveService;
	@Resource
	private DrvMakeupappService drvMakeupappService;
	@Resource
	private DrvCancelapplyService drvCancelapplyService;
	@Resource
	private DrvChangeapplyService drvChangeapplyService;
	@Resource
	private MngUserInfoService mngUserInfoService;
	//业务审核
	@RequestMapping("index")
	public String index(HttpServletRequest request,HttpServletResponse response){
		
		return "pilotApply/index";
	}
	
	@RequestMapping("drvPermitapplyList")
	public void drvPermitapplyList(HttpServletRequest request,HttpServletResponse response){
		String userName = request.getParameter("userName");
		String certNo = request.getParameter("certNo");
		String applyType = request.getParameter("applyType");
		Map<String, Object> m = new HashMap<String, Object>();
		MngUserInfo MngUserInfo = getCurrentUser();
		m.put("roleid", MngUserInfo.getRoleId());
		m.put("instid", MngUserInfo.getInstId());
		m.put("areacode", MngUserInfo.getAreaCode());
		m.put("userName", userName);
		m.put("certNo", certNo);
		m.put("applyType", applyType);
		List<Map> applyList = new ArrayList<Map>();
		//查询用户所拥有的驾驶员审批权限
		Map<String,Object> m2 = new HashMap<String,Object>();
		m2.put("userId", MngUserInfo.getUserId());
		m2.put("nodeType", "1");
		try {
			List<Map> approvalLimitList = mngUserInfoService.searchApprovalLimitById("com.nasoft.aboutcar.MngUserInfoMapper.searchApprovalLimitById", m2);
			if(approvalLimitList.size() > 0){
				for(Map p : approvalLimitList){
					m.put((String) p.get("node_code"), "1");
				}
			}
			
			applyList = (List<Map>) drvPermitapplyService.selectAll("com.nasoft.aboutcar.DrvPermitapplyMapper.selectAll",m);
			if(applyList.size() > 0){
				for(Map map:applyList){
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
					map.put("applydate", dateFormat.format((Date) map.get("applydate")));
					
					String certno = (String)map.get("certno");
					
					String examresult = "无";
					List<DrvExamresult> list = drvExamresultService.findByCertno("com.nasoft.aboutcar.DrvExamresultMapper.findByCertno",certno);
					//获取考试成绩与修改审核状态
					if(list.size() > 0){
						String quanguo = "";
						String difang = "";
						for(int i=0;i<list.size();i++){
							if(StringUtils.isBlank(quanguo) || StringUtils.isBlank(difang)){
								DrvExamresult drvExamresult = list.get(i);
								if("1".equals(drvExamresult.getExamtype()) && StringUtils.isBlank(quanguo)){
									quanguo = drvExamresult.getScore()+"";
								}else if("2".equals(drvExamresult.getExamtype()) && StringUtils.isBlank(difang)){
									difang = drvExamresult.getScore()+"";
								}
							}
						}
						examresult = quanguo+"/"+difang;
					}
					/*DrvCancelapply drvCancelapply = drvCancelapplyService.findDrvCancelapplyByCertNo("com.nasoft.aboutcar.DrvCancelapplyMapper.selectByCertno", certno);
					if(drvCancelapply!=null){
						map.remove("applytype");
						map.put("applytype", 3);
					if(drvCancelapply.getAppstatus().equals("1")){
						map.put("applystatus", 8);
					}else if(drvCancelapply.getAppstatus().equals("2")){
						map.remove("appstatus");
						map.put("appstatus", 9);
					}
					}*/
					map.put("examresult", examresult);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(applyList.toArray());
		writer(response, array+"");
	}
	
	//业务审核查看详细信息
	@RequestMapping("detail")
    public String detail(HttpServletRequest request,String certno,String applytype){
		Map<String,Object> map = new HashMap<String,Object>();
		map = getDetail(certno,applytype);
		try {
			Map smap = new HashMap();
			smap.put("certno", certno);
			smap.put("apprtype", applytype);
			List<DrvApprove> approveList = drvApproveService.selectByCertno("com.nasoft.aboutcar.DrvApproveMapper.selectByCertno", smap);
			if(approveList.size() > 0){
				map.put("approveList", approveList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("drv", map);
		return "pilotApply/detail";
    }
	
	//驾驶员身份验证
	@RequestMapping("validateDrv")
	@ResponseBody
	public Boolean validateDrv(HttpServletRequest request,String applyid){
		//（在驾驶员身份验证表中插入数据）
//		DrvUsercheck drvUsercheck = new DrvUsercheck();
//		try {
//			drvUsercheck.setCertno(certno);
//			drvUsercheck.setCheckgov("0");
//			drvUsercheck.setCheckitem("是否有吸毒史");
//			drvUsercheck.setCheckresult("通过");
//			drvUsercheck.setCheckstatus("1");
//			drvUsercheck.setChecktime(new Date());
//			drvUsercheckService.addDrvUsercheck("com.nasoft.aboutcar.DrvUsercheckMapper.addDrvUsercheck",drvUsercheck);
//			
//			drvUsercheck.setCheckgov("1");
//			drvUsercheck.setCheckitem("是否有违法记录");
//			drvUsercheckService.addDrvUsercheck("com.nasoft.aboutcar.DrvUsercheckMapper.addDrvUsercheck",drvUsercheck);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		try {
			DrvPermitapply drvPermitapply = drvPermitapplyService.selectByApplyid("com.nasoft.aboutcar.DrvPermitapplyMapper.selectByApplyid", Integer.parseInt(applyid));
			System.out.println(drvPermitapply);
			drvPermitapply.setCheckstatus("1");
			drvPermitapplyService.updateDrvPermitapply("com.nasoft.aboutcar.DrvPermitapplyMapper.updateDrvPermitapply",drvPermitapply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	//处理身份审核结果
	@RequestMapping("authentication")
	public ModelAndView authentication(HttpServletRequest request,String applyid,String certno,String description,String status){
		ModelAndView mv=new ModelAndView();
		String message = "您的驾驶员资质申请"+description+"！";
		try {
			addDrvApprove(request,applyid,"1",certno,description,status);//增加审核记录
			if("1".equals(status)){//身份审核不通过删除身份认证信息
				updateStatus(applyid,status,null);//修改申请表状态
			}else{
				updateStatus(applyid,status,null);//修改申请表状态
				message = "您的驾驶员资质申请身份验证已通过，请进入“考试预约”功能菜单进行考试预约！";
			}
			addMsgNotice(request,certno,message);//增加消息通知记录
			mv.addObject("msg","success");
			mv.setViewName("save_result");
		} catch (Exception e) {
			mv.addObject("msg","failed");
			e.printStackTrace();
		}
		return mv;
	}
	
	//处理考试审核结果
	@RequestMapping("examValidate")
	public ModelAndView examValidate(HttpServletRequest request,String applyid,String certno,String description,String status,String examresult){
		ModelAndView mv=new ModelAndView();
		try {
			if("3".equals(status)){//考试信息未通过
				addDrvApprove(request,applyid,"1",certno,description,"1");//增加审核记录
				addMsgNotice(request,certno,"您的驾驶员资质申请考试结果验证未通过，存在不合格的成绩！考试分数为："+examresult+"，请重新预约考试！");//增加消息通知记录
			}else{
				addDrvApprove(request,applyid,"1",certno,description,"2");//增加审核记录
				addMsgNotice(request,certno,"您的驾驶员资质申请考试结果验证已通过！考试分数为："+examresult+"，请进行窗口预约办理！");//增加消息通知记录
			}
			updateStatus(applyid,status,null);//修改申请表状态
			mv.addObject("msg","success");
			mv.setViewName("save_result");
		} catch (Exception e) {
			mv.addObject("msg","failed");
			e.printStackTrace();
		}
		return mv;
	}
	
	//处理窗口办理审核结果
	@RequestMapping("windowValidate")
	public ModelAndView windowValidate(HttpServletRequest request,String applyid,String certno,String description,String status,MngArchive mngArchive){
		ModelAndView mv=new ModelAndView();
		String message = "您的驾驶员资质申请"+description+"！";
		try {
			if("5".equals(status)){//未通过
				addDrvApprove(request,applyid,"1",certno,description,"1");//增加审核记录
			}else{
				addDrvApprove(request,applyid,"1",certno,description,"2");//增加审核记录
			}
			updateStatus(applyid,status,null);//修改申请表状态
			addMsgNotice(request,certno,message);//增加消息通知记录
			//保存档案信息
			mngArchive.setApplyid(applyid);
			mngArchive.setArchivetype("1");
			mngArchive.setCreatetime(new Date());
			mngArchiveService.addMngArchive("com.nasoft.aboutcar.mngArchiveMapper.addMngArchive", mngArchive);
			
			mv.addObject("msg","success");
			mv.setViewName("save_result");
		} catch (Exception e) {
			mv.addObject("msg","failed");
			e.printStackTrace();
		}
		return mv;
	}
	
	//处理变更审核
	@RequestMapping("changeValidate")
	public ModelAndView changeValidate(HttpServletRequest request,String applyid,String certno,String description,String status){
		ModelAndView mv=new ModelAndView();
		String message = "您的驾驶员资质变更申请"+description+"！";
		try {
			addDrvApprove(request,applyid,"2",certno,description,status);//增加审核记录
			//修改变更申请表状态
			DrvChangeapply drvChangeapply=new DrvChangeapply();
			drvChangeapply.setAppstatus(status);
			drvChangeapply.setApplyid(Integer.valueOf(applyid));
			drvChangeapply.setUpddatetime(new Date());//修改时间
			drvChangeapplyService.updateDrvChangeapplyByApplyid("com.nasoft.aboutcar.DrvChangeapplyMapper.updateDrvChangeapplyByApplyid",drvChangeapply);
			
			addMsgNotice(request,certno,message);//增加消息通知记录
			
			mv.addObject("msg","success");
			mv.setViewName("save_result");
		} catch (Exception e) {
			mv.addObject("msg","failed");
			e.printStackTrace();
		}
		return mv;
	}
	
	//处理注销审核
	@RequestMapping("cancelValidate")
	public ModelAndView cancelValidate(HttpServletRequest request,String applyid,String certno,String description,String status){
		ModelAndView mv=new ModelAndView();
		String message = "您的运行资格证注销申请"+description+"！";
		try {
			addDrvApprove(request,applyid,"3",certno,description,status);//增加审核记录
			updateCancelApplyStatus(status,certno);//修改注销申请表状态
			addMsgNotice(request,certno,message);//增加消息通知记录
			updateDrvPermitcertStatus(certno,description,applyid);//修改运行资格证的状态
			
			mv.addObject("msg","success");
			mv.setViewName("save_result");
		} catch (Exception e) {
			mv.addObject("msg","failed");
			e.printStackTrace();
		}
		return mv;
	}
	/**
	 * 修改驾驶员运营资格证的状态
	 * @param status
	 * @param certno
	 */
	private void updateDrvPermitcertStatus(String certno,String description,String applyid) {
		DrvPermitcert drvPermitcert=new DrvPermitcert();
		drvPermitcert.setStatus("2");
		drvPermitcert.setApplyid(Integer.parseInt(applyid));
		try {
			drvPermitcertService.updateByApplyid("com.nasoft.aboutcar.DrvPermitcertMapper.updateByApplyid",drvPermitcert);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * 修改注销申请表的状态
	 * @param status
	 */
	private void updateCancelApplyStatus( String status,String certno) {
		try {
			DrvCancelapply drvCancelapply=new DrvCancelapply();
			drvCancelapply.setAppstatus(status);
			drvCancelapply.setCertno(certno);
			drvCancelapply.setUpddatetime(new Date());//修改时间
			drvCancelapply.setUpduserid(1);//修改者
			drvCancelapply.setUpdinstid(1);
			drvCancelapplyService.updateDrvCancelapplyByCertno("com.nasoft.aboutcar.DrvCancelapplyMapper.updateDrvCancelapplyByCertno",drvCancelapply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	//跳到安排考试页面
	@RequestMapping("toExamplan")
	public String toExamplan(HttpServletRequest request,String certno){
		request.setAttribute("certno", certno);
		return "pilotApply/examplan";
	}
	
	//录入考试安排
	@RequestMapping("saveExamPlan")
	public ModelAndView saveExamPlan(HttpServletRequest request,String[] examaddr,String[] examname,String[] examDate,String certno){
		ModelAndView mv=new ModelAndView();
		DrvExamplan drvExamplan = new DrvExamplan();
		drvExamplan.setCertno(certno);
		drvExamplan.setCreatedatetime(new Date());
		drvExamplan.setExamstatus("0");
		MngUserInfo mngUserInfo = (MngUserInfo) request.getSession().getAttribute("mngUserInfo");
		if(null != mngUserInfo){
			drvExamplan.setCreateuserid(mngUserInfo.getUserId());
		}
		try {
			String examInfo = "";
			if(StringUtils.isNotBlank(examname[0]) && StringUtils.isNotBlank(examaddr[0]) && StringUtils.isNotBlank(examDate[0])){
				drvExamplan.setExamname(examname[0]);
				drvExamplan.setExamaddr(examaddr[0]);
				drvExamplan.setExamtype("1");
				if(StringUtils.isNotBlank(examDate[0])){
					drvExamplan.setExamdate(DateUtils.parseDate(examDate[0], new String[]{"yyyy-MM-dd"}));
				}
				drvExamplanService.addDrvExamplan("com.nasoft.aboutcar.DrvExamplanMapper.addDrvExamplan",drvExamplan);
				examInfo = "全国考试（考试时间："+examDate[0]+",考试地点："+examaddr[0]+"）";
			}
			if(StringUtils.isNotBlank(examname[1]) && StringUtils.isNotBlank(examaddr[1]) && StringUtils.isNotBlank(examDate[1])){
				drvExamplan.setExamtype("2");
				drvExamplan.setExamname(examname[1]);
				drvExamplan.setExamaddr(examaddr[1]);
				if(StringUtils.isNotBlank(examDate[1])){
					drvExamplan.setExamdate(DateUtils.parseDate(examDate[1], new String[]{"yyyy-MM-dd"}));
				}
				drvExamplanService.addDrvExamplan("com.nasoft.aboutcar.DrvExamplanMapper.addDrvExamplan",drvExamplan);
				examInfo += "地方考试（考试时间："+examDate[1]+",考试地点："+examaddr[1]+"）";
			}
			addMsgNotice(request,certno,"您的驾驶员资质申请已安排考试，考试信息为："+examInfo+"！");//增加消息通知记录
			mv.addObject("msg","success");
			mv.setViewName("save_result");
		} catch (Exception e) {
			mv.addObject("msg","failed");
			e.printStackTrace();
		}
		return mv;
	}
	
	//驾驶员发证（证书表中插入一条数据）
	@RequestMapping("sendCertificate")
	@ResponseBody
	public Boolean sendCertificate(HttpServletRequest request,String applyid,String instid,String certno){
		DrvPermitcert drvPermitcert = new DrvPermitcert();
		drvPermitcert.setPcertno("SDF"+new Date().getTime());
		drvPermitcert.setApplyid(Integer.valueOf(applyid));
		drvPermitcert.setSenddate(new Date());
		drvPermitcert.setEnddate(DateUtils.addMonths(new Date(), 3));
		drvPermitcert.setInstid(instid);
		drvPermitcert.setStatus("1");
		drvPermitcert.setCreatedatetime(new Date());
		try {
			drvPermitcertService.addDrvPermitcert("com.nasoft.aboutcar.DrvPermitcertMapper.addDrvPermitcert",drvPermitcert);
			addMsgNotice(request,certno,"您的驾驶员资质申请已发证！");//增加消息通知记录
			updateStatus(applyid,"7",null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	//证书管理
	@RequestMapping("certificate")
	public String certificate(HttpServletRequest request,HttpServletResponse response){
		
		return "pilotApply/certificate";
	}
	//证书管理列表
	@RequestMapping("drvPermitcertList")
	public void drvPermitcertList(HttpServletRequest request,HttpServletResponse response){
		String userName = request.getParameter("userName");
		String telNo = request.getParameter("telNo");
		Map<String, Object> map = new HashMap<String, Object>();
		MngUserInfo MngUserInfo = getCurrentUser();
		map.put("roleid", MngUserInfo.getRoleId());
		map.put("instid", MngUserInfo.getInstId());
		map.put("areacode", MngUserInfo.getAreaCode());
		map.put("userName", userName);
		map.put("telNo", telNo);
		List<Map> certList = new ArrayList<Map>();
		try {
			certList = (List<Map>) drvPermitcertService.selectAll("com.nasoft.aboutcar.DrvPermitcertMapper.selectAll",map);
			for(Map m : certList){
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				m.put("senddate", dateFormat.format((Date) m.get("senddate")));
				m.put("enddate", dateFormat.format((Date) m.get("enddate")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(certList.toArray());
		writer(response, array+"");
	}
	
	//跳到证书吊销页面
	@RequestMapping("toDrvDeactive")
	public ModelAndView toDrvDeactive(String certno){
		ModelAndView mv=new ModelAndView();
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			map = getDetail(certno,"1");
			mv.addObject("drv", map);
			mv.setViewName("pilotApply/deactive");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	//跳到证书作废页面
	@RequestMapping("toDrvCancellation")
	public ModelAndView toDrvCancellation(String certno){
		
		ModelAndView mv=new ModelAndView();
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			map = getDetail(certno,"1");
			mv.addObject("drv", map);
			mv.setViewName("pilotApply/cancellation");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	//证书操作（吊销、作废）
	@RequestMapping("operateDrvPermitcert")
	public ModelAndView operateDrvPermitcert(HttpServletRequest request,String status,String applyid,String certno,String reason){
		ModelAndView mv=new ModelAndView();
		DrvPermitcert drvPermitcert = new DrvPermitcert();
		drvPermitcert.setApplyid(Integer.valueOf(applyid));
		drvPermitcert.setStatus(status);
		try {
			drvPermitcertService.updateByApplyid("com.nasoft.aboutcar.DrvPermitcertMapper.updateByApplyid",drvPermitcert);
			if("2".equals(status)){
				addMsgNotice(request,certno,"您的驾驶员资质证书已被吊销，吊销原因为："+reason+"！");//增加消息通知记录
			}else if("3".equals(status)){
				addMsgNotice(request,certno,"您的驾驶员资质证书已被作废，作废原因为："+reason+"！");//增加消息通知记录
			}
			mv.addObject("msg","success");
			mv.setViewName("save_result");
		} catch (Exception e) {
			mv.addObject("msg","failed");
			e.printStackTrace();
		}
		return mv;
	}
	
	//跳到打印证书页面
	@RequestMapping("toPrintCert")
	public ModelAndView  toPrintCert(HttpServletRequest request,String certno,Model model) throws Exception{
		/*model.addAttribute("filename", "drvCert_"+certno+".jpg");*/
		ModelAndView mv=new ModelAndView();
	try {
		List<Map> list=	drvPermitcertService.findDrvPermitcertByCertno("com.nasoft.aboutcar.DrvPermitcertMapper.queryDrvPermitcerByCertno",certno);
		for (Map map : list) {
			mv.addObject("username", map.get("username"));//驾驶员名称
			mv.addObject("sex",map.get("sex"));			  //驾驶员性别
			if(mv.addObject("sex",map.get("sex")).equals("1")){
				mv.addObject("sex", "男");
			}else{
				mv.addObject("sex", "女");
			}
			mv.addObject("birthday",map.get("birthday")); //驾驶员生日
			mv.addObject("address", map.get("address"));  //驾驶员地址
			mv.addObject("censusaddr", map.get("censusaddr"));//户籍所在地
			mv.addObject("drivecardno", map.get("drivecardno")); //驾驶员证号
			//（0小型车、1中型车、2大型车）
			if(map.get("cardrivingtype").equals("0")){
				map.put("cardrivingtype", "小型车");
			}else if(map.get("cardrivingtype").equals("1")){
				map.put("cardrivingtype", "中型车");
				
			}else{
				map.put("cardrivingtype", "大型车");
			}
			mv.addObject("cardrivingtype", map.get("cardrivingtype"));
			String[] carddate = map.get("carddate").toString().split("-");
			mv.addObject("carddateYear", carddate[0]);
			mv.addObject("carddateMonth",carddate[1]);
			mv.addObject("carddateDay",carddate[2]);
			
			
		}
		mv.setViewName("pilotApply/drvCert");
	} catch (Exception e) {
		e.printStackTrace();
	}
	return mv;
	}
	
	//备案管理
	@RequestMapping("record")
	public String record(HttpServletRequest request,Model model){
		return "pilotApply/record";
	}
	
	//备案管理列表
	@RequestMapping("recordList")
	public void recordList(HttpServletRequest request,HttpServletResponse response){
		String userName = request.getParameter("userName");
		String comName = request.getParameter("comName");
		Map<String, Object> map = new HashMap<String, Object>();
		MngUserInfo MngUserInfo = getCurrentUser();
		map.put("roleid", MngUserInfo.getRoleId());
		map.put("areacode", MngUserInfo.getAreaCode());
		map.put("userName", userName);
		map.put("comName", comName);
		List<Map> recordList = new ArrayList<Map>();
		try {
			recordList = (List<Map>) drvRecordService.selectAllRecord("com.nasoft.aboutcar.DrvRecordMapper.selectAllRecord",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(recordList.toArray());
		writer(response, array+"");
	}
	/**
	 * 获取备案详细信息
	 * @param recordid
	 * @return
	 */
	@RequestMapping("recordDetail")
    public String recordDetail(HttpServletRequest request,String recordid){
		Map<String,Object> map = new HashMap<String,Object>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			map = drvRecordService.selectDetailById("com.nasoft.aboutcar.DrvRecordMapper.selectDetailById",recordid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("drv", map);
		return "pilotApply/recordDetail";
    }
    
    //处理备案审核结果
  	@RequestMapping("recordAuthentication")
  	public ModelAndView recordAuthentication(HttpServletRequest request,String recordid,String certno,String description,String status,String examresult){
  		ModelAndView mv=new ModelAndView();
  		try {
  			
			addDrvApprove(request,recordid,"6",certno,description,status);//增加审核记录
			
			//addMsgNotice(request,certno,description);//增加消息通知记录
			
			//修改备案表状态
			DrvRecord drvRecord = new DrvRecord();
			drvRecord.setRecordid(Integer.valueOf(recordid));
			drvRecord.setStatus(status);
			drvRecordService.updateDrvRecord("com.nasoft.aboutcar.DrvRecordMapper.updateDrvRecord",drvRecord);
			
  			mv.addObject("msg","success");
  			mv.setViewName("save_result");
  		} catch (Exception e) {
  			mv.addObject("msg","failed");
  			e.printStackTrace();
  		}
  		return mv;
  	}
  	
  	//备案信息撤销
  	@RequestMapping("revocationRecord")
  	@ResponseBody
  	public Boolean revocationRecord(HttpServletRequest request,String recordid){
  		try {
  			//修改备案表状态为3（撤销）
			DrvRecord drvRecord = new DrvRecord();
			drvRecord.setRecordid(Integer.valueOf(recordid));
			drvRecord.setStatus("3");
			drvRecordService.updateDrvRecord("com.nasoft.aboutcar.DrvRecordMapper.updateDrvRecord",drvRecord);
			
  		} catch (Exception e) {
  			e.printStackTrace();
  		}
  		return true;
  	}
  	
	//预警管理
	@RequestMapping("warning")
	public String warning(HttpServletRequest request,Model model){
		return "pilotApply/warning";
	}
	//驾驶员资质验证列表
	@RequestMapping("validate")
	public String validateList(){
		return "pilotApply/validate";
	}
	//驾驶员申请信息验证
	@RequestMapping("applyValidate")
	public String applyValidateList(){
		return "pilotApply/applyValidate";
	}
	@RequestMapping("applyValidateIndex")
	public void applyValidateIndex(HttpServletRequest request,HttpServletResponse response){
		String username = request.getParameter("username");
		String certno = request.getParameter("certno");
		String checkStatus = request.getParameter("checkStatus");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", username);
		map.put("certno", certno);
		map.put("checkStatus", checkStatus);
		List<DrvUserinfo> drvUserInfoList = drvUserinfoService.findDrvUserInfo("com.nasoft.aboutcar.DrvUserinfoMapper.findDrvUserInfo", map);
		JSONArray array = JSONArray.fromObject(drvUserInfoList);
		writer(response, array+"");
	}
	
	//导出Excel文件
	@RequestMapping("exportExcel")
	public void exportExcelFile(HttpServletRequest request,HttpServletResponse response){
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/x-download");
			String fileName = "驾驶员信息列表.xlsx";
			fileName = URLEncoder.encode(fileName, "UTF-8");
			response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
			String data = request.getParameter("data");
			data = new String(data.getBytes("iso8859-1"),"UTF8");
			Workbook wb;
			String filePath = request.getRealPath("/template")+"/"+"驾驶员身份验证模板.xlsx"; // excel位置
			File file = new File(filePath);
			String hz = filePath.substring(filePath.lastIndexOf("."),filePath.length());
			OutputStream out = null;
			FileInputStream excelInputStream = new FileInputStream(file);
			if(hz.equals(".xls")){
	    		wb = new HSSFWorkbook(excelInputStream);
	    	}else{
	    		wb = new XSSFWorkbook(excelInputStream);
	    	}
        	Sheet sheet = wb.getSheetAt(0);
        	
        	Font font = wb.createFont();
        	font.setFontName("宋体");
        	font.setFontHeightInPoints((short) 16);
        	List<String> certNoList = new ArrayList<String>();
        	Map<String, Object> map = new HashMap<String, Object>();
        	map.put("checkStatus", "2");
        	if(StringUtil.isNotEmpty(data)){
				JSONArray jsonArray = JSONArray.fromObject(data);
				for(int i=0;i<jsonArray.size();i++){
					DrvUserinfo drvUserInfo= (DrvUserinfo) JSONObject.toBean(JSONObject.fromObject(jsonArray.get(i)), DrvUserinfo.class);
					certNoList.add(drvUserInfo.getCertno());
					Row row = sheet.createRow(i+2);
					CellStyle cellStyle = wb.createCellStyle();
					cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
					//序号
					Cell cell = row.createCell(0);
					cell.setCellValue(i+1);
					cell.setCellStyle(cellStyle);
					//姓名
					cell = row.createCell(1);
					cell.setCellValue(drvUserInfo.getUsername());
					cell.setCellStyle(cellStyle);
					//性别
					cell = row.createCell(2);
					cell.setCellValue(drvUserInfo.getSex() == "1" ? "男":"女");
					cell.setCellStyle(cellStyle);
					//身份证号
					cell = row.createCell(3);
					cell.setCellValue(drvUserInfo.getCertno());
					cell.setCellStyle(cellStyle);
					//出生日期
					cell = row.createCell(4);
					cell.setCellValue(drvUserInfo.getBirthday());
					cell.setCellStyle(cellStyle);
					/*//民族
					cell = row.createCell(5);
					cell.setCellValue(drvUserInfo.getNation());
					cell.setCellStyle(cellStyle);*/
					//驾驶证取证时间
					cell = row.createCell(5);
					cell.setCellValue(drvUserInfo.getCarddate());
					cell.setCellStyle(cellStyle);
					//驾驶证签发机构
					cell = row.createCell(6);
					cell.setCellValue(drvUserInfo.getCarissuingagency());
					cell.setCellStyle(cellStyle);
					//家庭社会背景
					cell = row.createCell(7);
					cell.setCellValue(drvUserInfo.getFamilybg());
					cell.setCellStyle(cellStyle);
				}
			}
        	try {
            	out = response.getOutputStream();
                wb.write(out);
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
            	if(out != null){
            		try {
                        out.close();
                        for(String certNo:certNoList){
                        	map.put("certno", certNo);
                        	drvUserinfoService.updateDrvUser("com.nasoft.aboutcar.DrvUserinfoMapper.updateDrvUserPermit", map);
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
            	}
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	//导入Excel文件
	@RequestMapping("importExcel")
	public String importExcelFile(HttpServletRequest request,@RequestParam(value="excelFile",required=false) MultipartFile excelFile){
		Workbook wb;
		try {
			String fileName = excelFile.getOriginalFilename();
			String hz = fileName.substring(fileName.lastIndexOf("."),fileName.length()); 
			InputStream  excelInputStream = excelFile.getInputStream();
			if(hz.equals(".xls")){
	    		wb = new HSSFWorkbook(excelInputStream);
	    	}else{
	    		wb = new XSSFWorkbook(excelInputStream);
	    	}
			Sheet sheet = wb.getSheetAt(0);
			Map<String, Object> map = new HashMap<String, Object>();
			for(int i=2;i<sheet.getLastRowNum()+2;i++){
				Row row = sheet.getRow(i);
				if(row != null){
					//身份证号
					String certNo = row.getCell(3)+"";
					//是否通过
					String isPass = row.getCell(8)+"";
					if(!"null".equals(isPass)){
						isPass = "通过".equals(isPass) ? "4":"3";
						map.put("certno", certNo);
						map.put("checkStatus", isPass);
						map.put("recordcont", row.getCell(9));
						drvUserinfoService.updateDrvUser("com.nasoft.aboutcar.DrvUserinfoMapper.updateDrvUserPermit", map);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pilotApply/applyValidate";
	}
	
	/**
	 * 获取驾驶员详细信息
	 * @param certno
	 * @return
	 */
    public Map<String,Object> getDetail(String certno,String applytype){
		Map<String,Object> map = new HashMap<String,Object>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		try {
			if("2".equals(applytype)){//变更
				map = drvChangeapplyService.selectDetail("com.nasoft.aboutcar.DrvChangeapplyMapper.selectDetail",certno);
			}else{
				map = drvPermitapplyService.selectDetail("com.nasoft.aboutcar.DrvPermitapplyMapper.selectDetail",certno);
			}
			if(null != map){
				if(map.containsKey("applydate")){
					map.put("applydate", sdf.format((Date)map.get("applydate")));
				}
				if(map.containsKey("createdatetime")){
					map.put("createdatetime", sdf.format((Date)map.get("createdatetime")));
				}
			}
			//获取考试结果信息
			List<DrvExamresult> examList = drvExamresultService.findByCertno("com.nasoft.aboutcar.DrvExamresultMapper.findByCertno",certno);
			String quanguo = "";
			String difang = "";
			if(examList.size() > 0){
				for(int i=0;i<examList.size();i++){
					if(StringUtils.isBlank(quanguo) || StringUtils.isBlank(difang)){
						DrvExamresult drvExamresult = examList.get(i);
						if("1".equals(drvExamresult.getExamtype()) && StringUtils.isBlank(quanguo)){
							quanguo = drvExamresult.getScore()+"";
						}else if("2".equals(drvExamresult.getExamtype()) && StringUtils.isBlank(difang)){
							difang = drvExamresult.getScore()+"";
						}
					}
				}
			}
			map.put("quanguo", quanguo);
			map.put("difang", difang);
			//获取注销信息
			/*DrvCancelapply drvCancelapply=	drvCancelapplyService.findDrvCancelapplyByCertNo("com.nasoft.aboutcar.DrvCancelapplyMapper.selectByCertno", certno);
			if(null != drvCancelapply){
				map.put("zhuxiao", drvCancelapply.getAppstatus());//1.未审核
			}*/
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
    }
	
	/**
	 * 修改驾驶员申请表状态
	 * @param applyid
	 * @param status
	 * @param applytype
	 */
	public void updateStatus(String applyid,String status,String applytype){
		DrvPermitapply drvPermitapply = new DrvPermitapply();
		drvPermitapply.setApplyid(Integer.valueOf(applyid));
		drvPermitapply.setAppstatus(status);
		if(StringUtils.isNotBlank(applytype)){
			drvPermitapply.setApplytype(applytype);
		}
		try {
			drvPermitapplyService.updateDrvPermitapply("com.nasoft.aboutcar.DrvPermitapplyMapper.updateDrvPermitapply",drvPermitapply);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 增加一条审核记录
	 * @param request
	 * @param applyid
	 * @param certno
	 * @param description
	 * @param status
	 */
	public void addDrvApprove(HttpServletRequest request,String applyid,String apprtype,String certno,String description,String status){
		try {
			DrvApprove drvApprove = new DrvApprove();
			drvApprove.setApplyid(Integer.valueOf(applyid));
			drvApprove.setCertno(certno);
			drvApprove.setApprdatetime(new Date());
			drvApprove.setApprtype(apprtype);
			drvApprove.setOpinions(status);
			MngUserInfo mngUserInfo = (MngUserInfo) request.getSession().getAttribute("mngUserInfo");
			if(null != mngUserInfo){
				drvApprove.setAppruserid(mngUserInfo.getUserId());
			}
			drvApprove.setDescription(description);
			drvApproveService.addDrvApprove("com.nasoft.aboutcar.DrvApproveMapper.addDrvApprove",drvApprove);
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
	 * 补办页面
	 * @param applyid
	 * @param status
	 */
	@RequestMapping("toReissue")
	public String toReissue(HttpServletRequest request, String applyid){
		//map = getDetail(certno);
		try {
			DrvMakeupapp drvMakeupapp = drvMakeupappService.findById("com.nasoft.aboutcar.DrvMakeupappMapper.findById", Integer.parseInt(applyid));
			if(null != drvMakeupapp){
				request.setAttribute("drvMakeupapp", drvMakeupapp);				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "pilotApply/reissue";
	}
	
	/**
	 * 确认补办
	 * @param applyid
	 * @param status
	 */
	@RequestMapping("doReissue")
	public ModelAndView doReissue(String applyid,HttpServletRequest request,HttpServletResponse response){
		ModelAndView mv=new ModelAndView();
		DrvMakeupapp drvMakeupapp = new DrvMakeupapp();
		String message = "您的驾驶员补办申请已受理，请进入“窗口预约”功能菜单进行窗口办理！";
		try {
			drvMakeupapp = drvMakeupappService.findById("com.nasoft.aboutcar.DrvMakeupappMapper.findById", Integer.parseInt(applyid));
			addMsgNotice(request,drvMakeupapp.getCertno(),message);//增加消息通知记录
			drvMakeupapp.setAppstatus("5");//窗口办理不同过
			drvMakeupappService.updateDrvapp("com.nasoft.aboutcar.DrvMakeupappMapper.updateDrvapp",drvMakeupapp);
			mv.addObject("msg","success");
			mv.setViewName("save_result");
		} catch (Exception e) {
			mv.addObject("msg","failed");
			e.printStackTrace();
		}
		return mv;
	}
}
