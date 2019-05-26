package com.nasoft.aboutcar.credit.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.nasoft.aboutcar.credit.domain.IndicType;

public interface IndicTypeService {

	public ArrayList<IndicType> selectAllIndicType(String sql,HashMap<String,Object> map) throws Exception;

	public IndicType selectOneById(String sql, String type_code) throws Exception;

	public void batchDelIndicTypeByIds(String sql, String type_codes) throws Exception;

	public int addIndicType(String sql, IndicType indicType) throws Exception;
	
	public int updateIndicType(String sql, IndicType indicType) throws Exception;
}
