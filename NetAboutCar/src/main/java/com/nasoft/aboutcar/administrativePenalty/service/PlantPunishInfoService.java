package com.nasoft.aboutcar.administrativePenalty.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.administrativePenalty.domain.CaseManageInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvCaseManageInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvPlantCaseInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvPunishInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantPunishInfo;

public interface PlantPunishInfoService {

	public List<Map> findAllPlantPunishInfo(String sqlId, Map<String,Object>map) throws Exception;
	
	public void drvPlantCaseInfoByCaseId(String sqlId, String caseId) throws Exception;
	
	public PlantPunishInfo manageDetail(String sqlId,String caseId) throws Exception;

}
