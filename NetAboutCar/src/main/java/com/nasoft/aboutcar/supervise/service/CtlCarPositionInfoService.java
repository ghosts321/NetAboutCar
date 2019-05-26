package com.nasoft.aboutcar.supervise.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.supervise.domain.CtlCarPositionInfo;

public interface CtlCarPositionInfoService {
	public List<CtlCarPositionInfo> selectAll(String sqlId,Map<String, Object> map) throws Exception;
	
	public List<CtlCarPositionInfo> findAllCarNewPosition(String sqlId) throws Exception;

	public List<CtlCarPositionInfo> findAllCarPositionInfoH(String string, Map map) throws Exception;
	/**
	 * 获取报警车辆
	 * @param sqlId
	 * @return
	 * @throws Exception
	 */
	public List<CtlCarPositionInfo> selectAlarmCar(String sqlId, Map map) throws Exception;
	
	/**
	 * 特定车辆追踪
	 * @param sqlId
	 * @return
	 * @throws Exception
	 */
	public CtlCarPositionInfo getSpecificCar(String sqlId, String vehicleNo) throws Exception;
	
	public int addCarPosition(String sqlId, CtlCarPositionInfo ctlCarPositionInfo) throws Exception;
	
	/**
	 * 根据id获取车辆信息
	 * @param sqlId
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public CtlCarPositionInfo getCarInfoToid(String sqlId, String id) throws Exception;
}
