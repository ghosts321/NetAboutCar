package com.nasoft.aboutcar.rolemenu.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.rolemenu.domain.RoleMenu;
import com.nasoft.aboutcar.rolemenu.service.RoleMenuService;

@Service("roleMenuService")
public class RoleMenuServiceImpl implements RoleMenuService {

	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public List<RoleMenu> findUserRole(String sqlId) {
		try {
			return (List<RoleMenu>) baseDaoSupport.findForList(sqlId, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public RoleMenu searchById(String sqlId, Map<String, Object> map) {
		try {
			return (RoleMenu) baseDaoSupport.findForObject(sqlId, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int insert(String sqlId, RoleMenu roleMenu) {
		try {
			return (Integer) baseDaoSupport.save(sqlId, roleMenu);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int update(String sqlId, RoleMenu roleMenu) {
		try {
			return (Integer) baseDaoSupport.update(sqlId, roleMenu);
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
