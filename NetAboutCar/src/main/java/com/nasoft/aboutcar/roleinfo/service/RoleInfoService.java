package com.nasoft.aboutcar.roleinfo.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.nasoft.aboutcar.roleinfo.domain.RoleInfo;

public interface RoleInfoService {
	
	List<RoleInfo> findRoleInfo(String sqlId,Map<String, Object> map);

	RoleInfo searchById(String sqlId, Map<String, Object> map);
	
	int insertRole(String sqlId, RoleInfo role);
 
	int updateRole(String sqlId, RoleInfo role);
	
	int setRolePermiss(String sqlId,Map<String, Object> map);
	
	int deleteRole(String sqlId, Map<String, Object> map);
	
	Set<String> getRoleSet(String sqlId,Map<String, Object> map);
}
