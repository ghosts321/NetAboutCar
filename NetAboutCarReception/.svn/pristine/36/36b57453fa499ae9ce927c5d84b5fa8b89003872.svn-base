package com.nasoft.SSM.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.SSM.service.AreaCodeService;
import com.nasoft.SSM.base.dao.BaseDao;
import com.nasoft.SSM.domain.AreaCode;

@Service("areaCodeService")
public class AreaCodeServiceImpl implements AreaCodeService {

	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public List<AreaCode> findAreaList(String sqlId, Map<String,Object> map) throws Exception{
			List<AreaCode> areaInfoList = (List<AreaCode>) baseDaoSupport.findForList(sqlId, map);
			return areaInfoList;
	}
    
	@Override
	public String findAreaCodeByAreaName(String sqlId, String areaName) throws Exception{
			String areaCode= (String) baseDaoSupport.findForObject(sqlId, areaName);
			return areaCode;
		 
	}
	
	
	

	
}