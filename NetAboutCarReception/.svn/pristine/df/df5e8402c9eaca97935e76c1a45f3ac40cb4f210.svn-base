package com.nasoft.SSM.service;

import java.util.List;

import com.nasoft.SSM.domain.DrvPermitapply;
import com.nasoft.SSM.domain.DrvUserinfo;

public interface DrvPermitapplyService {

	public void addDrvPermitapply(String sqlId,DrvPermitapply drvPermitapply) throws Exception;
	
	public void updateDrvPermitapply(String sqlId,DrvPermitapply drvPermitapply) throws Exception;
	
	public void deleteByApplyid(String sqlId,int applyId) throws Exception;
	
	public DrvPermitapply selectByApplyid(String sqlId,int applyId) throws Exception;
	
	public List<DrvPermitapply> selectByCertno(String sqlId,String certno) throws Exception;

	public void addDrvApply(DrvUserinfo drvUserinfo, DrvPermitapply drvPermitapply) throws Exception;
	
}
