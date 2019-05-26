package com.nasoft.aboutcar.monitor.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.monitor.domain.MngAbnormityPriceSet;
import com.nasoft.aboutcar.monitor.service.MngAbnormityPriceSetService;
@Service
public class MngAbnormityPriceSetServiceImpl implements MngAbnormityPriceSetService {
	@Resource
	private BaseDao baseDaoSupport;
	@Override
	public List<MngAbnormityPriceSet> findAllMngAbnormityPriceSet(String sqlId, Map<String, Object> map)
			throws Exception {
		
		return  (List<MngAbnormityPriceSet>) baseDaoSupport.findForList(sqlId, map);
	}
	@Override
	public int addMngAbnormityPriceSet(String sqlId, MngAbnormityPriceSet mngAbnormityPriceSet) throws Exception {
		
		return  (Integer) baseDaoSupport.save(sqlId, mngAbnormityPriceSet);
	}
	@Override
	public List<MngAbnormityPriceSet> selectPriceSetById(String sqlId, Map<String, Object> map) throws Exception {
		
		return (List<MngAbnormityPriceSet>) baseDaoSupport.findForList(sqlId, map);
	}
	@Override
	public MngAbnormityPriceSet findPriceSetById(String sqlId, String abnormity_id) throws Exception {
		
		return (MngAbnormityPriceSet) baseDaoSupport.findForObject(sqlId, abnormity_id);
	}
	@Override
	public int updatePriceSet(String sqlId, MngAbnormityPriceSet mngAbnormityPriceSet) throws Exception {
		
		return (Integer) baseDaoSupport.update(sqlId, mngAbnormityPriceSet);
	}
	
	@Transactional
	@Override
	public void batchDelAbnormityPrice(String sqlId, String abnormityids) throws Exception {
		String[] mngAbnormityids = abnormityids.split(",");
		for(String abnormity_id : mngAbnormityids){
			baseDaoSupport.delete(sqlId, abnormity_id);
		}
	}

}
