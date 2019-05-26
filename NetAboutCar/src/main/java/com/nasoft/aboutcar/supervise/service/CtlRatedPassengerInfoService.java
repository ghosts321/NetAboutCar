package com.nasoft.aboutcar.supervise.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.supervise.domain.CtlRatedPassengerInfo;

public interface CtlRatedPassengerInfoService {
	public List<CtlRatedPassengerInfo> findAllRatedPassengerInfo(String sqlId,Map<String, Object> map) throws Exception;
	
	public int addCtlRatedPassengerInfo(String sqlId, CtlRatedPassengerInfo ctlRatedPassengerInfo) throws Exception;
}
