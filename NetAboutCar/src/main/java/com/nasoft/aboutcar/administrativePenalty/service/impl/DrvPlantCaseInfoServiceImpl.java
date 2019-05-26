package com.nasoft.aboutcar.administrativePenalty.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nasoft.aboutcar.administrativePenalty.domain.CaseDealInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvCaseDealInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.DrvPlantCaseInfo;
import com.nasoft.aboutcar.administrativePenalty.domain.PlantCaseInfo;
import com.nasoft.aboutcar.administrativePenalty.service.DrvPlantCaseInfoService;
import com.nasoft.aboutcar.administrativePenalty.service.PlantCaseInfoService;
import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.car.domain.CarInfo;
import com.nasoft.aboutcar.complaint.domain.drvComplainDistribute;
import com.nasoft.aboutcar.complaint.domain.drvComplainInfo;
import com.nasoft.aboutcar.instInfo.domain.InstInfo;
import com.nasoft.aboutcar.instInfo.service.InstInfoService;
import com.nasoft.aboutcar.menuinfo.domain.MenuInfo;
import com.nasoft.aboutcar.supervise.domain.DrvIllegalInfo;


@Service("DrvPlantCaseInfoService")
public class DrvPlantCaseInfoServiceImpl implements DrvPlantCaseInfoService {

	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public List<DrvPlantCaseInfo> findAllPlantCaseInfo(String sqlId,Map<String,Object>map) throws Exception {
		List<DrvPlantCaseInfo> list=(List<DrvPlantCaseInfo>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}
	
	@Override
	public DrvPlantCaseInfo drvpenaltyDetail(String sqlId, String caseid)
			throws Exception {
		return (DrvPlantCaseInfo) baseDaoSupport.findForObject(sqlId, caseid);
	}
	
	@Override
	public List<Map> getDrvno(String sqlId, String drivcarno)
			throws Exception {
		return (List<Map>) baseDaoSupport.findForList(sqlId, drivcarno);
	}
	 
	@Override
	public int insert(String sqlId, DrvPlantCaseInfo drvplantCaseInfo) throws Exception{
		try {
			return (Integer) baseDaoSupport.save(sqlId, drvplantCaseInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
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
	public int updateplantCaseInfo(String sqlId, DrvPlantCaseInfo drvPlantCaseInfo) throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, drvPlantCaseInfo);
	}
	
	@Override
	public int inserDrvCaseDeal(String sqlId, DrvCaseDealInfo drvCaseDealInfo) {
		try {
			return (Integer) baseDaoSupport.save(sqlId, drvCaseDealInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	@Transactional
	@Override
	public int delDrvCaseInfoByCaseId(String sqlId, String caseId) throws Exception {
		String[] xzcfcaseIds = caseId.split(",");
		for(String bespeak_id : xzcfcaseIds){
			baseDaoSupport.delete(sqlId, bespeak_id);
		}
		return 1;
		
		
	}
	
	/*@Transactional
	@Override
	public int delDrvCaseDealInfoByCaseId(String sqlId, String caseId) throws Exception{
		
		baseDaoSupport.delete(sqlId, caseId);
		return 0;
	}*/
	@Override
	public DrvIllegalInfo findDrvIllegalByCaseId(String sqlId, String caseId) throws Exception {
		
		return  (DrvIllegalInfo) baseDaoSupport.findForObject(sqlId, caseId);
	}
	
	@Override
	public drvComplainInfo findDrvComplainByCaseId(String sqlId, String caseId) throws Exception {
		
		return  (drvComplainInfo) baseDaoSupport.findForObject(sqlId, caseId);
	}
	
	@Override
	public drvComplainDistribute findDrvComplainDisByCaseId(String sqlId, String caseid)
			throws Exception {
		return (drvComplainDistribute) baseDaoSupport.findForObject(sqlId, caseid);
	}

}
