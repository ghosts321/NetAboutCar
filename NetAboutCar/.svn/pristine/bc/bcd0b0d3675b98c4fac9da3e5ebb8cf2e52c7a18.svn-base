package com.nasoft.aboutcar.common.realm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.Permission;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.authz.permission.AllPermission;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;
import com.nasoft.aboutcar.mnguserinfo.service.MngUserInfoService;
import com.nasoft.aboutcar.roleinfo.domain.RoleInfo;
import com.nasoft.aboutcar.roleinfo.service.RoleInfoService;
import com.nasoft.util.SetUtil;
import com.nasoft.util.StringUtil;

public class SystemRealm extends AuthorizingRealm{
	private static final Logger logger = LoggerFactory.getLogger(SystemRealm.class);
	
	@Resource
	private MngUserInfoService mngUserInfoService;
	
	@Resource
	private RoleInfoService roleInfoService;

	/**
	 * 为当前登录的用户授予角色和权限
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		logger.info("##################执行Shiro权限认证##################");
		//获取当前登录输入的用户名，等价于(String) principalCollection.fromRealm(getName()).iterator().next();
		String userName=(String)principals.getPrimaryPrincipal();
		SimpleAuthorizationInfo authorizationInfo=new SimpleAuthorizationInfo();
		//设置用户角色
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", userName);
		Set<String> rolesSet = roleInfoService.getRoleSet("com.nasoft.aboutcar.RoleInfoMapper.findRoleListByUserName", map);
		authorizationInfo.setRoles(rolesSet);
		//设置角色的权限
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("userName", userName);
		List<RoleInfo> roleInfoList = roleInfoService.findRoleInfo("com.nasoft.aboutcar.RoleInfoMapper.findRoleForValid", map2);
		String permis = "";
		if(roleInfoList != null && roleInfoList.size() > 0){
			for(RoleInfo roles:roleInfoList){
				permis += roles.getPermission()+",";
			}
		}
		if(StringUtil.isNotEmpty(permis)){
			Set<String> permisSet = SetUtil.strCaseSet(permis.substring(0,permis.length()-1), ",");
			if(permisSet != null){
				authorizationInfo.addStringPermissions(permisSet);
			}else{
				authorizationInfo.addStringPermission("xxff00");
			}
		}
		return authorizationInfo;
	}

	/**
	 * 验证当前登录的用户
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		String userName=(String)token.getPrincipal();
		MngUserInfo mngUserInfo = mngUserInfoService.LoginVerification("com.nasoft.aboutcar.MngUserInfoMapper.mngUserVerification", userName);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", userName);
		List<RoleInfo> roleList = roleInfoService.findRoleInfo("com.nasoft.aboutcar.RoleInfoMapper.findRoleListByUserName", map);
		if(roleList != null && roleList.size() > 0){
			mngUserInfo.setRoleId(roleList.get(0).getRoleId()+"");
			mngUserInfo.setRoleName(roleList.get(0).getRoleName()+"");
		}
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		long timeout = session.getTimeout();
		session.setAttribute("mngUserInfo",mngUserInfo);
		
		if(mngUserInfo!=null){
			AuthenticationInfo authcInfo=new SimpleAuthenticationInfo(mngUserInfo.getUserName(),mngUserInfo.getPassword(),"");
			return authcInfo;
		}else{
			return null;
		}
	}

}
