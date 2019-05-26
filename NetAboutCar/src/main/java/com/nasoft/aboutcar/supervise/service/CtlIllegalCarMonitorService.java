package com.nasoft.aboutcar.supervise.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.administrativePenalty.domain.DrvPlantCaseInfo;
import com.nasoft.aboutcar.supervise.domain.CarActionInfo;
import com.nasoft.aboutcar.supervise.domain.CarIllegalInfo;
import com.nasoft.aboutcar.supervise.domain.CtlIllegalCarMonitor;
import com.nasoft.aboutcar.supervise.domain.DrvActionInfo;
import com.nasoft.aboutcar.supervise.domain.DrvIllegalInfo;

public interface CtlIllegalCarMonitorService {
	/**
	 * 获取违规车辆列表
	 * @param sqlId
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public List<CtlIllegalCarMonitor> selectAll(String sqlId,Map<String, Object> map) throws Exception;
	
	public void disposeDel(String sqlId, String id) throws Exception;
	
	/**
	 * 根据违规车辆Id查找违规车辆信息
	 * @param sqlId
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public CtlIllegalCarMonitor findIllegalCarById(String sqlId, String id) throws Exception;
	
	public List<DrvIllegalInfo> DrvIllegalInfofindAll(String sqlId,Map<String, Object> map) throws Exception;
	
	public DrvIllegalInfo DrvIllegalInfofindById(String sqlId,String drv_illegal_id) throws Exception;
	
	public void insertDetermine(String sqlId , DrvIllegalInfo drvIllegalInfo) throws Exception;

	public void updateDetermine(String sqlId , DrvIllegalInfo drvIllegalInfo) throws Exception;

	public List<DrvIllegalInfo> driverexamineFindAll(String sqlId,Map<String, Object> map) throws Exception;

	public void updateExamine(String sqlId , DrvIllegalInfo drvIllegalInfo) throws Exception;

	public void addDriverwzwf(String sqlId , DrvIllegalInfo drvIllegalInfo) throws Exception;

	public List<DrvActionInfo> driverlawaddFindAll(String sqlId,Map<String, Object> map) throws Exception;

	public void DriverlawInsert(String sqlId , DrvActionInfo drvActionInfo) throws Exception;

	public List<CarIllegalInfo> CarIllegalInfofindAll(String sqlId,Map<String, Object> map) throws Exception;

	public CarIllegalInfo CarIllegalInfofindById(String sqlId,String car_illegal_id) throws Exception;

	public void updatecarDetermine(String sqlId , CarIllegalInfo carIllegalInfo) throws Exception;

	public void addCarwzwf(String sqlId , CarIllegalInfo carIllegalInfo) throws Exception;

	public List<CarIllegalInfo> carexamineFindAll(String sqlId,Map<String, Object> map) throws Exception;

	public void updatecarExamine(String sqlId , CarIllegalInfo carIllegalInfo) throws Exception;

	public List<CarActionInfo> carlawaddFindAll(String sqlId,Map<String, Object> map) throws Exception;

	public void CarlawInsert(String sqlId , CarActionInfo carActionInfo) throws Exception;

	public List<DrvIllegalInfo> zfjcillegalFindAll(String sqlId,Map<String, Object> map) throws Exception;

	public List<DrvIllegalInfo> drvillegalSearch(String sqlId,Map<String, Object> map) throws Exception;

	public List<CarIllegalInfo> carillegalSearch(String sqlId,Map<String, Object> map) throws Exception;

	public Map drvCanalysisInfo(String sqlId,Map map) throws Exception;

	public Map carCanalysisInfo(String sqlId,Map map) throws Exception;
	
	public void insertdrvcaseinfo(String sqlId , DrvPlantCaseInfo drvCaseInfo) throws Exception;

	public List<Map> findXzspCertno(String sqlId) throws Exception;
	
	public int saveIllCar(String sqlId, CtlIllegalCarMonitor illCar) throws Exception;
	
	public List<CtlIllegalCarMonitor> findIllegaCar(String sqlId, Map<String, Object> map) throws Exception;
}
