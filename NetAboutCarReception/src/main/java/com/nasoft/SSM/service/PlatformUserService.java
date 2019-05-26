package com.nasoft.SSM.service;

import com.nasoft.SSM.domain.PlatformUserReg;

public interface PlatformUserService {

	public void addPlatformUser(String sqlId,PlatformUserReg user) throws Exception;
	
	public PlatformUserReg findPlatformUserRegById(String sqlId,String id) throws Exception;
	
	public PlatformUserReg findPlatformUserRegByIdAndPwd(String sqlId,PlatformUserReg platformUserReg) throws Exception;
	
	public void changePassword(String sqlId,PlatformUserReg platformUserReg) throws Exception;
}
