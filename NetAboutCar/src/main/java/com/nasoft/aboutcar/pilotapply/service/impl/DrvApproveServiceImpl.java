package com.nasoft.aboutcar.pilotapply.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.pilotapply.domain.DrvApprove;
import com.nasoft.aboutcar.pilotapply.service.DrvApproveService;

@Service("DrvApproveService")
public class DrvApproveServiceImpl implements DrvApproveService {
	
	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public void addDrvApprove(String sqlId, DrvApprove drvApprove) throws Exception {
		baseDaoSupport.save(sqlId, drvApprove);
	}

	@Override
	public List<DrvApprove> selectByCertno(String sqlId, Map map) throws Exception {
		return (List<DrvApprove>) baseDaoSupport.findForList(sqlId, map);
	}
	
}
