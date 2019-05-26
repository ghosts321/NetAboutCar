package com.nasoft.aboutcar.administrativePenalty.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.administrativePenalty.domain.CaseManageInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvCaseManageInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvPlantCaseInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvPlantManageHisInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantManageHisInfo;

public interface DrvCaseManageInfoService {

	public List<Map> findAllPlantCaseInfo(String sqlId, Map<String,Object>map) throws Exception;
	
	public int updateplantCaseInfo(String sqlId,DrvCaseManageInfo drvCaseManageInfo) throws Exception;
	
	public void plantCaseInfoByCaseId(String sqlId, String caseId) throws Exception;
	
	public DrvCaseManageInfo manageDetail(String sqlId,String caseId) throws Exception;
	
	public int insertHis(String sqlId, DrvPlantManageHisInfo drvPlantManageHisInfo) throws Exception;
	
	public List<Map> penaltyHistory(String sqlId,String caseId) throws Exception;
	
	public List<Map> selectAllCompn(String sqlId)throws Exception;

}
