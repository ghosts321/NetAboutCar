package com.nasoft.aboutcar.menuinfo.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.menuinfo.domain.MenuInfo;
import com.nasoft.aboutcar.menuinfo.service.MenuInfoService;
import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;
import com.nasoft.util.DateUtil;
import com.nasoft.util.StringUtil;

@Controller
@RequestMapping("/menuInfo")
public class MenuInfoController extends BaseController{

	@Resource
	private MenuInfoService menuInfoService;
	
	@RequestMapping("index")
	public String index(){
		return "menuInfo/index";
	}
	
	@RequestMapping("menuInfoList")
	public void getMenuInfoList(HttpServletRequest request,HttpServletResponse response){
		MngUserInfo currentUser = getCurrentUser();
		Map<String, Object> map = new HashMap<String, Object>();
		String menuName = request.getParameter("menuName");
		String parentId = request.getParameter("parentId");
		map.put("parentId", StringUtil.isEmpty(parentId) ? "0":parentId);
		map.put("menuName", menuName);
		map.put("userId", currentUser.getUserId());
		List<MenuInfo> menuList = menuInfoService.findMenuInfo("com.nasoft.aboutcar.menuInfoMapper.findMenuInfo2",map);
		JSONArray array = JSONArray.fromObject(menuList);
		writer(response, array+"");
	}
	
	@RequestMapping("toAddMenu")
	public String toAddMenuInfo(){
		return "menuInfo/add";
	}
	
	@RequestMapping("addMenu")
	public String addMenuInfo(MenuInfo menuInfo,HttpServletRequest request){
		int d = (int)(Math.random()*(9999-1000+1))+1000;
		MngUserInfo currentUser = getCurrentUser();
		menuInfo.setMenuId(String.valueOf(d));
		menuInfo.setCreateUserId(currentUser.getUserId());
		menuInfo.setCreateInstId(currentUser.getInstId());
		menuInfo.setCreateDateTime(DateUtil.DateTimeFormat(new Date()));
		int result = menuInfoService.insert("com.nasoft.aboutcar.menuInfoMapper.menuInfoInsert", menuInfo);
		String msg="";
		if(result>0){
	    	msg="success";
	    }else{
	    	msg="failed";
	    }
		request.setAttribute("msg",msg);
		return "save_result";
	}
	@RequestMapping("updateMenuStatus")
	public void updateMenuInfoStatus(HttpServletRequest request, HttpServletResponse response){
		String menuId = request.getParameter("menuId");
		String status = request.getParameter("status");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menuId", menuId);
		map.put("status", "0".equals(status) ? "1":"0");
		int result = menuInfoService.updateMenuStatus("com.nasoft.aboutcar.menuInfoMapper.updateMenuStatus", map);
		writer(response, result+"");
		
	}
	
	@RequestMapping("toUpdateMenu")
	public String toUpdateMenuInfo(HttpServletRequest request){
		String menuId = request.getParameter("menuId");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menuId", menuId);
		MenuInfo menuInfo = menuInfoService.searchById("com.nasoft.aboutcar.menuInfoMapper.findMenuInfo", map);
		request.setAttribute("menuInfo", menuInfo);
		return "menuInfo/update";
	}
	
	@RequestMapping("updateMenu")
	public String updateMenuInfo(MenuInfo menuInfo,HttpServletRequest request){
		MngUserInfo currentUser = getCurrentUser();
		menuInfo.setUpdUserId(currentUser.getUserId());
		menuInfo.setUpdInstId(currentUser.getInstId());
		menuInfo.setUpdDateTime(DateUtil.DateTimeFormat(new Date()));
		int result = menuInfoService.update("com.nasoft.aboutcar.menuInfoMapper.updateMenuInfo", menuInfo);
		String msg="";
		if(result>0){
	    	msg="success";
	    }else{
	    	msg="failed";
	    }
		request.setAttribute("msg",msg);
		return "save_result";
	}
	@RequestMapping("deleteMenu")
	public void deleteMenuInfo(HttpServletRequest request){
		String menuId = request.getParameter("menuId");
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("menuId", menuId);
		int result = menuInfoService.delete("com.nasoft.aboutcar.menuInfoMapper.deleteMenuInfo", map);
		String msg="";
		if(result>0){
	    	msg="success";
	    }else{
	    	msg="failed";
	    }
	}
	
	@RequestMapping("/selectMenuName")
	public void selectMenuName(String path,HttpServletRequest request,HttpServletResponse response){
		StringBuilder str = new StringBuilder();
		Map<String, Object> map = new HashMap<>();
		map.put("path", path);
		MenuInfo menuInfo = menuInfoService.searchById("com.nasoft.aboutcar.menuInfoMapper.selectMenuName", map);
		str.append(menuInfo.getMenuName()).append(",");
		String parentId = "0000000000";
		while(parentId.length()>2){
			map.clear();
			map.put("menuid", menuInfo.getMenuId());
			menuInfo = menuInfoService.searchById("com.nasoft.aboutcar.menuInfoMapper.selectParentMenu", map);
			parentId = String.valueOf(menuInfo.getParentId());
			str.append(menuInfo.getMenuName()).append(",");
		}
		String menuNames = str.substring(0, str.lastIndexOf(","));
		writer(response, menuNames);
	}
}
