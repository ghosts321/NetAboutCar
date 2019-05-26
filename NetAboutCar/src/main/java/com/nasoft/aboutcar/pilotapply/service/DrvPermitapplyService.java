package com.nasoft.aboutcar.pilotapply.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.pilotapply.domain.DrvPermitapply;

public interface DrvPermitapplyService {

	public void addDrvPermitapply(String sqlId,DrvPermitapply drvPermitapply) throws Exception;
	
	public void updateDrvPermitapply(String sqlId,DrvPermitapply drvPermitapply) throws Exception;
	
	public void deleteByApplyid(String sqlId,int applyId) throws Exception;
	
	public DrvPermitapply selectByApplyid(String sqlId,int applyId) throws Exception;
	
	public List<Map> selectAll(String sqlId,Map<String, Object> m) throws Exception;
	
	public Map selectDetail(String sqlId,String certno) throws Exception;

}
