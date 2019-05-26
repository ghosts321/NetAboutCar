package com.nasoft.aboutcar.pilotapply.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.pilotapply.domain.DrvMakeupapp;
import com.nasoft.aboutcar.pilotapply.service.DrvMakeupappService;

@Service("DrvMakeupappService")
public class DrvMakeupappServiceImpl implements DrvMakeupappService {
	
	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public DrvMakeupapp findById(String sqlId, Integer id) throws Exception {
		
		return (DrvMakeupapp) baseDaoSupport.findForObject(sqlId, id);
	}

	@Override
	public void updateDrvapp(String sqlId, DrvMakeupapp drvMakeupapp) throws Exception {
		baseDaoSupport.update(sqlId, drvMakeupapp);
	}
	
}
