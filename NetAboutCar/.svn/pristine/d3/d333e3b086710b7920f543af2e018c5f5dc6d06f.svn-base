package com.nasoft.aboutcar.mngoperating.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.mngoperating.domain.MngOperatingTimeSet;
import com.nasoft.aboutcar.mngoperating.service.MngOperatingTimeSetService;

@Service
public class MngOperatingTimeSetServiceImpl implements MngOperatingTimeSetService {
	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public List<MngOperatingTimeSet> findAllMngOperatingTimeSet(String sqlId, Map<String, Object> map) throws Exception {
		
		return  (List<MngOperatingTimeSet>) baseDaoSupport.findForList(sqlId, map);
	}
	
	@Transactional
	@Override
	public void batchDelOperatingTime(String sqlId, String operatingids) throws Exception {
		String[] mngOperatingids = operatingids.split(",");
		for(String operating_time_id : mngOperatingids){
			baseDaoSupport.delete(sqlId, operating_time_id);
		}
	}
	
	@Override
	public List<MngOperatingTimeSet> selectOperatingSetById(String sqlId, Map<String, Object> map) throws Exception {
		
		return (List<MngOperatingTimeSet>) baseDaoSupport.findForList(sqlId, map);
	}
	
	@Override
	public int addMngOperatingSet(String sqlId, MngOperatingTimeSet mngOperatingTimeSet) throws Exception {
		
		return  (Integer) baseDaoSupport.save(sqlId, mngOperatingTimeSet);
	}
	
	@Override
	public MngOperatingTimeSet findOperatingSetById(String sqlId, String operating_time_id) throws Exception {
		
		return (MngOperatingTimeSet) baseDaoSupport.findForObject(sqlId, operating_time_id);
	}
	
	@Override
	public int updateOperatingSet(String sqlId, MngOperatingTimeSet mngOperatingTimeSet) throws Exception {
		
		return (Integer) baseDaoSupport.update(sqlId, mngOperatingTimeSet);
	}
}
