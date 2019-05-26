package com.nasoft.aboutcar.administrativePenalty.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nasoft.aboutcar.administrativePenalty.domain.CaseDealInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvCaseAppeal;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvPlantCaseInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantCaseAppeal;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantCaseInfo;
import com.nasoft.aboutcar.administrativePenalty.service.PlantCaseAppealService;
import com.nasoft.aboutcar.administrativePenalty.service.PlantCaseInfoService;
import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.exam.domain.MngExamBespeak;
import com.nasoft.aboutcar.instInfo.domain.InstInfo;
import com.nasoft.aboutcar.instInfo.service.InstInfoService;
import com.nasoft.aboutcar.menuinfo.domain.MenuInfo;
import com.nasoft.aboutcar.supervise.domain.DrvIllegalInfo;


@Service("PlantCaseAppealService")
public class PlantCaseAppealServiceImpl implements PlantCaseAppealService {

	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public List<Map> plantCaseAppealfindAll(String sqlId,Map map) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}
	
	@Override
	public PlantCaseInfo appealDetailbyId(String sqlId, String caseId) throws Exception {
		
		return  (PlantCaseInfo) baseDaoSupport.findForObject(sqlId, caseId);
	}
	
	@Override
	public PlantCaseAppeal caseAppealbyId(String sqlId, String caseId) throws Exception {
		
		return  (PlantCaseAppeal) baseDaoSupport.findForObject(sqlId, caseId);
	}
	
	@Override
	public void updateCaseInfo(String sqlId , PlantCaseInfo plantcaseinfo) throws Exception {
		 baseDaoSupport.findForObject(sqlId , plantcaseinfo);
	}
	
	@Override
	public List<Map> drvCaseAppealfindAll(String sqlId,Map map) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}
	
	@Override
	public DrvPlantCaseInfo drvappealDetailbyId(String sqlId, String caseId) throws Exception {
		
		return  (DrvPlantCaseInfo) baseDaoSupport.findForObject(sqlId, caseId);
	}
	
	@Override
	public DrvCaseAppeal drvcaseAppealbyId(String sqlId, String caseid) throws Exception {
		
		return  (DrvCaseAppeal) baseDaoSupport.findForObject(sqlId, caseid);
	}
	
	@Override
	public void drvupdateCaseInfo(String sqlId , DrvPlantCaseInfo drvplantcaseinfo) throws Exception {
		 baseDaoSupport.findForObject(sqlId , drvplantcaseinfo);
	}
	
	@Override
	public Map findplantanalysisList(String sqlId,Map map) throws Exception {
		return (Map) baseDaoSupport.findForObject(sqlId, map);

	}
}
