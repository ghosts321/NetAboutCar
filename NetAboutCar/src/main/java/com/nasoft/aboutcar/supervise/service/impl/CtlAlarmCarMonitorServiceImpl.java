package com.nasoft.aboutcar.supervise.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.supervise.domain.CtlAlarmCarMonitor;
import com.nasoft.aboutcar.supervise.service.CtlAlarmCarMonitorService;

@Service("CtlAlarmCarMonitorService")
public class CtlAlarmCarMonitorServiceImpl implements CtlAlarmCarMonitorService {
	@Resource
	private BaseDao baseDaoSupport;
	@Override
	public List<CtlAlarmCarMonitor> selectAll(String sqlId, Map<String, Object> map) throws Exception {

		return  (List<CtlAlarmCarMonitor>) baseDaoSupport.findForList(sqlId,map);
	}

}
