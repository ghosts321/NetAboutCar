package com.nasoft.aboutcar.administrativePenalty.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.administrativePenalty.domain.CaseDealInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvPlantCaseInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantCaseDealHis;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantCaseInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantPunishHistoryInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.StandardTermInfo;
import com.nasoft.aboutcar.complaint.domain.comComplainInfo;
import com.nasoft.aboutcar.complaint.domain.drvComplainInfo;
import com.nasoft.aboutcar.exam.domain.MngExamBespeak;
import com.nasoft.aboutcar.pilotapply.domain.DrvExamresult;
import com.nasoft.aboutcar.platform.domain.Platform;
import com.nasoft.aboutcar.supervise.domain.DrvIllegalInfo;

public interface PlantCaseInfoService {

	//public void addDrvExamresult(String sqlId,DrvExamresult drvExamresult) throws Exception;

	public List<PlantCaseInfo> findAllPlantCaseInfo(String sqlId, Map map) throws Exception;
	

	/*public void updateDrvExamresult(String sqlId, DrvExamresult examresult) throws Exception;

	public List<DrvExamresult> findByExamdate(String sqlId, Map<String, Object> map) throws Exception;
	//考试系统对接接口
	public List<Map> examSystemByCertno(String sqlId, String certno)throws Exception;*/
	public int insert(String sqlId, PlantCaseInfo plantCaseInfo) throws Exception;
	
	public int delPlantCaseInfoByCaseId(String sqlId, String caseId) throws Exception;
	
	public int delCaseDealInfoByCaseId(String sqlId, String caseId) throws Exception;
	
	public PlantCaseInfo findPlantCaseInfoByCaseId(String sqlId, String caseId) throws Exception;
	
	public int updateplantCaseInfo(String sqlId,PlantCaseInfo plantCaseInfo) throws Exception;
	//插入案件处理状态
	public int insertCaseDeal(String sqlId, CaseDealInfo caseDealInfo) throws Exception;
	
	public List<CaseDealInfo> findAllDealCaseInfoByCaseId(String sqlId, Map map) throws Exception;
	
	public int insertPlantCaseDealHis(String sqlId, PlantCaseDealHis plantCaseDealHis) throws Exception;

	public int acceptPlantCaseInfoByCaseId(String sqlId, PlantPunishHistoryInfo plantPunishHistoryInfo) throws Exception;
	public List<PlantCaseDealHis> findAllPlantCaseHis(String sqlId, String caseId) throws Exception;

	public List<Map> selectAllCompn(String sqlId)throws Exception;
	
	public List<Map> findAllCar(String sqlId,Map map)throws Exception;

	public Platform findPlatFormByCaseId(String sqlId, String caseId) throws Exception;


	public List<Platform> selectAllPlatForm(String sqlId) throws Exception;
	
	public List<StandardTermInfo> selectAllTerm(String sqlId) throws Exception;

	public List<Map> drvfindall(String sqlId , Map map) throws Exception;
	
	public comComplainInfo findComplainByCaseId(String sqlId, String caseId) throws Exception;
	
	public DrvIllegalInfo findDrvIllegalByCaseId(String sqlId, String caseId) throws Exception;

	public drvComplainInfo findDrvComplainByCaseId(String sqlId, String caseId) throws Exception;

}
