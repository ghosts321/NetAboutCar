package com.nasoft.aboutcar.supervise.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.text.NumberFormat;
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

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
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

import com.nasoft.aboutcar.administrativePenalty.domain.DrvPlantCaseInfo;
import com.nasoft.aboutcar.administrativePenalty.service.PlantCaseInfoService;
import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;
import com.nasoft.aboutcar.msgnotice.domain.MsgNotice;
import com.nasoft.aboutcar.msgnotice.service.MsgNoticeService;
import com.nasoft.aboutcar.runtime.mybatis.Page;
import com.nasoft.aboutcar.runtime.mybatis.Pageable;
import com.nasoft.aboutcar.setAssemblePlace.domain.SetAssemblePlace;
import com.nasoft.aboutcar.setAssemblePlace.service.SetAssemblePlaceService;
import com.nasoft.aboutcar.supervise.domain.BnsCompanyViolation;
import com.nasoft.aboutcar.supervise.domain.BnsNotOperateCar;
import com.nasoft.aboutcar.supervise.domain.BnsOperationPay;
import com.nasoft.aboutcar.supervise.domain.CarActionInfo;
import com.nasoft.aboutcar.supervise.domain.CarIllegalInfo;
import com.nasoft.aboutcar.supervise.domain.CtlAlarmCarMonitor;
import com.nasoft.aboutcar.supervise.domain.CtlCarPositionInfo;
import com.nasoft.aboutcar.supervise.domain.CtlIllegalCarMonitor;
import com.nasoft.aboutcar.supervise.domain.DrvActionInfo;
import com.nasoft.aboutcar.supervise.domain.DrvIllegalInfo;
import com.nasoft.aboutcar.supervise.domain.MngUnoperatingDriver;
import com.nasoft.aboutcar.supervise.service.BnsCompanyViolationService;
import com.nasoft.aboutcar.supervise.service.BnsNotOperateCarService;
import com.nasoft.aboutcar.supervise.service.BnsOperationPayService;
import com.nasoft.aboutcar.supervise.service.CtlAlarmCarMonitorService;
import com.nasoft.aboutcar.supervise.service.CtlAssembleCarMonitorService;
import com.nasoft.aboutcar.supervise.service.CtlCarPositionInfoService;
import com.nasoft.aboutcar.supervise.service.CtlIllegalCarMonitorService;
import com.nasoft.aboutcar.supervise.service.MngOrderStartInfoService;
import com.nasoft.aboutcar.supervise.service.MngUnoperatingDriverService;
import com.nasoft.aboutcar.yyjgOutinAreaSet.domain.OutinAreaSet;
import com.nasoft.aboutcar.yyjgOutinAreaSet.service.OutinAreaSetService;
import com.nasoft.util.DateUtil;


@Controller
@RequestMapping("/supervise")
public class SuperviseController extends BaseController {
	List<CtlCarPositionInfo> specificCarList = new ArrayList<CtlCarPositionInfo>();		//封装正在追踪的车辆数据
	
	@Resource
	private BnsCompanyViolationService bnsCompanyViolationService;
	@Resource
	private MngUnoperatingDriverService mngUnoperatingDriverService;
	@Resource
	private BnsNotOperateCarService bnsNotOperateCarService;
	@Resource
	private MngOrderStartInfoService mngOrderStartInfoService;
	@Resource
	private BnsOperationPayService bnsOperationPayService;
	@Resource
	private CtlCarPositionInfoService ctlCarPositionInfoService;
	@Resource
	private CtlAlarmCarMonitorService ctlAlarmCarMonitorService;
	@Resource
	private CtlIllegalCarMonitorService ctlIllegalCarMonitorService;
	@Resource
	private CtlAssembleCarMonitorService ctlAssembleCarMonitorService;
	@Resource
	private MsgNoticeService msgNoticeService;
	@Resource
	private SetAssemblePlaceService setAssemblePlaceService;
	@Resource
	private PlantCaseInfoService plantCaseInfoService;
	@Resource
	private OutinAreaSetService outinAreaSetService;
	@RequestMapping("index")
	public String index(HttpServletRequest request,Model model){
		return "supervise/index";
	}
	@RequestMapping("electronic")
	public String electronic(HttpServletRequest request,Model model){
		return "supervise/electronicFence";
	}
	
	/**
	 * total地图中，历史轨迹查询 页面打开
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("hisTrajectory")
	public String hisTrajectory(){
		return "totalMap/hisTrajectory/hisTrajectory";
	}
	
	/**
	 * total地图中，报警信息查询 页面打开
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("alertMessage")
	public String alertMessage(HttpServletRequest request, String tabType){
		request.getSession().setAttribute("tabType", tabType);
		return "totalMap/alertMessage/alertMessage";
	}
	
	/**
	 * total地图中，报警信息 数据获取
	 * @return
	 */
	@RequestMapping("/getAlertMessage")
	public void getAlertMessage(HttpServletRequest request, HttpServletResponse response){
		try {
			String type = request.getParameter("type");
			Map<String, Object> map = new HashMap<String, Object>();
			
			//获取报警车辆列表
			if("1".equals(type)){
				map.put("vehicle_no", request.getParameter("vehicle_no"));
				List<CtlCarPositionInfo> carPositionList = ctlCarPositionInfoService.selectAlarmCar("com.nasoft.aboutcar.CtlCarPositionInfoMapper.findAlarmCar", map);
				JSONArray array = JSONArray.fromObject(carPositionList.toArray());
				writer(response, array.toString());
			}
			//获取违规车辆列表
			else if("2".equals(type)){
				map.put("vehicle_no", request.getParameter("vehicle_no"));
				map.put("illegal_type", request.getParameter("illegal_type"));
				List<CtlIllegalCarMonitor> ctlIllegalCarMonitorList = ctlIllegalCarMonitorService.selectAll("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.findAll", map);
				//设置备注字段
				for(CtlIllegalCarMonitor illCar : ctlIllegalCarMonitorList){
					if("0".equals(illCar.getIllegal_type())){		//禁止驶入
						illCar.setRemark("驶入区域："+illCar.getAreaName());
					}
					else if("1".equals(illCar.getIllegal_type())){	//禁止驶出
						illCar.setRemark("应在经营区域："+illCar.getCityName());
					}
					else if("2".equals(illCar.getIllegal_type())){	//人车不对应
						illCar.setRemark("本应驾驶员："+illCar.getAreaName()+";"+"实际驾驶员："+illCar.getAreaName());
					}
				}
				
				JSONArray array = JSONArray.fromObject(ctlIllegalCarMonitorList.toArray());
				writer(response, array.toString());
			}
			// 获取所有聚集区域
			else if("3".equals(type)){
				map.put("place_name", request.getParameter("place_name"));
				
				List<SetAssemblePlace> setAssemblePlaceList = new ArrayList<SetAssemblePlace>();	//封装所有聚集区域
				
				String areaIds = request.getParameter("areaIds");		//数组集合（id，车辆个数）
				if(areaIds != ""){
					String[] idANDcountArr = areaIds.split(",");
					
					for(String idANDcounts : idANDcountArr){
						String[] idANDcount = idANDcounts.split(":");
						String id = idANDcount[0];		//区域id
						String count = idANDcount[1];	//区域内车辆个数
						
						map.put("id", id);
						
						//通过id获取区域参数信息
						SetAssemblePlace setAssemblePlace = setAssemblePlaceService.findAssemblePlaceById("com.nasoft.aboutcar.SetAssemblePlace.selectAssemblePlaceById",map);
						if(setAssemblePlace == null){
							continue;	//结束本次循环
						}
						
						setAssemblePlace.setCount(count);		//设置区域内车辆个数
						
						setAssemblePlaceList.add(setAssemblePlace);
					}
				}
				
				JSONArray array = JSONArray.fromObject(setAssemblePlaceList.toArray());
				writer(response, array.toString());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * total地图中，报警信息：违规车辆数据处理
	 * @param request
	 * @param response
	 */
	@RequestMapping("/disposeDel")
	public void disposeDel(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		String result = "";
		try {
			ctlIllegalCarMonitorService.disposeDel("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.disposeDel", id);
			result = "success";
		} catch (Exception e) {
			result = "fail";
			e.printStackTrace();
		}
		writer(response, result);
	}
	
	/**
	 * total地图中，特定车辆追踪 页面打开
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("specificCar")
	public String specificCar(){
		return "totalMap/specificCar/specificCar";
	}
	
	/**
	 * total地图中，特定车辆追踪 数据查询
	 * @param vehicleNo
	 */
	@RequestMapping("getSpecificCarList")
	public void getSpecificCarList(HttpServletRequest request,HttpServletResponse response){
		try {
			//页面初始加载，list列表清空
			if(request.getParameter("vehicleNo") == ""){
				specificCarList.clear();
			}
			JSONArray array = JSONArray.fromObject(specificCarList.toArray());
			writer(response, array.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * total地图中，特定车辆追踪：车牌号验证，列表list封装
	 * @param vehicleNo
	 */
	@ResponseBody
	@RequestMapping("vftionVehicleNo")
	public String vftionVehicleNo(String vehicleNo){
		String result = "";
		
		try {
			if(vehicleNo != null){
				//遍历list，查询车牌号是否正在追踪
				for(CtlCarPositionInfo sCar : specificCarList){
					if(vehicleNo.equals(sCar.getVehicle_no())){
						result = "1";	//车牌号正在追踪
						return result;
					}
				}
				
				//获取到要追踪车牌号数据信息
				CtlCarPositionInfo specificCar = ctlCarPositionInfoService.getSpecificCar("com.nasoft.aboutcar.CtlCarPositionInfoMapper.getSpecificCar", vehicleNo);
				if(specificCar != null){
					specificCarList.add(specificCar);
					result = "2";		//添加追踪车牌号
				} else {
					result = "3";		//追踪车牌号不存在
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * total地图中，特定车辆追踪：地图添加追踪轨迹
	 * @param request
	 * @param response
	 */
	@ResponseBody
	@RequestMapping("/toMapAddTrace")
	public List<CtlCarPositionInfo> toMapAddTrace(HttpServletRequest request, HttpServletResponse response){
		try {
			for(CtlCarPositionInfo sCar : specificCarList){
				String vehicleNo = sCar.getVehicle_no();
				//获取车牌号最新数据
				CtlCarPositionInfo specificCar = ctlCarPositionInfoService.getSpecificCar("com.nasoft.aboutcar.CtlCarPositionInfoMapper.getSpecificCar", vehicleNo);
				//list中添加车辆最新数据，并移除上次数据
				if(specificCar != null){
					remAdd(sCar, specificCar);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return specificCarList;
	}
	//判断上次数据是否移除成功，移除成功后才添加最新数据（为了避免一个数据在list中出现多次）
	public void remAdd(CtlCarPositionInfo sCar, CtlCarPositionInfo specificCar){
		Boolean isSuc = specificCarList.remove(sCar);	
		
		if(isSuc == true){
			specificCarList.add(specificCar);
		}
//		else {
//			remAdd(sCar, specificCar);
//		}
	}
	
	/**
	 * total地图中，特定车辆追踪 车辆取消追踪
	 * @param vehicleNo
	 */
	@ResponseBody
	@RequestMapping("deleteCarList")
	public String deleteCarList(HttpServletRequest request,HttpServletResponse response){
		String result = "";
		String operatingids = request.getParameter("operatingids");
		try {
			String[] mngOperatingids = operatingids.split(",");
			for(String vehicleNo : mngOperatingids){
				for(CtlCarPositionInfo sCar : specificCarList){
					if(vehicleNo.equals(sCar.getVehicle_no())){
						specificCarList.remove(sCar);
						break;
					}
				}
			}
			result = "success";	//取消追踪成功
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 运营监测》聚集车辆监管
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("gatherCar")
	public String gatherCar(HttpServletRequest request,Model model){
		return "supervise/gatherCar";
	}
	
	/**
	 * 运行监测》报警车辆查询
	 * @return
	 */
	@RequestMapping("/alarmCarMonitor")
	public String alarmCarMonitor(){
		return "supervise/alarmCarMonitor";
	}
	
	/**
	 * 获取报警车辆列表
	 * @param request
	 * @param response
	 */
	@RequestMapping("/alarmCarMonitorList")
	public void alarmCarMonitorList(HttpServletRequest request,HttpServletResponse response){
		String vehicle_region_code = request.getParameter("vehicle_region_code");
		String company_id = request.getParameter("company_id");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("vehicle_region_code", vehicle_region_code);
		map.put("company_id", company_id);
		
		try {
			List<CtlAlarmCarMonitor> ctlAlarmCarMonitorList = ctlAlarmCarMonitorService.selectAll("com.nasoft.aboutcar.CtlAlarmCarMonitorMapper.findAll", map);
			JSONArray array = JSONArray.fromObject(ctlAlarmCarMonitorList.toArray());
			writer(response, array.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取报警车辆
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getAlarmCar")
	public void getAlarmCar(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<CtlCarPositionInfo> carPositionList = ctlCarPositionInfoService.selectAlarmCar("com.nasoft.aboutcar.CtlCarPositionInfoMapper.findAlarmCar", map);
			JSONArray array = JSONArray.fromObject(carPositionList.toArray());
			writer(response, array.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("realTime")
	public String realTime(HttpServletRequest request,Model model){
		return "supervise/index2";
	}
	//全局运行态势图
	@RequestMapping("globalRunTrend")
	public String globalRunTrend(HttpServletRequest request,Model model){
		return "supervise/globalRunTrend";
	}
	@RequestMapping("getCarPosition")
	public void doLogin(HttpServletRequest request,HttpServletResponse response){
		try {
			List<CtlCarPositionInfo> carPositionList = ctlCarPositionInfoService.findAllCarNewPosition("com.nasoft.aboutcar.CtlCarPositionInfoMapper.findAllCarNewPosition");
			JSONArray array = JSONArray.fromObject(carPositionList.toArray());
			writer(response, array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("lllegal")
	public String lllegal(HttpServletRequest request,Model model){
		return "supervise/lllegalQuery";
	}
	@RequestMapping("lllegalCarSupervise")
	public String lllegalCarSupervise(HttpServletRequest request,Model model){
		return "supervise/lllegalCarSupervise";
	}
	
	/**
	 * 获取违规车辆列表
	 * @param request
	 * @param response
	 */
	@RequestMapping("/illegalCarList")
	public void illegalCarList(HttpServletRequest request, HttpServletResponse response){
		String vehicle_region_code = request.getParameter("vehicle_region_code");
		String company_id = request.getParameter("company_id");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("vehicle_region_code", vehicle_region_code);
		map.put("company_id", company_id);
		List<CtlIllegalCarMonitor> ctlIllegalCarMonitorList = new ArrayList<CtlIllegalCarMonitor>();
		try {
			ctlIllegalCarMonitorList = ctlIllegalCarMonitorService.selectAll("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.findAll", map);
			//设置备注字段
			for(CtlIllegalCarMonitor illCar : ctlIllegalCarMonitorList){
				if("0".equals(illCar.getIllegal_type())){		//禁止驶入
					illCar.setRemark("驶入区域："+illCar.getAreaName());
				}
				else if("1".equals(illCar.getIllegal_type())){	//禁止驶出
					illCar.setRemark("应在经营区域："+illCar.getCityName());
				}
				else if("2".equals(illCar.getIllegal_type())){	//人车不对应
					illCar.setRemark("本应驾驶员："+illCar.getAreaName()+";"+"实际驾驶员："+illCar.getAreaName());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(ctlIllegalCarMonitorList.toArray());
		writer(response, array.toString());
	}
	
	/**
	 * 违规车辆明细
	 * @return
	 */
	@RequestMapping("/illegalCarDetail")
	public ModelAndView illegalCarDetail(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		String id = request.getParameter("id");
		try {
			CtlIllegalCarMonitor ctlIllegalCarMonitor = ctlIllegalCarMonitorService.findIllegalCarById("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.findById", id);
			mv.setViewName("supervise/illegalCarMap");
			mv.addObject(ctlIllegalCarMonitor);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv; 
	}
	
	/**
	 * <p>查找违规车辆<br>
	 * 定时任务执行->获取车辆最新定位信息</p>
	 * @return
	 */
	@RequestMapping("/findIllegalCar")
	public ModelAndView findIllegalCar(){
		ModelAndView mv = new ModelAndView();
		List<CtlCarPositionInfo> newCarPositionList = null;
		ArrayList<HashMap<String,Object>> list = new ArrayList<>();
		try {
			//获取车辆最新定位信息
			newCarPositionList = ctlCarPositionInfoService.findAllCarNewPosition("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.findCarNewPosition");
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(CtlCarPositionInfo carPosition : newCarPositionList){
			HashMap<String,Object> map = new HashMap<>();
			map.put("lng", carPosition.getLongitude());
			map.put("lat", carPosition.getLatitude());
			list.add(map);
		}
		mv.addObject("mapSign", list.toString());
		mv.addObject("timer", "timer");
		mv.setViewName("supervise/illegalCarMap");
		
		return mv;
	}
	
	/**
	 * 获取车辆最新定位信息
	 * @param response
	 */
	@RequestMapping("findNewPositionInfo")
	public void findNewPositionInfo(HttpServletResponse response){
		ArrayList<HashMap<String,Object>> list = new ArrayList<>();
		List<CtlCarPositionInfo> newCarPositionList = null;
		//获取车辆最新定位信息
		try {
			newCarPositionList = ctlCarPositionInfoService.findAllCarNewPosition("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.findCarNewPosition");
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(CtlCarPositionInfo carPosition : newCarPositionList){
			HashMap<String,Object> map = new HashMap<>();
			map.put("lng", carPosition.getLongitude());
			map.put("lat", carPosition.getLatitude());
			map.put("veh", carPosition.getVehicle_no());//车牌号
			map.put("id", carPosition.getId());
			list.add(map);
		}
		JSONArray array = JSONArray.fromObject(list.toArray());
		writer(response, array.toString());
	}
	
	/**
	 * 添加聚集车辆
	 * @param req
	 */
	@RequestMapping("andGatherCar")
	public void andGatherCar(HttpServletRequest request,HttpServletResponse response){
		String ids = request.getParameter("ids");
		String[] idStr = ids.split(",");
		try {
			ctlAssembleCarMonitorService.addAssembleCar("com.nasoft.aboutcar.CtlAssembleCarMonitorMapper.addAssembleCar", idStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	/**
	 * 运行监测》车辆历史轨迹查询
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("trace")
	public String trace(HttpServletRequest request,Model model){
		return "supervise/tracePlayback";
	}
	
	/**
	 * 根据车牌号和定位时间获取车辆行驶历史轨迹
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getLngLat")
	public void getLngLat(HttpServletRequest request, HttpServletResponse response){
		String vehicle_no = request.getParameter("vehicleno");
		String begintime = request.getParameter("begintime");
		String endtime = request.getParameter("endtime");
//		begintime = begintime.replace("-", "")+"000000";
//		endtime = endtime.replace("-", "")+"235959";
		begintime = begintime+" 00:00:00";
		endtime = endtime+" 23:59:59";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("vehicle_no", vehicle_no);
		map.put("begintime", begintime);
		map.put("endtime", endtime);
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<CtlCarPositionInfo> ctlCarPositionInfoList = new ArrayList<CtlCarPositionInfo>();
		try {
			ctlCarPositionInfoList = ctlCarPositionInfoService.selectAll("com.nasoft.aboutcar.CtlCarPositionInfoMapper.findAllCarPositionInfoH", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(null != ctlCarPositionInfoList){
			for(CtlCarPositionInfo ctlCarPositionInfo : ctlCarPositionInfoList){
				if(null == ctlCarPositionInfo){
					continue;
				}
				HashMap<String, Object> hashmap = new HashMap<String, Object>();
				hashmap.put("lng", ctlCarPositionInfo.getLongitude());
				hashmap.put("lat", ctlCarPositionInfo.getLatitude());
				hashmap.put("owners", ctlCarPositionInfo.getMancompany());
				hashmap.put("vehicleNo", ctlCarPositionInfo.getVehicle_no());
				list.add(hashmap);
			}
		}
		
		JSONArray array = JSONArray.fromObject(list);
		writer(response, array.toString());
	}
	
	/**
     * 驾驶员违章违法信息列表
     */
	@RequestMapping("driverwzwfList")
	public String driverwzwfList(HttpServletRequest request,Model model){
		
		return "supervise/driverwzwfList";
	}
	
	@RequestMapping("driverwzwfFindAll")
	public void driverwzwfFindAll(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mv=new ModelAndView();
		String name = request.getParameter("name");
		String company_name = request.getParameter("company_name");
		String begin_time = request.getParameter("begin_time");
		String end_time = request.getParameter("end_time");
		Map<String, Object> map = new HashMap<String, Object>();
		if(end_time!=null && !end_time.equals("")){
			int endtime = Integer.parseInt(end_time.substring(9))+1;
			end_time=end_time.substring(0,9)+String.valueOf(endtime);
			map.put("end_time", end_time);	
			System.out.println(end_time);
			  }	
		map.put("name", name);
		map.put("company_name", company_name);
		map.put("begin_time", begin_time);
		//map.put("end_time", end_time);
		List<DrvIllegalInfo> drvIllegalInfoList = new ArrayList<DrvIllegalInfo>();
		try {
			drvIllegalInfoList = ctlIllegalCarMonitorService.DrvIllegalInfofindAll("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.DrvIllegalInfofindAll", map);
			for(DrvIllegalInfo m :drvIllegalInfoList ){
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date illegal_time =df.parse(m.getIllegal_time());
				m.setIllegal_time(df.format(illegal_time));
			}
			/*List<Platform> platformList = plantCaseInfoService.selectAllPlatForm("com.nasoft.aboutcar.administrativePenalty.selectAllPlatForm");
			mv.addObject("platformList", platformList);
			mv.setViewName("supervise/driverwzwfList");*/
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(drvIllegalInfoList.toArray());
		writer(response, array.toString());
		//return mv;
		
	}
	
	/**
     * 驾驶员违章违法信息判定
     */
	@RequestMapping("driverwzwfDetermine")
	public ModelAndView driverwzwfDetermine(HttpServletRequest request,HttpServletResponse response,String drv_illegal_id){
		
		ModelAndView mv=new ModelAndView();
		try {
			DrvIllegalInfo drvIllegalInfo=ctlIllegalCarMonitorService.DrvIllegalInfofindById("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.DrvIllegalInfofindById", drv_illegal_id);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date illegal_time =df.parse(drvIllegalInfo.getIllegal_time());
			drvIllegalInfo.setIllegal_time(df.format(illegal_time));
			mv.addObject("drvIllegalInfo", drvIllegalInfo);
			mv.setViewName("supervise/driverwzwfDetermine");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("driverwzwfAddDetermine")
	public ModelAndView driverwzwfAddDetermine(HttpServletRequest request,HttpServletResponse response,String status,String drv_illegal_id,String decision_result,String notice_status,String certno){
		ModelAndView mv=new ModelAndView();
		String msg="";
		DrvIllegalInfo drvIllegalInfo = new DrvIllegalInfo();
		drvIllegalInfo.setCertno(certno);
		drvIllegalInfo.setDecision_result(decision_result);
		drvIllegalInfo.setNotice_status(notice_status);
		drvIllegalInfo.setDrv_illegal_id(drv_illegal_id);
		drvIllegalInfo.setStatus(status);
		try {
			 ctlIllegalCarMonitorService.updateDetermine("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.updateDetermine",drvIllegalInfo);
			if(notice_status.equals("2")){
				addMsgNotice(request,certno,"您的违章违法信息已判定！");//增加消息通知记录

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
	
	/**
     * 驾驶员违章违法信息导入
     */
	@RequestMapping("driverwzwfImport")
	public String zfxxImport(HttpServletRequest request,Model model){
		return "supervise/driverwzwfImport";
	}
	
	/**
	 * 导入驾驶员违章违法信息
	 * @param request
	 * @param excelFile
	 * @return
	 */
	@RequestMapping("/drvimportExcel")
	public String importExcel(HttpServletRequest request,@RequestParam(value="excelFile",required=false) MultipartFile excelFile){
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
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			for(int i=2;i<sheet.getLastRowNum()+1;i++){
				Row row = sheet.getRow(i);
				if(row != null){
					 Date date = new Date();
					 SimpleDateFormat sf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
					 String newdate = sf.format(date);
					 String drv_illegal_id = newdate.substring(2,4)+newdate.substring(11,13)+newdate.substring(14,16)+newdate.substring(17)+i;
					//MngExamBespeak mngExamBespeak = new MngExamBespeak();
					//编号
					// drv_illegal_id = getCellValue(row.getCell(0));
					//姓名
					String name = getCellValue(row.getCell(1));
					//身份证号
					String certno = getCellValue(row.getCell(2));
					//所属平台ID
					String company_id = getCellValue(row.getCell(3));
					//所属平台名称
					String company_name = getCellValue(row.getCell(4));
					//车牌号
					String car_num = getCellValue(row.getCell(5));
					//行政区域
					String areacode = getCellValue(row.getCell(6));
					//手机号
					String phone_number = getCellValue(row.getCell(7));
					//订单编号
					String order_id = getCellValue(row.getCell(8));
					//违章来源
					String illegal_source = getCellValue(row.getCell(9));
					//违章内容
					String illegal_content = getCellValue(row.getCell(10));
					//是否审核
					String status = getCellValue(row.getCell(11));
					//违章时间
					String illegal_time = getDate(row.getCell(12));
					if("未判定".equals(status)){
						status = "1";
					}else if("已判定".equals(status)){
						status = "2";
					}
					List<Map> m = new ArrayList<Map>();
					//对驾驶员身份证号进行验证
					m = ctlIllegalCarMonitorService.findXzspCertno("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.findXzspCertno");
					for (int j = 0; j < m.size(); j++) {
					DrvIllegalInfo drvIllegalInfo = new DrvIllegalInfo();
					//对各个单元格的值进行验证
					if(drv_illegal_id!=null&&drv_illegal_id!=""
							&&name!=null&&name!=""
							&&certno!=null&&certno!=""&&certno.equals(m.get(j).get("certno"))
							&&company_id!=null&&company_id!=""
							&&company_name!=null&&company_name!=""
							&&car_num!=null&&car_num!=""
							&&areacode!=null&&areacode!=""
							&&phone_number!=null&&phone_number!=""
							&&order_id!=null&&order_id!=""
							&&illegal_source!=null&&illegal_source!=""
							&&illegal_content!=null&&illegal_content!=""
							&&status!=null&&status!=""
							&&illegal_time!=null&&illegal_time!=""){
					drvIllegalInfo.setDrv_illegal_id(drv_illegal_id);
					drvIllegalInfo.setName(name);
					drvIllegalInfo.setCertno(certno);
					drvIllegalInfo.setCompany_id(company_id);
					drvIllegalInfo.setCompany_name(company_name);
					drvIllegalInfo.setCar_num(car_num);
					drvIllegalInfo.setAreacode(areacode);
					drvIllegalInfo.setPhone_number(phone_number);
					drvIllegalInfo.setOrder_id(order_id);
					drvIllegalInfo.setIllegal_source(illegal_source);
					drvIllegalInfo.setIllegal_content(illegal_content);
					drvIllegalInfo.setStatus(status);
					drvIllegalInfo.setIllegal_time(illegal_time);
					
				 ctlIllegalCarMonitorService.addDriverwzwf("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.addDriverwzwf", drvIllegalInfo);
					}
				}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "supervise/driverwzwfList";
	}
	/**
	 * 对Excel的各个单元格的格式进行判断并转换
	 */
	private String getCellValue(Cell cell) {
        String cellValue = "";
        DecimalFormat df = new DecimalFormat("#");
		if(cell==null){
			return cellValue;		
		}
        switch (cell.getCellType()) {
        case HSSFCell.CELL_TYPE_STRING:
            cellValue =cell.getRichStringCellValue().getString().trim();
            break;
        case HSSFCell.CELL_TYPE_NUMERIC:
            cellValue =df.format(cell.getNumericCellValue()).toString();
            break;
        case HSSFCell.CELL_TYPE_BOOLEAN:
            cellValue =String.valueOf(cell.getBooleanCellValue()).trim();
            break;
        case HSSFCell.CELL_TYPE_FORMULA:
            cellValue =cell.getCellFormula();
            break;
        default:
            cellValue = "";
        }
        return cellValue;
	}
	/**
	 * 对Excel的日期单元格进行判断转换
	 */
	private String getDate(Cell Cell){
        DecimalFormat df = new DecimalFormat("#");
        if(Cell == null){
            return "";
        }
        switch (Cell.getCellType()){
        case HSSFCell.CELL_TYPE_NUMERIC:
            if(HSSFDateUtil.isCellDateFormatted(Cell)){
                SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");

                return sdf.format(HSSFDateUtil.getJavaDate(Cell.getNumericCellValue()));
            }

                return df.format(Cell.getNumericCellValue());
        case HSSFCell.CELL_TYPE_STRING:
            return Cell.getStringCellValue();
        case HSSFCell.CELL_TYPE_FORMULA:
            return Cell.getCellFormula();
        case HSSFCell.CELL_TYPE_BLANK:
            return "";

        }
    return "";


    }
	
	/**
     * 驾驶员违章违法审核列表
     */
	@RequestMapping("/driverwzwfexamineList")
	public String driverwzwfexamineList(HttpServletRequest request,Model model){
		return "supervise/driverwzwfexamineList";
	}
	
	@RequestMapping("driverexamineFindAll")
	public void driverexamineFindAll(HttpServletRequest request,HttpServletResponse response){
		String name = request.getParameter("name");
		String company_name = request.getParameter("company_name");
		String begin_time = request.getParameter("begin_time");
		String end_time = request.getParameter("end_time");
		Map<String, Object> map = new HashMap<String, Object>();
		if(end_time!=null && !end_time.equals("")){
			int endtime = Integer.parseInt(end_time.substring(9))+1;
			end_time=end_time.substring(0,9)+String.valueOf(endtime);
			map.put("end_time", end_time);	
			System.out.println(end_time);
			  }	
		map.put("name", name);
		map.put("company_name", company_name);
		map.put("begin_time", begin_time);
		//map.put("end_time", end_time);
		List<DrvIllegalInfo> drvIllegalInfoList = new ArrayList<DrvIllegalInfo>();
		try {
			drvIllegalInfoList = ctlIllegalCarMonitorService.driverexamineFindAll("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.driverexamineFindAll", map);
			for(DrvIllegalInfo m :drvIllegalInfoList ){
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date illegal_time =df.parse(m.getIllegal_time());
				m.setIllegal_time(df.format(illegal_time));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(drvIllegalInfoList.toArray());
		writer(response, array.toString());
		
	}
	
	/**
     * 驾驶员违章违法审核
     */
	@RequestMapping("driverwzwfExamine")
	public ModelAndView driverwzwfExamine(HttpServletRequest request,HttpServletResponse response,String drv_illegal_id){
		
		ModelAndView mv=new ModelAndView();
		try {
			DrvIllegalInfo drvIllegalInfo=ctlIllegalCarMonitorService.DrvIllegalInfofindById("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.DrvIllegalInfofindById", drv_illegal_id);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date illegal_time =df.parse(drvIllegalInfo.getIllegal_time());
			drvIllegalInfo.setIllegal_time(df.format(illegal_time));
			mv.addObject("drvIllegalInfo", drvIllegalInfo);
			mv.setViewName("supervise/driverwzwfExamine");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("driverwzwfAddExamine")
	public ModelAndView driverwzwfAddExamine(HttpServletRequest request,HttpServletResponse response,DrvIllegalInfo drvIllegalInfo,String status,String drv_illegal_id,String check_result,String notice_status,String decision_result){
		ModelAndView mv=new ModelAndView();
		//int d = (int)(Math.random()*(99999999-10000000+1))+10000000;
		
		String msg="";
		DrvPlantCaseInfo drvCaseInfo = new DrvPlantCaseInfo();
		String caseId = "C"+drvIllegalInfo.getDrv_illegal_id();
		String punishId = "D"+drvIllegalInfo.getDrv_illegal_id();
		//DrvIllegalInfo drvIllegalInfo = new DrvIllegalInfo();
		drvCaseInfo.setCaseid(caseId);
		drvCaseInfo.setPunishid(punishId);
		drvCaseInfo.setPlateName(drvIllegalInfo.getCompany_name());
		drvCaseInfo.setCarid(drvIllegalInfo.getCar_num());
		drvCaseInfo.setDrivcarno(drvIllegalInfo.getCertno());
		drvCaseInfo.setAreacode(drvIllegalInfo.getAreacode());
		drvCaseInfo.setCasetime(drvIllegalInfo.getIllegal_time());
		drvCaseInfo.setCasereason(drvIllegalInfo.getIllegal_content());
		drvCaseInfo.setDrivename(drvIllegalInfo.getName());
		drvCaseInfo.setUpdatetime(DateUtil.DateTimeFormat(new Date()));
		MngUserInfo currentUser = getCurrentUser();
		drvCaseInfo.setCaseuserid(currentUser.getRealName());
		drvCaseInfo.setCreateinstid(currentUser.getInstId());
		drvCaseInfo.setInstid(currentUser.getInstId());
		
		drvIllegalInfo.setCheck_result(check_result);
		drvIllegalInfo.setDecision_result(decision_result);
		drvIllegalInfo.setNotice_status(notice_status);
		drvIllegalInfo.setDrv_illegal_id(drv_illegal_id);
		drvIllegalInfo.setStatus(status);
		try {
			 ctlIllegalCarMonitorService.updateExamine("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.updateExamine",drvIllegalInfo);
			 ctlIllegalCarMonitorService.insertdrvcaseinfo("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.insertdrvcaseinfo",drvCaseInfo);
				
			mv.addObject("msg","success");
			mv.setViewName("save_result");
		} catch (Exception e) {
			mv.addObject("msg","failed");
			e.printStackTrace();
		}
		return mv;
	}
	/**
     * 驾驶员执法行动录入列表
     */
	@RequestMapping("/driverlawaddList")
	public String driverlawaddList(HttpServletRequest request,Model model){
		return "supervise/driverlawaddList";
	}
	
	@RequestMapping("driverlawaddFindAll")
	public void driverlawaddFindAll(HttpServletRequest request,HttpServletResponse response){
		String name = request.getParameter("name");
		String enforcer = request.getParameter("enforcer");
		String begin_time = request.getParameter("begin_time");
		String end_time = request.getParameter("end_time");
		Map<String, Object> map = new HashMap<String, Object>();
		if(end_time!=null && !end_time.equals("")){
			int endtime = Integer.parseInt(end_time.substring(9))+1;
			end_time=end_time.substring(0,9)+String.valueOf(endtime);
			map.put("end_time", end_time);	
			System.out.println(end_time);
			  }	
		map.put("name", name);
		map.put("enforcer", enforcer);
		map.put("begin_time", begin_time);
		//map.put("end_time", end_time);
		List<DrvActionInfo> drvActionInfoList = new ArrayList<DrvActionInfo>();
		try {
			drvActionInfoList = ctlIllegalCarMonitorService.driverlawaddFindAll("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.driverlawaddFindAll", map);
			for(DrvActionInfo m :drvActionInfoList ){
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date action_time =df.parse(m.getAction_time());
				m.setAction_time(df.format(action_time));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(drvActionInfoList.toArray());
		writer(response, array.toString());
		
	}
	
	 /**
     * 驾驶员执法行动录入
     */
	@RequestMapping("driverlawAdd")
	public String driverlawAdd(HttpServletRequest request,Model model){
		
		return "supervise/driverlawAdd";
	}
	
	@RequestMapping("driverlawInsert")
	public ModelAndView driverlawInsert(HttpServletRequest request,HttpServletResponse response,String name,String certno,String illegal_content,String enforcer,String action_time,String action_result){
		ModelAndView mv=new ModelAndView();
		String msg="";
		DrvActionInfo drvActionInfo = new DrvActionInfo();
		drvActionInfo.setName(name);
		drvActionInfo.setCertno(certno);
		drvActionInfo.setIllegal_content(illegal_content);
		drvActionInfo.setEnforcer(enforcer);
		drvActionInfo.setAction_time(action_time);
		drvActionInfo.setAction_result(action_result);
		try {
			 ctlIllegalCarMonitorService.DriverlawInsert("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.DriverlawInsert",drvActionInfo);
			mv.addObject("msg","success");
			mv.setViewName("save_result");
		} catch (Exception e) {
			mv.addObject("msg","failed");
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
     * 车辆违章违法信息列表
     */
	@RequestMapping("carwzwfList")
	public String carwzwfList(HttpServletRequest request,Model model){
		return "supervise/carwzwfList";
	}
	
	@RequestMapping("carwzwfFindAll")
	public void carwzwfFindAll(HttpServletRequest request,HttpServletResponse response){
		String car_num = request.getParameter("car_num");
		String driver_name = request.getParameter("driver_name");
		String company_name = request.getParameter("company_name");
		String begin_time = request.getParameter("begin_time");
		String end_time = request.getParameter("end_time");
		Map<String, Object> map = new HashMap<String, Object>();
		if(end_time!=null && !end_time.equals("")){
			int endtime = Integer.parseInt(end_time.substring(9))+1;
			end_time=end_time.substring(0,9)+String.valueOf(endtime);
			map.put("end_time", end_time);	
			System.out.println(end_time);
			  }	
		map.put("car_num", car_num);
		map.put("company_name", company_name);
		map.put("begin_time", begin_time);
		//map.put("end_time", end_time);
		map.put("driver_name", driver_name);
		List<CarIllegalInfo> carIllegalInfoList = new ArrayList<CarIllegalInfo>();
		try {
			carIllegalInfoList = ctlIllegalCarMonitorService.CarIllegalInfofindAll("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.CarIllegalInfofindAll", map);
			for(CarIllegalInfo m :carIllegalInfoList ){
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date illegal_time =df.parse(m.getIllegal_time());
				m.setIllegal_time(df.format(illegal_time));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(carIllegalInfoList.toArray());
		writer(response, array.toString());
		
	}
	
	/**
     * 车辆违章违法信息判定
     */
	@RequestMapping("carwzwfDetermine")
public ModelAndView carwzwfDetermine(HttpServletRequest request,HttpServletResponse response,String car_illegal_id){
		
		ModelAndView mv=new ModelAndView();
		try {
			CarIllegalInfo carIllegalInfo=ctlIllegalCarMonitorService.CarIllegalInfofindById("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.CarIllegalInfofindById", car_illegal_id);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date illegal_time =df.parse(carIllegalInfo.getIllegal_time());
			carIllegalInfo.setIllegal_time(df.format(illegal_time));
			mv.addObject("carIllegalInfo", carIllegalInfo);
			mv.setViewName("supervise/carwzwfDetermine");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("carwzwfAddDetermine")
	public ModelAndView carwzwfAddDetermine(HttpServletRequest request,HttpServletResponse response,String status,String car_illegal_id,String decision_result,String notice_status, String certno){
		ModelAndView mv=new ModelAndView();
		String msg="";
		CarIllegalInfo carIllegalInfo = new CarIllegalInfo();
		carIllegalInfo.setDecision_result(decision_result);
		carIllegalInfo.setNotice_status(notice_status);
		carIllegalInfo.setCar_illegal_id(car_illegal_id);
		carIllegalInfo.setStatus(status);
		carIllegalInfo.setDriver_certno(certno);
		try {
			 ctlIllegalCarMonitorService.updatecarDetermine("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.updatecarDetermine",carIllegalInfo);
			
			 if(notice_status.equals("2")){
					addMsgNotice(request,certno,"您的违章违法信息已判定！");//增加消息通知记录

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
     * 车辆违章违法信息导入
     */
	@RequestMapping("carwzwfImport")
	public String carwzwfImport(HttpServletRequest request,Model model){
		return "supervise/carwzwfImport";
	}
	
	/**
	 * 导入车辆违章违法信息
	 * @param request
	 * @param excelFile
	 * @return
	 */
	@RequestMapping("/carimportExcel")
	public String importcarExcel(HttpServletRequest request,@RequestParam(value="excelFile",required=false) MultipartFile excelFile){
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
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			for(int i=2;i<sheet.getLastRowNum()+1;i++){
				 Date date = new Date();
				 SimpleDateFormat sf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
				 String newdate = sf.format(date);
				 String car_illegal_id = newdate.substring(2,4)+newdate.substring(11,13)+newdate.substring(14,16)+newdate.substring(17)+i;
				Row row = sheet.getRow(i);
				if(row != null){
					//MngExamBespeak mngExamBespeak = new MngExamBespeak();
					//编号
					//String car_illegal_id = getCellValue(row.getCell(0));
					//车牌号
					String car_num = getCellValue(row.getCell(1));
					//姓名
					String driver_name = getCellValue(row.getCell(2));
					//身份证
					String driver_certno = getCellValue(row.getCell(3));
					//所属平台ID
					String company_id = getCellValue(row.getCell(4));
					//所属平台名称
					String company_name = getCellValue(row.getCell(5));
					//行政区域
					String areacode = getCellValue(row.getCell(6));
					//手机号
					String phone_number = getCellValue(row.getCell(7));
					//订单编号
					String order_id = getCellValue(row.getCell(8));
					//违章来源
					String illegal_source = getCellValue(row.getCell(9));
					//违章内容
					String illegal_content = getCellValue(row.getCell(10));
					//是否审核
					String status = getCellValue(row.getCell(11));
					//违章时间
					String illegal_time = getDate(row.getCell(12));
					if("未判定".equals(status)){
						status = "1";
					}else if("已判定".equals(status)){
						status = "2";
					}
					List<Map> m = new ArrayList<Map>();
					//对驾驶员身份证号进行验证
					m = ctlIllegalCarMonitorService.findXzspCertno("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.findXzspCertno");
					for (int j = 0; j < m.size(); j++) {
					CarIllegalInfo carIllegalInfo = new CarIllegalInfo();
					//对各个单元格的值进行验证
					if(car_illegal_id!=null&&car_illegal_id!=""
							&&car_num!=null&&car_num!=""
							&&driver_name!=null&&driver_name!=""
							&&driver_certno!=null&&driver_certno!=""&&driver_certno.equals(m.get(j).get("certno"))
							&&company_id!=null&&company_id!=""
							&&company_name!=null&&company_name!=""
							&&areacode!=null&&areacode!=""
							&&phone_number!=null&&phone_number!=""
							&&order_id!=null&&order_id!=""
							&&illegal_source!=null&&illegal_source!=""
							&&illegal_content!=null&&illegal_content!=""
							&&status!=null&&status!=""
							&&illegal_time!=null&&illegal_time!=""){
					carIllegalInfo.setCar_illegal_id(car_illegal_id);
					carIllegalInfo.setCar_num(car_num);
					carIllegalInfo.setDriver_name(driver_name);
					carIllegalInfo.setDriver_certno(driver_certno);
					carIllegalInfo.setCompany_id(company_id);
					carIllegalInfo.setCompany_name(company_name);
					carIllegalInfo.setAreacode(areacode);
					carIllegalInfo.setPhone_number(phone_number);
					carIllegalInfo.setOrder_id(order_id);
					carIllegalInfo.setIllegal_source(illegal_source);
					carIllegalInfo.setIllegal_content(illegal_content);
					carIllegalInfo.setStatus(status);
					carIllegalInfo.setIllegal_time(illegal_time);
					
				 ctlIllegalCarMonitorService.addCarwzwf("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.addCarwzwf", carIllegalInfo);
					}
				}
			}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "supervise/carwzwfList";
	}
	
	/**
     * 车辆违章违法审核列表
     */
	@RequestMapping("/carwzwfexamineList")
	public String carwzwfexamineList(HttpServletRequest request,Model model){
		return "supervise/carwzwfexamineList";
	}
	
	@RequestMapping("carexamineFindAll")
	public void carexamineFindAll(HttpServletRequest request,HttpServletResponse response){
		String car_num = request.getParameter("car_num");
		String company_name = request.getParameter("company_name");
		String begin_time = request.getParameter("begin_time");
		String end_time = request.getParameter("end_time");
		Map<String, Object> map = new HashMap<String, Object>();
		if(end_time!=null && !end_time.equals("")){
			int endtime = Integer.parseInt(end_time.substring(9))+1;
			end_time=end_time.substring(0,9)+String.valueOf(endtime);
			map.put("end_time", end_time);	
			System.out.println(end_time);
			  }	
		map.put("car_num", car_num);
		map.put("company_name", company_name);
		map.put("begin_time", begin_time);
		//map.put("end_time", end_time);
		List<CarIllegalInfo> carIllegalInfoList = new ArrayList<CarIllegalInfo>();
		try {
			carIllegalInfoList = ctlIllegalCarMonitorService.carexamineFindAll("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.carexamineFindAll", map);
			for(CarIllegalInfo m :carIllegalInfoList ){
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date illegal_time =df.parse(m.getIllegal_time());
				m.setIllegal_time(df.format(illegal_time));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(carIllegalInfoList.toArray());
		writer(response, array.toString());
		
	}
	
	/**
     * 车辆违章违法审核
     */
	@RequestMapping("/carwzwfExamine")
public ModelAndView carwzwfExamine(HttpServletRequest request,HttpServletResponse response,String car_illegal_id){
		
		ModelAndView mv=new ModelAndView();
		try {
			CarIllegalInfo carIllegalInfo=ctlIllegalCarMonitorService.CarIllegalInfofindById("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.CarIllegalInfofindById", car_illegal_id);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date illegal_time =df.parse(carIllegalInfo.getIllegal_time());
			carIllegalInfo.setIllegal_time(df.format(illegal_time));
			mv.addObject("carIllegalInfo", carIllegalInfo);
			mv.setViewName("supervise/carwzwfExamine");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("carwzwfAddExamine")
	public ModelAndView carwzwfAddExamine(HttpServletRequest request,HttpServletResponse response,CarIllegalInfo carIllegalInfo,String status,String car_illegal_id,String check_result,String notice_status,String decision_result){
		ModelAndView mv=new ModelAndView();
		//int d = (int)(Math.random()*(99999999-10000000+1))+10000000;
		String caseId = "C"+carIllegalInfo.getCar_illegal_id();
		String punishId = "D"+carIllegalInfo.getCar_illegal_id();
		String msg="";
		DrvPlantCaseInfo drvCaseInfo = new DrvPlantCaseInfo();
		drvCaseInfo.setCaseid(caseId);
		drvCaseInfo.setPunishid(punishId);
		drvCaseInfo.setPlateName(carIllegalInfo.getCompany_name());
		drvCaseInfo.setCarid(carIllegalInfo.getCar_num());
		drvCaseInfo.setDrivcarno(carIllegalInfo.getDriver_certno());
		drvCaseInfo.setAreacode(carIllegalInfo.getAreacode());
		drvCaseInfo.setCasetime(carIllegalInfo.getIllegal_time());
		drvCaseInfo.setCasereason(carIllegalInfo.getIllegal_content());
		drvCaseInfo.setDrivename(carIllegalInfo.getDriver_name());
		drvCaseInfo.setUpdatetime(DateUtil.DateTimeFormat(new Date()));
		MngUserInfo currentUser = getCurrentUser();
		drvCaseInfo.setCaseuserid(currentUser.getRealName());
		drvCaseInfo.setCreateinstid(currentUser.getInstId());
		drvCaseInfo.setInstid(currentUser.getInstId());
		
		
		carIllegalInfo.setCheck_result(check_result);
		carIllegalInfo.setDecision_result(decision_result);
		carIllegalInfo.setNotice_status(notice_status);
		carIllegalInfo.setCar_illegal_id(car_illegal_id);
		carIllegalInfo.setStatus(status);
		try {
			 ctlIllegalCarMonitorService.updatecarExamine("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.updatecarExamine",carIllegalInfo);
			// ctlIllegalCarMonitorService.insertdrvcaseinfo("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.insertcarcaseinfo",drvCaseInfo);
				
			mv.addObject("msg","success");
			mv.setViewName("save_result");
		} catch (Exception e) {
			mv.addObject("msg","failed");
			e.printStackTrace();
		}
		return mv;
	}
		
	/**
     * 车辆执法行动录入列表
     */
	@RequestMapping("/carlawaddList")
	public String carlawaddList(HttpServletRequest request,Model model){
		return "supervise/carlawaddList";
	}
	
	@RequestMapping("carlawaddFindAll")
	public void carlawaddFindAll(HttpServletRequest request,HttpServletResponse response){
		String car_num = request.getParameter("car_num");
		String enforcer = request.getParameter("enforcer");
		String begin_time = request.getParameter("begin_time");
		String end_time = request.getParameter("end_time");
		Map<String, Object> map = new HashMap<String, Object>();
		if(end_time!=null && !end_time.equals("")){
			int endtime = Integer.parseInt(end_time.substring(9))+1;
			end_time=end_time.substring(0,9)+String.valueOf(endtime);
			map.put("end_time", end_time);	
			System.out.println(end_time);
			  }	
		map.put("car_num", car_num);
		map.put("enforcer", enforcer);
		map.put("begin_time", begin_time);
		//map.put("end_time", end_time);
		List<CarActionInfo> carActionInfoList = new ArrayList<CarActionInfo>();
		try {
			carActionInfoList = ctlIllegalCarMonitorService.carlawaddFindAll("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.carlawaddFindAll", map);
			for(CarActionInfo m :carActionInfoList ){
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date enforcement_time =df.parse(m.getEnforcement_time());
				m.setEnforcement_time(df.format(enforcement_time));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(carActionInfoList.toArray());
		writer(response, array.toString());
		
	}
	
	 /**
     * 车辆执法行动录入
     */
	@RequestMapping("/carlawAdd")
	public String carlawAdd(){
		return "supervise/carlawAdd";
	}
	
	@RequestMapping("carlawInsert")
	public ModelAndView carlawInsert(HttpServletRequest request,HttpServletResponse response,String car_num,String engine_number,String illegal_content,String enforcer,String enforcement_time,String enforcement_result){
		ModelAndView mv=new ModelAndView();
		String msg="";
		CarActionInfo carActionInfo = new CarActionInfo();
		carActionInfo.setCar_num(car_num);
		carActionInfo.setEngine_number(engine_number);
		carActionInfo.setIllegal_content(illegal_content);
		carActionInfo.setEnforcer(enforcer);
		carActionInfo.setEnforcement_time(enforcement_time);
		carActionInfo.setEnforcement_result(enforcement_result);
		try {
			 ctlIllegalCarMonitorService.CarlawInsert("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.CarlawInsert",carActionInfo);
			
				//addMsgNotice(request,"您的违章违法信息已 判定！");//增加消息通知记录
			
			mv.addObject("msg","success");
			mv.setViewName("save_result");
		} catch (Exception e) {
			mv.addObject("msg","failed");
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
     * 驾驶员违规行为查询列表
     */
	@RequestMapping("/drvillegalSearchList")
	public String drvillegalSearchList(HttpServletRequest request,Model model){
		return "supervise/drvillegalSearchList";
	}
	
	@RequestMapping("drvillegalSearch")
	public void drvillegalSearch(HttpServletRequest request,HttpServletResponse response){
		String name = request.getParameter("name");
		String company_name = request.getParameter("company_name");
		String begin_time = request.getParameter("begin_time");
		String end_time = request.getParameter("end_time");
		Map<String, Object> map = new HashMap<String, Object>();
		if(end_time!=null && !end_time.equals("")){
			int endtime = Integer.parseInt(end_time.substring(9))+1;
			end_time=end_time.substring(0,9)+String.valueOf(endtime);
			map.put("end_time", end_time);	
			System.out.println(end_time);
			  }	
		map.put("name", name);
		map.put("company_name", company_name);
		map.put("begin_time", begin_time);
		//map.put("end_time", end_time);
		List<DrvIllegalInfo> drvIllegalInfoList = new ArrayList<DrvIllegalInfo>();
		try {
			drvIllegalInfoList = ctlIllegalCarMonitorService.drvillegalSearch("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.drvillegalSearch", map);
			for(DrvIllegalInfo m :drvIllegalInfoList ){
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date illegal_time =df.parse(m.getIllegal_time());
				m.setIllegal_time(df.format(illegal_time));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(drvIllegalInfoList.toArray());
		writer(response, array.toString());
		
	}
	
	/**
     * 驾驶员违规行为详细列表
     */
	@RequestMapping("drvillegalSearchDetails")
	public ModelAndView drvillegalSearchDetails(HttpServletRequest request,HttpServletResponse response,String drv_illegal_id){
		
		ModelAndView mv=new ModelAndView();
		try {
			DrvIllegalInfo drvIllegalInfo=ctlIllegalCarMonitorService.DrvIllegalInfofindById("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.DrvIllegalInfofindById", drv_illegal_id);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date illegal_time =df.parse(drvIllegalInfo.getIllegal_time());
			drvIllegalInfo.setIllegal_time(df.format(illegal_time));
			mv.addObject("drvIllegalInfo", drvIllegalInfo);
			mv.setViewName("supervise/drvillegalSearchDetails");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
     * 车辆违规行为查询列表
     */
	@RequestMapping("/carillegalSearchList")
	public String carillegalSearchList(HttpServletRequest request,Model model){
		return "supervise/carillegalSearchList";
	}
	
	@RequestMapping("carillegalSearch")
	public void carillegalSearch(HttpServletRequest request,HttpServletResponse response){
		String car_num = request.getParameter("car_num");
		String driver_name = request.getParameter("driver_name");
		String company_name = request.getParameter("company_name");
		String begin_time = request.getParameter("begin_time");
		String end_time = request.getParameter("end_time");
		Map<String, Object> map = new HashMap<String, Object>();
		if(end_time!=null && !end_time.equals("")){
			int endtime = Integer.parseInt(end_time.substring(9))+1;
			end_time=end_time.substring(0,9)+String.valueOf(endtime);
			map.put("end_time", end_time);	
			System.out.println(end_time);
			  }	
		map.put("car_num", car_num);
		map.put("company_name", company_name);
		map.put("begin_time", begin_time);
		//map.put("end_time", end_time);
		map.put("driver_name", driver_name);
		List<CarIllegalInfo> carIllegalInfoList = new ArrayList<CarIllegalInfo>();
		try {
			carIllegalInfoList = ctlIllegalCarMonitorService.carillegalSearch("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.carillegalSearch", map);
			for(CarIllegalInfo m :carIllegalInfoList ){
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date illegal_time =df.parse(m.getIllegal_time());
				m.setIllegal_time(df.format(illegal_time));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(carIllegalInfoList.toArray());
		writer(response, array.toString());
		
	}
	
	/**
     * 车辆违规行为详细列表
     */
	@RequestMapping("carillegalSearchDetails")
	public ModelAndView carillegalSearchDetails(HttpServletRequest request,HttpServletResponse response,String car_illegal_id){
			
			ModelAndView mv=new ModelAndView();
			try {
				CarIllegalInfo carIllegalInfo=ctlIllegalCarMonitorService.CarIllegalInfofindById("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.CarIllegalInfofindById", car_illegal_id);
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date illegal_time =df.parse(carIllegalInfo.getIllegal_time());
				carIllegalInfo.setIllegal_time(df.format(illegal_time));
				mv.addObject("carIllegalInfo", carIllegalInfo);
				mv.setViewName("supervise/carillegalSearchDetails");
			} catch (Exception e) {
				e.printStackTrace();
			}
			return mv;
		}
	
	/**
     * 执法稽查违规信息统计分析列表
     */
	@RequestMapping("/zfjcanalysisList")
	public String zfjcanalysisList(HttpServletRequest request,String tabType,String certno,String car_num,String beginTime,String endTime){
		try {
			Map m = new HashMap();
			if(endTime!=null && !endTime.equals("")){
				int endtime = Integer.parseInt(endTime.substring(9))+1;
				endTime=endTime.substring(0,9)+String.valueOf(endtime);
				m.put("endTime", endTime);	
				System.out.println(endTime);
				  }	
			m.put("certno", certno);
			m.put("car_num", car_num);
			m.put("beginTime", beginTime);
			//m.put("endTime", endTime);
			m.put("tabType", tabType);
			if(tabType != null){
					if(tabType.equals("1")){
						Map map = ctlIllegalCarMonitorService.drvCanalysisInfo("com.nasoft.aboutcar.DrvIllegalInfoMapper.drvCanalysisInfo", m);
						request.getSession().setAttribute("map", map);
					} else if(tabType.equals("2")){
						Map map = ctlIllegalCarMonitorService.carCanalysisInfo("com.nasoft.aboutcar.CarIllegalInfoMapper.carCanalysisInfo", m);
						request.getSession().setAttribute("map", map);
					}
			}else{
				Map map = ctlIllegalCarMonitorService.drvCanalysisInfo("com.nasoft.aboutcar.DrvIllegalInfoMapper.drvCanalysisInfo", m);
				request.getSession().setAttribute("map", map);
			}
			
			request.getSession().setAttribute("tabType", tabType);
	        request.getSession().setAttribute("m", m);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "supervise/zfjcanalysisList";
	}
	
	/**
	 * 新增违规信息
	 * @return
	 */
	@RequestMapping("/illegalBehaviorAdd")
	public String illegalBehaviorAdd(){
		return "supervise/illegalBehaviorAdd";
	}
	 /**
	  * 运营监管 》巡游行为监管
	  */
	@RequestMapping("paradeCarSupervise")
	public String paradeCarSupervise(HttpServletRequest request,Model model){
		return "supervise/paradeCarSupervise";
	}
	
	/**
	 * 运营监管 》经营者违规行为监测
	 */
	@RequestMapping("illegalMonitoring")
	public String illegalMonitoring(HttpServletRequest request,Model model){
		
		return "supervise/illegalMonitoring";
	}
	
	@RequestMapping("illegalMonitoringList")
	public void illegalMonitoringList(HttpServletRequest request,HttpServletResponse response){
		String driverName = request.getParameter("driverName");
		String vehicleNo = request.getParameter("vehicleNo");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("driverName", driverName);
		map.put("vehicleNo", vehicleNo);
		
		List<BnsCompanyViolation> bnsCompanyViolationList = new ArrayList<BnsCompanyViolation>();
		try {
			bnsCompanyViolationList = bnsCompanyViolationService.selectAll("com.nasoft.aboutcar.BnsCompanyViolationMapper.selectAll", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(bnsCompanyViolationList.toArray());
		writer(response, array+"");
	}
	
	/**
	 * 运营监管 》长时间未运营驾驶员情况
	 */
	@RequestMapping("unoperatingDriver")
	public String longtimeNoRun(HttpServletRequest request,Model model){
		
		return "supervise/unoperatingDriver";
	}
	
	@RequestMapping("unoperatingDriverList")
	public void unoperatingDriverList(HttpServletRequest request,HttpServletResponse response){
		String driverName = request.getParameter("driverName");
		String regionName = request.getParameter("regionName");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("driverName", driverName);
		map.put("regionName", regionName);
		
		List<MngUnoperatingDriver> mngUnoperatingDriverList = new ArrayList<MngUnoperatingDriver>();
		try {
			mngUnoperatingDriverList = mngUnoperatingDriverService.selectAll("com.nasoft.aboutcar.MngUnoperatingDriverMapper.selectAll", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(mngUnoperatingDriverList.toArray());
		writer(response, array+"");
	}
	
	/**
	 * 运营监管 》长期未运营车辆情况
	 * @return
	 */
	@RequestMapping("/notOperateCar")
	public String notOperateCar(){
		return "supervise/notOperateCar";
	}
	
	/**
	 * 获取长期未运营车辆列表
	 * @param request
	 * @param response
	 */
	@RequestMapping("/notOperateCarList")
	public void notOperateCarList(HttpServletRequest request,HttpServletResponse response){
		String region_code = request.getParameter("region_code");
		String company_id = request.getParameter("company_id");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("region_code", region_code);
		map.put("company_id", company_id);
		
		try {
			List<BnsNotOperateCar> bnsNotOperateCarList = bnsNotOperateCarService.selectAll("com.nasoft.aboutcar.BnsNotOperateCarMapper.findAllNotOperCar", map);
			JSONArray array = JSONArray.fromObject(bnsNotOperateCarList.toArray());
			writer(response, array.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 运营监管 》接单时长分析
	 * @return
	 */
	@RequestMapping("/orderReceivingTime")
	public String orderReceivingTime(HttpServletRequest request,String tabType,String address,String companyId,String beginTime,String endTime){
		try {
			Map m = new HashMap();
			m.put("address", address);
			m.put("companyId", companyId);
			m.put("beginTime", beginTime);
			m.put("endTime", endTime);
			Map map = mngOrderStartInfoService.selectOrderReceivingTime("com.nasoft.aboutcar.MngOrderStartInfoMapper.selectOrderReceivingTime",m);
			List<Map> addressList = mngOrderStartInfoService.selectAddress("com.nasoft.aboutcar.MngOrderStartInfoMapper.selectAddress");
			List<Map> companyList = mngOrderStartInfoService.selectCompany("com.nasoft.aboutcar.MngOrderStartInfoMapper.selectCompany");
	        request.getSession().setAttribute("map", map);
	        request.getSession().setAttribute("tabType", tabType);
	        request.getSession().setAttribute("m", m);
	        request.getSession().setAttribute("addressList", addressList);
	        request.getSession().setAttribute("companyList", companyList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "supervise/orderReceivingTime";
	}
	
	/**
	 * 运营监管 》全局运营分析
	 */
	@RequestMapping("globalOperationAnalyzing")
	public String orderAnalyzing(HttpServletRequest request,Model model){
		try {
			List<Map> areaList = bnsOperationPayService.selectOnArea("com.nasoft.aboutcar.BnsOperationPayMapper.selectOnArea");
			request.getSession().setAttribute("areaList", areaList);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			request.getSession().setAttribute("createTime", sdf.format(new Date()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "supervise/globalOperationAnalyzing";
	}
	
	@RequestMapping("globalOperationList")
	public void globalOperationList(HttpServletRequest request,HttpServletResponse response){
		String onArea = request.getParameter("onArea");
		String createTime = request.getParameter("createTime");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("onArea", onArea);
		map.put("createTime", createTime);
		
		List<Map> mapList = new ArrayList<Map>();
		try {
			mapList = bnsOperationPayService.globalOperationAnalyzing("com.nasoft.aboutcar.BnsOperationPayMapper.globalOperationAnalyzing", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(mapList.toArray());
		writer(response, array+"");
	}
	
	/**
	 * 运营监管 》网约车订单查询
	 * @return
	 */
	@RequestMapping("/operationOrder")
	public String operationOrder(){
		return "supervise/operationOrder";
	}
	
	/**
	 * 获取网约车订单列表
	 * @param request
	 * @param response
	 */
	@RequestMapping("/operationOrderList")
	public void operationOrderList(HttpServletRequest request,HttpServletResponse response,Pageable pageable ){
		String vehicle_no = request.getParameter("vehicle_no");
		String company_id = request.getParameter("company_id");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("vehicle_no", vehicle_no);
		map.put("company_id", company_id);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Page<BnsOperationPay> bnsOperationPayList = bnsOperationPayService.findOperationPay("com.nasoft.aboutcar.BnsOperationPayMapper.findOperationPay", map,pageable);
			for ( BnsOperationPay bnsOperationPay: bnsOperationPayList.getRows() ) {
				if(null!=bnsOperationPay.getBookDepTime()) bnsOperationPay.setBook_dep_time(sdf.format(bnsOperationPay.getBookDepTime()));
				if(null!=bnsOperationPay.getDriveTime()) bnsOperationPay.setDrive_time(sdf.format(bnsOperationPay.getDriveTime()));
				if(null!=bnsOperationPay.getPayTime()) bnsOperationPay.setPay_time(sdf.format(bnsOperationPay.getPayTime()));
				if(null!=bnsOperationPay.getOrderMatchTime()) bnsOperationPay.setOrder_match_time(sdf.format(bnsOperationPay.getOrderMatchTime()));
			}
//			JSONArray array = JSONArray.fromObject(bnsOperationPayList.toArray());
			writer(response, bnsOperationPayList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		NumberFormat n = NumberFormat.getInstance();
		  n.setMaximumFractionDigits(3);
		double s=Math.random();
		System.out.println(n.format(s));
	}
	
	/**
     * 执法稽查驾驶员违章违法信息导出Excel文件
     */
		@RequestMapping("drvexportExcel")
		public void drvexportExcel(HttpServletRequest request,HttpServletResponse response){
			 try {  
				request.setCharacterEncoding("UTF-8");
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/x-download");
				String fileName = "驾驶员违章违法信息列表.xlsx";
				fileName = URLEncoder.encode(fileName, "UTF-8");
				response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
				String filePath = request.getRealPath("/template")+"/"+"执法稽查驾驶员违规信息模板.xlsx"; // excel位置
			            InputStream inputStream=new FileInputStream(filePath);  
			            OutputStream os=response.getOutputStream();  
			            byte[] b=new byte[1024];  
			            int length;  
			            while((length=inputStream.read(b))>0){  
			                os.write(b,0,length);  
			            }  
			            inputStream.close();  
			        } catch (IOException e) {  
			            e.printStackTrace();  
			        }  
				
		}
		
		/**
	     * 执法稽查驾驶员违章违法信息导出Excel文件
	     */
		@RequestMapping("carexportExcel")
		public void carexportExcel(HttpServletRequest request,HttpServletResponse response){
			 try {  
				request.setCharacterEncoding("UTF-8");
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/x-download");
				String fileName = "车辆违章违法信息列表.xlsx";
				fileName = URLEncoder.encode(fileName, "UTF-8");
				response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
				String filePath = request.getRealPath("/template")+"/"+"执法稽查车辆违规信息模板.xlsx"; // excel位置
			            InputStream inputStream=new FileInputStream(filePath);  
			            OutputStream os=response.getOutputStream();  
			            byte[] b=new byte[1024];  
			            int length;  
			            while((length=inputStream.read(b))>0){  
			                os.write(b,0,length);  
			            }  
			            inputStream.close();  
			        } catch (IOException e) {  
			            e.printStackTrace();  
			        }  
				
		}
		
		/**
		 * 判断车辆是否违规，获取数据：车辆GPS信息、禁止驶入区域信息
		 * @param request
		 * @param response
		 */
		@ResponseBody
		@RequestMapping("getIllCar")
		public List<List<?>> getIllCar(HttpServletRequest request,HttpServletResponse response){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("isUse", request.getParameter("isUse"));
			List<List<?>> getIllCarList = new ArrayList<List<?>>();
			
			try {
				//获取车辆最新GPS数据
				List<CtlCarPositionInfo> positionInfoList = ctlCarPositionInfoService.findAllCarNewPosition("com.nasoft.aboutcar.CtlCarPositionInfoMapper.findAllCarNewPosition");
				//获取所有禁止驶入的区域
				List<OutinAreaSet> outinAreaSetList = outinAreaSetService.findAllOutinArea("com.nasoft.aboutcar.OutinAreaSetMapper.getOutinAreaSetList",map);
				
				getIllCarList.add(positionInfoList);
				getIllCarList.add(outinAreaSetList);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return getIllCarList;
		}
		
		/**
		 * 违规车辆保存
		 * @param request
		 * @param response
		 */
		@RequestMapping("saveIllCar")
		public void saveIllCar(HttpServletRequest request,HttpServletResponse response){
			try {
				//根据id获取违规的车辆信息
				CtlCarPositionInfo carGps = ctlCarPositionInfoService.getCarInfoToid("com.nasoft.aboutcar.CtlCarPositionInfoMapper.getCarInfoToid", request.getParameter("carGpsId"));
				//根据id获取禁止驶入区域信息
//				OutinAreaSet area = outinAreaSetService.getAreaToid("com.nasoft.aboutcar.OutinAreaSetMapper.getAreaToid", request.getParameter("areaId"));
				
				if(carGps != null){
					String areaId = request.getParameter("areaId");
					
					//封装查询参数map
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("vehicleNo", carGps.getVehicle_no());
					
					//违规：禁止驶出
					if("1".equals(request.getParameter("illegalType1"))){
						//封装违规信息对象
						CtlIllegalCarMonitor illCar = getIllCar(carGps, "1", areaId);
						
						map.put("illegalType", "1");
						//判断要保存的违规车辆禁止驶出信息 是否存在
						List<CtlIllegalCarMonitor> illCarM = ctlIllegalCarMonitorService.findIllegaCar("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.findIllegaCar", map);
						if(illCarM.size() == 0){
							ctlIllegalCarMonitorService.saveIllCar("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.saveIllCar", illCar);
						}
					}
					
					//违规：禁止驶入
					if("0".equals(request.getParameter("illegalType"))){
						//封装违规信息对象
						CtlIllegalCarMonitor illCar = getIllCar(carGps, "0", areaId);
						
						map.put("illegalType", "0");
						map.put("areaId", areaId);
						//判断要保存的违规车辆禁止驶入信息 是否存在
						List<CtlIllegalCarMonitor> illCarM = ctlIllegalCarMonitorService.findIllegaCar("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.findIllegaCar", map);
						if(illCarM.size() == 0){
							ctlIllegalCarMonitorService.saveIllCar("com.nasoft.aboutcar.CtlIllegalCarMonitorMapper.saveIllCar", illCar);
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//封装要保存的违规车辆实体
		private CtlIllegalCarMonitor getIllCar(CtlCarPositionInfo carGps, String illegalType, String areaId){
			CtlIllegalCarMonitor illCar = new CtlIllegalCarMonitor();
			illCar.setVehicle_no(carGps.getVehicle_no());
			illCar.setCompany_id(carGps.getCompany_id());
			illCar.setVehicle_region_code(carGps.getVehicle_region_code());
			illCar.setPosition_time(carGps.getPosition_time());
			illCar.setLongitude(carGps.getLongitude());
			illCar.setLatitude(carGps.getLatitude());
			illCar.setSpeed(carGps.getSpeed());
			illCar.setDirection(carGps.getDirection());
			illCar.setElevation(carGps.getElevation());
			illCar.setMileage(carGps.getMileage());
			illCar.setWarnStatus(carGps.getWarnStatus());
			illCar.setVeh_status(carGps.getVeh_status());
			illCar.setBiz_status(carGps.getBiz_status());
			illCar.setOrder_id(carGps.getOrder_id());
			illCar.setEncrypt(carGps.getEncrypt());
			illCar.setCreate_time(DateUtil.getDateTime());
			illCar.setInAreaId(areaId);
			illCar.setIllegal_type(illegalType);
			
			return illCar;
		}
}
