package com.nasoft.aboutcar.pilotapply.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.nasoft.aboutcar.pilotapply.domain.DrvUserinfo;

public interface DrvUserinfoService {

	public void addDrvUserinfo(String sqlId,DrvUserinfo DrvUserinfo) throws Exception;
	
	public List<DrvUserinfo> findDrvUserInfo(String sqlId,Map<String ,Object> map);
	
	public int updateDrvUser(String sqlId,Map<String ,Object> map);
	
	public DrvUserinfo  findDrvUserByCertNo(String sqlId, @Param(value="certno")String certno) throws Exception;

	
}
