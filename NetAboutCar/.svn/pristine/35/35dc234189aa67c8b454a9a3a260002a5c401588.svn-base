package com.nasoft.aboutcar.monitor.service.impl;

import javax.annotation.Resource;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.monitor.service.BnsViolationPriceMonitorService;

public class BnsViolationPriceMonitorServiceImpl implements BnsViolationPriceMonitorService{
	
	@Resource
	private BaseDao baseDaoSupport;
	
	public void setViolationPriceMonitor(String sqlId,String orderMatchTime ){
		try {
			baseDaoSupport.save(sqlId, orderMatchTime );
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
