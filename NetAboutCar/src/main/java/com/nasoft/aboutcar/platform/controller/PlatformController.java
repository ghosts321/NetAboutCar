package com.nasoft.aboutcar.platform.controller;

import java.awt.Font;
import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;
import com.nasoft.aboutcar.mnguserinfo.service.MngUserInfoService;
import com.nasoft.aboutcar.msgnotice.domain.MsgNotice;
import com.nasoft.aboutcar.msgnotice.service.MsgNoticeService;
import com.nasoft.aboutcar.platform.domain.Platform;
import com.nasoft.aboutcar.platform.domain.PlatformApply;
import com.nasoft.aboutcar.platform.domain.PlatformApprove;
import com.nasoft.aboutcar.platform.domain.PlatformPermitcert;
import com.nasoft.aboutcar.platform.service.PlatformService;
import com.nasoft.util.FontImage;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/platform")
public class PlatformController extends BaseController {

	@Resource
	private PlatformService platformService;
	@Resource
	private MsgNoticeService msgNoticeService;
	@Resource
	private MngUserInfoService mngUserInfoService;
	 
	//业务审核
	@RequestMapping("index")
	public String index(HttpServletRequest request,Model model){
		return "platform/platformIndex";
	}
	//证书管理
	@RequestMapping("certificate")
	public String certificate(HttpServletRequest request,Model model){
		return "platform/certificate";
	}
	@RequestMapping("platformApplyList")
	public void getPlatformList(HttpServletRequest request,HttpServletResponse response){
		MngUserInfo MngUserInfo = getCurrentUser();
		//查询用户所拥有的审批权限
		Map<String,Object> m2 = new HashMap<String,Object>();
		m2.put("userId", MngUserInfo.getUserId());
		m2.put("nodeType", "3");
		try {
			List<Map> approvalLimitList = mngUserInfoService.searchApprovalLimitById("com.nasoft.aboutcar.MngUserInfoMapper.searchApprovalLimitById", m2);
			if(null == approvalLimitList || approvalLimitList.isEmpty()){//没有权限
				return;
			}else{
				List<String> list = new ArrayList<>();
				for(Map map : approvalLimitList){
					list.add((String) map.get("node_code"));
				}
				if(!list.contains("comApply")){//没有查看申请记录权限
					return;
				}
			}
			Map<String, Object> map = new HashMap<String, Object>();
			String creditCode = request.getParameter("creditCode");
			map.put("creditCode", creditCode);
			
			//MngUserInfo MngUserInfo = getCurrentUser();
			map.put("roleid", MngUserInfo.getRoleId());
			map.put("instid", MngUserInfo.getInstId());
			map.put("areacode", MngUserInfo.getAreaCode());
			
			List<PlatformApply> platformApplyList = platformService.findAllPlatformApply("com.nasoft.aboutcar.PlatformMapper.searchAllPlatformApply", map);
			JSONArray array = JSONArray.fromObject(platformApplyList);
			System.out.println(array);
			writer(response, array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("toShowDetail")
	public String toShowDetail(String creditCode,String applyId,String applyType,HttpServletRequest request,HttpServletResponse response){
		try {
			Platform platform = platformService.findPlatformById("com.nasoft.aboutcar.PlatformMapper.searchPlatformById", creditCode);
			Map<String, Object> map = new HashMap<>();
			map.put("applyType", applyType);
			map.put("creditCode", creditCode);
			PlatformApply platformApply= platformService.findPlatformApplyByMap("com.nasoft.aboutcar.PlatformMapper.searchPlatformApplyByMap", map);
			List<Map> approve = platformService.findApproveListByApplyId("com.nasoft.aboutcar.PlatformMapper.findCarApproveByApplyId", applyId);
			request.setAttribute("platform", platform);
			request.setAttribute("platformApply", platformApply);
			request.setAttribute("approve", approve);//审批历史
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "platform/platformDetail";
	}
	
	   @RequestMapping("approve")
		public ModelAndView approve(HttpServletRequest request,String applyId,String appStatus,String applytype,PlatformApprove platformApprove){
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
	    	SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    	MngUserInfo currentUser = getCurrentUser();
	    	//查询用户所拥有的审批权限
			Map<String,Object> m2 = new HashMap<String,Object>();
			m2.put("userId", currentUser.getUserId());
			m2.put("nodeType", "3");
			ModelAndView mv=new ModelAndView();
			try {
				List<Map> approvalLimitList = mngUserInfoService.searchApprovalLimitById("com.nasoft.aboutcar.MngUserInfoMapper.searchApprovalLimitById", m2);
				if(null == approvalLimitList || approvalLimitList.isEmpty()){//没有权限
					mv.addObject("msg","审批失败！您没有权限！");
					mv.setViewName("save_result");
					return mv;
				}else{
					List<String> list = new ArrayList<>();
					for(Map map : approvalLimitList){
						list.add((String) map.get("node_code"));
					}
					if(!list.contains("comValidate")){//没有平台认证审批权限
						mv.addObject("msg","审批失败！您没有权限！");
						mv.setViewName("save_result");
						return mv;
					}
				}
				
				String cont="";
				
				if(applytype.equals("1")){//资质申请
					if("1".equals(appStatus)){
						cont="您的平台资质申请已通过";
					}else if("-1".equals(appStatus)){
						cont="您的平台资质申请未通过，审核意见："+platformApprove.getDescription()+"（注：附件须重新完整上传）";
					}
				}else if(applytype.equals("2")){//变更申请
					if("1".equals(appStatus)){
						cont="您的平台变更申请已通过";
					}else if("-1".equals(appStatus)){
						cont="您的平台变更申请未通过，审核意见："+platformApprove.getDescription()+"（注：附件须重新完整上传）";
					}
				}
				
				PlatformApply pa=new PlatformApply();
				pa.setApplyId(applyId);
				pa.setAppStatus(appStatus);
				pa.setApplytype(applytype);
				//更新申请状态
				platformService.updateApplyStatus("com.nasoft.aboutcar.PlatformMapper.updateApplyStatus", pa);
				
				//增加审批记录
				platformApprove.setAppRid("A"+sdf.format(new Date()));
				platformApprove.setApprType("1");
				platformApprove.setApplyId(applyId);
				platformApprove.setApprUserId(currentUser.getUserId());
				platformApprove.setApprInstId(currentUser.getInstId());
				platformApprove.setApprDateTime(sdf2.format(new Date()));
				platformService.addPlatformApprove("com.nasoft.aboutcar.PlatformMapper.insertPlatformApprove", platformApprove);
				
				addMsgNotice(request,platformApprove.getCreditCode(),cont);
				
				mv.addObject("msg","success");
				mv.setViewName("save_result");
			} catch (Exception e) {
				mv.addObject("msg","系统错误！审批失败！");
				e.printStackTrace();
			}
			return mv;
		}
	    @RequestMapping("faZheng")
	    public void faZheng(HttpServletRequest request,HttpServletResponse response,String creditCode,String applytype,PrintWriter out){
		    MngUserInfo currentUser = getCurrentUser();
	    	//查询用户所拥有的审批权限
			Map<String,Object> m2 = new HashMap<String,Object>();
			m2.put("userId", currentUser.getUserId());
			m2.put("nodeType", "3");
			try {
				List<Map> approvalLimitList = mngUserInfoService.searchApprovalLimitById("com.nasoft.aboutcar.MngUserInfoMapper.searchApprovalLimitById", m2);
				if(null == approvalLimitList || approvalLimitList.isEmpty()){//没有权限
					writer(response, "发证失败，您没有权限！");
					return ;
				}else{
					List<String> list = new ArrayList<>();
					for(Map map : approvalLimitList){
						list.add((String) map.get("node_code"));
					}
					if(!list.contains("comCert")){//没有发证权限
						writer(response, "发证失败，您没有权限！");
						return ;
					}
				}
	    		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
	    		SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    		SimpleDateFormat sdf3=new SimpleDateFormat("yyyy年MM月dd日");
	    		Platform platform=platformService.findPlatformById("com.nasoft.aboutcar.PlatformMapper.searchPlatformById", creditCode);
	    		PlatformApply platformApply=platformService.findPlatformApplyById("com.nasoft.aboutcar.PlatformMapper.searchPlatformApplyById", creditCode);	
	    		
	    		PlatformPermitcert pp=new PlatformPermitcert();
	    		pp.setPcertId("Z"+sdf.format(new Date()));
	    		pp.setPcertNo("N"+sdf.format(new Date()));
	    		pp.setCreditCode(creditCode);
	    		pp.setAppId("");
	    		pp.setSendDate(sdf2.format(new Date()));
	    		pp.setEndDate("2020-01-01 00:00:00");
	    		pp.setInstId("A0001");
	    		pp.setStatus(1);
	    		pp.setCreateMan(1);
	    		pp.setCreateInstId(1);
	    		pp.setCreateDate(sdf2.format(new Date()));
	    		platformService.addPlatformPermitcert("com.nasoft.aboutcar.PlatformMapper.insertPlatformPermitcert", pp);
	    		
	    		PlatformApply pa=new PlatformApply();
				pa.setApplyId(platformApply.getApplyId());
				pa.setAppStatus("2");
				pa.setApplytype(applytype);
				platformService.updateApplyStatus("com.nasoft.aboutcar.PlatformMapper.updateApplyStatus", pa);
	    		
				addMsgNotice(request,creditCode,"您的平台资质证书已发。");
				//生成平台证书图片
				String realPath=request.getSession().getServletContext().getRealPath("/file");
				String sourceFilePath=realPath+File.separator+"platCert.jpg";
				String fileName="comCert_"+creditCode+".jpg";
				String targetFilePath=realPath+File.separator+fileName;
				String text[]={"XX","XX",platform.getComName(),"北京市海淀区",platform.getBusiAddress(),sdf3.format(new Date())+"至2020年01月01日",pp.getInstId()};
			    int offsetX[]={455,510,240,240,240,190,540};
		        int offsetY[]={225,225,260,295,330,405,370};
				FontImage.pressTextGroup(text ,targetFilePath,sourceFilePath, "宋体", Font.TRUETYPE_FONT,13,offsetX,offsetY);
				
	    		out.write("发证成功！");
				
				out.flush();
				out.close();
			} catch (Exception e) {
				out.write("系统错误！发证失败！");
				e.printStackTrace();
			}
	    	
	    }
	 
	//平台营运资质验证列表
	@RequestMapping("validate")
	public String validateList(){
		return "platform/validate";
	}
	//平台申请信息验证
	@RequestMapping("applyValidate")
	public String applyValidateList(){
		return "platform/applyValidate";
	}
	
	//证书管理页面
	@RequestMapping("comPermitcert")
	public String comPermitcert(){
		return "platform/comPermitcert";
	}
	
	@RequestMapping("findAllComPermitcert")
	public void findAllComPermitcert(HttpServletRequest request,HttpServletResponse response){
		try {
			String comName = request.getParameter("comName");
			String creditCode = request.getParameter("creditCode");
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("comName", comName);
			map.put("creditCode", creditCode);
			MngUserInfo MngUserInfo = getCurrentUser();
			map.put("roleid", MngUserInfo.getRoleId());
			map.put("instid", MngUserInfo.getInstId());
			map.put("areacode", MngUserInfo.getAreaCode());
			List<Map> certList=platformService.selectAllCertInfo("com.nasoft.aboutcar.PlatformMapper.selectAllCertInfo",map);


			for(Map m : certList){
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				m.put("senddate", dateFormat.format((Date) m.get("senddate")));
				m.put("enddate", dateFormat.format((Date) m.get("enddate")));
			}
			
			JSONArray array = JSONArray.fromObject(certList);
			writer(response, array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//跳到打印证书页面
	@RequestMapping("toPrintCert")
	public ModelAndView toPrintCert(HttpServletRequest request,String creditCode,Model model){
		/*model.addAttribute("filename", "comCert_"+creditCode+".jpg");*/
		ModelAndView mv=new ModelAndView();
		try {
			
			PlatformPermitcert platformPermitcert= platformService.findPermitcertByCredCode("com.nasoft.aboutcar.PlatformMapper.queryPermitcertByCreditcode",creditCode);
			List<Map>  list=platformService.findInstByCreditcode("com.nasoft.aboutcar.PlatformMapper.queryInstByCreditcode",creditCode);
			for (Map map : list) {
				//机关名称
				mv.addObject("instname", map.get("instname"));
				//公司名称
				mv.addObject("comname", map.get("comname"));
				//注册地址
				mv.addObject("regaddress", map.get("regaddress"));
				mv.addObject("businessarea", map.get("businessarea"));//经营区域
				mv.addObject("businessrange",map.get("businessrange"));//经营范围
				mv.addObject("businesstime", map.get("businesstime"));//经营期限
				mv.addObject("economic", map.get("economic"));//经济性质
			}
			//有效期
			String endDate = platformPermitcert.getEndDate();
			//发证日期
			String sendDate = platformPermitcert.getSendDate();
			String[] beginDate = sendDate.toString().split("-");
			String[] lastDate = endDate.toString().split("-");
			//发证 年
			mv.addObject("sendYear", beginDate[0]);
			//发证月
			mv.addObject("sendMonth", beginDate[1]);
			//发证日
			mv.addObject("sendDay",beginDate[2]);
			//有效期 年
			mv.addObject("endYear", lastDate[0]);
			//有效期 月
			mv.addObject("endMonth", lastDate[1]);
			//有效期 日
			mv.addObject("endDay", lastDate[2]);
			mv.addObject("platformPermitcert", platformPermitcert);
			
			mv.setViewName("platform/comCert");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	//跳到证书吊销页面
	@RequestMapping("toComDeactive")
	public ModelAndView toComDeactive(String creditCode){
		ModelAndView mv=new ModelAndView();
		try {
			Platform platform = platformService.findPlatformById("com.nasoft.aboutcar.PlatformMapper.searchPlatformById", creditCode);
			PlatformApply platformApply= platformService.findPlatformApplyById("com.nasoft.aboutcar.PlatformMapper.searchPlatformApplyById", creditCode);
			
			mv.addObject("platform", platform);
			mv.addObject("platformApply", platformApply);
			mv.setViewName("platform/comDeactive");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	//跳到证书作废页面
	@RequestMapping("toComCancellation")
	public ModelAndView toComCancellation(String creditCode){
		
		ModelAndView mv=new ModelAndView();
		try {
			Platform platform = platformService.findPlatformById("com.nasoft.aboutcar.PlatformMapper.searchPlatformById", creditCode);
			PlatformApply platformApply= platformService.findPlatformApplyById("com.nasoft.aboutcar.PlatformMapper.searchPlatformApplyById", creditCode);
			mv.addObject("platform", platform);
			mv.addObject("platformApply", platformApply);
			mv.setViewName("platform/comCancellation");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	//证书操作（吊销、作废）
	@RequestMapping("operateComPermitcert")
	public ModelAndView operateComPermitcert(HttpServletRequest request,String status,String creditCode,String reason){
		ModelAndView mv=new ModelAndView();
		PlatformPermitcert comPermitcert = new PlatformPermitcert();
		comPermitcert.setCreditCode(creditCode);
		comPermitcert.setStatus(Integer.valueOf(status));
		try {
			platformService.updateCertByApplyid("com.nasoft.aboutcar.PlatformMapper.updateCertByApplyid",comPermitcert);
			if("2".equals(status)){
				addMsgNotice(request,creditCode,"您的平台证书已被吊销，吊销原因为："+reason+"！");//增加消息通知记录
			}else if("3".equals(status)){
				addMsgNotice(request,creditCode,"您的平台证书已被作废，作废原因为："+reason+"！");//增加消息通知记录
			}
			mv.addObject("msg","success");
			mv.setViewName("save_result");
		} catch (Exception e) {
			mv.addObject("msg","failed");
			e.printStackTrace();
		}
		return mv;
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
}
