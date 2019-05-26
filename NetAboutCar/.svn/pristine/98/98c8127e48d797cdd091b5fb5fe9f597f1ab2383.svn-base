package com.nasoft.aboutcar.administrativePenalty.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nasoft.aboutcar.administrativePenalty.domain.CaseDealInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvPlantCaseInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantCaseDealHis;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantCaseInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantPunishHistoryInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.StandardTermInfo;
import com.nasoft.aboutcar.administrativePenalty.service.PlantCaseInfoService;
import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.complaint.domain.comComplainInfo;
import com.nasoft.aboutcar.complaint.domain.drvComplainInfo;
import com.nasoft.aboutcar.exam.domain.MngExamBespeak;
import com.nasoft.aboutcar.instInfo.domain.InstInfo;
import com.nasoft.aboutcar.instInfo.service.InstInfoService;
import com.nasoft.aboutcar.menuinfo.domain.MenuInfo;
import com.nasoft.aboutcar.platform.domain.Platform;
import com.nasoft.aboutcar.supervise.domain.DrvIllegalInfo;


@Service("PlantCaseInfoService")
public class PlantCaseInfoServiceImpl implements PlantCaseInfoService {

	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public List<PlantCaseInfo> findAllPlantCaseInfo(String sqlId,Map map) throws Exception {
		List<PlantCaseInfo> list=(List<PlantCaseInfo>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}
	
	/*@Override
	public List<PlantCaseInfo> findAllPlantCaseInfoSL(String sqlId,PlantCaseInfo plantCaseInfo) throws Exception {
		List<PlantCaseInfo> list=(List<PlantCaseInfo>) baseDaoSupport.findForList(sqlId, plantCaseInfo);
		return list;
	}*/
	
	@Override
	public int insert(String sqlId, PlantCaseInfo plantCaseInfo) {
		try {
			return (Integer) baseDaoSupport.save(sqlId, plantCaseInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	@Transactional
	@Override
	public int delPlantCaseInfoByCaseId(String sqlId, String caseId) throws Exception {
		String[] xzcfcaseIds = caseId.split(",");
		for(String bespeak_id : xzcfcaseIds){
			baseDaoSupport.delete(sqlId, bespeak_id);
		}
		
		return 1;
	}
	
	@Transactional
	@Override
	public int delCaseDealInfoByCaseId(String sqlId, String caseId) throws Exception{
		
		baseDaoSupport.delete(sqlId, caseId);
		return 0;
	}
	@Override
	public PlantCaseInfo findPlantCaseInfoByCaseId(String sqlId, String caseId) throws Exception {
		
		return  (PlantCaseInfo) baseDaoSupport.findForObject(sqlId, caseId);
	}
	
	@Override
	public int updateplantCaseInfo(String sqlId, PlantCaseInfo plantCaseInfo) throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, plantCaseInfo);
	}
		
	@Override
	public int insertCaseDeal(String sqlId, CaseDealInfo caseDealInfo) {
		try {
			return (Integer) baseDaoSupport.save(sqlId, caseDealInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	@Override
	public List<CaseDealInfo> findAllDealCaseInfoByCaseId(String sqlId,Map map) throws Exception {
		List<CaseDealInfo> list=(List<CaseDealInfo>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}
	
	@Override
	public List<Map> selectAllCompn(String sqlId) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId,null);
		return list;
	}
	
	@Override
	public List<Map> findAllCar(String sqlId,Map map) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId,map);
		return list;
	}

	
	@Override
	public int acceptPlantCaseInfoByCaseId(String sqlId,PlantPunishHistoryInfo plantPunishHistoryInfo) throws Exception{
		return (Integer) baseDaoSupport.save(sqlId, plantPunishHistoryInfo);
	}

	@Override
	public int insertPlantCaseDealHis(String sqlId, PlantCaseDealHis plantCaseDealHis) throws Exception{
		try {
			return (Integer) baseDaoSupport.save(sqlId, plantCaseDealHis);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	@Override
	public List<PlantCaseDealHis> findAllPlantCaseHis(String sqlId,String caseId) throws Exception {
		List<PlantCaseDealHis> list=(List<PlantCaseDealHis>) baseDaoSupport.findForList(sqlId, caseId);
		return list;
	}
	
	@Override
	public Platform findPlatFormByCaseId(String sqlId, String caseId) throws Exception {
		
		return  (Platform) baseDaoSupport.findForObject(sqlId, caseId);
	}
	
	@Override
	public List<Platform> selectAllPlatForm(String sqlId) throws Exception {
		return (List<Platform>) baseDaoSupport.findForList(sqlId, null);
	}
	
	@Override
	public List<StandardTermInfo> selectAllTerm(String sqlId) throws Exception {
		return (List<StandardTermInfo>) baseDaoSupport.findForList(sqlId, null);
	}

	@Override
	public List<Map> drvfindall(String sqlId , Map map) throws Exception {
		return (List<Map>) baseDaoSupport.findForList(sqlId,map);
	}
	
	@Override
	public comComplainInfo findComplainByCaseId(String sqlId, String caseId) throws Exception {
		
		return  (comComplainInfo) baseDaoSupport.findForObject(sqlId, caseId);
	}
	
	@Override
	public DrvIllegalInfo findDrvIllegalByCaseId(String sqlId, String caseId) throws Exception {
		
		return  (DrvIllegalInfo) baseDaoSupport.findForObject(sqlId, caseId);
	}
	
	@Override
	public drvComplainInfo findDrvComplainByCaseId(String sqlId, String caseId) throws Exception {
		
		return  (drvComplainInfo) baseDaoSupport.findForObject(sqlId, caseId);
	}
}
