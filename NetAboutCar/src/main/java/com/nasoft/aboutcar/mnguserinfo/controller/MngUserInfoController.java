package com.nasoft.aboutcar.mnguserinfo.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.mngareainfo.domain.MngAreaInfo;
import com.nasoft.aboutcar.mngareainfo.service.MngAreaInfoService;
import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;
import com.nasoft.aboutcar.mnguserinfo.service.MngUserInfoService;
import com.nasoft.aboutcar.roleinfo.domain.RoleInfo;
import com.nasoft.aboutcar.roleinfo.service.RoleInfoService;
import com.nasoft.aboutcar.userrole.domain.UserRole;
import com.nasoft.aboutcar.userrole.service.UserRoleService;
import com.nasoft.util.DateUtil;
import com.nasoft.util.Encryption;
import com.nasoft.util.StringUtil;

/**
 * @author yangke
 * @version 1.0
 * @since 1.0
 */

@Controller
@RequestMapping("/mngUserInfo")
public class MngUserInfoController extends BaseController{
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	@Resource
	private MngUserInfoService mngUserInfoService;
	
	@Resource
	private MngAreaInfoService mngAreaInfoService;
	
	@Resource
	private RoleInfoService roleInfoService;
	
	@Resource
	private UserRoleService userRoleService;
	
	/** 列表 */
	@RequestMapping("index")
	public String index(HttpServletRequest request,HttpServletResponse response) {
		return "mngUserInfo/index";
	}
	
	@RequestMapping("validUserName")
	public void validUserName(HttpServletRequest request,HttpServletResponse response,String userName){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", userName);
		map.put("areaCode", "000000");
		List<MngUserInfo> userList = mngUserInfoService.findUser("com.nasoft.aboutcar.MngUserInfoMapper.findMngUser",map);
		String flag = "";
		if(userList != null && userList.size() > 0){
			flag = "1";
		}else{
			flag = "0";
		}
		writer(response, flag);
	}
	
	@RequestMapping("mngUserList")
	public void getUserList(HttpServletRequest request,HttpServletResponse response){
		String userName = request.getParameter("userName");
		String realName = request.getParameter("realName");
		MngUserInfo userInfo = getCurrentUser();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", userName);
		map.put("realName", realName);
		map.put("areaCode", userInfo.getAreaCode());
		List<MngUserInfo> userList = mngUserInfoService.findUser("com.nasoft.aboutcar.MngUserInfoMapper.findMngUser",map);
		JSONArray array = JSONArray.fromObject(userList);
		writer(response, array+"");
	}
	
	@RequestMapping("toRegistUser")
	public String toRegistUser(HttpServletRequest request,HttpServletResponse response){
		List<MngAreaInfo> areaInfoList = mngAreaInfoService.findAreaList("com.nasoft.aboutcar.MngAreaInfoMapper.findAreaListByCode", null);
		JSONArray areaInfoArray = JSONArray.fromObject(areaInfoList);
		request.setAttribute("provinceList", areaInfoArray);
		return "mngUserInfo/add";
	}
	
	@RequestMapping("userRegist")
	public ModelAndView userRegist(MngUserInfo userInfo, HttpServletRequest request,HttpServletResponse response){
		ModelAndView mv=new ModelAndView();
		userInfo.setPassword(Encryption.md5(userInfo.getPassword()));
		userInfo.setCreateDate(DateUtil.DateTimeFormat(new Date()));
		int i = mngUserInfoService.insertUserInfo("com.nasoft.aboutcar.MngUserInfoMapper.insert", userInfo);
		String msg="";
		if(i<0){
			request.setAttribute("responseMsg", "对不起！注册失败");
			msg="failed";
			
		}
		msg="success";
		mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
	}
	
	@RequestMapping("toUpdateUser")
	public String toUpdateUser(HttpServletRequest request){
		MngUserInfo userInfo = getCurrentUser();
		MngUserInfo mngUserInfo = mngUserInfoService.searchById("com.nasoft.aboutcar.MngUserInfoMapper.searchMngUserById", userInfo.getUserId()+"");
		request.setAttribute("userInfo", mngUserInfo);
		List<MngAreaInfo> areaInfoList = mngAreaInfoService.findAreaList("com.nasoft.aboutcar.MngAreaInfoMapper.findAreaListByCode", null);
		JSONArray areaInfoArray = JSONArray.fromObject(areaInfoList);
		request.setAttribute("provinceList", areaInfoArray);
		return "mngUserInfo/update";
	}
	
	@RequestMapping("getAreaCode")
	public void getAreaCode(HttpServletRequest request,HttpServletResponse response){
		String code = request.getParameter("codeParam");
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("pareaCode", code);
		List<MngAreaInfo> areaInfoList = mngAreaInfoService.findAreaList("com.nasoft.aboutcar.MngAreaInfoMapper.findAreaListByCode",map);
		JSONArray array = JSONArray.fromObject(areaInfoList);
		writer(response, array+"");
	}
	
	@RequestMapping("updateUser")
	public String updateUser(MngUserInfo userInfo,HttpServletRequest request){
		String pwd = userInfo.getPassword();
		userInfo.setPassword(Encryption.md5(pwd));
		MngUserInfo currentUser = getCurrentUser();
		userInfo.setUserId(currentUser.getUserId());
		userInfo.setUpdUserId(currentUser.getUserId());
		userInfo.setUpdInstId(currentUser.getInstId());
		userInfo.setUpdDateTime(DateUtil.dateToString(new Date(), "yyyy-MM-dd"));
		int result = mngUserInfoService.updateUserInfo("com.nasoft.aboutcar.MngUserInfoMapper.updateUserInfo", userInfo);
		String msg="";
		if(result>0){
			if(StringUtil.isNotEmpty(pwd)){
				return "redirect:/login/userLoginOut.action";
			}
	    }else{
	    	msg="failed";
	    }
		request.setAttribute("msg",msg);
		return "save_result";
	}
	@RequestMapping("deleteUser")
	public void deleteUser(HttpServletRequest request){
		String userId = request.getParameter("userId");
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		int result = mngUserInfoService.deleteUserInfo("com.nasoft.aboutcar.MngUserInfoMapper.deleteUserInfo", map);
		String msg="";
		if(result>0){
	    	msg="success";
	    }else{
	    	msg="failed";
	    }
	}
	
	
	@RequestMapping("toAssignRole")
	public String toAssignRole(HttpServletRequest request){
		String selectUserId = request.getParameter("userId");
		String roleIds = request.getParameter("roleIds");
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("flag", "1");
		List<RoleInfo> roleList = roleInfoService.findRoleInfo("com.nasoft.aboutcar.RoleInfoMapper.findRoleInfo",map);
		request.setAttribute("selectUserId", selectUserId);
		request.setAttribute("roleIds", "'"+roleIds+"'");
		request.setAttribute("roleList", roleList);
		return "mngUserInfo/assignRole";
	}
	//分配角色
	@RequestMapping("assignRole")
	public String assignRole(HttpServletRequest request){
		String roleIds = request.getParameter("roleIds");
		String selectUserId = request.getParameter("selectUserId");
		//保存之前先把里面所有用户的角色删除
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", selectUserId);
		userRoleService.delete("com.nasoft.aboutcar.userRoleMapper.deleteUserRole", map);
		int result = 1;
		if(StringUtils.isNotEmpty(roleIds)){
			roleIds = roleIds.substring(0, roleIds.length()-1);
			MngUserInfo userInfo = getCurrentUser();
			for(String s:roleIds.split(",")){
				UserRole userRole = new UserRole(Integer.parseInt(selectUserId),Integer.parseInt(s),
						userInfo.getUserId(),userInfo.getInstId(),DateUtil.format(new Date()));
				result = userRoleService.insert("com.nasoft.aboutcar.userRoleMapper.userRoleInsert", userRole);
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

