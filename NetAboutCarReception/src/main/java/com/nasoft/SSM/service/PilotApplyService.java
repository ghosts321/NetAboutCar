package com.nasoft.SSM.service;

import com.nasoft.SSM.domain.PilotApply;

public interface PilotApplyService {

	public void addPilotApply(String sqlId,PilotApply pilotApply) throws Exception;
	
	public void updatePilotApply(String sqlId,PilotApply pilotApply) throws Exception;
	
	public void deletePilotApply(String sqlId,String applyId) throws Exception;
	
	public PilotApply findPilotApplyById(String sqlId,String applyId) throws Exception;
	
}
