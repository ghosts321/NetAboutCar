package com.nasoft.aboutcar.credit.service.impl;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.credit.domain.IndicType;
import com.nasoft.aboutcar.credit.service.IndicTypeService;
@Service("IndicTypeService")
public class IndicTypeServiceImpl implements IndicTypeService {
	@Resource
	private BaseDao baseDaoSupport;

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<IndicType> selectAllIndicType(String sql, HashMap<String, Object> map) throws Exception {
		
		return (ArrayList<IndicType>) baseDaoSupport.findForList(sql, map);
	}

	@Override
	public IndicType selectOneById(String sql, String type_code) throws Exception {
		
		return (IndicType) baseDaoSupport.findForObject(sql, type_code);
	}

	@Transactional
	@Override
	public void batchDelIndicTypeByIds(String sql, String type_codes) throws Exception {
		String[] codes = type_codes.split(",");
		for(String code : codes){
			baseDaoSupport.delete(sql, code);
		}
	}

	@Override
	public int addIndicType(String sql, IndicType indicType) throws Exception {
		
		return (int) baseDaoSupport.save(sql, indicType);
	}

	@Override
	public int updateIndicType(String sql, IndicType indicType) throws Exception {
		
		return (int) baseDaoSupport.update(sql, indicType);
	}
}
