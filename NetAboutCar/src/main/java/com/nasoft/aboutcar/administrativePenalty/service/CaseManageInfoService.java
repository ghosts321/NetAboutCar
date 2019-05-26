package com.nasoft.aboutcar.administrativePenalty.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.administrativePenalty.domain.CaseManageInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvPlantCaseInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantManageHisInfo;

public interface CaseManageInfoService {

	public List<Map> findAllPlantCaseInfo(String sqlId, Map<String,Object>map) throws Exception;
	
	public int updateplantCaseInfo(String sqlId,CaseManageInfo caseManageInfo) throws Exception;
	
	public void plantCaseInfoByCaseId(String sqlId, String caseId) throws Exception;
	
	public CaseManageInfo manageDetail(String sqlId,String caseId) throws Exception;

	public int insertHis(String sqlId, PlantManageHisInfo plantManageHisInfo) throws Exception;
	
	public List<Map> penaltyHistory(String sqlId,String caseId) throws Exception;
	
	public List<Map> selectAllCompn(String sqlId)throws Exception;


}
