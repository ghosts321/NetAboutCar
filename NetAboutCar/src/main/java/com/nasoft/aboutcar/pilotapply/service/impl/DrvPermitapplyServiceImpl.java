package com.nasoft.aboutcar.pilotapply.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.pilotapply.domain.DrvPermitapply;
import com.nasoft.aboutcar.pilotapply.service.DrvPermitapplyService;

@Service("DrvPermitapplyService")
public class DrvPermitapplyServiceImpl implements DrvPermitapplyService {

	
	@Resource
	private BaseDao baseDaoSupport;
	@Override
	public void addDrvPermitapply(String sqlId, DrvPermitapply drvPermitapply) throws Exception {
		// TODO Auto-generated method stub
		baseDaoSupport.save(sqlId, drvPermitapply);
	}
	@Override
	public void updateDrvPermitapply(String sqlId, DrvPermitapply drvPermitapply) throws Exception {
		// TODO Auto-generated method stub
		baseDaoSupport.update(sqlId, drvPermitapply);
	}
	@Override
	public void deleteByApplyid(String sqlId, int applyId) throws Exception {
		// TODO Auto-generated method stub
		baseDaoSupport.delete(sqlId, applyId);
	}
	@Override
	public DrvPermitapply selectByApplyid(String sqlId, int applyId) throws Exception {
		// TODO Auto-generated method stub
		return (DrvPermitapply) baseDaoSupport.findForObject(sqlId, applyId);
	}
	@Override
	public List<Map> selectAll(String sqlId,Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map>) baseDaoSupport.findForList(sqlId, map);
	}
	@Override
	public Map selectDetail(String sqlId, String certno) throws Exception { 
		// TODO Auto-generated method stub
		return (Map) baseDaoSupport.findForObject(sqlId, certno);
	}

}
