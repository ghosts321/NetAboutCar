package com.nasoft.SSM.service;

import java.util.List;
import java.util.Map;

import com.nasoft.SSM.domain.CarChangeApply;
import com.nasoft.SSM.domain.CarInfo;
import com.nasoft.SSM.domain.CarPermitApply;
import com.nasoft.SSM.domain.CarPermitcert;

import com.nasoft.SSM.domain.DrvUserinfo;
import com.nasoft.SSM.domain.CancelApply;

/**
 * 车辆资质业务申请
 * @author 周鹏飞
 *
 */
public interface CarPilotApplyService {

	public void addCarInfo(String sqlId,CarInfo carInfo) throws Exception;
	
	public void addCarPermitApply(String sqlId,CarPermitApply carPermitApply) throws Exception;
	
	public List<CarPermitApply> findAllCarPermitApplyByCertNo(String sqlId,Map map) throws Exception;
	
	public CarPermitApply findCarApplyByApplyId(String sqlId,String applyid) throws Exception;
		
	public CarInfo findCarInfoByCertNo(String sqlId,String certNo) throws Exception;
	
	public void insertCancelApply(String sqlId , CancelApply cancelApply) throws Exception;
	
	public CarPermitApply findCarApplyByCarId(String sqlId,String carid) throws Exception;
	
	public CarPermitcert findCarCertByuserName(String sqlId,String certNo) throws Exception;

	public List<CarPermitcert> findCarCertByCertNo(String sqlId, String certNo) throws Exception;

	public void deleteCarInfoByCarId(String sqlId,String carId) throws Exception;
	
	public void deleteCarPilotApplyByCarId(String sqlId,String carId) throws Exception;

	public CarPermitcert selectByCondition(String sqlId,Map<String,String> map) throws Exception;

	public void updateExternalExploration(String sqlId, CarPermitApply carPermitApply) throws Exception;
	
	public void updateCarPermitApply(String sqlId, CarPermitApply carPermitApply) throws Exception;

	public void updateChangeProperty(String sqlId, CarPermitApply carPermitApply) throws Exception;
	public void updateCarInfo(String sqlId,CarInfo carInfo) throws Exception;
	
	public DrvUserinfo findUserInfoByUserName(String sqlId, String username)
			throws Exception;

	public List<CancelApply> findAllCancelApplyByPcertNo(String string, Map map)throws Exception;

	public void deleteCancelApplyByCancelId(String sqlId, String cancelId)throws Exception;

	public CancelApply findCancelApplyByCancelPcertno(String sqlId,String pcertNo) throws Exception;
	/**
	 * 添加车辆变更数据
	 * @param string
	 * @param carPermitApply
	 */
	public void addCarChangeApply(String sqlId, CarPermitApply carPermitApply)throws Exception;
	/**
	 * 车辆变更
	 * @param sqlId
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public List<CarChangeApply> findAllCarChangeApplyByApplyId(String sqlId,String applyid)throws Exception;
	/**
	 * 通过身份证号查询车辆变更表
	 * @param sqlId
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public List<CarChangeApply> findAllCarChangeApplyByCertNo(String sqlId,Map map)throws Exception;
	/**
	 * 修改更改变更的状态
	 * @param string
	 * @param carChangeApply
	 */
	public void updateCarChangeApply(String sqlId,CarChangeApply carChangeApply)  throws Exception;

}
