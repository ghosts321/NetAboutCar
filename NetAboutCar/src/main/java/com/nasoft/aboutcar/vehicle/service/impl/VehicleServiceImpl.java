package com.nasoft.aboutcar.vehicle.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.vehicle.domain.Vehicle;
import com.nasoft.aboutcar.vehicle.service.VehicleService;

@Service("vehicleApplyService")
public class VehicleServiceImpl implements VehicleService {
	
	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public List<Vehicle> findAllVehicle(String sqlId, String flag) {
		try {
			List<Vehicle> list = (List<Vehicle>) baseDaoSupport.findForList(sqlId, flag);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Vehicle searchById(String sqlId, Vehicle vehicle) {
		try {
			Vehicle pa = (Vehicle) baseDaoSupport.findForObject(sqlId, vehicle);
			return pa;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Vehicle findVehicleByCarId(String sqlId, String carId) throws Exception {
		Vehicle pa = (Vehicle) baseDaoSupport.findForObject(sqlId, carId);
		return pa;
	}

}
