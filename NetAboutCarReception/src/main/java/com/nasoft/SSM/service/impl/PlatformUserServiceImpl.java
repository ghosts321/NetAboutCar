package com.nasoft.SSM.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.SSM.base.dao.BaseDao;
import com.nasoft.SSM.domain.PlatformUserReg;
import com.nasoft.SSM.service.PlatformUserService;

@Service("platformUserService")
public class PlatformUserServiceImpl implements PlatformUserService{
	
	
	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public void addPlatformUser(String sqlId, PlatformUserReg user) throws Exception{
		// TODO Auto-generated method stub
		try {
			baseDaoSupport.save(sqlId, user);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public PlatformUserReg findPlatformUserRegById(String sqlId, String id) throws Exception {
		return (PlatformUserReg) baseDaoSupport.findForObject(sqlId, id);
	}

	@Override
	public PlatformUserReg findPlatformUserRegByIdAndPwd(String sqlId,
			PlatformUserReg platformUserReg) throws Exception {
		// TODO Auto-generated method stub
		return (PlatformUserReg) baseDaoSupport.findForObject(sqlId, platformUserReg);
	}

	@Override
	public void changePassword(String sqlId, PlatformUserReg platformUserReg) throws Exception {
		
		baseDaoSupport.update(sqlId, platformUserReg);
	}

}
