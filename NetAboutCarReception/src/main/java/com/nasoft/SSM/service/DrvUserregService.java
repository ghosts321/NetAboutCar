package com.nasoft.SSM.service;

import com.nasoft.SSM.domain.DrvUserreg;

public interface DrvUserregService {
	
	public DrvUserreg isexistUser(String sqlId,String certno) throws Exception; 

	public DrvUserreg findByUserInfo(String sqlId,DrvUserreg drvUserreg) throws Exception; 
	
	public void addDrvUserreg(String sqlId,DrvUserreg drvUserreg) throws Exception; 
	
	public void changePassword(String sqlId,DrvUserreg drvUserreg) throws Exception;
}
