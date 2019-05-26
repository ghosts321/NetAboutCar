package com.nasoft.aboutcar.drvuserinfo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.drvuserinfo.domain.DrvUserinfo;
import com.nasoft.aboutcar.drvuserinfo.domain.DrvUserreg;
import com.nasoft.aboutcar.drvuserinfo.service.DrvUserInfoService;
import com.nasoft.aboutcar.mngareainfo.service.MngAreaInfoService;
import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;
import com.nasoft.aboutcar.roleinfo.service.RoleInfoService;
import com.nasoft.aboutcar.userrole.service.UserRoleService;
import com.nasoft.util.Encryption;


/**
 * @author yangke
 * @version 1.0
 * @since 1.0
 */

@Controller
@RequestMapping("/drvUserInfo")
public class DrvUserInfoController extends BaseController{
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	@Resource
	private DrvUserInfoService drvUserInfoService;
	
	@Resource
	private MngAreaInfoService mngAreaInfoService;
	
	@Resource
	private RoleInfoService roleInfoService;
	
	@Resource
	private UserRoleService userRoleService;
	  
	@RequestMapping("index")
	public String index(){
		return "drvUserInfo/index";
	}
	/**
	 * cuixing
	 * 驾驶员列表的查询
	 */
	@RequestMapping("/drvUserList")
	public void drvUserList(HttpServletResponse response,HttpServletRequest request){
		try {
			String username=request.getParameter("username");
			String certno=request.getParameter("certno");
			Map<String,String> map=new HashMap<String,String>();
			map.put("username", username);
			MngUserInfo MngUserInfo = getCurrentUser();
			map.put("roleid", MngUserInfo.getRoleId());
			map.put("instid", MngUserInfo.getInstId());
			map.put("areacode", MngUserInfo.getAreaCode());
			map.put("certno", certno);
			List<DrvUserinfo>  list=drvUserInfoService.findDrvUserList("com.nasoft.aboutcar.DrvUserinfoMapper.findDrvUserList",map);
			JSONArray array = JSONArray.fromObject(list.toArray());
			writer(response, array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/toUpdateUser")
	public String toUpdateUser(HttpServletRequest request,HttpServletResponse response){
		String certno=request.getParameter("certno");
		request.setAttribute("certno", certno);
		return "drvUserInfo/update";
	}
	/**
	 * 修改驾驶员密码
	 * @param request
	 * @param response
	 */
	@RequestMapping("/updateUser")
	public ModelAndView updateUser(HttpServletRequest request,HttpServletResponse response){
		String certno = request.getParameter("certno");
		String password = Encryption.md5(request.getParameter("password"));
		String newPwd = Encryption.md5(request.getParameter("newPwd"));
		String comfirmPwd = Encryption.md5(request.getParameter("comfirmPwd"));
		String msg="";
		ModelAndView mv=new ModelAndView();
		try {
			DrvUserreg userinfo=drvUserInfoService.findDrvUserByCertno("com.nasoft.aboutcar.DrvUserinfoMapper.findUserInfoByCertno",certno);
			
			if(!userinfo.getPassword().equals(password)){
				msg="原密码不正确";
				request.setAttribute("msg", msg);
				mv.addObject("failed");
				mv.setViewName("save_result");
				return mv;
			}
			if(!newPwd.equals(comfirmPwd)){
				msg="两次输入的密码不一致";
				request.setAttribute("msg", msg);
				mv.addObject("failed");
				mv.setViewName("save_result");
				return mv;
			}
			Map<String,String> map=new HashMap<String,String>();
			map.put("certno",certno);
			map.put("newPwd", newPwd);
			drvUserInfoService.updateDrvUserByCertno("com.nasoft.aboutcar.DrvUserinfoMapper.updateUserInfoByCertno",map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		msg="修改成功";
		request.setAttribute("msg", msg);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
}

