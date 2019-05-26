package com.nasoft.aboutcar.credit.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.credit.domain.PunishedSet;
import com.nasoft.aboutcar.credit.service.PunishedSetService;


@Service("PunishedSetService")
public class PunishedSetServiceImpl implements PunishedSetService{
	
	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public List<PunishedSet> findAllPunishedSet(String sqlId, Map<String, Object> map)throws Exception {
		return (List<PunishedSet>) baseDaoSupport.findForList(sqlId, map);
	}
	@Override
	public PunishedSet findPunishedSetByPunCode(String sqlId, String punCode)throws Exception {
		return (PunishedSet) baseDaoSupport.findForObject(sqlId, punCode);
	}
	@Override
	public void addPunishedSet(String sqlId, PunishedSet punishedSet) throws Exception {
		baseDaoSupport.save(sqlId, punishedSet);
	}
	@Override
	public void updatePunishedSet(String sqlId, PunishedSet punishedSet) throws Exception {
		baseDaoSupport.update(sqlId, punishedSet);
	}
	
	@Transactional
	@Override
	public void deletePunishedSet(String sqlId, String punCodes) throws Exception {
		for(String punCode : punCodes.split(",")){
			baseDaoSupport.delete(sqlId, punCode);
		}
	}
}
