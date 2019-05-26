package com.nasoft.aboutcar.credit.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.credit.domain.Indic;
import com.nasoft.aboutcar.credit.domain.IndicType;

public interface IndicService {

	/**
	 * 查询所有
	 * @param sql
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public ArrayList<Indic> selectAllIndic(String sql,HashMap<String,Object> map) throws Exception;
	
	public Indic selectOneById(String sql, String indic_code) throws Exception;

	public void batchDelIndicTypeByIds(String sql, String indic_codes) throws Exception;

	public int addIndicType(String sql, Indic indic) throws Exception;
	
	public int updateIndicType(String sql, Indic indic) throws Exception;

	public ArrayList<IndicType> selectAllTypeCode(String sql, HashMap<String, Object> map)throws Exception;

	public List<Map> findAllIndic(String sqlId) throws Exception;
}
