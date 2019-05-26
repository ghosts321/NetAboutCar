package com.nasoft.aboutcar.supervise.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.supervise.domain.CtlAlarmCarMonitor;

public interface CtlAlarmCarMonitorService {
	public List<CtlAlarmCarMonitor> selectAll(String sqlId,Map<String, Object> map) throws Exception;
}
