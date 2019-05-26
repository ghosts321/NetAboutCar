package com.nasoft.aboutcar.setAssemblePlace.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;
import com.nasoft.aboutcar.setAssemblePlace.domain.SetAssemblePlace;
import com.nasoft.aboutcar.setAssemblePlace.service.SetAssemblePlaceService;
import com.nasoft.aboutcar.supervise.service.CtlCarPositionInfoService;
import com.nasoft.util.DateUtil;

@Controller
@RequestMapping("/setAssemblePlace")
public class SetAssemblePlaceController extends BaseController {
	@Autowired
	private SetAssemblePlaceService setAssemblePlaceService;
	
	@Autowired
	private CtlCarPositionInfoService ctlCarPositionInfoService;
	
	private String guiType = "";	//绘图类型
	private String guiData = "";	//点位经纬度
	private String circleRat = "";	//圆形半径
	SetAssemblePlace setAssemblePlace = new SetAssemblePlace();	//存放要修改的聚集地点
	
	/**
	 * total地图中，打开聚集地点列表页面
	 * @return
	 */
	@RequestMapping("/openAssemblePlaceTotal")
	public String openAssemblePlaceTotal(){
		return "totalMap/assemblePlace/assemblePlaceList";
	}
	
	/**
	 * total地图中，聚集车辆功能，获取聚集区域参数
	 * @return
	 */
	@RequestMapping("/selectDataTotal")
	public ModelAndView selectDataTotal(HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("id", request.getParameter("id"));
			SetAssemblePlace setAssemblePlace = setAssemblePlaceService.findAssemblePlaceById("com.nasoft.aboutcar.SetAssemblePlace.selectAssemblePlaceById",map);
			mv.addObject(setAssemblePlace);
			mv.addObject("count",request.getParameter("count"));
			mv.setViewName("totalMap/assemblePlace/assembleDataSelect");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * total地图中，打开聚集地点新增页面
	 * @return
	 */
	@RequestMapping("/assemblePlaceAddTotal")
	public String assemblePlaceAddTotal(HttpServletRequest request){
		guiType = request.getParameter("guiType");
		guiData = request.getParameter("guiData");
		circleRat = request.getParameter("circleRat");
		return "totalMap/assemblePlace/assemblePlaceAdd";
	}
	
	/**
	 * total地图中，打开聚集地点修改页面
	 * @return
	 */
	@RequestMapping("/assemblePlaceUpdateTotal")
	public ModelAndView assemblePlaceUpdateTotal(HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		try {
			mv.addObject(setAssemblePlace);
			mv.setViewName("totalMap/assemblePlace/assemblePlaceUpdate");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * total地图中，聚集地点修改-获取修改数据
	 * @return
	 */
	@RequestMapping("/mapSetUpdateTotal")
	@ResponseBody
	public SetAssemblePlace mapSetUpdateTotal(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("id", request.getParameter("id"));
			setAssemblePlace = setAssemblePlaceService.findAssemblePlaceById("com.nasoft.aboutcar.SetAssemblePlace.selectAssemblePlaceById",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return setAssemblePlace;
	}
	
	/**
	 * total地图中，新增聚集地点保存
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/addAssemblePlaceSetTotal")
	public ModelAndView addAssemblePlaceSetTotal(HttpServletRequest request, HttpServletResponse response, SetAssemblePlace setAssemblePlace){
		String msg="";//页面返回状态
		ModelAndView mv=new ModelAndView();
		
		try {
			if((guiType==null || guiType=="") || (guiData==null || guiData=="") || (circleRat==null || circleRat=="")){
				msg="保存失败：系统未获取到区域经纬度，请重新增加区域！";
				mv.addObject("msg",msg);
				mv.setViewName("totalMap/assemblePlace/assemblePlaceAdd");
				return mv;
			}
			
			if("circle".equals(guiType)){
				setAssemblePlace.setMap_type("1");
			}
			else if("ppr".equals(guiType)){
				setAssemblePlace.setMap_type("2");
			}
			if(guiData != null){
				setAssemblePlace.setMap_sign(guiData);
			}
			if(circleRat != null){
				setAssemblePlace.setRotundity_radius(circleRat);
			}
			
			//获取当前登录用户
			MngUserInfo currentUser = getCurrentUser();
			setAssemblePlace.setCreate_user(currentUser.getUserId());
			setAssemblePlace.setCreate_time(DateUtil.getTimestamp());
			
			//判断聚集地点是否存在: 聚集地点名称
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("placeName", setAssemblePlace.getPlace_name());	
		
			List<SetAssemblePlace> PriceSetById = setAssemblePlaceService.selectAssemblePlaceIsHave("com.nasoft.aboutcar.SetAssemblePlace.selectAssemblePlaceIsHave", map);
			if(!PriceSetById.isEmpty()){
				msg ="保存失败：该区域已存在！";//存在
			}else{
				int result = setAssemblePlaceService.addAssemblePlaceSet("com.nasoft.aboutcar.SetAssemblePlace.addAssemblePlaceSet",setAssemblePlace);
				if(result > 0){
					msg="success";
				}else{
					msg="failed";
				}
			}
		} catch (Exception e) {
			msg="failed";
			e.printStackTrace();
		}
		mv.addObject("msg",msg);
		mv.setViewName("totalMap/assemblePlace/assemblePlaceAdd");
		return mv;
	}
	
	/**
	 * total地图中，修改聚集地点保存
	 * @param setAssPla
	 * @return
	 */
	@RequestMapping("/updateAssemblePlaceTotal")
	public ModelAndView updateAssemblePlaceTotal(SetAssemblePlace setAssPla){
		ModelAndView mv=new ModelAndView();
		String msg="";
		try{
			//获取当前登录用户
			MngUserInfo currentUser = getCurrentUser();
			setAssPla.setUpdate_user(currentUser.getUserId());
			setAssPla.setUpdate_time(DateUtil.getTimestamp());
			
			//设置ID
			setAssPla.setId(setAssemblePlace.getId());
			
			int result = setAssemblePlaceService.updateAssemblePlace("com.nasoft.aboutcar.SetAssemblePlace.updateAssemblePlace",setAssPla);
			if(result>0){
				msg="success";
			}else{
				msg="failed";
			}
		}catch(Exception e){
			msg="failed";
			e.printStackTrace();
		}
		mv.addObject("msg",msg);
		mv.setViewName("totalMap/assemblePlace/assemblePlaceUpdate");
		return mv;
	}
	
	/**
	 * 打开列表页面
	 * @return
	 */
	@RequestMapping("/openAssemblePlace")
	public String openAssemblePlace(){
		return "assemblePlace/assemblePlaceList";
	}
	
	/**
	 * 新增-打开地图设置页面
	 * @return
	 */
	@RequestMapping("/mapSetAdd")
	public String mapSetAdd(HttpServletRequest request){
		return "assemblePlace/mapSet";
	}
	
	/**
	 * 修改-打开地图设置页面
	 * @return
	 */
	@RequestMapping("/mapSetUpdate")
	public ModelAndView mapSetUpdate(HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("id", request.getParameter("id"));
			setAssemblePlace = setAssemblePlaceService.findAssemblePlaceById("com.nasoft.aboutcar.SetAssemblePlace.selectAssemblePlaceById",map);
			
			mv.addObject("mapType", setAssemblePlace.getMap_type());
			mv.addObject("mapSign", setAssemblePlace.getMap_sign());
			mv.addObject("rotundityRadius", setAssemblePlace.getRotundity_radius());
			mv.addObject("updateMake", "make");		//修改标记
			
			mv.setViewName("assemblePlace/mapSet");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	/**
	 * 打开聚集地点新增页面
	 * @return
	 */
	@RequestMapping("/assemblePlaceAdd")
	public String assemblePlaceAdd(HttpServletRequest request){
		guiType = request.getParameter("guiType");
		guiData = request.getParameter("guiData");
		circleRat = request.getParameter("circleRat");
		return "assemblePlace/assemblePlaceAdd";
	}
	
	/**
	 * 打开聚集地点修改页面
	 * @return
	 */
	@RequestMapping("/assemblePlaceUpdate")
	public ModelAndView assemblePlaceUpdate(HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		try {
			mv.addObject(setAssemblePlace);
			mv.setViewName("assemblePlace/assemblePlaceUpdate");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 获取聚集地点列表记录
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getAssemblePlaceList")
	public void getAssemblePlaceList(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("placeName", request.getParameter("placeName")); 
		
		List<SetAssemblePlace> setAssemblePlaceList = new ArrayList<SetAssemblePlace>();	//聚集地点列表集合
		
		try {
			setAssemblePlaceList = setAssemblePlaceService.findAllAssemblePlaceSet("com.nasoft.aboutcar.SetAssemblePlace.findAllAssemblePlaceSet",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(setAssemblePlaceList.toArray());
		writer(response, array.toString());
	}
	
	/**
	 * 回显图形
	 * @param request
	 * @param response
	 */
	@RequestMapping("/findAssemblePlaceList")
	@ResponseBody
	public List<SetAssemblePlace> findAssemblePlaceList(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isUse", request.getParameter("isUse"));
		List<SetAssemblePlace> findAssemblePlaceList = new ArrayList<SetAssemblePlace>();
		
		try {
			findAssemblePlaceList = setAssemblePlaceService.findAllAssemblePlaceSet("com.nasoft.aboutcar.SetAssemblePlace.findAllAssemblePlaceSet",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return findAssemblePlaceList;
	}
	
	/**
	 * 新增聚集地点保存
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/addAssemblePlaceSet")
	public ModelAndView addAssemblePlaceSet(HttpServletRequest request, HttpServletResponse response, SetAssemblePlace setAssemblePlace){
		String msg="";//页面返回状态
		ModelAndView mv=new ModelAndView();
		
		try {
			if((guiType==null || guiType=="") || (guiData==null || guiData=="") || (circleRat==null || circleRat=="")){
				msg="failed";
				mv.addObject("msg",msg);
				mv.setViewName("save_result");
				return mv;
			}
			
			if("circle".equals(guiType)){
				setAssemblePlace.setMap_type("1");
			}
			else if("ppr".equals(guiType)){
				setAssemblePlace.setMap_type("2");
			}
			if(guiData != null){
				setAssemblePlace.setMap_sign(guiData);
			}
			if(circleRat != null){
				setAssemblePlace.setRotundity_radius(circleRat);
			}
			
			//获取当前登录用户
			MngUserInfo currentUser = getCurrentUser();
			setAssemblePlace.setCreate_user(currentUser.getUserId());
			setAssemblePlace.setCreate_time(DateUtil.getTimestamp());
			
			//判断聚集地点是否存在: 聚集地点名称
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("placeName", setAssemblePlace.getPlace_name());	
		
			List<SetAssemblePlace> PriceSetById = setAssemblePlaceService.selectAssemblePlaceIsHave("com.nasoft.aboutcar.SetAssemblePlace.selectAssemblePlaceIsHave", map);
			if(!PriceSetById.isEmpty()){
				msg ="该区域已存在！";//存在
			}else{
				int result = setAssemblePlaceService.addAssemblePlaceSet("com.nasoft.aboutcar.SetAssemblePlace.addAssemblePlaceSet",setAssemblePlace);
				if(result > 0){
					msg="success";
				}else{
					msg="failed";
				}
			}
		} catch (Exception e) {
			msg="failed";
			e.printStackTrace();
		}
		mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 修改聚集地点保存
	 * @param setAssPla
	 * @return
	 */
	@RequestMapping("/updateAssemblePlace")
	public ModelAndView updateAssemblePlace(SetAssemblePlace setAssPla){
		ModelAndView mv=new ModelAndView();
		String msg="";
		try{
			//获取当前登录用户
			MngUserInfo currentUser = getCurrentUser();
			setAssPla.setUpdate_user(currentUser.getUserId());
			setAssPla.setUpdate_time(DateUtil.getTimestamp());
			
			//设置ID
			setAssPla.setId(setAssemblePlace.getId());
			
			int result = setAssemblePlaceService.updateAssemblePlace("com.nasoft.aboutcar.SetAssemblePlace.updateAssemblePlace",setAssPla);
			if(result>0){
				msg="success";
			}else{
				msg="failed";
			}
		}catch(Exception e){
			msg="failed";
			e.printStackTrace();
		}
		mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 改变启用状态
	 * @param request
	 */
	@RequestMapping("/setState")
	public void setState(HttpServletRequest request, HttpServletResponse response){
		String result = "";
		String id = request.getParameter("id");
		String is_use = request.getParameter("is_use");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("is_use", is_use);
		
		try {
			setAssemblePlaceService.setState("com.nasoft.aboutcar.SetAssemblePlace.setState",map);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		writer(response, result);
	}

	/**
	 * 删除聚集地点
	 * @param request
	 * @param response
	 */
	@RequestMapping("/assemblePlaceDel")
	public void assemblePlaceDel(HttpServletRequest request, HttpServletResponse response){
		String operatingids = request.getParameter("operatingids");
		String result = "";
		try {
			setAssemblePlaceService.batchDelAssemblePlace("com.nasoft.aboutcar.SetAssemblePlace.delAssemblePlaceById",operatingids);
			result = "success";
		} catch (Exception e) {
			result = "fail";
			e.printStackTrace();
		}
		writer(response, result);
	}
}
