package com.nasoft.aboutcar.administrativePenalty.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nasoft.aboutcar.administrativePenalty.domain.CaseManageInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvCaseManageInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvPlantCaseInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvPlantManageHisInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantManageHisInfo;
import com.nasoft.aboutcar.administrativePenalty.service.CaseManageInfoService;
import com.nasoft.aboutcar.administrativePenalty.service.DrvCaseManageInfoService;
import com.nasoft.aboutcar.base.dao.BaseDao;


@Service("DrvCaseManageInfoService")
public class DrvCaseManageInfoServiceImpl implements DrvCaseManageInfoService{

	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public List<Map> findAllPlantCaseInfo(String sqlId,Map<String,Object>map) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}
	
	@Override
	public int updateplantCaseInfo(String sqlId, DrvCaseManageInfo drvCaseManageInfo) throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, drvCaseManageInfo);
	}
	
	@Transactional
	@Override
	public void plantCaseInfoByCaseId(String sqlId, String caseId) throws Exception {
		String[] xzcfcaseIds = caseId.split(",");
		for(String bespeak_id : xzcfcaseIds){
			baseDaoSupport.delete(sqlId, caseId);
		}
		
	}
	
	@Override
	public DrvCaseManageInfo manageDetail(String sqlId, String caseId)
			throws Exception {
		return (DrvCaseManageInfo) baseDaoSupport.findForObject(sqlId, caseId);
	}
	
	@Override
	public int insertHis(String sqlId,DrvPlantManageHisInfo drvPlantManageHisInfo)throws Exception{
		return (Integer) baseDaoSupport.update(sqlId, drvPlantManageHisInfo);
	}
	
	@Override
	public List<Map> penaltyHistory(String sqlId, String caseId)
			throws Exception {
		List<Map> list =(List<Map>) baseDaoSupport.findForList(sqlId, caseId);
		return list;
	}
	
	@Override
	public List<Map> selectAllCompn(String sqlId) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId,null);
		return list;
	}
}
