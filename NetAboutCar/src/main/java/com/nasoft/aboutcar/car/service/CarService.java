package com.nasoft.aboutcar.car.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.car.domain.CarApprove;
import com.nasoft.aboutcar.car.domain.CarChangeApply;
import com.nasoft.aboutcar.car.domain.CarInfo;
import com.nasoft.aboutcar.car.domain.CarInfoHis;
import com.nasoft.aboutcar.car.domain.CarMakeupTapp;
import com.nasoft.aboutcar.car.domain.CarPermitApply;
import com.nasoft.aboutcar.car.domain.CarPermitApplyHis;
import com.nasoft.aboutcar.car.domain.CarPermitcert;
import com.nasoft.aboutcar.pilotapply.domain.DrvPermitcert;


public interface CarService {

    
	//车辆信息
	public List<CarInfo> findAllCar(String sqlId) throws Exception;
	//根据ID获取车辆信息
	public CarInfo findCarInfoByCarId(String sqlId,String carId) throws Exception;
	//车辆历史信息
	public List<CarInfoHis> findAllCarHis(String sqlId) throws Exception;
	//车辆营运许可申请信息
	public List<Map> findAllCarPermitApply(String sqlId,Map<String, Object> map) throws Exception;
	//根据车辆ID获取车辆申请信息
	public CarPermitApply findAllCarPermitApplyByCarId(String sqlId,String carId) throws Exception;
	
	public CarPermitApply findCarPermitApplyByApplyId(String sqlId,String applyId) throws Exception;
	
	//车辆营运许可申请历史信息
	public List<CarPermitApplyHis> findAllCarPermitApplyHis(String sqlId) throws Exception;
	//车辆运营许可证信息
	public List<CarPermitcert> findAllCarPermitcert(String sqlId) throws Exception;
	
	//修改车辆证书表状态
	public void updateByApplyid(String sqlId,CarPermitcert carPermitcert) throws Exception;
	//查询证书列表信息
	public List<Map> selectAllCertInfo(String sqlId,Map<String, Object> map) throws Exception;
	
	//车辆营运许可补换申请信息
	public List<CarMakeupTapp> findAllCarMakeupTapp(String sqlId) throws Exception;
	
	public void updateApplyStatus(String sqlId,CarPermitApply ca) throws Exception;
	
	public CarApprove findApproveByApplyId(String sqlId,String applyId) throws Exception;

	public void addCarApprove(String sqlId,CarApprove carApprove) throws Exception;

	public void addCarPermitcert(String sqlId, CarPermitcert carPermitcert) throws Exception;
	//根据身份证号查询所有证书信息
	List<CarPermitcert> findCarCertByCertNo(String sqlId, String certno) throws Exception;
	//根据汽车编号进行查询证书信息
	public List<Map> findPrintCertByCarid(String string, String carid)throws Exception;
	//通过申请id去查询之前进行过处理
	public List<Map> findApproveListByApplyId(String sqlId, String applyId)throws Exception;
	/**
	 * 通过applyId查询处变更表
	 * @param string
	 * @param applyId
	 * @return
	 * @throws Exception
	 */
	public CarChangeApply findCarChangeApplyByApplyId(String sqlId,String applyId)throws Exception;
	/**
	 * 修改变更表中的状态
	 * @param string
	 * @param ca
	 * @throws Exception
	 */
	public void updateChangeApplyStatus(String string, CarPermitApply ca)throws Exception;
	/**
	 * 查询所有的审批车辆
	 * @param sqlId
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public List<Map> findAllCarPermitApplyList(String sqlId,Map<String, Object> map)throws Exception;
	
}
