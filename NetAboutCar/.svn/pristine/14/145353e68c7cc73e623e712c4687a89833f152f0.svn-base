package com.nasoft.aboutcar.instInfo.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.instInfo.domain.InstInfo;



public interface InstInfoService {

	List<InstInfo> findAllInstInfo(String sqlId,Map<String, Object> map) throws Exception;
	
	List<InstInfo> findAllInstInfoByAreaCode(String sqlId,String areaCode) throws Exception;
	
	InstInfo findInstInfoByInstId(String sqlId,String instId) throws Exception;
	
	int addInstInfo(String sqlId,InstInfo instInfo) throws Exception;
	
	int updateInstInfo(String sqlId,InstInfo instInfo) throws Exception;
	
	int deleteInstInfoByInstId(String sqlId,String instId) throws Exception;
}
