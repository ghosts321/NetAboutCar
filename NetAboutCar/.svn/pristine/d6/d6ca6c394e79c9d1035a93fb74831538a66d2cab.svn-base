package com.nasoft.aboutcar.credit.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.nasoft.aboutcar.car.domain.CarInfo;
import com.nasoft.aboutcar.credit.domain.CarBlacklist;

public interface CarBlacklistService {
	public ArrayList<CarBlacklist> selectAllCarBlacklist(String sql,HashMap<String,Object> map) throws Exception;

	public CarBlacklist selectOneById(String sql, String type_code) throws Exception;
	
	public int addCarBlacklist(String sql, CarBlacklist carBlacklist) throws Exception;
	
	public int updateCarBlacklist(String sql, CarBlacklist carBlacklist) throws Exception;

	public List<CarInfo> getCarNoList(String string, Object object) throws Exception;
}
