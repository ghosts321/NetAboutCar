package com.nasoft.SSM.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.SSM.base.dao.BaseDao;
import com.nasoft.SSM.domain.CancelApply;
import com.nasoft.SSM.domain.CarChangeApply;
import com.nasoft.SSM.domain.CarInfo;
import com.nasoft.SSM.domain.CarPermitApply;
import com.nasoft.SSM.domain.CarPermitcert;
import com.nasoft.SSM.domain.DrvUserinfo;
import com.nasoft.SSM.service.CarPilotApplyService;

@Service("carPilotApplyService")
public class CarPilotApplyServiceImpl implements CarPilotApplyService{

	
	@Resource
	private BaseDao baseDaoSupport;
	@Override
	public void addCarInfo(String sqlId, CarInfo carInfo) throws Exception {
		baseDaoSupport.save(sqlId, carInfo);
	}

	@Override
	public void addCarPermitApply(String sqlId, CarPermitApply carPermitApply)
			throws Exception {
		baseDaoSupport.save(sqlId, carPermitApply);
	}
	
	@Override
	public void updateExternalExploration(String sqlId, CarPermitApply carPermitApply)throws Exception {
		baseDaoSupport.update(sqlId, carPermitApply);
	}
	
	@Override
	public void updateChangeProperty(String sqlId, CarPermitApply carPermitApply)throws Exception {
		baseDaoSupport.update(sqlId, carPermitApply);
	}

	@Override
	public List<CarPermitApply> findAllCarPermitApplyByCertNo(String sqlId,Map map) throws Exception {
		return  (List<CarPermitApply>) baseDaoSupport.findForList(sqlId, map);
	}
	
	@Override
	public List<CancelApply> findAllCancelApplyByPcertNo(String sqlId,Map map) throws Exception {
		return  (List<CancelApply>) baseDaoSupport.findForList(sqlId, map);
	}

	@Override
	public CarInfo findCarInfoByCertNo(String sqlId,
			String certNo) throws Exception {
		return  (CarInfo) baseDaoSupport.findForObject(sqlId, certNo);
		
	}
	
	@Override
	public CarPermitcert findCarCertByuserName(String sqlId,
			String certNo) throws Exception {
		return  (CarPermitcert) baseDaoSupport.findForObject(sqlId, certNo);
	}
	
	@Override
	public void insertCancelApply(String sqlId , CancelApply cancelapply) throws Exception {
		 baseDaoSupport.findForObject(sqlId , cancelapply);
	}
	
	@Override
	public List<CarPermitcert> findCarCertByCertNo(String sqlId,String certNo) throws Exception {
		return  (List<CarPermitcert>) baseDaoSupport.findForList(sqlId, certNo);
	}
	@Override
	public void deleteCarInfoByCarId(String sqlId, String carId)
			throws Exception {
		baseDaoSupport.delete(sqlId, carId);
		
	}
	
	@Override
	public void deleteCancelApplyByCancelId(String sqlId, String cancelId)
			throws Exception {
		baseDaoSupport.delete(sqlId, cancelId);
		
	}
	@Override
	public void deleteCarPilotApplyByCarId(String sqlId, String carId)
			throws Exception {
		baseDaoSupport.delete(sqlId, carId);
		
	}

	@Override
	public CarPermitApply findCarApplyByApplyId(String sqlId, String applyid) throws Exception {
		return (CarPermitApply) baseDaoSupport.findForObject(sqlId, applyid);
	}
	
	@Override
	public CancelApply findCancelApplyByCancelPcertno(String sqlId, String pcertNo) throws Exception {
		return (CancelApply) baseDaoSupport.findForObject(sqlId, pcertNo);
	}

	@Override
	public CarPermitcert selectByCondition(String sqlId, Map<String, String> map) throws Exception {
		return (CarPermitcert) baseDaoSupport.findForObject(sqlId, map);
	}

	public void updateCarPermitApply(String sqlId, CarPermitApply carPermitApply) throws Exception {

		 baseDaoSupport.update(sqlId, carPermitApply);
	}

	
	public DrvUserinfo findUserInfoByUserName(String sqlId,
			String username) throws Exception {
		return  (DrvUserinfo) baseDaoSupport.findForObject(sqlId, username);
	}
	public void updateCarInfo(String sqlId, CarInfo carInfo) throws Exception {

		 baseDaoSupport.update(sqlId, carInfo);
	}

	@Override
	public CarPermitApply findCarApplyByCarId(String sqlId, String carid)
			throws Exception {
		// TODO Auto-generated method stub
		return (CarPermitApply) baseDaoSupport.findForObject(sqlId,carid);
	}

	@Override
	public void addCarChangeApply(String sqlId, CarPermitApply carPermitApply)
			throws Exception {
		baseDaoSupport.save(sqlId, carPermitApply);
		
	}

	@Override
	public List<CarChangeApply> findAllCarChangeApplyByApplyId(String sqlId,
			String applyid) throws Exception {
		
		return (List<CarChangeApply>) baseDaoSupport.findForList(sqlId, applyid);
	}

	@Override
	public List<CarChangeApply> findAllCarChangeApplyByCertNo(String sqlId,Map map) throws Exception {
		return (List<CarChangeApply>) baseDaoSupport.findForList(sqlId, map);
	}

	@Override
	public void updateCarChangeApply(String sqlId,CarChangeApply carChangeApply) throws Exception {
	
		baseDaoSupport.update(sqlId,carChangeApply);
	}

	
}
