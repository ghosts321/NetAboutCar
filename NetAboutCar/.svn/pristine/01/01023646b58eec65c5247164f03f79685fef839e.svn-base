package com.nasoft.aboutcar.datadic.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.datadic.domain.DataDic;


public interface DataDicService {

	public List<DataDic> findAllDataDic(String sqlId,Map<String, Object> map) throws Exception;
	
	public List<DataDic> findDataDicByDataCode(String sqlId,String DataCode) throws Exception;
	
	public void insertDataDic(String sqlId,DataDic dataDic) throws Exception;
	
	public void updateDataDic(String sqlId,DataDic dataDic) throws Exception;
	
	public void deleteChildDic(String sqlId,DataDic dataDic) throws Exception;
	
	public String findLastDataCode(String sqlId) throws Exception;
}
