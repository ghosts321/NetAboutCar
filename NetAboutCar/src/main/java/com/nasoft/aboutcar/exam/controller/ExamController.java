package com.nasoft.aboutcar.exam.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.DecimalFormat;
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
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.exam.domain.MngExamBespeak;
import com.nasoft.aboutcar.exam.service.MngExamBespeakService;
import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;
import com.nasoft.aboutcar.pilotapply.domain.DrvExamplan;
import com.nasoft.aboutcar.pilotapply.domain.DrvExamresult;
import com.nasoft.aboutcar.pilotapply.service.DrvExamplanService;
import com.nasoft.aboutcar.pilotapply.service.DrvExamresultService;
import com.nasoft.util.DateUtil;
import com.nasoft.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import sun.misc.BASE64Encoder;

@Controller
@RequestMapping("/exam")
public class ExamController extends BaseController {
	
	@Resource
	private DrvExamresultService drvExamresultService;
	@Resource
	private DrvExamplanService drvExamplanService;
	@Resource
	private MngExamBespeakService mngExamBespeakService;
	
	//培训管理
	@RequestMapping("training")
	public String trainingList(){
		return "exam/training";
	}
	@RequestMapping("trainingAdd")
	public String trainingAddList(){
		return "exam/trainingAdd";
	}
	
	//培训安排
	@RequestMapping("arrange")
	public String arrangeList(){
		return "exam/arrange";
	}
	@RequestMapping("arrangeAdd")
	public String arrangeAddList(){
		return "exam/arrangeAdd";
	}
	
	//培训人员管理
	@RequestMapping("trainPerson")
	public String trainPersonList(){
		return "exam/trainPerson";
	}
	//考试人员管理
	@RequestMapping("examPerson")
	public String examPersonList(){
		return "exam/examPerson";
	}
	
	//模拟考试
	@RequestMapping("practiceTest")
	public String practiceTestList(){
		return "exam/practiceTest";
	}
	
	//考试预约管理
	@RequestMapping("appointment")
	public String appointmentList(){
		return "exam/appointment";
	}
	@RequestMapping("appointmentAdd")
	public String appointmentAddList(){
		return "exam/appointmentAdd";
	}

	/**
	 * 获取考试预约列表
	 * @param request
	 * @param response
	 */
	@RequestMapping("/findAllExamBespeak")
	public void getExamBespeakList(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> map = new HashMap<String, Object>();
		String bespeak_date = request.getParameter("bespeak_date");
		map.put("bespeak_date", bespeak_date);
		List<MngExamBespeak> examBespeakList = new ArrayList<MngExamBespeak>();
		try {
			examBespeakList = mngExamBespeakService.findAllExamBespeak("com.nasoft.aboutcar.MngExamBespeak.findAllExamBespeak",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(examBespeakList.toArray());
		writer(response, array+"");
	}
	
	/**
	 * 增加考试预约
	 * @return
	 */
	@RequestMapping("/addExamBespeak")
	public ModelAndView addExamBespeak(HttpServletRequest request, HttpServletResponse response, MngExamBespeak mngExamBespeak){
		ModelAndView mv=new ModelAndView();
		String msg="";//页面返回状态
		String bespeakdate = mngExamBespeak.getBespeak_date();
		String address = mngExamBespeak.getAddress();
		Map<String, Object> map = new HashMap<String, Object>();
		
		//获取当前登录用户
		MngUserInfo currentUser = getCurrentUser();
		mngExamBespeak.setCreate_user(currentUser.getUserId());
		mngExamBespeak.setCreate_time(DateUtil.getDateTime());
		mngExamBespeak.setUpdate_user(currentUser.getUserId());
		mngExamBespeak.setUpdate_time(DateUtil.getDateTime());
		String[] dateArr = mngExamBespeak.getBespeak_date().split("-");
		mngExamBespeak.setYear(dateArr[0]);
		mngExamBespeak.setMonth(dateArr[1]);
		Integer bespeak_time = mngExamBespeak.getBespeak_time();
		if(bespeak_time==1){
			mngExamBespeak.setAfternoon_count(0);
		}else{
			mngExamBespeak.setMorning_count(0);
		}
		map.put("bespeak_date", bespeakdate);
		map.put("address", address);
		map.put("exam_type", mngExamBespeak.getExam_type());
		try{
			List<MngExamBespeak> mngExamBespeakListByDate = mngExamBespeakService.findAllExamBespeak("com.nasoft.aboutcar.MngExamBespeak.selectByBespeakDate", map);
			if(!mngExamBespeakListByDate.isEmpty()){
				msg ="预约已存在！";//存在
			}else{
				int result = mngExamBespeakService.addMngExamBespeak("com.nasoft.aboutcar.MngExamBespeak.addMngExamBespeak", mngExamBespeak);
				if(result > 0){
					msg="success";
				}else{
					msg="failed";
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			msg="failed";
		}
		mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 打开修改考试预约页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/appointmentUpdate")
	public ModelAndView appointmentUpdate(HttpServletRequest request, HttpServletResponse response){
		String bespeakid = request.getParameter("bespeakid");
		ModelAndView mv=new ModelAndView();
		try{
			MngExamBespeak mngExamBespeak = mngExamBespeakService.finMngExamBespeakById("com.nasoft.aboutcar.MngExamBespeak.finMngExamBespeakByBespeakId", bespeakid);
			mv.addObject("mngExamBespeak", mngExamBespeak);
			mv.setViewName("exam/appointmentUpdate");
		}catch(Exception e){
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 保存考试预约修改
	 * @param request
	 * @param response
	 * @param mngExamBespeak
	 */
	@RequestMapping("/updateExamBespeak")
	public ModelAndView updateExamBespeak(HttpServletRequest request, HttpServletResponse response, MngExamBespeak mngExamBespeak){
		ModelAndView mv=new ModelAndView();
		String msg="";
		//获取当前登录用户
		MngUserInfo currentUser = getCurrentUser();
		mngExamBespeak.setUpdate_user(currentUser.getUserId());
		mngExamBespeak.setUpdate_time(DateUtil.getDateTime());
		String[] dateArr = mngExamBespeak.getBespeak_date().split("-");
		mngExamBespeak.setYear(dateArr[0]);
		mngExamBespeak.setMonth(dateArr[1]);
		Integer bespeak_time = mngExamBespeak.getBespeak_time();
		if(bespeak_time==1){
			mngExamBespeak.setAfternoon_count(0);
		}else{
			mngExamBespeak.setMorning_count(0);
		}
		try{
			int result = mngExamBespeakService.updateMngExamBespeak("com.nasoft.aboutcar.MngExamBespeak.updateExamBespeak", mngExamBespeak);
			if(result>0){
				msg="success";
			}else{
				msg="failed";
			}
		}catch(Exception e){
			e.printStackTrace();
			msg="failed";
		}
		mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除考试预约
	 * @param request
	 * @param response
	 */
	@RequestMapping("/appointmentDel")
	public void appointmentDel(HttpServletRequest request, HttpServletResponse response){
		String bespeakids = request.getParameter("bespeakids");
		String result = "";
		try {
			mngExamBespeakService.batchDelMngExamBespeak("com.nasoft.aboutcar.MngExamBespeak.delMngExamBespeakById",bespeakids);
			result = "success";
		} catch (Exception e) {
			result = "fail";
			e.printStackTrace();
		}
		writer(response, result);
	}
	
	//考试计划管理
	@RequestMapping("planning")
	public String planningList(){
		return "exam/planning";
	}
	@RequestMapping("planningAdd")
	public String planningAddList(){
		return "exam/planningAdd";
	}
	
	//进入考试成绩录入页面
	@RequestMapping("insertResult")
	public String resultList(){
		return "exam/insertResult";
	}
	//考试安排列表
	@RequestMapping("planList")
	public void planList(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> map = new HashMap<String, Object>();
		String certNo = request.getParameter("certNo");
		MngUserInfo MngUserInfo = getCurrentUser();
		map.put("roleid", MngUserInfo.getRoleId());
		map.put("instid", MngUserInfo.getInstId());
		map.put("areacode", MngUserInfo.getAreaCode());
		map.put("certNo", certNo);
		List<DrvExamplan> planList = new ArrayList<DrvExamplan>();
		try {
			planList = (List<DrvExamplan>) drvExamplanService.findAll("com.nasoft.aboutcar.DrvExamplanMapper.findAll",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(planList.toArray());
		writer(response, array+"");
	}
	//录入考试成绩
	@RequestMapping("saveExam")
	public String saveExam(HttpServletRequest request,String planid,String score){
		try {
			DrvExamplan drvExamplan = (DrvExamplan) drvExamplanService.findById("com.nasoft.aboutcar.DrvExamplanMapper.findById",Integer.valueOf(planid));
			if(null != drvExamplan){
				DrvExamresult drvExamresult = new DrvExamresult();
				drvExamresult.setCertno(drvExamplan.getCertno());
				drvExamresult.setCreatedatetime(new Date());
				drvExamresult.setExamdate(drvExamplan.getExamdate());
				drvExamresult.setExamname(drvExamplan.getExamname());
				drvExamresult.setExamplace(drvExamplan.getExamaddr());
				drvExamresult.setExamtype(drvExamplan.getExamtype());
				drvExamresult.setScore(Integer.valueOf(score));
				if(StringUtils.isNotBlank(score) && Integer.valueOf(score) > 80){
					drvExamresult.setExamresult("1");
				}else{
					drvExamresult.setExamresult("0");
				}
				drvExamresultService.addDrvExamresult("com.nasoft.aboutcar.DrvExamresultMapper.addDrvExamresult",drvExamresult);
			}
			drvExamplan.setExamstatus("1");
			drvExamplanService.updateExamstatus("com.nasoft.aboutcar.DrvExamplanMapper.updateExamstatus", drvExamplan);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "exam/insertResult";
	}
	
	/**
	 * 获取考试预约驾驶员列表
	 * @param request
	 * @param response
	 */
	@RequestMapping("/findAllExamPerson")
	public void findAllExamPerson(HttpServletRequest request,HttpServletResponse response){
		String type = request.getParameter("type");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date currentDate = DateUtil.getDate();
		Map<String, Object> map = new HashMap<String, Object>();
		String bespeak_date = request.getParameter("bespeak_date");
		String address = request.getParameter("address");
		String bespeak_time = request.getParameter("bespeak_time");
		map.put("bespeak_date", bespeak_date);
		map.put("address", address);
		map.put("bespeak_time", bespeak_time);
		List<MngExamBespeak> examBespeakList = new ArrayList<MngExamBespeak>();
		try {
			examBespeakList = mngExamBespeakService.findAllExamBespeak("com.nasoft.aboutcar.MngExamBespeak.findAllExamPerson",map);
			if(type.equals("export")){
				List<MngExamBespeak> bespeaklist = new ArrayList<MngExamBespeak>();
				for(MngExamBespeak examBespeak : examBespeakList){
					if(null != examBespeak.getBespeak_date() && !sdf.parse(examBespeak.getBespeak_date()).before(currentDate)){
						bespeaklist.add(examBespeak);
					}
				}
				JSONArray array = JSONArray.fromObject(bespeaklist.toArray());
				writer(response, array.toString());
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(examBespeakList.toArray());
		writer(response, array.toString());
	}
	
	/**
	 * 导出驾驶员预约考试信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("/exportExcel")
	public void exportExcel(HttpServletRequest request,HttpServletResponse response){
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/x-download");
			String fileName = "驾驶员考试预约信息列表.xlsx";
			String agent = request.getHeader("User-Agent");
			if(agent.contains("Firefox")){
        		//火狐浏览器   => Base64编码
        		BASE64Encoder base64Encoder = new BASE64Encoder();
        		fileName = "=?utf-8?B?"+base64Encoder.encode(fileName.getBytes("utf-8"))+"?=";
        	}else{
        		fileName = URLEncoder.encode(fileName, "UTF-8");        		
        	}
			response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
			String data = request.getParameter("data");
			//data = new String(data.getBytes("iso8859-1"),"UTF8");
			Workbook wb;
			String filePath = request.getRealPath("/template")+"/"+"驾驶员预约考试模板.xlsx"; //模板位置
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
					MngExamBespeak mngExamBespeak= (MngExamBespeak) JSONObject.toBean(JSONObject.fromObject(jsonArray.get(i)), MngExamBespeak.class);
					Row row = sheet.createRow(i+1);
					CellStyle cellStyle = wb.createCellStyle();
					cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
					//考试预约号
					Cell cell = row.createCell(0);
					cell.setCellValue(mngExamBespeak.getDriver_bespeak_id());
					cell.setCellStyle(cellStyle);
					//姓名
					cell = row.createCell(1);
					cell.setCellValue(mngExamBespeak.getUsername());
					cell.setCellStyle(cellStyle);
					//身份证号
					cell = row.createCell(2);
					cell.setCellValue(mngExamBespeak.getCertno());
					cell.setCellStyle(cellStyle);
					//考试名称
					cell = row.createCell(3);
					cell.setCellValue(mngExamBespeak.getExam_name());
					cell.setCellStyle(cellStyle);
					//预约日期
					cell = row.createCell(4);
					cell.setCellValue(mngExamBespeak.getBespeak_date());
					cell.setCellStyle(cellStyle);
					//预约时段（1：上午，2：下午）
					cell = row.createCell(5);
					cell.setCellValue(mngExamBespeak.getBespeak_time()==1?"上午":"下午");
					cell.setCellStyle(cellStyle);
					//考试类型（1：全国，2：地方）
					cell = row.createCell(6);
					cell.setCellValue(mngExamBespeak.getExam_type().equals("1")?"全国":"地方");
					cell.setCellStyle(cellStyle);
					//考试地点
					cell = row.createCell(7);
					cell.setCellValue(mngExamBespeak.getAddress());
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
	 * 导入驾驶员考试信息
	 * @param request
	 * @param excelFile
	 * @return
	 */
	@RequestMapping("/importExcel")
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
			for(int i=1;i<sheet.getLastRowNum()+1;i++){
				Row row = sheet.getRow(i);
				if(row != null){
					//MngExamBespeak mngExamBespeak = new MngExamBespeak();
					//驾驶员考试预约号
					//String driver_bespeak_id = getCellValue(row.getCell(0));
					//姓名
					//String username = getCellValue(row.getCell(1));
					//身份证号
					String certno = getCellValue(row.getCell(2));
					//考试名称
					String examname = getCellValue(row.getCell(3));
					//考试日期
					String examdate = getCellValue(row.getCell(4));
					//时段
					//String bespeaktime = getCellValue(row.getCell(5));
					//考试类型
					String examtype = getCellValue(row.getCell(6));//（1：全国，2：地方）
					//考试地点
					String address = getCellValue(row.getCell(7));
					//成绩
					String score = getCellValue(row.getCell(8));
					//是否通过
					String isPass = getCellValue(row.getCell(9));
					if("是".equals(isPass)){
						isPass = "1";
					}else if("否".equals(isPass)){
						isPass = "0";
					}
					if(examtype.equals("全国")){
						examtype="1";
					}else if(examtype.equals("地方")){
						examtype="2";
					}
					if(score.equals("")){
						score = "0";
					}
					DrvExamresult drvExamresult = new DrvExamresult();
					drvExamresult.setCertno(certno);
					drvExamresult.setExamname(examname);
					drvExamresult.setExamdate(sdf.parse(examdate));
					drvExamresult.setExamplace(address);
					drvExamresult.setScore(Integer.parseInt(score));
					drvExamresult.setExamresult(isPass);
					drvExamresult.setExamtype(examtype);
					drvExamresult.setCreatedatetime(DateUtil.getDateTime());
					
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("certno", certno);
					map.put("examdate", sdf.parse(examdate));
					//根据身份证号和考试日期判断该驾驶员考试成绩是否已存在
					List<DrvExamresult> drvExamresultlist = drvExamresultService.findByExamdate("com.nasoft.aboutcar.DrvExamresultMapper.findByExamdate", map);
					if(null!=drvExamresultlist && !drvExamresultlist.isEmpty()){//存在则更新考试成绩
						if(drvExamresultlist.size()==2){
							DrvExamresult drvExamresult1 = drvExamresultlist.get(0);
							DrvExamresult drvExamresult2 = drvExamresultlist.get(1);
							if(drvExamresult1.getExamtype().equals(examtype)){
								drvExamresult1.setScore(Integer.parseInt(score));
								drvExamresult1.setExamresult(isPass);
								drvExamresult1.setCreatedatetime(DateUtil.getDateTime());
								drvExamresultService.updateDrvExamresult("com.nasoft.aboutcar.DrvExamresultMapper.updateDrvExamresult",drvExamresult1);
							}else{
								drvExamresult2.setScore(Integer.parseInt(score));
								drvExamresult2.setExamresult(isPass);
								drvExamresult2.setCreatedatetime(DateUtil.getDateTime());
								drvExamresultService.updateDrvExamresult("com.nasoft.aboutcar.DrvExamresultMapper.updateDrvExamresult",drvExamresult2);
							}
						}else{
							DrvExamresult drvResult = drvExamresultlist.get(0);
							if(examtype.equals(drvResult.getExamtype())){
								drvResult.setScore(Integer.parseInt(score));
								drvResult.setExamresult(isPass);
								drvResult.setCreatedatetime(DateUtil.getDateTime());
								drvExamresultService.updateDrvExamresult("com.nasoft.aboutcar.DrvExamresultMapper.updateDrvExamresult",drvResult);
							}else{
								drvExamresultService.addDrvExamresult("com.nasoft.aboutcar.DrvExamresultMapper.addDrvExamresult",drvExamresult);
							}
						}
					}else{//不存在则添加考试信息及成绩
						drvExamresultService.addDrvExamresult("com.nasoft.aboutcar.DrvExamresultMapper.addDrvExamresult",drvExamresult);
					}
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "exam/insertResult";
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
	
	//考试成绩管理
	@RequestMapping("score")
	public String scorenList(){
		return "exam/score";
	}
	
	//培训质量分析
	@RequestMapping("trainStatistic")
	public String trainStatisticList(){
		return "exam/trainStatistic";
	}
	//考试成绩分析
	@RequestMapping("scoreStatistic")
	public String scoreStatisticList(){
		return "exam/scoreStatistic";
	}
	/**
	 * 考试接口
	 * @param request
	 * @param response
	 * @throws Exception 
	 */
	@RequestMapping("/examSystem")
	public void examSystem(HttpServletRequest request,HttpServletResponse response) throws Exception{
		List<Map> list=null;
		ModelAndView mv=new ModelAndView();
		try {
			String certno=request.getParameter("certno");
			 list=drvExamresultService.examSystemByCertno("com.nasoft.aboutcar.DrvExamresultMapper.examSystemByCertno",certno);
			for (Map map : list) {
				if(map.get("examresult").equals("1")){
					//通过
					map.put("examresult", "通过");
				}else{
					//未通过
					map.put("examresult", "未通过");
				}
				if(map.get("examtype").equals("1")){
					//1.全国
					map.put("examtype", "全国");
				}else{
					//2.地方
					map.put("examtype", "地方");
				}
				
					}
			String json = JSON.toJSONString(list);
			writer(response, json+"");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
