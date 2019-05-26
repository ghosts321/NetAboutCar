package com.nasoft.aboutcar.administrativePenalty.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.administrativePenalty.domain.CaseDealInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvCaseAppeal;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvPlantCaseInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantCaseAppeal;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantCaseInfo;
import com.nasoft.aboutcar.exam.domain.MngExamBespeak;
import com.nasoft.aboutcar.pilotapply.domain.DrvExamresult;
import com.nasoft.aboutcar.supervise.domain.DrvIllegalInfo;

public interface PlantCaseAppealService {


	public List<Map> plantCaseAppealfindAll(String sqlId, Map map) throws Exception;

	public PlantCaseInfo appealDetailbyId(String sqlId, String caseId) throws Exception;

	public PlantCaseAppeal caseAppealbyId(String sqlId, String caseId) throws Exception;

	public void updateCaseInfo(String sqlId , PlantCaseInfo plantcaseinfo) throws Exception;
	
	public List<Map> drvCaseAppealfindAll(String sqlId, Map map) throws Exception;
	
	public DrvPlantCaseInfo drvappealDetailbyId(String sqlId, String caseId) throws Exception;

	public DrvCaseAppeal drvcaseAppealbyId(String sqlId, String caseid) throws Exception;

	public void drvupdateCaseInfo(String sqlId , DrvPlantCaseInfo drvplantcaseinfo) throws Exception;
	
	public Map findplantanalysisList(String sqlId,Map map) throws Exception;

}
