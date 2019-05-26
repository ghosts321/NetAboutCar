package com.nasoft.aboutcar.supervise.service;

import com.nasoft.aboutcar.supervise.domain.CtlCarPositionInfo;

/**
 * 聚集车辆
 * @author Administrator
 *
 */
public interface CtlAssembleCarMonitorService {
	
	public int addAssembleCar(String sqlId,String[] ids) throws Exception;
	
	public CtlCarPositionInfo findIllegalCarById(String sqlId, String id) throws Exception;
}
