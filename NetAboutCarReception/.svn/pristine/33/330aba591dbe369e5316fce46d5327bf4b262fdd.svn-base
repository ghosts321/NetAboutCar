package com.nasoft.SSM.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.SSM.base.dao.BaseDao;
import com.nasoft.SSM.domain.BnsComplain;
import com.nasoft.SSM.domain.CancelApply;
import com.nasoft.SSM.domain.CarInfo;
import com.nasoft.SSM.domain.CarPermitApply;
import com.nasoft.SSM.domain.CarPermitcert;
import com.nasoft.SSM.domain.DrvCaseAppeal;
import com.nasoft.SSM.domain.DrvPlantCaseInfo;
import com.nasoft.SSM.domain.DrvUserinfo;
import com.nasoft.SSM.domain.PlantCaseAppeal;
import com.nasoft.SSM.domain.PlantCaseInfo;
import com.nasoft.SSM.service.PlantCaseInfoService;

@Service("plantCaseInfoService")
public class PlantCaseInfoServiceImpl implements PlantCaseInfoService{

	
	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public String findComname(String sqlId, String userName) throws Exception {
		return (String) baseDaoSupport.findForObject(sqlId,userName );
	}
	
	@Override
	public List<PlantCaseInfo> findBycomname(String sqlId, String comname) throws Exception {
		return (List<PlantCaseInfo>) baseDaoSupport.findForList(sqlId,comname );
	}
	
	@Override
	public PlantCaseInfo findBycaseId(String sqlId,String caseId) throws Exception {
		return  (PlantCaseInfo) baseDaoSupport.findForObject(sqlId, caseId);
		
	}
	
	@Override
	public void addPlantAppeal(String sqlId , PlantCaseAppeal plantCaseAppeal) throws Exception {
		 baseDaoSupport.findForObject(sqlId , plantCaseAppeal);
	}
	
	@Override
	public void updateCaseInfo(String sqlId, String caseId) throws Exception {
		 baseDaoSupport.findForObject(sqlId,caseId );
	}
	
	@Override
	public void updateCaseDeal(String sqlId, String caseId) throws Exception {
		baseDaoSupport.findForObject(sqlId,caseId );
	}
	
	@Override
	public List<DrvPlantCaseInfo> findByusername(String sqlId, String userName) throws Exception {
		return (List<DrvPlantCaseInfo>) baseDaoSupport.findForList(sqlId,userName );
	}
	
	@Override
	public DrvPlantCaseInfo findBycaseid(String sqlId,String caseid) throws Exception {
		return  (DrvPlantCaseInfo) baseDaoSupport.findForObject(sqlId, caseid);
		
	}
	
	@Override
	public void addDrvAppeal(String sqlId , DrvCaseAppeal plantCaseAppeal) throws Exception {
		 baseDaoSupport.findForObject(sqlId , plantCaseAppeal);
	}
}
