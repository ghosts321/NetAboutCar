package com.nasoft.aboutcar.credit.controller;

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
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.codec.binary.Base64OutputStream;
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

import com.mysql.jdbc.StringUtils;
import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.car.domain.CarInfo;
import com.nasoft.aboutcar.credit.domain.CarBlacklist;
import com.nasoft.aboutcar.credit.domain.ComAppealD;
import com.nasoft.aboutcar.credit.domain.ComAppeals;
import com.nasoft.aboutcar.credit.domain.ComEventReview;
import com.nasoft.aboutcar.credit.domain.ComScoreRecord;
import com.nasoft.aboutcar.credit.domain.CxkhCarBlacklist;
import com.nasoft.aboutcar.credit.domain.CxkhComAnnualWork;
import com.nasoft.aboutcar.credit.domain.CxkhComPunList;
import com.nasoft.aboutcar.credit.domain.CxkhComPunRecord;
import com.nasoft.aboutcar.credit.domain.CxkhDrvAnnualWork;
import com.nasoft.aboutcar.credit.domain.CxkhDrvAppealD;
import com.nasoft.aboutcar.credit.domain.CxkhDrvAppeals;
import com.nasoft.aboutcar.credit.domain.CxkhDrvBlacklist;
import com.nasoft.aboutcar.credit.domain.CxkhDrvPunList;
import com.nasoft.aboutcar.credit.domain.CxkhDrvPunRecord;
import com.nasoft.aboutcar.credit.domain.CxkhDrvScoreRecord;
import com.nasoft.aboutcar.credit.domain.CxkhEvents;
import com.nasoft.aboutcar.credit.domain.CxkhIndic;
import com.nasoft.aboutcar.credit.domain.DrvBlacklist;
import com.nasoft.aboutcar.credit.domain.DrvEventReview;
import com.nasoft.aboutcar.credit.domain.DrvScoreRecord;
import com.nasoft.aboutcar.credit.domain.Events;
import com.nasoft.aboutcar.credit.domain.Indic;
import com.nasoft.aboutcar.credit.domain.IndicType;
import com.nasoft.aboutcar.credit.domain.PunishedSet;
import com.nasoft.aboutcar.credit.domain.XzcfDricaseInfo;
import com.nasoft.aboutcar.credit.service.ComAppealDService;
import com.nasoft.aboutcar.credit.service.ComAppealsService;
import com.nasoft.aboutcar.credit.service.CarBlacklistService;
import com.nasoft.aboutcar.credit.service.ComEventReviewService;
import com.nasoft.aboutcar.credit.service.ComScoreRecordService;
import com.nasoft.aboutcar.credit.service.CreditService;
import com.nasoft.aboutcar.credit.service.DrvBlacklistService;
import com.nasoft.aboutcar.credit.service.DrvEventReviewService;
import com.nasoft.aboutcar.credit.service.DrvScoreRecordService;
import com.nasoft.aboutcar.credit.service.EventsService;
import com.nasoft.aboutcar.credit.service.IndicService;
import com.nasoft.aboutcar.credit.service.IndicTypeService;
import com.nasoft.aboutcar.credit.service.PunishedSetService;
import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;
import com.nasoft.aboutcar.pilotapply.domain.DrvUserinfo;
import com.nasoft.aboutcar.pilotapply.service.DrvRecordService;
import com.nasoft.aboutcar.platform.domain.Platform;
import com.nasoft.aboutcar.platform.service.PlatformService;
import com.nasoft.aboutcar.credit.domain.CxkhPunishedSet;
import com.nasoft.util.DateTime;
import com.nasoft.util.DateUtil;
import com.nasoft.util.FtpUtil;
import com.nasoft.util.StringUtil;
@Controller
@RequestMapping("/credit")
public class CreditController extends BaseController {
	
	@Resource
	private EventsService eventsService;
	@Resource
	private DrvEventReviewService drvEventReviewService;
	@Resource
	private DrvScoreRecordService drvScoreRecordService;
	@Resource
	private ComEventReviewService comEventReviewService;
	@Resource
	private ComScoreRecordService comScoreRecordService;
	@Resource
	private ComAppealDService comAppealDService;
	@Resource
	private ComAppealsService comAppealsService;
	@Resource
	private PunishedSetService punishedSetService;
	@Resource
	private CreditService creditService;
	@Resource
	private DrvRecordService drvRecordService;
	@Resource
	private IndicService indicService;
	@Resource
	private IndicTypeService indicTypeService;
	@Resource
	private PlatformService platformService;
	@Resource
	private CarBlacklistService carBlacklistService;
	@Resource
	private DrvBlacklistService drvBlacklistService;
	
	//指标体系管理
	@RequestMapping("indicator")
	public String indicatorList(){
		return "credit/indicator";
	}
	
	//分组管理
	@RequestMapping("group")
	public String groupList(){
		return "credit/group";
	}
	
	//模型分类管理
	@RequestMapping("modelGroup")
	public String modelGroupList(){
		return "credit/modelGroup";
	}
	


	@RequestMapping("driver/archive/detail")
	public String driverArchiveDetail(HttpServletRequest request,HttpServletResponse response,String certNo){
		request.setAttribute("certNo", certNo);
		return "credit/drvArchiveDetail";
	}
	
	//模型管理
	@RequestMapping("model")
	public String modelList(){
		return "credit/model";
	}
	
	//经营者诚信管理
	@RequestMapping("platform")
	public String platformList(){
		return "credit/platform";
	}
	//驾驶员诚信管理
	@RequestMapping("poilt")
	public String poiltList(){
		return "credit/poilt";
	}

	//指标细则管理
	@RequestMapping("/indic")
	public String drvCxkhIndic(String type,Model model){
		model.addAttribute("type",type);
		return "credit/indic";
	}
	
	//指标管理
	@RequestMapping("/indicType")
	public String drvCxkhIndicType(String type,Model model){
		model.addAttribute("type",type);
		return "credit/indicType";
	}
	
	/**
	 * 驾驶员黑名单
	 * @return
	 */
	@RequestMapping("/drvBlacklist")
	public String drvBlacklist(){
		return "credit/drvBlacklist";
	}

	/**
	 * 车辆黑名单
	 * @return
	 */
	@RequestMapping("carBlacklist")
	public String cardBlacklist(){
		return "credit/carBlacklist";
	}
	
	@RequestMapping("carBlacklistAdd")
	public String carBlacklistAdd(){
		return "credit/carBlacklistAdd";
	}
	
	@RequestMapping("/drvBlacklistAdd")
	public String drvBlacklistAdd(){
		return "credit/drvBlacklistAdd";
	}
	
	@RequestMapping("/getDrvBlackList")
	public @ResponseBody List<DrvBlacklist> getDrvBlackList(String drv_name,HttpServletResponse response){
		HashMap<String,Object> map = new HashMap<>();
		map.put("drv_name", drv_name);
		List<DrvBlacklist> list = null;
		try {
			list = drvBlacklistService.selectAllDrvBlacklist("com.nasoft.aboutcar.DrvBlacklist.findAllDrvBlacklist", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@RequestMapping("/getCarBlackList")
	public @ResponseBody List<CarBlacklist> getCarBlackList(String carid,HttpServletResponse response){
		HashMap<String,Object> map = new HashMap<>();
		map.put("carid", carid);
		List<CarBlacklist> list = null;
		try {
			list = carBlacklistService.selectAllCarBlacklist("com.nasoft.aboutcar.CarBlacklist.findAllCarBlacklist", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@RequestMapping("/openRemoveDrv")
	public String openRemoveDrv(int drv_id,Model model){
		model.addAttribute("drv_id", drv_id);
		return "credit/drvBlacklistRemove";
	}
	
	@RequestMapping("/openRemoveCar")
	public String openRemoveCar(String carid,Model model){
		model.addAttribute("carid", carid);
		return "credit/carBlacklistRemove";
	}
	
	@RequestMapping("/removeCar")
	public ModelAndView removeCar(@RequestParam(value="annexFile",required=false) MultipartFile annexFile,CarBlacklist carBlacklist){
		ModelAndView mv = new ModelAndView();
		String remove_file = "";
		String msg = "";
		MngUserInfo currentUser = getCurrentUser();
		carBlacklist.setRemove_date(new Date());
		carBlacklist.setRemover(currentUser.getRealName());
		carBlacklist.setUpdate_time(DateUtil.DateTimeFormat(new Date()));
		carBlacklist.setUpdate_user(currentUser.getUserId());
		try {
			if(!annexFile.isEmpty()){
				InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
				Properties p = new Properties();
				p.load(in);
				String hostname = p.getProperty("ftp.hostname");
				int port = Integer.valueOf(p.getProperty("ftp.port"));
				String username = p.getProperty("ftp.username");
				String password = p.getProperty("ftp.password");
				String pathname = "upload/credit/remove_file"; 
				String filename = "car_"+carBlacklist.getCarid()+annexFile.getOriginalFilename().substring(annexFile.getOriginalFilename().lastIndexOf(".")); 
				InputStream inputStream  = annexFile.getInputStream();
				Boolean flag = FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, filename, inputStream);
				if(flag){
					remove_file = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+filename;
				}
			}
			carBlacklist.setRemove_file(remove_file);
			int result = carBlacklistService.updateCarBlacklist("com.nasoft.aboutcar.CarBlacklist.updateCarBlacklist", carBlacklist);
			if(result>0){
				msg="success";
			}else{
				msg="移除失败";
			}
		} catch (Exception e) {
			msg="移除失败";
			e.printStackTrace();
		}
		mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
	}
	
	@RequestMapping("/removeDrv")
	public ModelAndView removeDrv(@RequestParam(value="annexFile",required=false) MultipartFile annexFile,DrvBlacklist drvBlacklist){
		ModelAndView mv = new ModelAndView();
		String remove_file = "";
		String msg = "";
		MngUserInfo currentUser = getCurrentUser();
		drvBlacklist.setRemove_date(new Date());
		drvBlacklist.setRemover(currentUser.getRealName());
		drvBlacklist.setUpdate_time(DateUtil.DateTimeFormat(new Date()));
		drvBlacklist.setUpdate_user(currentUser.getUserId());
		try {
			if(!annexFile.isEmpty()){
				InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
				Properties p = new Properties();
				p.load(in);
				String hostname = p.getProperty("ftp.hostname");
				int port = Integer.valueOf(p.getProperty("ftp.port"));
				String username = p.getProperty("ftp.username");
				String password = p.getProperty("ftp.password");
				String pathname = "upload/credit/remove_file"; 
				String filename = "drv_"+drvBlacklist.getDrv_id()+annexFile.getOriginalFilename().substring(annexFile.getOriginalFilename().lastIndexOf(".")); 
				InputStream inputStream  = annexFile.getInputStream();
				Boolean flag = FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, filename, inputStream);
				if(flag){
					remove_file = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+filename;
				}
			}
			drvBlacklist.setRemove_file(remove_file);
			int result = drvBlacklistService.updateDrvBlacklist("com.nasoft.aboutcar.DrvBlacklist.updateDrvBlacklist", drvBlacklist);
			if(result>0){
				msg="success";
			}else{
				msg="移除失败";
			}
		} catch (Exception e) {
			msg="移除失败";
			e.printStackTrace();
		}
		mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 获取不存在于黑名单的驾驶员
	 * @param response
	 * @return
	 */
	@RequestMapping("/getDrvNameList")
	public @ResponseBody List<DrvUserinfo> getDrvNameList(HttpServletResponse response){
		List<DrvUserinfo> list = null;
		try {
			list = drvBlacklistService.getDrvNameList("com.nasoft.aboutcar.DrvBlacklist.getDrvNameList", null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 获取未添加到黑名单的车辆信息
	 * @param response
	 * @return
	 */
	@RequestMapping("/getCarNoList")
	public @ResponseBody List<CarInfo> getCarNoList(HttpServletResponse response){
		List<CarInfo> list = null;
		try {
			list = carBlacklistService.getCarNoList("com.nasoft.aboutcar.CarBlacklist.getCarNoList", null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 添加驾驶员黑名单
	 * @param drvBlacklist
	 * @param data
	 * @param annexFile
	 * @return
	 */
	@RequestMapping("/addDrvBlacklist")
	public ModelAndView addDrvBlacklist(DrvBlacklist drvBlacklist,String data,@RequestParam(value="annexFile",required=false) MultipartFile annexFile){
		ModelAndView mv = new ModelAndView();
		String msg = "";
		int result = 0;
		String storage_file = "";
		MngUserInfo currentUser = getCurrentUser();
		JSONArray jsonArray = JSONArray.fromObject(data);
		drvBlacklist.setStorage_date(new Date());
		drvBlacklist.setCreate_user(currentUser.getUserId());
		drvBlacklist.setCreate_time(DateUtil.DateTimeFormat(new Date()));
		drvBlacklist.setStatus("0");
		drvBlacklist.setStorager(currentUser.getRealName());
		try {
			if(!annexFile.isEmpty()){
				InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
				Properties p = new Properties();
				p.load(in);
				String hostname = p.getProperty("ftp.hostname");
				int port = Integer.valueOf(p.getProperty("ftp.port"));
				String username = p.getProperty("ftp.username");
				String password = p.getProperty("ftp.password");
				String pathname = "upload/credit/storage_file";
				InputStream inputStream  = annexFile.getInputStream();
				for(int i=0;i<jsonArray.size();i++){
					DrvUserinfo userInfo= (DrvUserinfo) JSONObject.toBean(JSONObject.fromObject(jsonArray.get(i)), DrvUserinfo.class);
					drvBlacklist.setDrv_name(userInfo.getUsername());
					drvBlacklist.setDrv_id(userInfo.getCertno());
					drvBlacklist.setDrv_license(userInfo.getDrivecardno());
					String filename = "drv_"+userInfo.getCertno()+annexFile.getOriginalFilename().substring(annexFile.getOriginalFilename().lastIndexOf(".")); 
					Boolean flag = FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, filename, inputStream);
					if(flag){
						storage_file = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+filename;
					}
					drvBlacklist.setStorage_file(storage_file);
					result = drvBlacklistService.addDrvBlacklist("com.nasoft.aboutcar.DrvBlacklist.addDrvBlacklist", drvBlacklist);
				}
			}
			if(result>0){
				msg="success";
			}else{
				msg="添加失败";
			}
		} catch (Exception e) {
			msg="添加失败";
			e.printStackTrace();
		}
		
		mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
		
	}
	
	/**
	 * 添加车辆黑名单
	 * @param carBlacklist
	 * @param data
	 * @param annexFile
	 * @return
	 */
	@RequestMapping("/addCarBlacklist")
	public ModelAndView addCarBlacklist(CarBlacklist carBlacklist,String data,@RequestParam(value="annexFile",required=false) MultipartFile annexFile){
		ModelAndView mv = new ModelAndView();
		String msg = "";
		int result = 0;
		String storage_file = "";
		MngUserInfo currentUser = getCurrentUser();
		JSONArray jsonArray = JSONArray.fromObject(data);
		carBlacklist.setStorage_date(new Date());
		carBlacklist.setCreate_user(currentUser.getUserId());
		carBlacklist.setCreate_time(DateUtil.DateTimeFormat(new Date()));
		carBlacklist.setStatus("0");
		carBlacklist.setStorager(currentUser.getRealName());
		try {
			if(!annexFile.isEmpty()){
				InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
				Properties p = new Properties();
				p.load(in);
				String hostname = p.getProperty("ftp.hostname");
				int port = Integer.valueOf(p.getProperty("ftp.port"));
				String username = p.getProperty("ftp.username");
				String password = p.getProperty("ftp.password");
				String pathname = "upload/credit/storage_file"; 
				InputStream inputStream  = annexFile.getInputStream();
				for(int i=0;i<jsonArray.size();i++){
					CarInfo carInfo= (CarInfo) JSONObject.toBean(JSONObject.fromObject(jsonArray.get(i)), CarInfo.class);
					carBlacklist.setCarnum(carInfo.getCarNum());
					carBlacklist.setEnginenum(carInfo.getEngineNum());
					carBlacklist.setCertno(carInfo.getCertNo());
					carBlacklist.setCarid(carInfo.getCarId());
					String filename = "car_"+carInfo.getCarId()+annexFile.getOriginalFilename().substring(annexFile.getOriginalFilename().lastIndexOf(".")); 
					Boolean flag = FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, filename, inputStream);
					if(flag){
						storage_file = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+filename;
					}
					carBlacklist.setStorage_file(storage_file);
					result = carBlacklistService.addCarBlacklist("com.nasoft.aboutcar.CarBlacklist.addCarBlacklist", carBlacklist);
					
				}
			}
			if(result>0){
				msg="success";
			}else{
				msg="添加失败";
			}
		} catch (Exception e) {
			msg="添加失败";
			e.printStackTrace();
		}
		
		mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
		
	}
	
	/**
	 * 获取指标管理列表
	 * @param type
	 */
	@RequestMapping("/getIndicTypeList")
	public void getIndicTypeList(String type,String type_name,HttpServletResponse response){
		HashMap<String,Object> map = new HashMap<>();
		map.put("type", type);
		map.put("type_name", type_name);
		ArrayList<IndicType> indicTypeList = new ArrayList<>();
		try {
			indicTypeList = indicTypeService.selectAllIndicType("com.nasoft.aboutcar.IndicTypeMapper.selectAllIndicType", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(indicTypeList.toArray());
		writer(response, array.toString());
	}
	
	/**
	 * 获取指标细则管理列表
	 * @param type
	 */
	@RequestMapping("/getIndicList")
	public void getIndicList(String type,String indic_text,HttpServletResponse response){
		HashMap<String,Object> map = new HashMap<>();
		map.put("type", type);
		map.put("indic_text", indic_text);
		ArrayList<Indic> indicList = new ArrayList<>();
		try {
			indicList = indicService.selectAllIndic("com.nasoft.aboutcar.IndicMapper.selectAllIndic", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(indicList.toArray());
		writer(response, array.toString());
	}
	
	/**
	 * 打开新增（修改）指标
	 * @param type
	 * @param type_code
	 * @param model
	 * @return
	 */
	@RequestMapping("/indicTypeAdd")
	public String indicTypeAdd(String type,String type_code,Model model){
		model.addAttribute("category", type);
		if(StringUtil.isNotEmpty(type_code)){
			IndicType indicType = new IndicType();
			try {
				indicType = indicTypeService.selectOneById("com.nasoft.aboutcar.IndicTypeMapper.selectOneById",type_code);
			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("indicType", indicType);
			model.addAttribute("type", "update");
			return "credit/indicTypeAdd";
		}
		model.addAttribute("type", "add");
		return "credit/indicTypeAdd";
	}
	
	/**
	 * 打开新增（修改）指标细则
	 * @param type
	 * @param type_code
	 * @param model
	 * @return
	 */
	@RequestMapping("/indicAdd")
	public String indicAdd(String type,String indic_code,Model model){
		model.addAttribute("category", type);
		if(StringUtil.isNotEmpty(indic_code)){
			Indic indic = new Indic();
			try {
				indic = indicService.selectOneById("com.nasoft.aboutcar.IndicMapper.selectOneById",indic_code);
			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("indic", indic);
			model.addAttribute("type", "update");
			return "credit/indicAdd";
		}
		model.addAttribute("type", "add");
		return "credit/indicAdd";
	}
	
	/**
	 * 获取指标名称
	 * @param category
	 * @param response
	 */
	@RequestMapping("/getTypeName")
	@ResponseBody
	public ArrayList<IndicType> getTypeName(String category,HttpServletResponse response){
		HashMap<String,Object> map = new HashMap<>();
		map.put("category", category);
		ArrayList<IndicType> list = new ArrayList<>();
		try {
			list = indicService.selectAllTypeCode("com.nasoft.aboutcar.IndicMapper.selectAllTypeCode", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 检查上级指标代码是否存在
	 * @param response
	 * @param upperCode
	 */
	@RequestMapping("/checkUpperCode")
	public void checkUpperCode(HttpServletResponse response,String upperCode,String category){
		HashMap<String,Object> map = new HashMap<>();
		map.put("upperCode", upperCode);
		map.put("category", category);
		try {
			ArrayList<IndicType> indicType = indicTypeService.selectAllIndicType("com.nasoft.aboutcar.IndicTypeMapper.selectOneByUpperCode",map);
			if(null !=indicType && indicType.size()>0){
				writer(response, "ok");
			}else{
				writer(response, "no");
			}
		} catch (Exception e) {
			writer(response, "error");
			e.printStackTrace();
		}
	}
	
	/**
	 * 增加（修改）指标
	 * @param indicType
	 * @param response
	 * @param type
	 * @return
	 */
	@RequestMapping("/addIndicType")
	public ModelAndView addIndicType(IndicType indicType,HttpServletResponse response,String type,String category){
		String msg="";
		ModelAndView mv = new ModelAndView();
		MngUserInfo currentUser = getCurrentUser();
		if(type.equals("add")){
			indicType.setCreate_user(currentUser.getUserId());
			indicType.setCreate_time(DateUtil.DateTimeFormat(new Date()));
			indicType.setCategory(category);
			try {
				IndicType indic = indicTypeService.selectOneById("com.nasoft.aboutcar.IndicTypeMapper.selectOneById",indicType.getType_code());
				if(null != indic){
					msg = "指标编码已存在！";
					mv.addObject("msg",msg);
					mv.setViewName("save_result");
					return mv;
				}
				int result = indicTypeService.addIndicType("com.nasoft.aboutcar.IndicTypeMapper.addIndicType",indicType);
				if(result>0){
					msg="success";
				}else{
					msg="添加失败";
				}
			} catch (Exception e) {
				msg="添加失败";
				e.printStackTrace();
			}
		}else{
			indicType.setUpdate_user(currentUser.getUserId());
			indicType.setUpdate_time(DateUtil.DateTimeFormat(new Date()));
			try {
				int result = indicTypeService.updateIndicType("com.nasoft.aboutcar.IndicTypeMapper.updateIndicType", indicType);
				if(result>0){
					msg="success";
				}else{
					msg="修改失败";
				}
			} catch (Exception e) {
				msg="修改失败";
				e.printStackTrace();
			}
		}
		mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 增加（修改）指标细则
	 * @param indic
	 * @param response
	 * @param type
	 * @return
	 */
	@RequestMapping("/addIndic")
	public ModelAndView addIndic(Indic indic,HttpServletResponse response,String type,String category){
		String msg="";
		ModelAndView mv = new ModelAndView();
		MngUserInfo currentUser = getCurrentUser();
		if(type.equals("add")){
			indic.setCreate_user(currentUser.getUserId());
			indic.setCreate_time(DateUtil.DateTimeFormat(new Date()));
			indic.setCategory(category);
			try {
				Indic indic1 = indicService.selectOneById("com.nasoft.aboutcar.IndicMapper.selectOneById",indic.getIndic_code());
				if(null != indic1){
					msg = "指标编码已存在！";
					mv.addObject("msg",msg);
					mv.setViewName("save_result");
					return mv;
				}
				int result = indicService.addIndicType("com.nasoft.aboutcar.IndicMapper.addIndic",indic);
				if(result>0){
					msg="success";
				}else{
					msg="添加失败";
				}
			} catch (Exception e) {
				msg="添加失败";
				e.printStackTrace();
			}
		}else{
			indic.setUpdate_user(currentUser.getUserId());
			indic.setUpdate_time(DateUtil.DateTimeFormat(new Date()));
			try {
				int result = indicService.updateIndicType("com.nasoft.aboutcar.IndicMapper.updateIndic", indic);
				if(result>0){
					msg="success";
				}else{
					msg="修改失败";
				}
			} catch (Exception e) {
				msg="修改失败";
				e.printStackTrace();
			}
		}
		mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 修改指标细则状态
	 * @param response
	 */
	@RequestMapping("/toDisable")
	public void toDisable(String indic_code,String indic_status,HttpServletResponse response){
		Indic indic = new Indic();
		indic.setIndic_code(indic_code);
		indic.setIndic_status(indic_status);
		try {
			indicService.updateIndicType("com.nasoft.aboutcar.IndicMapper.updateIndicStatus", indic);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除指标
	 * @param type_codes
	 */
	@RequestMapping("indicTypeDel")
	public void indicTypeDel(String type_codes,HttpServletResponse response){
		String result = "";
		try {
			indicTypeService.batchDelIndicTypeByIds("com.nasoft.aboutcar.IndicTypeMapper.batchDelById",type_codes);
			result = "success";
		} catch (Exception e) {
			result = "fail";
			e.printStackTrace();
		}
		writer(response, result);
	}
	
	/**
	 * 删除指标细则
	 * @param type_codes
	 */
	@RequestMapping("indicDel")
	public void indicDel(String indic_codes,HttpServletResponse response){
		String result = "";
		try {
			indicService.batchDelIndicTypeByIds("com.nasoft.aboutcar.IndicMapper.batchDelById",indic_codes);
			result = "success";
		} catch (Exception e) {
			result = "fail";
			e.printStackTrace();
		}
		writer(response, result);
	}
	
	//驾驶员考核信息审核
	@RequestMapping("drvEvent")
	public String drvEvent(HttpServletRequest request,HttpServletResponse response){
		
		return "credit/drvEventList";
	}
	
	@RequestMapping("drvEventList")
	public void drvEventList(HttpServletRequest request,HttpServletResponse response,String status){
		String userName = request.getParameter("userName");
		String certNo = request.getParameter("certNo");
		Map<String, Object> m = new HashMap<String, Object>();
		//MngUserInfo MngUserInfo = getCurrentUser();
		List<Map> eventList = new ArrayList<Map>();
		m.put("userName", userName);
		m.put("certNo", certNo);
		if(!StringUtils.isNullOrEmpty(status)){
			m.put("status", status);
		}
		try {
			eventList = (List<Map>) eventsService.findDrvEvents("com.nasoft.aboutcar.Events.findDrvEvents",m);
			if(eventList.size() > 0){
				for(Map map:eventList){
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					map.put("occur_date", dateFormat.format((Date) map.get("occur_date")));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		JSONArray array = JSONArray.fromObject(eventList.toArray());
		writer(response, array+"");
	}
	
	@RequestMapping("drvEventDetail")
    public String drvEventDetail(HttpServletRequest request,String certno,String event_no){
		try {
			Map<String,Object> map = drvRecordService.selectDetailByCertno("com.nasoft.aboutcar.DrvRecordMapper.selectDetailByCertno",certno);
			Events event = eventsService.findEventsByNo("com.nasoft.aboutcar.Events.findEventsByNo", event_no);
			DrvEventReview drvEventReview = drvEventReviewService.findByEventNo("com.nasoft.aboutcar.DrvEventReview.findByEventNo", event_no);
			if(null != drvEventReview && "已审核".equals(drvEventReview.getReview_status())){
				List<DrvScoreRecord> drvScoreRecordList = drvScoreRecordService.selectByEventNo("com.nasoft.aboutcar.DrvScoreRecord.selectByEventNo", event_no);
				request.setAttribute("drvScoreRecordList", drvScoreRecordList);
			}else{
				List<Map> indicList = indicService.findAllIndic("com.nasoft.aboutcar.IndicMapper.findAllIndic");
				request.setAttribute("indicList", indicList);
			}
			request.setAttribute("drv", map);
			request.setAttribute("event", event);
			request.setAttribute("drvEventReview", drvEventReview);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "credit/drvEventDetail";
    }


	@RequestMapping("toEventList")
    public String toEventList(HttpServletRequest request,String where) throws Exception{
		if(where.equals("platform")){
			return "credit/comEventList";
		}else{
			return "credit/drvEventList";			
		}
    }
	
	@RequestMapping("event/audit")
    public String auditEvent(HttpServletRequest request,CxkhEvents entity,String where) throws Exception{
		CxkhEvents ce=creditService.findForObject2("com.nasoft.aboutcar.CxkhEventsMapper.selectList", entity);
		request.setAttribute("event", ce);
		request.setAttribute("where", where);
		return "credit/auditEvent";
    }
	

	@RequestMapping("event/driver/audit/detail")
    public String auditEventDetail(HttpServletRequest request,CxkhEvents entity,DrvEventReview review,String where) throws Exception{
		DrvEventReview der=creditService.findForObject2("com.nasoft.aboutcar.DrvEventReview.findByReviewNo", review);
		
		entity.setEventNo(der.getEvent_no());
		CxkhEvents ce=creditService.findForObject2("com.nasoft.aboutcar.CxkhEventsMapper.selectList", entity);
		
		request.setAttribute("er", der);
		request.setAttribute("event", ce);
		request.setAttribute("where", where);
		return "credit/auditEventDetail";
    }


	@RequestMapping("event/platform/audit/detail")
    public String auditEventDetail(HttpServletRequest request,CxkhEvents entity,ComEventReview review,String where) throws Exception{
		ComEventReview der=creditService.findForObject2("com.nasoft.aboutcar.ComEventReview.findByReviewNo", review);
		
		entity.setEventNo(der.getEvent_no());
		CxkhEvents ce=creditService.findForObject2("com.nasoft.aboutcar.CxkhEventsMapper.selectList", entity);
		
		request.setAttribute("er", der);
		request.setAttribute("event", ce);
		request.setAttribute("where", where);
		return "credit/auditEventDetail";
    }

	@RequestMapping("event/audited")
	public void auditEvent(HttpServletRequest request,HttpServletResponse response,
			String driverModels,String platformModels,DrvEventReview entity,
			@RequestParam(value="resultfile",required=false) MultipartFile resultfile){
		try {
			
			MngUserInfo MngUserInfo = getCurrentUser();
			
			//附件材料
			String result_file = "";
			if(resultfile!=null && !resultfile.isEmpty()){
				InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
			    Properties p = new Properties();
			    p.load(in);
				String hostname = p.getProperty("ftp.hostname");
				int port = Integer.valueOf(p.getProperty("ftp.port"));
				String username = p.getProperty("ftp.username");
				String password = p.getProperty("ftp.password");
				
				String pathname = "upload/credit/eventReview"; 
				
				String filename = "result_"+entity.getEvent_no()+resultfile.getOriginalFilename().substring(resultfile.getOriginalFilename().lastIndexOf(".")); 
				InputStream inputStream  = resultfile.getInputStream();
				Boolean flag = FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, filename, inputStream);
				if(flag){
					result_file = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+filename;
				}
			}

			JSONArray ja=JSONArray.fromObject(driverModels);
			//驾驶员失信记分表
			List<DrvScoreRecord> scoreRecordList = new ArrayList<DrvScoreRecord>();
			List<DrvEventReview> drvEventReviews=new ArrayList<DrvEventReview>();
			
			for(int ii=0;ii<ja.size();ii++){
				
				JSONObject jo=ja.getJSONObject(ii);
				if(jo.getString("indics").equals("")){
					break;
				}
				JSONArray indics=jo.getJSONArray("indics");
				jo.put("indics", "");
				
				DriverModel dm=(DriverModel) JSONObject.toBean(jo,DriverModel.class);
								
				if(indics.size()>0){					
					
					ii++;
					
					//驾驶员失信事件审核表
					DrvEventReview drvEventReview = new DrvEventReview();
					drvEventReview.setReview_no(DateUtil.dateToString(new Date(), DateUtil.SDFyyyyMMddHHmmss2)+String.format("%02d",ii));
					drvEventReview.setCreate_time(new Date());
					drvEventReview.setEvent_no(entity.getEvent_no());
					drvEventReview.setCreate_user(MngUserInfo.getUserId());
					drvEventReview.setResult_file(result_file);
					drvEventReview.setReview_date(new Date());
					drvEventReview.setReview_result(entity.getReview_result());
					drvEventReview.setReview_status("已审核");
					drvEventReview.setCertno(dm.getCertno());
					drvEventReview.setDrv_license(dm.getCertno());
					drvEventReview.setDrv_name(dm.getUsername());
					drvEventReview.setScore(dm.getAllScore());
					
					int i = 0;
					for(Object indic : indics){

						i++;
						
						CxkhIndic ci=(CxkhIndic) JSONObject.toBean(JSONObject.fromObject(indic),CxkhIndic.class);
						
						DrvScoreRecord drvScoreRecord = new DrvScoreRecord();
						drvScoreRecord.setReview_no(drvEventReview.getReview_no());
						drvScoreRecord.setRec_no(drvEventReview.getReview_no()+String.format("%02d",i));
						drvScoreRecord.setCreate_time(new Date());
						drvScoreRecord.setDrv_name(dm.getUsername());
						drvScoreRecord.setCertno(dm.getCertno());
						drvScoreRecord.setEvent_no(entity.getEvent_no());
						drvScoreRecord.setCreate_user(MngUserInfo.getUserId());
						drvScoreRecord.setRec_date(new Date());
						drvScoreRecord.setRec_status("有效");
						drvScoreRecord.setIndic_code(ci.getIndicCode());
						drvScoreRecord.setIndic_text(ci.getIndicText());
						drvScoreRecord.setScore(ci.getScore());
						scoreRecordList.add(drvScoreRecord);
					}
					
					drvEventReviews.add(drvEventReview);
				}

			}
			
			
			//平台

			ja=JSONArray.fromObject(platformModels);
			List<ComEventReview> comEventReviews=new ArrayList<ComEventReview>();
			List<ComScoreRecord> comScoreRecordList = new ArrayList<ComScoreRecord>();
			
			for(int ii=0;ii<ja.size();ii++){
				
				JSONObject jo=ja.getJSONObject(ii);

				if(jo.getString("indics").equals("")){
					break;
				}
				
				JSONArray indics=jo.getJSONArray("indics");
				jo.put("indics", "");
				
				PlatformModel dm=(PlatformModel) JSONObject.toBean(jo,PlatformModel.class);
								
				if(indics.size()>0){
					ComEventReview comEventReview = new ComEventReview();
					comEventReview.setReview_no(DateUtil.dateToString(new Date(), DateUtil.SDFyyyyMMddHHmmss2)+String.format("%02d", ii));
					comEventReview.setCreate_time(new Date());
					comEventReview.setEvent_no(entity.getEvent_no());
					comEventReview.setCreate_user(MngUserInfo.getUserId());			
					comEventReview.setResult_file(result_file);
					comEventReview.setReview_date(new Date());
					comEventReview.setReview_result(entity.getReview_result());
					comEventReview.setReview_status("已审核");
					comEventReview.setCreditcode(dm.getCreditCode());
					comEventReview.setCom_license(dm.getCreditCode());
					comEventReview.setScore(dm.getAllScore());
										
					for(int i=0;i<indics.size();i++){
						
						CxkhIndic ci=(CxkhIndic) JSONObject.toBean(JSONObject.fromObject(indics.get(i)),CxkhIndic.class);
						
						ComScoreRecord comScoreRecord = new ComScoreRecord();
						comScoreRecord.setReview_no(comEventReview.getReview_no());
						comScoreRecord.setRec_no(comEventReview.getReview_no()+String.format("%02d", i));
						comScoreRecord.setCreate_time(new Date());
						comScoreRecord.setCreditcode(dm.getCreditCode());
						comScoreRecord.setEvent_no(entity.getEvent_no());
						comScoreRecord.setCreate_user(MngUserInfo.getUserId());
						comScoreRecord.setRec_date(new Date());
						comScoreRecord.setRec_status("有效");
						comScoreRecord.setIndic_code(ci.getIndicCode());
						comScoreRecord.setIndic_text(ci.getIndicText());
						comScoreRecord.setScore(ci.getScore());
						comScoreRecordList.add(comScoreRecord);
					}

					comEventReviews.add(comEventReview);
				}
			
			}			

			drvEventReviewService.drvEventReview(drvEventReviews, scoreRecordList,comEventReviews,comScoreRecordList);
			
			writer(response,"success");
		} catch (Exception e) {
			writer(response,e.getMessage());
			e.printStackTrace();
		}
	}
	

	@RequestMapping("event/find")
    public void findEvent(HttpServletRequest request,HttpServletResponse response,CxkhEvents entity) throws Exception{
		CxkhEvents ce=creditService.findForObject2("com.nasoft.aboutcar.CxkhEventsMapper.selectList", entity);
		writer(response,ce);
    }
	

	@RequestMapping("driver/detail")
    public void findDriverDetail(HttpServletRequest request,HttpServletResponse response,String drvCertno) throws Exception{

		DrvUserinfo drv = creditService.findForObject2("com.nasoft.aboutcar.CxkhDrvAnnualWorkMapper.findDrvUserinfo",drvCertno);

		writer(response,drv);
    }
	

	@RequestMapping("driver/cert/detail")
    public void findDriverCertDetail(HttpServletRequest request,HttpServletResponse response,String drvCertno) throws Exception{

		DrvPermitcertModel drv = creditService.findForObject2("com.nasoft.aboutcar.CxkhDrvAnnualWorkMapper.findDrvPermitcert",drvCertno);

		writer(response,drv);
    }
	


	@RequestMapping("driver/aw/list")
    public void listDriverAnnualWork(HttpServletRequest request,HttpServletResponse response,CxkhDrvAnnualWork entity) throws Exception{

		
		List<CxkhDrvAnnualWork> list = creditService.findForList2("com.nasoft.aboutcar.CxkhDrvAnnualWorkMapper.selectList",entity);

		writer(response,list);
    }
	 

	@RequestMapping("driver/pun/list")
    public void listDriverPunRecord(HttpServletRequest request,HttpServletResponse response,CxkhDrvPunRecord entity) throws Exception{

		
		List<CxkhDrvPunRecord> list = creditService.findForList2("com.nasoft.aboutcar.CxkhDrvPunRecordMapper.selectList",entity);

		writer(response,list);
    }


	@RequestMapping("driver/xzcf/list")
    public void listDriverXzcfRecord(HttpServletRequest request,HttpServletResponse response,XzcfDricaseInfo entity) throws Exception{

		
		List<XzcfDricaseInfo> list = creditService.findForList2("com.nasoft.aboutcar.XzcfDricaseInfoMapper.selectList",entity);

		writer(response,list);
    }
	

	
	@RequestMapping("platform/drivers")
    public String listPlatformDrivers(HttpServletRequest request,HttpServletResponse response,CxkhComAnnualWork entity) throws Exception{

		Platform platform=platformService.findPlatformById("com.nasoft.aboutcar.PlatformMapper.searchPlatformById", entity.getComLicense());
		request.setAttribute("platform", platform);
		return "credit/listDrvforPlatform";
    }
		
	@RequestMapping("platform/driver/list")
    public void findDriversforPlatform(HttpServletRequest request,HttpServletResponse response,CxkhComAnnualWork entity) throws Exception{

		List<CxkhDrvAnnualWork> aws = creditService.findForList2("com.nasoft.aboutcar.CxkhDrvAnnualWorkMapper.listDrvforPlatform",entity);

		writer(response,aws);
    }
	
	@RequestMapping("event/driver/find")
    public void findDriver(HttpServletRequest request,HttpServletResponse response,CxkhEvents entity,String drvCertno) throws Exception{

		DriverModel drv = creditService.findForObject2("com.nasoft.aboutcar.DrvRecordMapper.selectDetailByCertno2",drvCertno);

		writer(response,drv);
    }
	

	@RequestMapping("event/audit/selectscore")
    public String auditEventSelectScore(HttpServletRequest request,HttpServletResponse response,CxkhEvents entity,DriverModel driver,String category) throws Exception{
		request.setAttribute("category", category);
		return "credit/auditEventSelectScore";
    }
	


	@RequestMapping("indic/list")
    public void listIndic(HttpServletRequest request,HttpServletResponse response,CxkhIndic ci) throws Exception{

		ci.setIndicStatus("1");
		List<CxkhIndic> list = creditService.findForList2("com.nasoft.aboutcar.CxkhIndicMapper.selectList",ci);
		
		writer(response,list);
    }


	@RequestMapping("event/platform/find")
    public void findPlatform(HttpServletRequest request,HttpServletResponse response,CxkhEvents entity,String creditcode) throws Exception{

		Platform platform=platformService.findPlatformById("com.nasoft.aboutcar.PlatformMapper.searchPlatformById", creditcode);
		
		writer(response,platform);
    }
	

	
	
	
	//处理审核
	@RequestMapping("drvEventReview")
	public ModelAndView drvEventReview(HttpServletRequest request,String[] indics,String event_no,String certno,String drvName,String review_result,String scoreSum,@RequestParam(value="resultfile",required=false) MultipartFile resultfile){
		ModelAndView mv=new ModelAndView();
		try {
			MngUserInfo MngUserInfo = getCurrentUser();
			//驾驶员失信事件审核表
			DrvEventReview drvEventReview = new DrvEventReview();
			drvEventReview.setReview_no(DateUtil.dateToString(new Date(), DateUtil.SDFyyyyMMddHHmmss2));
			drvEventReview.setCreate_time(new Date());
			drvEventReview.setEvent_no(event_no);
			drvEventReview.setCreate_user(MngUserInfo.getUserId());
			String result_file = "";
			
			if(!resultfile.isEmpty()){
				InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
			    Properties p = new Properties();
			    p.load(in);
				String hostname = p.getProperty("ftp.hostname");
				int port = Integer.valueOf(p.getProperty("ftp.port"));
				String username = p.getProperty("ftp.username");
				String password = p.getProperty("ftp.password");
				
				String pathname = "upload/credit/eventReview"; 
				
				String filename = "result_"+event_no+resultfile.getOriginalFilename().substring(resultfile.getOriginalFilename().lastIndexOf(".")); 
				InputStream inputStream  = resultfile.getInputStream();
				Boolean flag = FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, filename, inputStream);
				if(flag){
					result_file = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+filename;
				}
			}
			drvEventReview.setResult_file(result_file);
			drvEventReview.setReview_date(new Date());
			drvEventReview.setReview_result(review_result);
			drvEventReview.setReview_status("已审核");
			drvEventReview.setCertno(certno);
			drvEventReview.setDrv_name(drvName);
			
			//驾驶员失信记分表
			List<DrvScoreRecord> scoreRecordList = new ArrayList<DrvScoreRecord>();
			if(null != indics){
				int i = 0;
				for(String indicCode : indics){
					DrvScoreRecord drvScoreRecord = new DrvScoreRecord();
					drvScoreRecord.setRec_no(DateUtil.dateToString(new Date(), DateUtil.SDFyyyyMMddHHmmss2)+i);
					drvScoreRecord.setCreate_time(new Date());
					drvScoreRecord.setDrv_name(drvName);
					drvScoreRecord.setCertno(certno);
					drvScoreRecord.setEvent_no(event_no);
					drvScoreRecord.setCreate_user(MngUserInfo.getUserId());
					drvScoreRecord.setRec_date(new Date());
					drvScoreRecord.setRec_status("有效");
					drvScoreRecord.setIndic_code(indicCode);
					Indic indic = indicService.selectOneById("com.nasoft.aboutcar.IndicMapper.selectOneById",indicCode);
					if(null != indic){
						drvScoreRecord.setIndic_text(indic.getIndic_text());
						drvScoreRecord.setScore(indic.getScore());
					}
					i++;
					scoreRecordList.add(drvScoreRecord);
				}
			}
			
			drvEventReviewService.drvEventReview(drvEventReview, scoreRecordList,scoreSum);
			
			mv.addObject("msg","success");
		} catch (Exception e) {
			mv.addObject("msg","failed");
			e.printStackTrace();
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	//平台考核信息审核
	@RequestMapping("comEvent")
	public String comEvent(HttpServletRequest request,HttpServletResponse response){

		return "credit/comEventList";
	}
	
	@RequestMapping("comEventList")
	public void comEventList(HttpServletRequest request,HttpServletResponse response,String status){
		String comname = request.getParameter("comname");
		String creditcode = request.getParameter("creditcode");
		Map<String, Object> m = new HashMap<String, Object>();
		//MngUserInfo MngUserInfo = getCurrentUser();
		m.put("comname", comname);
		m.put("creditcode", creditcode);
		if(!StringUtils.isNullOrEmpty(status))m.put("status", status);
		List<Map> eventList = new ArrayList<Map>();
		try {
			eventList = (List<Map>) eventsService.findComEvents("com.nasoft.aboutcar.Events.findComEvents",m);
			if(eventList.size() > 0){
				for(Map map:eventList){
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					map.put("occur_date", dateFormat.format((Date) map.get("occur_date")));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(eventList.toArray());
		writer(response, array+"");
	}
	

	@RequestMapping("findEvent")
	public void findEvent(HttpServletRequest request,HttpServletResponse response,Events event) throws Exception{

		event = eventsService.findEventsByNo("com.nasoft.aboutcar.Events.findEventsByNo", event.getEvent_no());
		
		writer(response,event);				
	}
	
	@RequestMapping("findPlatform")
	public void findPlatform(HttpServletRequest request,HttpServletResponse response,Platform platform) throws Exception{

		Platform _platform=platformService.findPlatformById("com.nasoft.aboutcar.PlatformMapper.searchPlatformById", platform.getCreditCode());
		
		writer(response,_platform);				
	}
	
	@RequestMapping("comEventDetail")
	public String comEventDetail(HttpServletRequest request,String creditcode,String event_no){
		try {
			Platform platform=platformService.findPlatformById("com.nasoft.aboutcar.PlatformMapper.searchPlatformById", creditcode);
			Events event = eventsService.findEventsByNo("com.nasoft.aboutcar.Events.findEventsByNo", event_no);
			ComEventReview comEventReview = comEventReviewService.findByEventNo("com.nasoft.aboutcar.ComEventReview.findByEventNo", event_no);
			if(null != comEventReview && "已审核".equals(comEventReview.getReview_status())){
				List<ComScoreRecord> comScoreRecordList = comScoreRecordService.selectByEventNo("com.nasoft.aboutcar.ComScoreRecord.selectByEventNo", event_no);
				request.setAttribute("comScoreRecordList", comScoreRecordList);
			}else{
				List<Map> indicList = indicService.findAllIndic("com.nasoft.aboutcar.IndicMapper.findAllIndic");
				request.setAttribute("indicList", indicList);
			}
			request.setAttribute("platform", platform);
			request.setAttribute("event", event);
			request.setAttribute("comEventReview", comEventReview);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "credit/comEventDetail";
	}
	
	//处理审核
	@RequestMapping("comEventReview")
	public ModelAndView comEventReview(HttpServletRequest request,String[] indics,String event_no,String creditcode,String scoreSum,String review_result,@RequestParam(value="resultfile",required=false) MultipartFile resultfile){
		ModelAndView mv=new ModelAndView();
		try {
			MngUserInfo MngUserInfo = getCurrentUser();
			//驾驶员失信事件审核表
			ComEventReview comEventReview = new ComEventReview();
			comEventReview.setReview_no(DateUtil.dateToString(new Date(), DateUtil.SDFyyyyMMddHHmmss2));
			comEventReview.setCreate_time(new Date());
			comEventReview.setEvent_no(event_no);
			comEventReview.setCreate_user(MngUserInfo.getUserId());
			String result_file = "";
			
			if(!resultfile.isEmpty()){
				InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
				Properties p = new Properties();
				p.load(in);
				String hostname = p.getProperty("ftp.hostname");
				int port = Integer.valueOf(p.getProperty("ftp.port"));
				String username = p.getProperty("ftp.username");
				String password = p.getProperty("ftp.password");
				
				String pathname = "upload/credit/eventReview"; 
				
				String filename = "result_"+event_no+resultfile.getOriginalFilename().substring(resultfile.getOriginalFilename().lastIndexOf(".")); 
				InputStream inputStream  = resultfile.getInputStream();
				Boolean flag = FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, filename, inputStream);
				if(flag){
					result_file = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+filename;
				}
			}
			comEventReview.setResult_file(result_file);
			comEventReview.setReview_date(new Date());
			comEventReview.setReview_result(review_result);
			comEventReview.setReview_status("已审核");
			comEventReview.setCreditcode(creditcode);
			
			//驾驶员失信记分表
			List<ComScoreRecord> scoreRecordList = new ArrayList<ComScoreRecord>();
			if(null != indics){
				int i = 0;
				for(String indicCode : indics){
					ComScoreRecord comScoreRecord = new ComScoreRecord();
					comScoreRecord.setRec_no(DateUtil.dateToString(new Date(), DateUtil.SDFyyyyMMddHHmmss2)+i);
					comScoreRecord.setCreate_time(new Date());
					comScoreRecord.setCreditcode(creditcode);
					comScoreRecord.setEvent_no(event_no);
					comScoreRecord.setCreate_user(MngUserInfo.getUserId());
					comScoreRecord.setRec_date(new Date());
					comScoreRecord.setRec_status("有效");
					comScoreRecord.setIndic_code(indicCode);
					Indic indic = indicService.selectOneById("com.nasoft.aboutcar.IndicMapper.selectOneById",indicCode);
					if(null != indic){
						comScoreRecord.setIndic_text(indic.getIndic_text());
						comScoreRecord.setScore(indic.getScore());
					}
					i++;
					scoreRecordList.add(comScoreRecord);
				}
			}
			
			comEventReviewService.comEventReview(comEventReview, scoreRecordList,scoreSum);
			
			mv.addObject("msg","success");
		} catch (Exception e) {
			mv.addObject("msg","failed");
			e.printStackTrace();
		}
		mv.setViewName("save_result");
		return mv;
	}
	

	@RequestMapping("checkIdcard")
	public void checkIdcard(HttpServletRequest request,HttpServletResponse response,String idcards){

		String[] _idcards=idcards.split(",");
		try {
			for(String idcard :_idcards){		
				Map map=creditService.findForObject2("com.nasoft.aboutcar.Events.findDriverRecord", idcard);
				if(map==null){
					throw new Exception("未找到驾驶员信息【"+idcard+"】");
				}
			}		
			writer(response,"success");
		} catch (Exception e) {
			e.printStackTrace();
			writer(response,"身份证号验证失败："+e.getMessage());
		}			
		
	}
	

	@RequestMapping("checkCreditcode")
	public void checkCreditcode(HttpServletRequest request,HttpServletResponse response,String creditcodes){

		String[] _creditcodes=creditcodes.split(",");
		try {
			for(String creditcode :_creditcodes){		
				Map map=creditService.findForObject2("com.nasoft.aboutcar.Events.findComRecord", creditcode);
				if(map==null){
					throw new Exception("未找到平台信息【"+creditcode+"】");
				}
			}		
			writer(response,"success");
		} catch (Exception e) {
			e.printStackTrace();
			writer(response,"平台验证失败："+e.getMessage());
		}			
		
	}
	
	@RequestMapping("toEventsAdd")
	public String toDrvEventsAdd(HttpServletRequest request,String event_type){
		request.setAttribute("event_type", event_type);
		return "credit/eventAdd";
	}
	
	@RequestMapping("addEvents")
	public ModelAndView addEvents(Events events,String occurDate,@RequestParam(value="attachmentfile",required=false) MultipartFile attachmentfile){
		ModelAndView mv=new ModelAndView();
		String msg="";
		try {
			events.setCreate_time(new Date());
			events.setData_source("手工录入");
			events.setEvent_no(DateUtil.dateToString(new Date(), DateUtil.SDFyyyyMMddHHmmss2));
			events.setStorage_date(new Date());
			events.setEvent_status("未处理");
			Date d = DateUtil.stringToDate(occurDate, DateUtil.SDFyyyyMMdd);
			events.setOccur_date(d);
			String attachment = "";
			if(!attachmentfile.isEmpty()){
				InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
				Properties p = new Properties();
				p.load(in);
				String hostname = p.getProperty("ftp.hostname");
				int port = Integer.valueOf(p.getProperty("ftp.port"));
				String username = p.getProperty("ftp.username");
				String password = p.getProperty("ftp.password");
				
				String pathname = "upload/credit/event"; 
				
				String filename = "event_"+events.getEvent_no()+attachmentfile.getOriginalFilename().substring(attachmentfile.getOriginalFilename().lastIndexOf(".")); 
				InputStream inputStream  = attachmentfile.getInputStream();
				Boolean flag = FtpUtil.uploadFileFromProduction(hostname, port, username, password, pathname, filename, inputStream);
				if(flag){
					attachment = "ftp://"+username+":"+password+"@"+hostname+":"+port+"/"+pathname+"/"+filename;
				}
			}
			events.setAttachment(attachment);
			eventsService.addEvents("com.nasoft.aboutcar.Events.addEvents", events);
		    msg="success";
		} catch (Exception e) {
			msg="failed";
			e.printStackTrace();
		}
		mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
	}
	
	

	
	@RequestMapping("punish/set/list")
	public void listPunishedSet(HttpServletRequest request,HttpServletResponse response,CxkhPunishedSet set) throws Exception{
		List<CxkhPunishedSet> list=creditService.findForList2("com.nasoft.aboutcar.CxkhPunishedSetMapper.selectList", set);
		writer(response,list);
	}
	
	//驾驶员考核处分设定
	@RequestMapping("drvPunishedSet")
	public String drvPunishedSet(HttpServletRequest request){
		request.setAttribute("pun_type", "1");
		return "credit/punishedSetList";
	}
	
	//平台考核处分设定
	@RequestMapping("comPunishedSet")
	public String comPunishedSet(HttpServletRequest request){
		request.setAttribute("pun_type", "2");
		return "credit/punishedSetList";
	}
	
	@RequestMapping("findAllPunishedSet")
	public void findAllPunishedSet(HttpServletRequest request,HttpServletResponse response){
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			String pun_text=request.getParameter("pun_text");
			String pun_type=request.getParameter("pun_type");
			map.put("pun_text", pun_text);
			map.put("pun_type", pun_type);
			List<PunishedSet> list=punishedSetService.findAllPunishedSet("com.nasoft.aboutcar.PunishedSet.findAllPunishedSet", map);
			JSONArray array = JSONArray.fromObject(list);
			writer(response, array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("toPunishedSetAdd")
	public String toPunishedSetAdd(HttpServletRequest request,String pun_type){
		request.setAttribute("pun_type", pun_type);
		return "credit/punishedSetAdd";
	}
	
	@RequestMapping("addPunishedSet")
	public ModelAndView addPunishedSet(PunishedSet punishedSet){
		ModelAndView mv=new ModelAndView();
		String msg="";
		try {
			punishedSet.setCreate_time(new Date());
			punishedSetService.addPunishedSet("com.nasoft.aboutcar.PunishedSet.addPunishedSet", punishedSet);
		    msg="success";
		} catch (Exception e) {
			msg="failed";
			e.printStackTrace();
		}
		mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
	}
	
	@RequestMapping("toPunishedSetUpdate")
	public String toPunishedSetUpdate(String punCode,HttpServletRequest request,HttpServletResponse response){
		try {
			PunishedSet punishedSet=punishedSetService.findPunishedSetByPunCode("com.nasoft.aboutcar.PunishedSet.findPunishedSetByPunCode", punCode);
			request.setAttribute("punishedSet", punishedSet);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "credit/punishedSetUpdate";
	}
		
	@RequestMapping("updatePunishedSet")
	public ModelAndView updatePunishedSet(HttpServletRequest request,HttpServletResponse response,PunishedSet punishedSet){
		ModelAndView mv=new ModelAndView();
		String msg="";
		try {
			punishedSet.setUpdate_time(new Date());
			punishedSetService.updatePunishedSet("com.nasoft.aboutcar.PunishedSet.updatePunishedSet", punishedSet);
		    msg="success";
		} catch (Exception e) {
			msg="failed";
			e.printStackTrace();
		}
		mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
	}
	
	@RequestMapping("/deletePunishedSet")
	public void deletePunishedSet(HttpServletRequest request, HttpServletResponse response){
		String punCodes = request.getParameter("punCodes");
		String result = "";
		try {
			punishedSetService.deletePunishedSet("com.nasoft.aboutcar.PunishedSet.deletePunishedSet",punCodes);
			result = "success";
		} catch (Exception e) {
			result = "fail";
			e.printStackTrace();
		}
		writer(response, result);
	}
	
	//平台记分申诉处理
	@RequestMapping("platform/appeal")
	public String comAppeal(HttpServletRequest request,HttpServletResponse response){
		
		return "credit/comAppealList";
	}
	

	@RequestMapping("driver/appeal")
	public String drvAppeal(HttpServletRequest request,HttpServletResponse response){
		
		return "credit/drvAppealList";
	}

	@RequestMapping("auditComAppealDetail")
	public void auditComAppealDetail(HttpServletRequest request,HttpServletResponse response,ComAppealD comAppealD) throws Exception{

		Map<String,String> param =new HashMap<String,String>();
		param.put("rec_no", comAppealD.getRec_no());
		ComAppealD cad=creditService.findForObject2("com.nasoft.aboutcar.ComAppealD.findByRecNo", param);
	
		cad.setId(comAppealD.getId());
		cad.setDeal_result(comAppealD.getDeal_result());
		cad.setAppeal_status("已审核");
		cad.setUpdate_time(new Date());
		cad.setAppeal_result(comAppealD.getAppeal_result());
		creditService.update2("com.nasoft.aboutcar.ComAppealD.updateComAppealD", cad);
		
		writer(response,"success");
	}


	@RequestMapping("auditComAppealResult")
	public String auditComAppealResult(HttpServletRequest request,HttpServletResponse response,ComAppeals comAppeals,ComAppealD comAppealD) throws Exception{

		Map<String,String> param =new HashMap<String,String>();
		param.put("rec_no", comAppealD.getRec_no());
		
		ComAppealD cad=creditService.findForObject2("com.nasoft.aboutcar.ComAppealD.findByRecNo", param);
		request.setAttribute("cad", cad);

		ComAppeals ca=creditService.findForObject2("com.nasoft.aboutcar.ComAppeals.findByAppealNo", cad);
		request.setAttribute("ca", ca);
		
		Platform platform=platformService.findPlatformById("com.nasoft.aboutcar.PlatformMapper.searchPlatformById", ca.getCreditcode());
		request.setAttribute("platform", platform);
		
		List<ComScoreRecord> csr=creditService.findForList2("com.nasoft.aboutcar.ComScoreRecord.selectByRecNo", cad.getRec_no());
		request.setAttribute("comScoreRecordList", csr);
		
		Events event = eventsService.findEventsByNo("com.nasoft.aboutcar.Events.findEventsByNo", csr.get(0).getEvent_no());
		request.setAttribute("event", event);
				
		return "credit/auditComAppealResult";
	}

	@RequestMapping("auditComAppeal")
	public String auditComAppeal(HttpServletRequest request,HttpServletResponse response,ComAppeals comAppeals,ComAppealD comAppealD) throws Exception{

		Map<String,String> param =new HashMap<String,String>();
		param.put("rec_no", comAppealD.getRec_no());
		
		ComAppealD cad=creditService.findForObject2("com.nasoft.aboutcar.ComAppealD.findByRecNo", param);
		request.setAttribute("cad", cad);

		ComAppeals ca=creditService.findForObject2("com.nasoft.aboutcar.ComAppeals.findByAppealNo", cad);
		request.setAttribute("ca", ca);
		
		Platform platform=platformService.findPlatformById("com.nasoft.aboutcar.PlatformMapper.searchPlatformById", ca.getCreditcode());
		request.setAttribute("platform", platform);
		
		List<ComScoreRecord> csr=creditService.findForList2("com.nasoft.aboutcar.ComScoreRecord.selectByRecNo", cad.getRec_no());
		request.setAttribute("comScoreRecordList", csr);
		
		Events event = eventsService.findEventsByNo("com.nasoft.aboutcar.Events.findEventsByNo", csr.get(0).getEvent_no());
		request.setAttribute("event", event);
				
		return "credit/auditComAppeal";
	}
	
	@RequestMapping("comAppealList")
	public void comAppealList(HttpServletRequest request,HttpServletResponse response){
		String comname = request.getParameter("comname");
		String creditcode = request.getParameter("creditcode");
		Map<String, Object> m = new HashMap<String, Object>();
		//MngUserInfo MngUserInfo = getCurrentUser();
		m.put("comname", comname);
		m.put("creditcode", creditcode);
		List<Map> appealList = new ArrayList<Map>();
		try {
			appealList = (List<Map>) comAppealDService.findComAppealD("com.nasoft.aboutcar.ComAppealD.findComAppealD",m);
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(appealList.toArray());
		writer(response, array+"");
	}


	@RequestMapping("driver/appeal/list")
	public void listDrvAppeal(HttpServletRequest request,HttpServletResponse response,CxkhDrvAppeals drvAppeal) throws Exception{

		List<CxkhDrvAppealDetailModel> list=creditService.findForList2("com.nasoft.aboutcar.CxkhDrvAppealsMapper.selectList2", drvAppeal);
		
		writer(response, list);
		
	}
	

	@RequestMapping("driver/appeal/audit")
	public String auditDrvAppeal(HttpServletRequest request,HttpServletResponse response,CxkhDrvAppeals cxkhDrvAppeals,CxkhDrvAppealD cxkhDrvAppealD) throws Exception{

	
		CxkhDrvAppealD cad=creditService.findForObject2("com.nasoft.aboutcar.CxkhDrvAppealDMapper.selectList", cxkhDrvAppealD);		
		request.setAttribute("cad", cad);

		cxkhDrvAppeals.setAppealNo(cad.getAppealNo());
		CxkhDrvAppeals ca=creditService.findForObject2("com.nasoft.aboutcar.CxkhDrvAppealsMapper.selectList", cxkhDrvAppeals);
		request.setAttribute("ca", ca);
		
		Map<String,Object> drv = drvRecordService.selectDetailByCertno("com.nasoft.aboutcar.DrvRecordMapper.selectDetailByCertno",ca.getCertno());
		request.setAttribute("drv", drv);
		
		List<DrvScoreRecord> csr=creditService.findForList2("com.nasoft.aboutcar.DrvScoreRecord.selectByRecNo", cad.getRecNo());
		request.setAttribute("drvScoreRecordList", csr);
		
		Events event = eventsService.findEventsByNo("com.nasoft.aboutcar.Events.findEventsByNo", csr.get(0).getEvent_no());
		request.setAttribute("event", event);
				
		return "credit/auditDrvAppeal";
	}


	@RequestMapping("driver/appeal/result")
	public String auditDrvAppealResult(HttpServletRequest request,HttpServletResponse response,CxkhDrvAppeals cxkhDrvAppeals,CxkhDrvAppealD cxkhDrvAppealD) throws Exception{

	
		CxkhDrvAppealD cad=creditService.findForObject2("com.nasoft.aboutcar.CxkhDrvAppealDMapper.selectList", cxkhDrvAppealD);		
		request.setAttribute("cad", cad);

		cxkhDrvAppeals.setAppealNo(cad.getAppealNo());
		CxkhDrvAppeals ca=creditService.findForObject2("com.nasoft.aboutcar.CxkhDrvAppealsMapper.selectList", cxkhDrvAppeals);
		request.setAttribute("ca", ca);
		
		Map<String,Object> drv = drvRecordService.selectDetailByCertno("com.nasoft.aboutcar.DrvRecordMapper.selectDetailByCertno",ca.getCertno());
		request.setAttribute("drv", drv);
		
		List<DrvScoreRecord> csr=creditService.findForList2("com.nasoft.aboutcar.DrvScoreRecord.selectByRecNo", cad.getRecNo());
		request.setAttribute("drvScoreRecordList", csr);
		
		Events event = eventsService.findEventsByNo("com.nasoft.aboutcar.Events.findEventsByNo", csr.get(0).getEvent_no());
		request.setAttribute("event", event);
				
		return "credit/auditDrvAppealResult";
	}
	
	@RequestMapping("driver/appeal/audited")
	public void auditDrvAppealDetail(HttpServletRequest request,HttpServletResponse response,CxkhDrvAppealD cxkhDrvAppealD) throws Exception{


		CxkhDrvAppealD cad=new CxkhDrvAppealD();
		cad.setDealResult(cxkhDrvAppealD.getDealResult());
		cad.setAppealResult(cxkhDrvAppealD.getAppealResult());

		cxkhDrvAppealD=creditService.findForObject2("com.nasoft.aboutcar.CxkhDrvAppealDMapper.selectById", cxkhDrvAppealD);	
		
		cad.setId(cxkhDrvAppealD.getId());
		cad.setAppealStatus("已审核");
		cad.setUpdateTime(new Date());
		creditService.update2("com.nasoft.aboutcar.CxkhDrvAppealDMapper.updateIfNotnull", cad);
		
		writer(response,"success");
	}

	//驾驶员考核处分名单
		@RequestMapping("drvpunishment")
		public String drvpunishment(){
			return "credit/driverPunishment";
		}
		//查询驾驶员考核处分名单
		@RequestMapping("/drvPunishmentList")
		public void drvPunishmentList(HttpServletRequest request,HttpServletResponse response){
			MngUserInfo MngUserInfo = getCurrentUser();
			String username = request.getParameter("userName");
			String pubStatus = request.getParameter("pubStatus");
			Map<String,String> map=new HashMap<>();
			String pubstatus="未公布";
			map.put("username", username);
			map.put("pun_text", pubStatus);
			map.put("pubStatus", pubstatus);
		map.put("instid", MngUserInfo.getInstId());
		try {
			List<Map> list=	creditService.findCreditDriverPunishmentList("com.nasoft.aboutcar.CxkhDrvPunList.findCreditDriverPunishmentList",map);
			Map map2 = list.get(0);	
			if(map2== null){
				JSONArray array = JSONArray.fromObject("[]");
				writer(response, array+"");
			}else{
				
				JSONArray array = JSONArray.fromObject(list.toArray());
				writer(response, array+"");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		}
		

		@RequestMapping("platform/punish/list/create")
		public void createPLPunishList(HttpServletRequest request,HttpServletResponse response,CxkhPunishedSet set) throws Exception{
//			MngUserInfo MngUserInfo = getCurrentUser();

			List<CxkhDrvAnnualWork> list=new ArrayList<CxkhDrvAnnualWork>();
			if(set.getPunCode()!=null){
				
				CxkhPunishedSet _set=creditService.findForObject2("com.nasoft.aboutcar.CxkhPunishedSetMapper.selectList", set);
				
				list=creditService.findForList2("com.nasoft.aboutcar.CxkhComPunListMapper.listforPunish",_set);
								
			}
			
			writer(response,list);
			
		}
		

		@RequestMapping("platform/punish/list/submit")
		public void submitPLPunishList(HttpServletRequest request,HttpServletResponse response,CxkhPunishedSet set,String creditcodes){
			String[] _creditcodes=creditcodes.split(",");
			
			try {

				DateTime dt=new DateTime();
				CxkhPunishedSet _set=creditService.findForObject2("com.nasoft.aboutcar.CxkhPunishedSetMapper.selectList", set);
				String listNo=dt.format("yyMMddHHmmss")+"-"+_set.getPunCode();
				CxkhComPunList cdpl=new CxkhComPunList();
				cdpl.setListNo(listNo);
				cdpl.setPunCode(_set.getPunCode().toString());
				cdpl.setPunText(_set.getPunText());
				cdpl.setPubDate(dt.turnIntoDate());
				cdpl.setPubStatus("已公示");
				cdpl.setCreateTime(dt.turnIntoDate());
				creditService.insert2("com.nasoft.aboutcar.CxkhComPunListMapper.insertIfNotnull", cdpl);
				
				
				for(int i=0;i<_creditcodes.length;i++){
					CxkhComPunRecord record=new CxkhComPunRecord();
					record.setListNo(cdpl.getListNo());//名单编号
					record.setComLicense(_creditcodes[i]);//驾驶证号
					record.setPunCode(cdpl.getPunCode());//处分代码
					record.setPunText(cdpl.getPunText());//处分内容
					record.setPunStatus("已公示");//处分状态
					record.setPunDate(cdpl.getPubDate());//处分日期
					creditService.insert2("com.nasoft.aboutcar.CxkhComPunList.addCxkhPlatPunRecord",record);
				}
				
				writer(response,"success");
			} catch (Exception e) {
				writer(response,e.getLocalizedMessage());
				e.printStackTrace();
			}
			
		}
		
		@RequestMapping("driver/punish/list/create")
		public void createDrvPunishList(HttpServletRequest request,HttpServletResponse response,CxkhPunishedSet set) throws Exception{
//			MngUserInfo MngUserInfo = getCurrentUser();

			List<CxkhDrvAnnualWork> list=new ArrayList<CxkhDrvAnnualWork>();
			
			if(set.getPunCode()!=null){
				CxkhPunishedSet _set=creditService.findForObject2("com.nasoft.aboutcar.CxkhPunishedSetMapper.selectList", set);
				list=creditService.findForList2("com.nasoft.aboutcar.CxkhDrvAnnualWorkMapper.listforPunish",_set);				
			}
			
			writer(response,list);
			
		}
		


		@RequestMapping("platform/punish/list/view")
		public String viewPLPunishList(HttpServletRequest request,HttpServletResponse response,CxkhComPunList cdpl) throws Exception{

			return "credit/platformPunishList";
		}
		

		@RequestMapping("platform/punish/list")
		public void listPLPunish(HttpServletRequest request,HttpServletResponse response,CxkhComPunList cdpl) throws Exception{

			List<CxkhComPunList> list=creditService.findForList2("com.nasoft.aboutcar.CxkhComPunListMapper.selectList", cdpl);
			
			writer(response, list);
			
		}


		@RequestMapping("driver/punish/list/view")
		public String viewDrvPunishList(HttpServletRequest request,HttpServletResponse response,CxkhDrvPunList cdpl) throws Exception{

			return "credit/driverPunishList";
		}

		@RequestMapping("driver/punish/list")
		public void listDrvPunish(HttpServletRequest request,HttpServletResponse response,CxkhDrvPunList cdpl) throws Exception{

			List<CxkhDrvPunList> list=creditService.findForList2("com.nasoft.aboutcar.CxkhDrvPunListMapper.selectList", cdpl);
			
			writer(response, list);
			
		}


		@RequestMapping("platform/punish/list/toDetail")
		public String toListPLPunishDetail(HttpServletRequest request,HttpServletResponse response,CxkhComPunList cdpl) throws Exception{

			request.setAttribute("listNo", cdpl.getListNo());
			return "credit/platformPunishListD";
			
		}

		@RequestMapping("driver/punish/list/toDetail")
		public String toListDrvPunishDetail(HttpServletRequest request,HttpServletResponse response,CxkhDrvPunList cdpl) throws Exception{

			request.setAttribute("listNo", cdpl.getListNo());
			return "credit/driverPunishListD";
			
		}

		@RequestMapping("platform/punish/list/detail")
		public void listPLPunishDetail(HttpServletRequest request,HttpServletResponse response,CxkhComPunRecord cdpr) throws Exception{

			List<CxkhComPunRecord> list=creditService.findForList2("com.nasoft.aboutcar.CxkhComPunList.selectList", cdpr);
			
			writer(response, list);
			
		}
		

		@RequestMapping("driver/punish/list/detail")
		public void listDrvPunishDetail(HttpServletRequest request,HttpServletResponse response,CxkhDrvPunRecord cdpr) throws Exception{

			List<CxkhDrvPunRecord> list=creditService.findForList2("com.nasoft.aboutcar.CxkhDrvPunRecordMapper.selectList", cdpr);
			
			writer(response, list);
			
		}
		
		@RequestMapping("driver/punish/list/submit")
		public void submitDrvPunishList(HttpServletRequest request,HttpServletResponse response,CxkhPunishedSet set,String drvLicenses){
			String[] _drvLicenses=drvLicenses.split(",");
			
			try {

				DateTime dt=new DateTime();
				CxkhPunishedSet _set=creditService.findForObject2("com.nasoft.aboutcar.CxkhPunishedSetMapper.selectList", set);
				String listNo=dt.format("yyMMddHHmmss")+"-"+_set.getPunCode();
				CxkhDrvPunList cdpl=new CxkhDrvPunList();
				cdpl.setListNo(listNo);
				cdpl.setPunCode(_set.getPunCode().toString());
				cdpl.setPunText(_set.getPunText());
				cdpl.setPubDate(dt.turnIntoDate());
				cdpl.setPubStatus("已公示");
				cdpl.setCreateTime(dt.turnIntoDate());
				creditService.insert2("com.nasoft.aboutcar.CxkhDrvPunListMapper.insertIfNotnull", cdpl);
				
				
				for(int i=0;i<_drvLicenses.length;i++){
					CxkhDrvPunRecord record=new CxkhDrvPunRecord();
					record.setListNo(cdpl.getListNo());//名单编号
					record.setDrvLicense(_drvLicenses[i]);//驾驶证号
					record.setPunCode(cdpl.getPunCode());//处分代码
					record.setPunText(cdpl.getPunText());//处分内容
					record.setPunStatus("已公示");//处分状态
					record.setPunDate(cdpl.getPubDate());//处分日期
					creditService.insert2("com.nasoft.aboutcar.CxkhDrvPunRecordMapper.insertIfNotnull",record);
				}
				
				writer(response,"success");
			} catch (Exception e) {
				writer(response,e.getLocalizedMessage());
				e.printStackTrace();
			}
			
		}
		
		@RequestMapping("/addRecord")
		public String addRecord(HttpServletRequest request,HttpServletResponse response){
			String status=null;
			String s=null;
			try {
				String data = request.getParameter("data");
				data = new String(data.getBytes("iso8859-1"),"UTF8");
				if(StringUtil.isNotEmpty(data)){
					JSONArray jsonArray = JSONArray.fromObject(data);
					for(int i=0;i<jsonArray.size();i++){
						CxkhDrvPunList cxkhDrvPunList= (CxkhDrvPunList) JSONObject.toBean(JSONObject.fromObject(jsonArray.get(i)), CxkhDrvPunList.class);
						String listNo = cxkhDrvPunList.getListNo();
						status=cxkhDrvPunList.getPunText();
					List<Map> 	list=creditService.findCxhDrvPunListByListNo("com.nasoft.aboutcar.CxkhDrvPunList.findCxhDrvPunListByListNo",listNo);
						CxkhDrvPunRecord record=new CxkhDrvPunRecord();
						record.setListNo(list.get(0).get("listNo")+"");//名单编号
						record.setDrvLicense(list.get(0).get("drvLicense")+"");//驾驶证号
						record.setPunCode(list.get(0).get("punCode")+"");//处分代码
						record.setPunText(list.get(0).get("punText")+"");//处分内容
						record.setPunStatus(list.get(0).get("pubStatus")+"");//处分状态
						record.setPunDate((Date)list.get(0).get("pubDate"));//处分日期
						record.setCancelDate((Date)list.get(0).get("punEndDate"));//处分取消日期
						creditService.addCxkhDrvPunRecord("com.nasoft.aboutcar.CxkhDrvPunRecord.addCxkhDrvPunRecord",record);
						String pubStatus="已公示";
						Map<String,String> map=new HashMap<>();
						map.put("pubStatus",pubStatus);
						map.put("listNo", listNo);
						creditService.updateCxkhDrvPunListByListNo("com.nasoft.aboutcar.CxkhDrvPunList.updateCxhDrvPunList",map);	
					}
					if(status.equals("警告")){
						s= "credit/driverPunishment";
					}else if(status.equals("再教育")){
						s="credit/driverRetrain";
					}else if(status.equals("吊销")){
						s="credit/dirverevoke";
					}
					
					}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return s;
			
		}
		@RequestMapping("/drvretrain")
		public String drvretrain(){
			return "credit/driverRetrain";
		}
		@RequestMapping("/drvrevoke")
		public String drvrevoke(){
			return "credit/drivervoke";
		}
		/**
		 * 导出驾驶员再教育信息
		 * @param request
		 * @param response
		 */
		@RequestMapping("/exportExcel")
		public void exportExcel(HttpServletRequest request,HttpServletResponse response){
			try {
				request.setCharacterEncoding("UTF-8");
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/x-download");
				String fileName = "驾驶员考试再教育列表.xlsx";
				fileName = URLEncoder.encode(fileName, "UTF-8");
				response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
				String data = request.getParameter("data");
				data = new String(data.getBytes("iso8859-1"),"UTF8");
				Workbook wb;
				String filePath = request.getRealPath("/template")+"/"+"驾驶员再教育模板.xlsx"; //模板位置
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
	        	if(StringUtil.isNotEmpty(data)){
					JSONArray jsonArray = JSONArray.fromObject(data);
					for(int i=0;i<jsonArray.size();i++){
						CxkhDrvPunList cxkhDrvPunList= (CxkhDrvPunList) JSONObject.toBean(JSONObject.fromObject(jsonArray.get(i)), CxkhDrvPunList.class);
						Row row = sheet.createRow(i+1);
						CellStyle cellStyle = wb.createCellStyle();
						cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
						//考试预约号
						Cell cell = row.createCell(0);
						cell.setCellValue(i+1);
						cell.setCellStyle(cellStyle);
						//姓名
						cell = row.createCell(1);
						cell.setCellValue(cxkhDrvPunList.getDrvName());
						cell.setCellStyle(cellStyle);
						//身份证号
						cell = row.createCell(2);
						cell.setCellValue(cxkhDrvPunList.getCertno());
						cell.setCellStyle(cellStyle);
						//所属平台 1.自有车辆 2.平台车辆 3.公司车辆
						cell = row.createCell(3);
						cell.setCellValue(cxkhDrvPunList.getBelongs()=="1"?"自有车辆":cxkhDrvPunList.getBelongs()=="2"?"平台车辆":"公司车辆");
						cell.setCellStyle(cellStyle);
						//车牌号
						cell = row.createCell(4);
						cell.setCellValue(cxkhDrvPunList.getCarnum());
						cell.setCellStyle(cellStyle);
						//累计分数
						cell = row.createCell(5);
						cell.setCellValue(cxkhDrvPunList.getScore());
						cell.setCellStyle(cellStyle);
					//处分结果
						cell = row.createCell(6);
						cell.setCellValue(cxkhDrvPunList.getPubStatus());
						cell.setCellStyle(cellStyle);
					}
				}
	        	try {
	            	out = response.getOutputStream();
	            	Base64OutputStream base64OutputStream = new Base64OutputStream(out);
	            	String agent = request.getHeader("User-Agent");
	            	if(agent.contains("Firefox")){
	            		wb.write(base64OutputStream);
	            	}else{
	            		wb.write(out);
	            	}
	            } catch (IOException e) {
	                e.printStackTrace();
	            } finally {
	            	if(out != null){
	            		try {
	                        out.close();
	                    } catch (IOException e) {
	                        e.printStackTrace();
	                    }
	            	}
	            }
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		/**
		 * 跳转到驾驶员诚信考核查询页面
		 * @return
		 */
		@RequestMapping("/drvexamination")
		public String driverExamination(){
			return "credit/driverExamination";
		}
		@RequestMapping("/drvExamination")
		public void drvExamination(HttpServletRequest request,HttpServletResponse response){
			try {
				
				Map<String,String> map=new HashMap<>();
				String username = request.getParameter("username");
				String year = request.getParameter("year");
				map.put("username", username);
				map.put("year", year);
				List<Map> list=creditService.findDrvExaminationList("com.nasoft.aboutcar.CxkhDrvAnnualWorkMapper.findDrvExaminationList2",map);
				JSONArray array = JSONArray.fromObject(list.toArray());
				writer(response, array+"");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		@RequestMapping("/findAllYear")
		public void findAllYear(HttpServletRequest request,HttpServletResponse response){
			try {
				CxkhDrvAnnualWork entity=new CxkhDrvAnnualWork();
				List<CxkhDrvAnnualWork> list=creditService.findForList2("com.nasoft.aboutcar.CxkhDrvAnnualWorkMapper.findAllYear",entity);
				writer(response,list);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		@RequestMapping("/toShowDetail")
		public String toShowDetail(HttpServletRequest request,HttpServletResponse response){
			String drivecardno = request.getParameter("drivecardno");
			request.getSession().setAttribute("drivecardno", drivecardno);
			return "credit/creditDriverDetail";
		}
		@RequestMapping("/showDetail")
		public void showDetail(HttpServletRequest request,HttpServletResponse response){
			try {
				String drivecardno = request.getSession().getAttribute("drivecardno")+"";
			List<Map> cxkhIndic=	creditService.findCreditDriverByDrivecardno("com.nasoft.aboutcar.CxkhDrvAnnualWorkMapper.findCreditDriverByDrivecardno",drivecardno);
			JSONArray array = JSONArray.fromObject(cxkhIndic);
			writer(response, array+"");
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		@RequestMapping("/platpunishment")
		public String platPunishment(){
			return "credit/platPunishment";
		}
		
		@RequestMapping("platPunishmentList")
		public void platPunishmentList(HttpServletRequest request,HttpServletResponse response){
			try {
				
				String comname = request.getParameter("comname");
				String pubText = request.getParameter("pubText");
				String pubStatus="未公布";
				Map<String,String> map=new HashMap<>();
				map.put("comname", comname);
				map.put("pubText", pubText);
				map.put("pubStatus", pubStatus);
				List<Map> list=creditService.findCreditPlatListByComName("com.nasoft.aboutcar.CxkhComPunList.findCreditPlatByComname",map);
				if(list.get(0)== null){
					JSONArray array = JSONArray.fromObject("[]");
					writer(response, array+"");
				}else{
					
					JSONArray array = JSONArray.fromObject(list.toArray());
					writer(response, array+"");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		@RequestMapping("/addPlatRecord")
		public String addPlatRecord(HttpServletRequest request,HttpServletResponse response){
			String s=null;
			String status=null;
			try {
				String data = request.getParameter("data");
				data = new String(data.getBytes("iso8859-1"),"UTF8");
				if(StringUtil.isNotEmpty(data)){
					JSONArray jsonArray = JSONArray.fromObject(data);
					for(int i=0;i<jsonArray.size();i++){
						CxkhDrvPunList cxkhDrvPunList= (CxkhDrvPunList) JSONObject.toBean(JSONObject.fromObject(jsonArray.get(i)), CxkhDrvPunList.class);
						String listNo = cxkhDrvPunList.getListNo();
						status=cxkhDrvPunList.getPunText();
					List<Map> 	list=creditService.findCxhkPlatPunListByListNo("com.nasoft.aboutcar.CxkhComPunList.findCxhkPlatPunListByListNo",listNo);
						CxkhComPunRecord record=new CxkhComPunRecord();
						record.setListNo(list.get(0).get("list_no")+"");//名单编号
						record.setComLicense(list.get(0).get("com_license")+"");//营业许可证号
						record.setPunCode(list.get(0).get("pun_code")+"");//处分代码
						record.setPunText(list.get(0).get("pun_text")+"");//处分内容
						record.setPunStatus(list.get(0).get("pub_status")+"");//处分状态
						record.setPunDate((Date)list.get(0).get("pub_date"));//处分日期
						record.setCancelDate((Date)list.get(0).get("pun_end_date"));//处分取消日期
						creditService.addCxkhPlatPunRecord("com.nasoft.aboutcar.CxkhComPunList.addCxkhPlatPunRecord",record);
						String pubStatus="已公示";
						Map<String,String> map=new HashMap<>();
						map.put("pubStatus",pubStatus);
						map.put("listNo", listNo);
						creditService.updateCxkhPlatPunListByListNo("com.nasoft.aboutcar.CxkhComPunList.updateCxhkPlatPunList",map);
						}
					if(status.equals("警告")){
						s= "credit/platPunishment";
					}else if(status.equals("再教育")){
						s="credit/platRetrain";
					}else if(status.equals("吊销")){
						s="credit/platrevoke";
					}
					
					}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return s;
			
		}
		@RequestMapping("/platretrain")
		public String platretrain(){
			return "credit/platRetrain";
		}
		@RequestMapping("/platrevoke")
		public String platrevoke(){
			return "credit/platrevoke";
		}
		@RequestMapping("/platexamination")
		public String platexamination(){
			return "credit/platExamination";
		}
		@RequestMapping("/platExamination")
		public void platExamination(HttpServletRequest request,HttpServletResponse response){
		try {
						
						Map<String,String> map=new HashMap<>();
						String comname = request.getParameter("comname");
						String year = request.getParameter("year");
						map.put("comname", comname);
						map.put("year", year);
						List<Map> list=creditService.findPlatExaminationList("com.nasoft.aboutcar.CxkhComAnnualWork.findPlatExaminationList",map);
						JSONArray array = JSONArray.fromObject(list.toArray());
						writer(response, array+"");
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
		
		@RequestMapping("/toShowPlatDetail")
		public String toShowPlatDetail(HttpServletRequest request,HttpServletResponse response){
			String comLicense = request.getParameter("comLicense");
			request.getSession().setAttribute("comLicense", comLicense);
			return "credit/creditPlatDetail";
		}
		
		@RequestMapping("/platShowDetail")
		public void platShowDetail(HttpServletRequest request,HttpServletResponse response){
			try {
				String comLicense = request.getSession().getAttribute("comLicense")+"";
			List<Map> cxkhIndic=	creditService.findCreditPlatByCreditcode("com.nasoft.aboutcar.CxkhComAnnualWork.findCreditComByCreditcode",comLicense);
			JSONArray array = JSONArray.fromObject(cxkhIndic);
			writer(response, array+"");
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		/**
		 * 导出平台再教育信息
		 * @param request
		 * @param response
		 */
		@RequestMapping("/platExportExcel")
		public void platExportExcel(HttpServletRequest request,HttpServletResponse response){
			try {
				request.setCharacterEncoding("UTF-8");
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/x-download");
				String fileName = "平台考试再教育列表.xlsx";
				fileName = URLEncoder.encode(fileName, "UTF-8");
				response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
				String data = request.getParameter("data");
				data = new String(data.getBytes("iso8859-1"),"UTF8");
				Workbook wb;
				String filePath = request.getRealPath("/template")+"/"+"平台再教育模板.xlsx"; //模板位置
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
				if(StringUtil.isNotEmpty(data)){
					JSONArray jsonArray = JSONArray.fromObject(data);
					for(int i=0;i<jsonArray.size();i++){
						CxkhComPunList cxkhComPunList= (CxkhComPunList) JSONObject.toBean(JSONObject.fromObject(jsonArray.get(i)), CxkhComPunList.class);
						Row row = sheet.createRow(i+1);
						CellStyle cellStyle = wb.createCellStyle();
						cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
						//序号
						Cell cell = row.createCell(0);
						cell.setCellValue(i+1);
						cell.setCellStyle(cellStyle);
						//平台名称
						cell = row.createCell(1);
						cell.setCellValue(cxkhComPunList.getComname());
						cell.setCellStyle(cellStyle);
						//统一社会信用代码
						cell = row.createCell(2);
						cell.setCellValue(cxkhComPunList.getCreditcode());
						cell.setCellStyle(cellStyle);
						//累计分数
						cell = row.createCell(3);
						cell.setCellValue(cxkhComPunList.getScore());
						cell.setCellStyle(cellStyle);
						//处分结果
						cell = row.createCell(4);
						cell.setCellValue(cxkhComPunList.getPubStatus());
						cell.setCellStyle(cellStyle);
					}
				}
				try {
					out = response.getOutputStream();
					Base64OutputStream base64OutputStream = new Base64OutputStream(out);
					String agent = request.getHeader("User-Agent");
					if(agent.contains("Firefox")){
						wb.write(base64OutputStream);
					}else{
						wb.write(out);
					}
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					if(out != null){
						try {
							out.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		

		@RequestMapping("/bl/remove")
	    public void UpdateBlAtExpired(HttpServletRequest request,HttpServletResponse response) throws Exception{
	    	
			try{
				List<String> msgs=creditService.removeDrvBlByExpired();		
				msgs.addAll(creditService.removeCarBlByExpired());
		    	writer(response,msgs);
			}catch(Exception e){
		    	writer(response,"failure:"+e.getMessage());				
			}
	    	
	    }
		


}
