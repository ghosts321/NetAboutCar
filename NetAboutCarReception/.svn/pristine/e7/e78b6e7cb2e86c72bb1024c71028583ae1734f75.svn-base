package com.nasoft.SSM.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.SSM.base.dao.BaseDao;
import com.nasoft.SSM.domain.PilotApply;
import com.nasoft.SSM.service.PilotApplyService;

@Service("pilotApplyService")
public class PilotApplyServiceImpl implements PilotApplyService {

	
	@Resource
	private BaseDao baseDaoSupport;
	@Override
	public void addPilotApply(String sqlId, PilotApply pilotApply) throws Exception {
		// TODO Auto-generated method stub
		baseDaoSupport.save(sqlId, pilotApply);
	}
	@Override
	public void updatePilotApply(String sqlId, PilotApply pilotApply) throws Exception {
		// TODO Auto-generated method stub
		baseDaoSupport.update(sqlId, pilotApply);
	}
	@Override
	public void deletePilotApply(String sqlId, String applyId) throws Exception {
		// TODO Auto-generated method stub
		baseDaoSupport.delete(sqlId, applyId);
	}
	@Override
	public PilotApply findPilotApplyById(String sqlId, String applyId) throws Exception {
		// TODO Auto-generated method stub
		return (PilotApply) baseDaoSupport.findForObject(sqlId, applyId);
	}

}
