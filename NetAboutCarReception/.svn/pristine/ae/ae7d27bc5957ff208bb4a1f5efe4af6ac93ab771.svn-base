package com.nasoft.SSM.service;

import java.util.List;
import java.util.Map;

import com.nasoft.SSM.domain.BnsComplain;
import com.nasoft.SSM.domain.CarInfo;
import com.nasoft.SSM.domain.DrvCaseAppeal;
import com.nasoft.SSM.domain.DrvPlantCaseInfo;
import com.nasoft.SSM.domain.PlantCaseAppeal;
import com.nasoft.SSM.domain.PlantCaseInfo;
/**
 * 平台处罚信息
 * @author 蒋俊鹏
 *
 */
public interface PlantCaseInfoService {

	public String findComname(String sqlId,String userName) throws Exception;

	public List<PlantCaseInfo> findBycomname(String sqlId,String comname) throws Exception;

	public PlantCaseInfo findBycaseId(String sqlId,String caseId) throws Exception;

	public void addPlantAppeal(String sqlId,PlantCaseAppeal plantCaseAppeal) throws Exception;
	
	public void updateCaseInfo(String sqlId,String caseId) throws Exception;
	
	public void updateCaseDeal(String sqlId,String caseId) throws Exception;

	public List<DrvPlantCaseInfo> findByusername(String sqlId,String userName) throws Exception;

	public DrvPlantCaseInfo findBycaseid(String sqlId,String caseid) throws Exception;
	
	public void addDrvAppeal(String sqlId,DrvCaseAppeal plantCaseAppeal) throws Exception;

}
