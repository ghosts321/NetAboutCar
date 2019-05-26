package com.nasoft.aboutcar.supervise.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.supervise.domain.MngUnoperatingDriver;
import com.nasoft.aboutcar.supervise.service.MngUnoperatingDriverService;

@Service("MngUnoperatingDriverService")
public class MngUnoperatingDriverServiceImpl implements MngUnoperatingDriverService {

	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public int addMngUnoperatingDriver(String sqlId, MngUnoperatingDriver mngUnoperatingDriver) {
		try {
			int i = (Integer) baseDaoSupport.save(sqlId, mngUnoperatingDriver);
			return i;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<MngUnoperatingDriver> selectAll(String sqlId, Map<String, Object> map) throws Exception {
		
		return (List<MngUnoperatingDriver>) baseDaoSupport.findForList(sqlId,map);
	}
	
}