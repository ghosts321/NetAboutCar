package com.nasoft.SSM.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.SSM.base.dao.BaseDao;
import com.nasoft.SSM.domain.DrvUserinfo;
import com.nasoft.SSM.service.DrvUserinfoService;

@Service("DrvUserinfoService")
public class DrvUserinfoServiceImpl implements DrvUserinfoService {

	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public void addDrvUserinfo(String sqlId, DrvUserinfo drvUserinfo) throws Exception {
		baseDaoSupport.save(sqlId, drvUserinfo);
	}

	@Override
	public DrvUserinfo selectByCertno(String sqlId, String certno) throws Exception {
		return  (DrvUserinfo) baseDaoSupport.findForObject(sqlId, certno);
	}

	@Override
	public void updateDrvUserinfo(String sqlId,DrvUserinfo drvUserinfo) throws Exception {
		baseDaoSupport.update(sqlId, drvUserinfo);
	}

}
