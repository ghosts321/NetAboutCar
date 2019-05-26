package com.nasoft.aboutcar.car.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.car.domain.CarApprove;
import com.nasoft.aboutcar.car.domain.CarChangeApply;
import com.nasoft.aboutcar.car.domain.CarInfo;
import com.nasoft.aboutcar.car.domain.CarInfoHis;
import com.nasoft.aboutcar.car.domain.CarMakeupTapp;
import com.nasoft.aboutcar.car.domain.CarPermitApply;
import com.nasoft.aboutcar.car.domain.CarPermitApplyHis;
import com.nasoft.aboutcar.car.domain.CarPermitcert;
import com.nasoft.aboutcar.car.service.CarService;
import com.nasoft.aboutcar.pilotapply.domain.DrvPermitcert;

@Service("carService")
public class CarServiceImpl implements CarService{

	
	@Resource
	private BaseDao baseDaoSupport;
	@Override
	public List<CarInfo> findAllCar(String sqlId) throws Exception {
		List<CarInfo> list=(List<CarInfo>) baseDaoSupport.findForList(sqlId, null);
		return list;
	}
	
	@Override
	public CarInfo findCarInfoByCarId(String sqlId, String carId)
			throws Exception {
		return (CarInfo) baseDaoSupport.findForObject(sqlId, carId);
	}

	@Override
	public List<CarInfoHis> findAllCarHis(String sqlId) throws Exception {
		List<CarInfoHis> list=(List<CarInfoHis>) baseDaoSupport.findForList(sqlId, null);
		return list;
	}

	@Override
	public List<Map> findAllCarPermitApply(String sqlId,Map<String, Object> map) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}

	@Override
	public List<CarPermitApplyHis> findAllCarPermitApplyHis(String sqlId)
			throws Exception {
		List<CarPermitApplyHis> list=(List<CarPermitApplyHis>) baseDaoSupport.findForList(sqlId, null);
		return list;
	}

	@Override
	public List<CarPermitcert> findAllCarPermitcert(String sqlId)
			throws Exception {
		List<CarPermitcert> list=(List<CarPermitcert>) baseDaoSupport.findForList(sqlId, null);
		return list;
	}

	@Override
	public List<CarMakeupTapp> findAllCarMakeupTapp(String sqlId)
			throws Exception {
		List<CarMakeupTapp> list=(List<CarMakeupTapp>) baseDaoSupport.findForList(sqlId, null);
		return list;
	}

	@Override
	public CarPermitApply findAllCarPermitApplyByCarId(String sqlId,
			String carId) throws Exception {
		return (CarPermitApply) baseDaoSupport.findForObject(sqlId,carId);
	}
	
	@Override
	public CarPermitApply findCarPermitApplyByApplyId(String sqlId,String applyId) throws Exception {
		return (CarPermitApply) baseDaoSupport.findForObject(sqlId,applyId);
	}
	
	@Override
	public List<CarPermitcert> findCarCertByCertNo(String sqlId,String certno) throws Exception {
		return (List<CarPermitcert>) baseDaoSupport.findForList(sqlId,certno);
	}
	
	@Override
	public void updateApplyStatus(String sqlId, CarPermitApply ca) throws Exception {
		// TODO Auto-generated method stub
		baseDaoSupport.update(sqlId, ca);
	}
	
	@Override
	public CarApprove findApproveByApplyId(String sqlId, String applyId)
			throws Exception {
		// TODO Auto-generated method stub
		return (CarApprove) baseDaoSupport.findForObject(sqlId, applyId);
	}
	
	@Override
	public void addCarApprove(String sqlId, CarApprove carApprove)
			throws Exception {
		baseDaoSupport.save(sqlId, carApprove);
		
	}
	
	public void addCarPermitcert(String sqlId,CarPermitcert carPermitcert) throws Exception{
		baseDaoSupport.save(sqlId, carPermitcert);
	}

	@Override
	public void updateByApplyid(String sqlId, CarPermitcert carPermitcert) throws Exception {
		baseDaoSupport.update(sqlId, carPermitcert);
	}

	@Override
	public List<Map> selectAllCertInfo(String sqlId,Map<String, Object> map) throws Exception {
		return (List<Map>) baseDaoSupport.findForList(sqlId, map);
	}

	@Override
	public List<Map> findPrintCertByCarid(String sqlId, String carid) throws Exception {
		
		return (List<Map>) baseDaoSupport.findForList(sqlId,carid);
	}

	@Override
	public List<Map> findApproveListByApplyId(String sqlId, String applyId)throws Exception {
		
		return (List<Map>) baseDaoSupport.findForList(sqlId,applyId);
	}

	@Override
	public CarChangeApply findCarChangeApplyByApplyId(String sqlId,
			String applyId) throws Exception {
		
		return (CarChangeApply) baseDaoSupport.findForObject(sqlId, applyId);
	}

	@Override
	public void updateChangeApplyStatus(String sqlId, CarPermitApply ca)
			throws Exception {
		baseDaoSupport.update(sqlId, ca);
		
	}

	@Override
	public List<Map> findAllCarPermitApplyList(String sqlId,
			Map<String, Object> map) throws Exception {
		return (List<Map>) baseDaoSupport.findForList(sqlId, map);
	}

	

}
