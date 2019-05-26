package com.nasoft.aboutcar.datadic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.datadic.domain.DataDic;
import com.nasoft.aboutcar.datadic.service.DataDicService;


@Service("dataDicService")
public class DataDicServiceImpl implements DataDicService{
	
	@Resource
	private BaseDao baseDaoSupport;
	@Override
	public List<DataDic> findAllDataDic(String sqlId, Map<String, Object> map)
			throws Exception {
		return (List<DataDic>) baseDaoSupport.findForList(sqlId, map);
	}
	@Override
	public List<DataDic> findDataDicByDataCode(String sqlId, String DataCode)
			throws Exception {
		return (List<DataDic>) baseDaoSupport.findForList(sqlId, DataCode);
	}
	@Override
	public void insertDataDic(String sqlId, DataDic dataDic) throws Exception {
		// TODO Auto-generated method stub
		baseDaoSupport.save(sqlId, dataDic);
	}
	@Override
	public void updateDataDic(String sqlId, DataDic dataDic) throws Exception {
		// TODO Auto-generated method stub
		baseDaoSupport.update(sqlId, dataDic);
	}
	@Override
	public void deleteChildDic(String sqlId, DataDic dataDic) throws Exception {
		// TODO Auto-generated method stub
		baseDaoSupport.delete(sqlId, dataDic);
	}
    @Override
    public String findLastDataCode(String sqlId) throws Exception {
    	return (String) baseDaoSupport.findForObject(sqlId, null);
    }
}
