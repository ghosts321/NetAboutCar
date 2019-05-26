package com.nasoft.aboutcar.yyjgOutinAreaSet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.yyjgOutinAreaSet.domain.OutinAreaSet;
import com.nasoft.aboutcar.yyjgOutinAreaSet.service.OutinAreaSetService;

@Service
public class OutinAreaSetServiceImpl  implements OutinAreaSetService {
	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public List<OutinAreaSet> findAllOutinArea(String sqlId,Map<String, Object> map) throws Exception {
		return (List<OutinAreaSet>) baseDaoSupport.findForList(sqlId,map);
	}
	
	@Override
	public OutinAreaSet getAreaToid(String sqlId, String id) throws Exception {
		return (OutinAreaSet) baseDaoSupport.findForObject(sqlId,id);
	}
	
}
