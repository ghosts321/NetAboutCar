package com.nasoft.aboutcar.pilotapply.service;

import com.nasoft.aboutcar.pilotapply.domain.DrvMakeupapp;

public interface DrvMakeupappService {

	public DrvMakeupapp findById(String sqlId,Integer id) throws Exception;

	public void updateDrvapp(String sqlId, DrvMakeupapp drvMakeupapp) throws Exception;
	
}
