package com.nasoft.aboutcar.roleinfo.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.roleinfo.domain.RoleInfo;
import com.nasoft.aboutcar.roleinfo.service.RoleInfoService;

@Service("roleInfoService")
public class RoleInfoServiceImpl implements RoleInfoService {
	
	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public List<RoleInfo> findRoleInfo(String sqlId ,Map<String, Object> map) {
		try {
			List<RoleInfo> list = (List<RoleInfo>) baseDaoSupport.findForList(sqlId, map);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public RoleInfo searchById(String sqlId, Map<String, Object> map) {
		try {
			return (RoleInfo) baseDaoSupport.findForObject(sqlId, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int insertRole(String sqlId, RoleInfo role) {
		try {
			return (Integer)baseDaoSupport.save(sqlId, role);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int updateRole(String sqlId, RoleInfo roleInfo) {
		try {
			return (Integer)baseDaoSupport.update(sqlId, roleInfo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int deleteRole(String sqlId, Map<String, Object> map) {
		try {
			return (Integer) baseDaoSupport.delete(sqlId, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public Set<String> getRoleSet(String sqlId, Map<String, Object> map) {
		try {
			List<RoleInfo> list = (List<RoleInfo>) baseDaoSupport.findForList(sqlId, map);
			Set<String> set = new HashSet<String>();
			if(list != null && list.size()>0){
				for(RoleInfo role:list){
					set.add(role.getRoleName());
				}
			}
			return set;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int setRolePermiss(String sqlId, Map<String, Object> map) {
		try {
			return (Integer)baseDaoSupport.update(sqlId, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}
