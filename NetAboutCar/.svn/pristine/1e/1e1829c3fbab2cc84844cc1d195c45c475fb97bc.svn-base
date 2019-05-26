package com.nasoft.aboutcar.pilotapply.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.pilotapply.domain.DrvPermitcert;
import com.nasoft.aboutcar.pilotapply.service.DrvPermitcertService;

@Service("DrvPermitcertService")
public class DrvPermitcertServiceImpl implements DrvPermitcertService {
	
	@Resource
	private BaseDao baseDaoSupport;
	@Override
	public void addDrvPermitcert(String sqlId, DrvPermitcert drvPermitcert) throws Exception {
		baseDaoSupport.save(sqlId, drvPermitcert);
	}
	@Override
	public List<Map> selectAll(String sqlId,Map<String, Object> map) throws Exception {
		return (List<Map>) baseDaoSupport.findForList(sqlId, map);
	}
	@Override
	public void updateByApplyid(String sqlId,DrvPermitcert drvPermitcert) throws Exception {
		baseDaoSupport.update(sqlId, drvPermitcert);
	}
	@Override
	public List<Map> findDrvPermitcertByCertno(String sqlId, String certno) throws Exception{
		
		return (List<Map>)baseDaoSupport.findForList(sqlId,certno);
	}

}
