package com.nasoft.aboutcar.administrativePenalty.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nasoft.aboutcar.administrativePenalty.domain.CaseManageInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvCaseManageInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvPlantCaseInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvPunishInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantPunishInfo;
import com.nasoft.aboutcar.administrativePenalty.service.CaseManageInfoService;
import com.nasoft.aboutcar.administrativePenalty.service.DrvCaseManageInfoService;
import com.nasoft.aboutcar.administrativePenalty.service.DrvPunishInfoService;
import com.nasoft.aboutcar.administrativePenalty.service.PlantPunishInfoService;
import com.nasoft.aboutcar.base.dao.BaseDao;


@Service("PlantPunishInfoService")
public class PlantPunishInfoServiceImpl implements PlantPunishInfoService{

	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public List<Map> findAllPlantPunishInfo(String sqlId,Map<String,Object>map) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}
	
	
	
	@Transactional
	@Override
	public void drvPlantCaseInfoByCaseId(String sqlId, String caseId) throws Exception {
		String[] xzcfcaseIds = caseId.split(",");
		for(String bespeak_id : xzcfcaseIds){
			baseDaoSupport.delete(sqlId, caseId);
		}
		
	}
	
	@Override
	public PlantPunishInfo manageDetail(String sqlId, String caseId)
			throws Exception {
		return (PlantPunishInfo) baseDaoSupport.findForObject(sqlId, caseId);
	}
	
}
