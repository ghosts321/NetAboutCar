package com.nasoft.aboutcar.car.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.car.domain.CarApprove;
import com.nasoft.aboutcar.car.domain.CarChangeApply;
import com.nasoft.aboutcar.car.domain.CarInfo;
import com.nasoft.aboutcar.car.domain.CarPermitApply;
import com.nasoft.aboutcar.car.domain.CarPermitcert;
import com.nasoft.aboutcar.car.service.CarService;
import com.nasoft.aboutcar.mngarchive.domain.MngArchive;
import com.nasoft.aboutcar.mngarchive.service.MngArchiveService;
import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;
import com.nasoft.aboutcar.mnguserinfo.service.MngUserInfoService;
import com.nasoft.aboutcar.msgnotice.domain.MsgNotice;
import com.nasoft.aboutcar.msgnotice.service.MsgNoticeService;


@Controller
@RequestMapping("/car")
public class CarController extends BaseController{

	@Resource
	private CarService carService;
	@Resource
	private MsgNoticeService msgNoticeService;
	@Resource
	private MngArchiveService mngArchiveService;
	@Resource
	private MngUserInfoService mngUserInfoService;
	
	@RequestMapping("carInfoIndex")
	public String carInfo(){
		return "car/carInfoIndex";
	}
	
	
	@RequestMapping("findAllCar")
	public void findAllCar(HttpServletRequest request,HttpServletResponse response){
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			String carNum = request.getParameter("carNum");
			map.put("carNum", carNum);
			
			MngUserInfo MngUserInfo = getCurrentUser();
			map.put("roleid", MngUserInfo.getRoleId());
			map.put("instid", MngUserInfo.getInstId());
			map.put("areacode", MngUserInfo.getAreaCode());
			
			Map<String,Object> m2 = new HashMap<String,Object>();
			m2.put("userId", MngUserInfo.getUserId());
			m2.put("nodeType", "2");
			List<Map> approvalLimitList = mngUserInfoService.searchApprovalLimitById("com.nasoft.aboutcar.MngUserInfoMapper.searchApprovalLimitById", m2);
			if(approvalLimitList.size() > 0){
				for(Map p : approvalLimitList){
					map.put((String) p.get("node_code"), "1");
				}
			}
			//List<CarInfo> list=carService.findAllCar("com.nasoft.aboutcar.car.findAllCar");
			List<Map> list2=carService.findAllCarPermitApply("com.nasoft.aboutcar.car.findAllCarPermitApply",map);
			Object[] array = list2.toArray();
			for (Map map1 : list2) {
				if(map1.get("applyType").equals("2")){
					CarChangeApply changeApply = carService.findCarChangeApplyByApplyId("com.nasoft.aboutcar.car.findCarChangeApplyByApplyId", map1.get("applyId")+"");
					if(changeApply !=null){
					if(changeApply.getAppStatus().equals("1")){
						//审核通过
						map1.remove("appStatus");
						map1.put("appStatus", "6");
						map1.remove("applyType");
						map1.put("applyType", "2");
					}else if(changeApply.getAppStatus().equals("2")){
						map1.remove("appStatus");
						map1.put("appStatus",-6);
						map1.remove("applyType");
						map1.put("applyType", "2");
					}
					}
				}
				String string = map1.get("applyDate").toString();
				map.remove("applyDate");
				map1.put("applyDate", string);
			}
			JSONArray array2 = JSONArray.fromObject(list2.toArray());
			writer(response, array2+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("toShowDetail")
	public ModelAndView toShowDetail(String applyId,String carId){
		
		ModelAndView mv=new ModelAndView();
		try {
			CarInfo carInfo=carService.findCarInfoByCarId("com.nasoft.aboutcar.car.findCarByCarId", carId);
			CarPermitApply carPermitApply=carService.findCarPermitApplyByApplyId("com.nasoft.aboutcar.car.findCarPermitApplyByApplyId", applyId);
			List<Map> Approve = carService.findApproveListByApplyId("com.nasoft.aboutcar.car.findCarApproveByApplyId", applyId);
			CarChangeApply carChangeApply=carService.findCarChangeApplyByApplyId("com.nasoft.aboutcar.car.findCarChangeApplyByApplyId",applyId);
			if(carChangeApply!=null){
				mv.addObject("carChangeApply", carChangeApply);
				carChangeApply.setAppStatus("5");
				mv.addObject("carPermitApply", carChangeApply);
			}else{
				mv.addObject("carPermitApply", carPermitApply);
				
			}
			
			mv.addObject("carInfo", carInfo);
			
			mv.addObject("approve", Approve);
			mv.setViewName("car/carInfoDetail");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	@RequestMapping("showDetail")
	public ModelAndView showDetail(String applyId,String carId){
		
		ModelAndView mv=new ModelAndView();
		try {
			CarInfo carInfo=carService.findCarInfoByCarId("com.nasoft.aboutcar.car.findCarByCarId", carId);
			CarPermitApply carPermitApply=carService.findCarPermitApplyByApplyId("com.nasoft.aboutcar.car.findCarPermitApplyByApplyId", applyId);
			List<Map> Approve = carService.findApproveListByApplyId("com.nasoft.aboutcar.car.findCarApproveByApplyId", applyId);
			mv.addObject("carInfo", carInfo);
			mv.addObject("carPermitApply", carPermitApply);
			mv.addObject("approve", Approve);
			mv.setViewName("car/carInfoDetails");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 车辆认证审批
	 * @param carId
	 * @param appStatus
	 * @param carApprove
	 * @return
	 */
    @RequestMapping("approve")
	public ModelAndView approve(HttpServletRequest request,String applyId,String carId,String appStatus,CarApprove carApprove,MngArchive mngArchive){
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
    	SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	ModelAndView mv=new ModelAndView();
    	appStatus=appStatus.split(",")[1];
		try {
			String cont="";
			String message="";
			
			//获得车主身份证号
			CarInfo carInfo=carService.findCarInfoByCarId("com.nasoft.aboutcar.car.findCarByCarId", carId);
			
			CarPermitApply ca=new CarPermitApply();
			ca.setCarId(carId);
			if(appStatus.equals("6")){
				ca.setAppStatus("1");
				carService.updateChangeApplyStatus("com.nasoft.aboutcar.car.updateChangeApplyStatus",ca);
			}else{
				
				ca.setAppStatus(appStatus);
				carService.updateApplyStatus("com.nasoft.aboutcar.car.updateApplyStatus", ca);
			}
			
			if("1".equals(appStatus)){
				cont="您的车辆认证审核已通过。";
				carApprove.setOpinions("2");
				message = cont + "请进入“车辆外勘”功能菜单上传外勘资料！";
				carApprove.setApprType("1"); 
			}else if("-1".equals(appStatus)){
				cont="您的车辆认证审核未通过，审核意见："+carApprove.getDescription();
				carApprove.setApprType("1"); 
				carApprove.setOpinions("1");
				message = cont;
			}else if("2".equals(appStatus)){
				cont="您的车辆外勘审核已通过。";
				carApprove.setOpinions("2");
				message = cont + "请进入“变更车辆性质”功能菜单进行处理！";
				carApprove.setApprType("2"); 
			}else if("-2".equals(appStatus)){
				cont="您的车辆外勘审核未通过，审核意见："+carApprove.getDescription();
				carApprove.setApprType("1"); 
				carApprove.setOpinions("2");
				message = cont;
			}else if("3".equals(appStatus)){
				cont="您的变更车辆性质审核已通过。";
				carApprove.setApprType("3"); 
				carApprove.setOpinions("2");
				message = cont + "请进入“车辆窗口预约”功能菜单进行处理！";
			}else if("-3".equals(appStatus)){
				cont="您的变更车辆性质审核未通过，审核意见："+carApprove.getDescription();
				carApprove.setApprType("3"); 
				carApprove.setOpinions("1");
				message = cont;
			}else if("4".equals(appStatus)){
				cont="您的车辆窗口办理审核已通过。";
				carApprove.setApprType("4"); 
				carApprove.setOpinions("2");
				message = cont + "请等待发证！";
				//保存档案信息
				mngArchive.setApplyid(applyId);
				mngArchive.setArchivetype("2");
				mngArchive.setCreatetime(new Date());
				mngArchiveService.addMngArchive("com.nasoft.aboutcar.mngArchiveMapper.addMngArchive", mngArchive);
			}else if("-4".equals(appStatus)){
				cont="您的车辆窗口办理审核未通过，审核意见："+carApprove.getDescription();
				carApprove.setOpinions("1");
				message = cont;
				carApprove.setApprType("4"); 
				//保存档案信息
				mngArchive.setApplyid(applyId);
				mngArchive.setArchivetype("2");
				mngArchive.setCreatetime(new Date());
				mngArchiveService.addMngArchive("com.nasoft.aboutcar.mngArchiveMapper.addMngArchive", mngArchive);
			}else if("6".equals(appStatus)){
				cont="您的车辆变更审核已通过。";
				carApprove.setOpinions("2");
				message = cont + "请速去领证！";
				carApprove.setApprType("5");
			}else if("-6".equals(appStatus)){
				cont="您的车辆变更审核未通过，审核意见："+carApprove.getDescription();
				carApprove.setOpinions("1");
				message = cont;
				carApprove.setApprType("5");
			}
			String username = request.getSession().getAttribute("username").toString();
			List<Map> list=mngUserInfoService.findUserByUsername("com.nasoft.aboutcar.MngUserInfoMapper.findUserByUsername",username);
			
			carApprove.setAppRid("A"+sdf.format(new Date()));
			carApprove.setApprUserId(list.get(0).get("userid")+"");
			carApprove.setApprInstId(list.get(0).get("instid")+"");
			carApprove.setApprDateTime(sdf2.format(new Date()));
			
			
			carService.addCarApprove("com.nasoft.aboutcar.car.insertApprove", carApprove);
			
			addMsgNotice(request,carInfo.getCertNo(),message);
			
			mv.addObject("msg","success");
			mv.setViewName("save_result");
		} catch (Exception e) {
			mv.addObject("msg","failed");
			e.printStackTrace();
		}
		return mv;
	}
    @RequestMapping("faZheng")
    public void faZheng(HttpServletRequest request,String carId,String applyId,PrintWriter out){
    	try {
    		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
    		SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    		CarInfo carInfo=carService.findCarInfoByCarId("com.nasoft.aboutcar.car.findCarByCarId", carId);
//    		CarPermitApply carPermitApply=carService.findAllCarPermitApplyByCarId("com.nasoft.aboutcar.car.findAllCarPermitApplyByCarId", carId);	
    		CarPermitApply carPermitApply=carService.findCarPermitApplyByApplyId("com.nasoft.aboutcar.car.findCarPermitApplyByApplyId", applyId);
    		
    		CarPermitcert cpc=new CarPermitcert();
    		if("5".equals(carPermitApply.getApplyType())){//证书补办申请，将之前申请证书置为作废状态
    			List<CarPermitcert> list = carService.findCarCertByCertNo("com.nasoft.aboutcar.car.findCarCertByCertNo", carInfo.getCertNo());
				if(list.size() > 0){
					for(CarPermitcert carPermitcert : list){
						if(carPermitcert.getStatus() != 3){
							carPermitcert.setStatus(3);
							carService.updateByApplyid("com.nasoft.aboutcar.car.updateByApplyid",carPermitcert);
						}
					}
				}
    		}
    		cpc.setPcertId("Z"+sdf.format(new Date()));
    		cpc.setApplyId(carPermitApply.getApplyId());
    		cpc.setPcertNo("N"+sdf.format(new Date()));
    		cpc.setCertNo(carInfo.getCertNo());
    		cpc.setAppId("");
    		cpc.setSendDate(sdf2.format(new Date()));
    		cpc.setEndDate("2020-01-01 00:00:00");
    		cpc.setInstId("A0001");
    		cpc.setStatus(1);
    		cpc.setCreateMan(1);
    		cpc.setCreateInstId(1);
    		cpc.setCreateDate(sdf2.format(new Date()));
    		carService.addCarPermitcert("com.nasoft.aboutcar.car.insertCarPermitcert", cpc);
    		
    		CarPermitApply ca=new CarPermitApply();
			ca.setCarId(carId);
			ca.setAppStatus("5");
			carService.updateApplyStatus("com.nasoft.aboutcar.car.updateApplyStatus", ca);
    		
			addMsgNotice(request,carInfo.getCertNo(),"您的车辆资质证书已颁发。");
			
    		out.write("success");
			
			out.flush();
			out.close();
		} catch (Exception e) {
			out.write("failed");
			e.printStackTrace();
		}
    	
    }
    
	@RequestMapping("findAllCarPermitApply")
	public void findAllCarPermitApply(HttpServletRequest request,HttpServletResponse response){
		
		try {
			List<Map> list=carService.findAllCarPermitApply("com.nasoft.aboutcar.car.findAllCarPermitApply",null);
			JSONArray array = JSONArray.fromObject(list);
			writer(response, array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//证书管理页面
	@RequestMapping("carPermitcert")
	public String carPermitcert(){
		return "car/carPermitcert";
	}
	
	@RequestMapping("findAllCarPermitcert")
	public void findAllCarPermitcert(HttpServletRequest request,HttpServletResponse response){
		try {
			String carNum = request.getParameter("carNum");
			String certNo = request.getParameter("certNo");
			Map<String, Object> map = new HashMap<String, Object>();
			MngUserInfo MngUserInfo = getCurrentUser();
			map.put("roleid", MngUserInfo.getRoleId());
			map.put("instid", MngUserInfo.getInstId());
			map.put("areacode", MngUserInfo.getAreaCode());
			map.put("carNum", carNum);
			map.put("certNo", certNo);
			List<Map> certList=carService.selectAllCertInfo("com.nasoft.aboutcar.car.selectAllCertInfo",map);
			for(Map m : certList){
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				m.put("receivedate", dateFormat.format((Date) m.get("receivedate")));
				m.put("senddate", dateFormat.format((Date) m.get("senddate")));
				m.put("enddate", dateFormat.format((Date) m.get("enddate")));
			}
			JSONArray array = JSONArray.fromObject(certList);
			writer(response, array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	 
	
	public static void main(String[] args) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
		System.out.println(sdf.format(new Date()));
	}
	
	//跳到打印证书页面
	@RequestMapping("toTaxiPrintCert")
	public ModelAndView toTaxiPrintCert(HttpServletRequest request,String certno,Model model)throws Exception{
		/*model.addAttribute("filename", "carCert_"+certno+".jpg");
		return "car/carCert";*/
		String carid=request.getParameter("carid");
		ModelAndView mv=new ModelAndView();
		try {
			List<Map> list=	carService.findPrintCertByCarid("com.nasoft.aboutcar.car.certByCarid",carid);
			for (Map map : list) {
				String[] split = map.get("senddate").toString().split("-");
				mv.addObject("sendYear",split[0]);//发证 年
				mv.addObject("sendMonth",split[1]);//发证 月
				mv.addObject("sendDay",split[2]);//发证 日
				mv.addObject("instname",map.get("instname"));//机构名称
				mv.addObject("mancompandy", map.get("mancompany"));//车辆所有人
				mv.addObject("address",map.get("address"));//地址
				mv.addObject("carnum",map.get("carnum"));//车牌号
				mv.addObject("cartype",map.get("cartype"));//车辆类型
				mv.addObject("seatnum",map.get("seatnum"));// 座位数
				mv.addObject("length", map.get("length"));//长
				mv.addObject("width", map.get("width"));//宽
				mv.addObject("heigth", map.get("heigth"));//高

			}
			mv.setViewName("car/carCert");
		} catch (Exception e) {
			e.printStackTrace();
		}
	return mv;
	}
	//跳到证书吊销页面
	@RequestMapping("toCarDeactive")
	public ModelAndView toCarDeactive(String carId,String applyId){
		
		ModelAndView mv=new ModelAndView();
		try {
			CarInfo carInfo=carService.findCarInfoByCarId("com.nasoft.aboutcar.car.findCarByCarId", carId);
//			CarPermitApply carPermitApply=carService.findAllCarPermitApplyByCarId("com.nasoft.aboutcar.car.findAllCarPermitApplyByCarId", carId);
			CarPermitApply carPermitApply=carService.findCarPermitApplyByApplyId("com.nasoft.aboutcar.car.findCarPermitApplyByApplyId", applyId);
			mv.addObject("carInfo", carInfo);
			mv.addObject("carPermitApply", carPermitApply);
			mv.setViewName("car/carDeactive");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	//跳到证书作废页面
	@RequestMapping("toCarCancellation")
	public ModelAndView toCarCancellation(String carId,String applyId){
		ModelAndView mv=new ModelAndView();
		try {
			CarInfo carInfo=carService.findCarInfoByCarId("com.nasoft.aboutcar.car.findCarByCarId", carId);
//			CarPermitApply carPermitApply=carService.findAllCarPermitApplyByCarId("com.nasoft.aboutcar.car.findAllCarPermitApplyByCarId", carId);
			CarPermitApply carPermitApply=carService.findCarPermitApplyByApplyId("com.nasoft.aboutcar.car.findCarPermitApplyByApplyId", applyId);
			mv.addObject("carInfo", carInfo);
			mv.addObject("carPermitApply", carPermitApply);
			mv.setViewName("car/carCancellation");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	//证书操作（吊销、作废）
	@RequestMapping("operateCarPermitcert")
	public ModelAndView operateCarPermitcert(HttpServletRequest request,String status,String applyid,String certno,String reason){
		ModelAndView mv=new ModelAndView();
		CarPermitcert carPermitcert = new CarPermitcert();
		carPermitcert.setApplyId(applyid);
		carPermitcert.setStatus(Integer.valueOf(status));
		try {
			carService.updateByApplyid("com.nasoft.aboutcar.car.updateByApplyid",carPermitcert);
			if("2".equals(status)){
				addMsgNotice(request,certno,"您的车辆证书已被吊销，吊销原因为："+reason+"！");//增加消息通知记录
			}else if("3".equals(status)){
				addMsgNotice(request,certno,"您的车辆证书已被作废，作废原因为："+reason+"！");//增加消息通知记录
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
