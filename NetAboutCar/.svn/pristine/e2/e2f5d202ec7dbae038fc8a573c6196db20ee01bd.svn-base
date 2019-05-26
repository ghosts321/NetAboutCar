package com.nasoft.aboutcar.userrole.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.userrole.domain.UserRole;
import com.nasoft.aboutcar.userrole.service.UserRoleService;

@Service("userRoleService")
public class UserRoleServiceImpl implements UserRoleService {

	@Resource
	private BaseDao baseDaoSupport;
	
	public List<UserRole> findUserRole(String sqlId){
		try {
			return (List<UserRole>) baseDaoSupport.findForList(sqlId, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public UserRole searchById(String sqlId, Map<String, Object> map) {
		try {
			return (UserRole) baseDaoSupport.findForObject(sqlId, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int insert(String sqlId, UserRole userRole) {
		try {
			return (Integer) baseDaoSupport.save(sqlId, userRole);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int update(String sqlId, UserRole userRole) {
		try {
			return (Integer) baseDaoSupport.update(sqlId, userRole);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int delete(String sqlId, Map<String, Object> map) {
		try {
			return (Integer) baseDaoSupport.delete(sqlId, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}
