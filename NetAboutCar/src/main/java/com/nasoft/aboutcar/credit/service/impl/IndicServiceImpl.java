package com.nasoft.aboutcar.credit.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.credit.domain.Indic;
import com.nasoft.aboutcar.credit.domain.IndicType;
import com.nasoft.aboutcar.credit.service.IndicService;
@Service("IndicService")
public class IndicServiceImpl implements IndicService {
	@Resource
	private BaseDao baseDaoSupport;

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Indic> selectAllIndic(String sql, HashMap<String, Object> map) throws Exception {
		
		return (ArrayList<Indic>)baseDaoSupport.findForList(sql, map);
	}

	@Override
	public Indic selectOneById(String sql, String indic_code) throws Exception {
		return (Indic) baseDaoSupport.findForObject(sql, indic_code);
	}

	@Override
	public void batchDelIndicTypeByIds(String sql, String indic_codes) throws Exception {
		String[] codes = indic_codes.split(",");
		for(String code : codes){
			baseDaoSupport.delete(sql, code);
		}
	}

	@Override
	public int addIndicType(String sql, Indic indic) throws Exception {
		return (int) baseDaoSupport.save(sql, indic);
	}

	@Override
	public int updateIndicType(String sql, Indic indic) throws Exception {
		return (int) baseDaoSupport.update(sql, indic);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<IndicType> selectAllTypeCode(String sql, HashMap<String, Object> map) throws Exception {
		
		return (ArrayList<IndicType>) baseDaoSupport.findForList(sql, map);
	}
	@Override
	public List<Map> findAllIndic(String sqlId) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId, null);
		return list;
	}
}
