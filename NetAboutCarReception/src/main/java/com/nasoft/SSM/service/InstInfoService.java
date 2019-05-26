package com.nasoft.SSM.service;

import java.util.List;

import com.nasoft.SSM.domain.InstInfo;


public interface InstInfoService {

	List<InstInfo> findAllInstInfo(String sqlId) throws Exception;

	List<InstInfo> findInstInfoByAreacode(String sqlId, String areaCode) throws Exception;
	List<String> findInstNameByInstid(String sqlId, String instid) throws Exception;

}
