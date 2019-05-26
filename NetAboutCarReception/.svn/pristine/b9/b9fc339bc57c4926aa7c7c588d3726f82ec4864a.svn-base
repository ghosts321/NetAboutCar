package com.nasoft.SSM.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.SSM.base.dao.BaseDao;
import com.nasoft.SSM.domain.DrvMakeupapp;
import com.nasoft.SSM.service.DrvMakeupappService;

@Service("DrvMakeupappService")
public class DrvMakeupappServiceImpl implements DrvMakeupappService {

	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public void addDrvMakeupapp(String sqlId, DrvMakeupapp drvMakeupapp) throws Exception {
		baseDaoSupport.save(sqlId, drvMakeupapp);
		
	}

	@Override
	public DrvMakeupapp findDrvMakeupappByCertNo(String sqlId, String certNo) throws Exception {
		
		return (DrvMakeupapp) baseDaoSupport.findForObject(sqlId, certNo);
	}

}
