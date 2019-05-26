package com.nasoft.aboutcar.administrativePenalty.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.administrativePenalty.domain.CaseDealInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvCaseDealInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvPlantCaseInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantCaseInfo;
import com.nasoft.aboutcar.complaint.domain.drvComplainDistribute;
import com.nasoft.aboutcar.complaint.domain.drvComplainInfo;
import com.nasoft.aboutcar.pilotapply.domain.DrvExamresult;
import com.nasoft.aboutcar.supervise.domain.DrvIllegalInfo;

public interface DrvPlantCaseInfoService {

	//public void addDrvExamresult(String sqlId,DrvExamresult drvExamresult) throws Exception;

	public List<DrvPlantCaseInfo> findAllPlantCaseInfo(String sqlId, Map<String,Object>map) throws Exception;

	/*public void updateDrvExamresult(String sqlId, DrvExamresult examresult) throws Exception;

	public List<DrvExamresult> findByExamdate(String sqlId, Map<String, Object> map) throws Exception;
	//考试系统对接接口
	public List<Map> examSystemByCertno(String sqlId, String certno)throws Exception;*/
	public int insert(String sqlId, DrvPlantCaseInfo drvplantCaseInfo) throws Exception;
	
	public void plantCaseInfoByCaseId(String sqlId, String caseId) throws Exception;

	public DrvPlantCaseInfo drvpenaltyDetail(String sqlId,String caseid) throws Exception;
	
	public int updateplantCaseInfo(String sqlId,DrvPlantCaseInfo plantCaseInfo) throws Exception;
	
	public List<Map> getDrvno(String sqlId,String drivcarno) throws Exception;
	
	public int delDrvCaseInfoByCaseId(String sqlId, String caseId) throws Exception;
	
	/*public int delDrvCaseDealInfoByCaseId(String sqlId, String caseId) throws Exception;*/
	
	public int inserDrvCaseDeal(String sqlId, DrvCaseDealInfo drvCaseDealInfo) throws Exception;

	public DrvIllegalInfo findDrvIllegalByCaseId(String sqlId, String caseId) throws Exception;

	public drvComplainInfo findDrvComplainByCaseId(String sqlId, String caseId) throws Exception;

	public drvComplainDistribute findDrvComplainDisByCaseId(String sqlId, String caseId) throws Exception;

}
