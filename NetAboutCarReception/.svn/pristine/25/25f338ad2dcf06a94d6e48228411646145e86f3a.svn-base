package com.nasoft.SSM.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.SSM.base.dao.BaseDao;
import com.nasoft.SSM.domain.DrvUserreg;
import com.nasoft.SSM.service.DrvUserregService;

@Service("DrvUserregService")
public class DrvUserregServiceImpl implements DrvUserregService {

	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public DrvUserreg isexistUser(String sqlId, String certno) throws Exception {
		// TODO Auto-generated method stub
		return (DrvUserreg) baseDaoSupport.findForObject(sqlId, certno);
	}

	@Override
	public DrvUserreg findByUserInfo(String sqlId,DrvUserreg drvUserreg) throws Exception {
		// TODO Auto-generated method stub
		return (DrvUserreg) baseDaoSupport.findForObject(sqlId, drvUserreg);
	}
	
	@Override
	public void addDrvUserreg(String sqlId,DrvUserreg drvUserreg) throws Exception {
		// TODO Auto-generated method stub
        baseDaoSupport.save(sqlId, drvUserreg);
	}

	@Override
	public void changePassword(String sqlId, DrvUserreg drvUserreg) throws Exception {
		
		baseDaoSupport.update(sqlId, drvUserreg);
	}

}
