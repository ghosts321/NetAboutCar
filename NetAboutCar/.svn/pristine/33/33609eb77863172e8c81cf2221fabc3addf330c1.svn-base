package com.nasoft.aboutcar.roleinfo.controller;

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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.menuinfo.domain.MenuInfo;
import com.nasoft.aboutcar.menuinfo.service.MenuInfoService;
import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;
import com.nasoft.aboutcar.roleinfo.domain.RoleInfo;
import com.nasoft.aboutcar.roleinfo.service.RoleInfoService;
import com.nasoft.aboutcar.rolemenu.domain.RoleMenu;
import com.nasoft.aboutcar.rolemenu.service.RoleMenuService;
import com.nasoft.aboutcar.userrole.domain.UserRole;
import com.nasoft.util.DateUtil;
import com.nasoft.util.StringUtil;

@Controller
@RequestMapping("/roleInfo")
public class RoleInfoController extends BaseController{
	
	@Resource
	private RoleInfoService roleInfoService;
	
	@Resource
	private MenuInfoService menuInfoService;
	
	@Resource
	private RoleMenuService roleMenuService;
	
	@RequestMapping("index")
	public String index(){
		return "roleInfo/index";
	}
	
	@RequestMapping("roleInfoList")
	public void getRoleInfoList(HttpServletRequest request,HttpServletResponse response){
		String roleName = request.getParameter("roleName");
		Map<String, Object> map = new HashMap<String, Object>();
		if(!"admin".equals(getCurrentUser().getUserName())){
			map.put("flag", "1");
		}
		map.put("roleName", roleName);
		List<RoleInfo> roleList = roleInfoService.findRoleInfo("com.nasoft.aboutcar.RoleInfoMapper.findRoleInfo",map);
		JSONArray array = JSONArray.fromObject(roleList);
		writer(response, array+"");
	}
	
	@RequestMapping("toAddRole")
	public String toAddRoleInfo(){
		return "roleInfo/add";
	}
	@RequestMapping("addRole")
	public String addRoleInfo(RoleInfo roleInfo,HttpServletRequest request){
		int d = (int)(Math.random()*(9999-1000+1))+1000;
		MngUserInfo currentUser = getCurrentUser();
		roleInfo.setRoleId(d);
		roleInfo.setCreateUserId(currentUser.getUserId());
		roleInfo.setCreateInstId(currentUser.getInstId());
		roleInfo.setCreateDateTime(DateUtil.DateTimeFormat(new Date()));
		int result = roleInfoService.insertRole("com.nasoft.aboutcar.RoleInfoMapper.insertRoleInfo", roleInfo);
		String msg="";
		if(result>0){
	    	msg="success";
	    }else{
	    	msg="failed";
	    }
		request.setAttribute("msg",msg);
		return "save_result";
	}
	@RequestMapping("toUpdateRole")
	public String toUpdateRoleInfo(HttpServletRequest request){
		String roleId = request.getParameter("roleId");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("roleId", roleId);
		RoleInfo roleInfo = roleInfoService.searchById("com.nasoft.aboutcar.RoleInfoMapper.findRoleInfo", map);
		request.setAttribute("roleInfo", roleInfo);
		return "roleInfo/update";
	}
	@RequestMapping("updateRole")
	public String updateRoleInfo(RoleInfo roleInfo,HttpServletRequest request){
		MngUserInfo currentUser = getCurrentUser();
		roleInfo.setUpdUserId(currentUser.getUserId());
		roleInfo.setUpdInstId(currentUser.getInstId());
		roleInfo.setUpdDateTime(DateUtil.DateTimeFormat(new Date()));
		int result = roleInfoService.updateRole("com.nasoft.aboutcar.RoleInfoMapper.updateRoleInfo", roleInfo);
		String msg="";
		if(result>0){
	    	msg="success";
	    }else{
	    	msg="failed";
	    }
		request.setAttribute("msg",msg);
		return "save_result";
	}
	@RequestMapping("deleteRole")
	public String deleteRoleInfo(HttpServletRequest request){
		String roleId = request.getParameter("roleId");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("roleId", roleId);
		int result = roleInfoService.deleteRole("com.nasoft.aboutcar.RoleInfoMapper.deleteRoleInfo", map);
		String msg="";
		if(result>0){
	    	msg="success";
	    }else{
	    	msg="failed";
	    }
		request.setAttribute("msg",msg);
		return "save_result";
	}
	
	//分配权限
	@RequestMapping("toAssignPermissions")
	public String toAssignAuthority(HttpServletRequest request){
		String selectRoleId = request.getParameter("roleId");
		String menuIds = request.getParameter("menuIds");
		List<MenuInfo> menuList = menuInfoService.findMenuInfo("com.nasoft.aboutcar.menuInfoMapper.findMenuInfo",null);
		String json = "";
		if(menuList != null && menuList.size()>0){
			for(MenuInfo menu:menuList){
				json += "{id:"+menu.getMenuId()+",pId:"+menu.getParentId()+",name:'"+menu.getMenuName()+"',urls:'"+menu.getMenuUrl()+"'";
				/*if(menu.getMenuLevel() == 1 || menu.getMenuLevel() == 2){
					json += ",open:true";
				}*/
				json += "},";
			}
		}
		request.setAttribute("selectRoleId", selectRoleId);
		request.setAttribute("menuIds", "'"+menuIds+"'");
		request.setAttribute("job", "["+json.substring(0, json.length()-1)+"]");
		return "roleInfo/assignPermis";
	}
	@RequestMapping("assignPermis")
	public String assignPermis(HttpServletRequest request){
		String menuIds = request.getParameter("menuIds");
		String btnPermis = request.getParameter("btnPermis");
		String selectRoleId = request.getParameter("selectRoleId");
		//保存之前先把里面所有用户的角色删除
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("roleId", selectRoleId);
		roleMenuService.delete("com.nasoft.aboutcar.roleMenuMapper.deleteRoleMenu", map);
		int result = 1;
		if(StringUtils.isNotEmpty(menuIds)){
			menuIds = menuIds.substring(0, menuIds.length()-1);
			btnPermis = btnPermis.substring(0, btnPermis.length()-1);
			String permisStr = "";
			String[] menuId = menuIds.split(",");
			String[] btnPermi = btnPermis.split(",");
			//存储权限菜单
			MngUserInfo userInfo = getCurrentUser();
			for(String s:menuId){
				RoleMenu roleMenu = new RoleMenu(Integer.parseInt(selectRoleId),s,
						userInfo.getUserId(),userInfo.getInstId(),DateUtil.format(new Date()));
				result = roleMenuService.insert("com.nasoft.aboutcar.roleMenuMapper.roleMenuInsert", roleMenu);
			}
			//存储权限按钮
			for(int i=0;i<menuId.length;i++){
				if(menuId[i].length() == 8 && StringUtil.isNotEmpty(btnPermi[i])){
					permisStr += btnPermi[i]+",";
				}
			}
			if(StringUtil.isNotEmpty(permisStr)){
				map.clear();
				map.put("permis", permisStr.substring(0,permisStr.length()-1));
				map.put("roleId", selectRoleId);
				int i = roleInfoService.setRolePermiss("com.nasoft.aboutcar.RoleInfoMapper.setRolePermis", map);
			}
		}
		String msg="";
		if(result>0){
	    	msg="success";
	    }else{
	    	msg="failed";
	    }
		request.setAttribute("msg",msg);
		return "save_result";
	}
}
