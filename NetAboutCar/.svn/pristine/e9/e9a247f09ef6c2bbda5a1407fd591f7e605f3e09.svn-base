package com.nasoft.aboutcar.supervise.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.supervise.service.PlantInformationService;


@Service("PlantInformationService")
public class PlantInformationServiceImpl implements PlantInformationService {
		
	@Resource
	private BaseDao baseDaoSupport;
	
	
	@Override
	public List<Map> findAllPlantInformation(String sqlId,Map<String,Object>map) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}
}
