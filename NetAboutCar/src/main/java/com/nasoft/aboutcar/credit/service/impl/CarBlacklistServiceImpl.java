package com.nasoft.aboutcar.credit.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.car.domain.CarInfo;
import com.nasoft.aboutcar.credit.domain.CarBlacklist;
import com.nasoft.aboutcar.credit.service.CarBlacklistService;
@Service("CarBlacklistService")
public class CarBlacklistServiceImpl implements CarBlacklistService {
	@SuppressWarnings("unchecked")
	@Override
	public List<CarInfo> getCarNoList(String string, Object object) throws Exception {
		return (List<CarInfo>) baseDaoSupport.findForList(string, object);
	}

	@Resource
	private BaseDao baseDaoSupport;
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<CarBlacklist> selectAllCarBlacklist(String sql, HashMap<String, Object> map) throws Exception {
		return (ArrayList<CarBlacklist>) baseDaoSupport.findForList(sql, map);
	}

	@Override
	public CarBlacklist selectOneById(String sql, String type_code) throws Exception {
		return (CarBlacklist) baseDaoSupport.findForObject(sql, type_code);
	}

	@Override
	public int addCarBlacklist(String sql, CarBlacklist carBlacklist) throws Exception {
		return (int) baseDaoSupport.save(sql, carBlacklist);
	}

	@Override
	public int updateCarBlacklist(String sql, CarBlacklist carBlacklist) throws Exception {
		return (int) baseDaoSupport.update(sql, carBlacklist);
	}

}
