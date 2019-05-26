package com.nasoft.aboutcar.pilotapply.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.pilotapply.domain.DrvChangeapply;
import com.nasoft.aboutcar.pilotapply.service.DrvChangeapplyService;

@Service("DrvChangeapplyService")
public class DrvChangeapplyServiceImpl implements DrvChangeapplyService {
	
	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public DrvChangeapply selectByApplyid(String sqlId, int applyId) throws Exception {
		return (DrvChangeapply) baseDaoSupport.findForObject(sqlId, applyId);
	}
	
	@Override
	public DrvChangeapply selectByCertno(String sqlId, String certno) throws Exception {
		return (DrvChangeapply) baseDaoSupport.findForObject(sqlId, certno);
	}
	
	@Override
	public Map selectDetail(String sqlId, String certno) throws Exception { 
		return (Map) baseDaoSupport.findForObject(sqlId, certno);
	}
	
	@Override
	public void addDrvChangeapply(String sqlId,DrvChangeapply drvChangeapply) throws Exception {
		baseDaoSupport.save(sqlId, drvChangeapply);
	}
	
	@Override
	public void updateDrvChangeapply(String sqlId,DrvChangeapply drvChangeapply) throws Exception {
		baseDaoSupport.update(sqlId, drvChangeapply);
	}
	
	@Override
	public void updateDrvChangeapplyByApplyid(String sqlId,DrvChangeapply drvChangeapply) throws Exception {
		baseDaoSupport.update(sqlId, drvChangeapply);
	}
}
