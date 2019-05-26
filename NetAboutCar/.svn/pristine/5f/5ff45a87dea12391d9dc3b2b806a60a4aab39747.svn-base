package com.nasoft.aboutcar.vehicle.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.nasoft.aboutcar.vehicle.domain.Vehicle;

public interface VehicleService {

	List<Vehicle> findAllVehicle(String sqlId, String flag);
	
	Vehicle searchById(String sqlId,Vehicle vehicleApply);
	
	Vehicle findVehicleByCarId(String sqlId, @Param(value="carId")String carId) throws Exception;
}
