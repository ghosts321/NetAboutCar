package com.nasoft.SSM.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.SSM.base.dao.BaseDao;
import com.nasoft.SSM.domain.BnsComplain;
import com.nasoft.SSM.domain.DrvPlantCaseInfo;
import com.nasoft.SSM.domain.PlantCaseInfo;
import com.nasoft.SSM.domain.comComplainAppeal;
import com.nasoft.SSM.domain.comComplainInfo;
import com.nasoft.SSM.domain.drvBlackList;
import com.nasoft.SSM.domain.drvComplainAppeal;
import com.nasoft.SSM.domain.drvComplainDispose;
import com.nasoft.SSM.domain.drvComplainInfo;
import com.nasoft.SSM.domain.drvDisAppeal;
import com.nasoft.SSM.service.BnsComplainService;




@Service("BnsComplainService")
public class BnsComplainServiceImpl implements BnsComplainService {

	
	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public void addBnsComplain(String sqlId, BnsComplain BnsComplain) throws Exception {
		baseDaoSupport.save(sqlId, BnsComplain);
	}
	
	@Override
	public void saveDisAppeal(String sqlId, drvDisAppeal drvdisappeal) throws Exception {
		baseDaoSupport.save(sqlId, drvdisappeal);
	}
	
	@Override
	public List<Map> selectAllComplain(String sqlId, Map<String, Object> map) throws Exception {
		return (List<Map>) baseDaoSupport.findForList(sqlId, map);
	}
	
	@Override
	public List<Map> drvCount(String sqlId) throws Exception {
		return (List<Map>) baseDaoSupport.findForList(sqlId, null);
	}
	
	@Override
	public List<Map> findcomZS(String sqlId,String comnName) throws Exception {
		return (List<Map>) baseDaoSupport.findForList(sqlId, comnName);
	}
	
	@Override
	public int deleteblack(String sqlId, drvBlackList blacklist)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, blacklist);
	}
	
	@Override
	public int updatetblack(String sqlId, drvBlackList blacklist)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, blacklist);
	}
	
	@Override
	public int insertdrvplant(String sqlId, DrvPlantCaseInfo drvplantcase)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, drvplantcase);
	}
	
	@Override
	public int updateplant(String sqlId, PlantCaseInfo plantcaseinfo)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, plantcaseinfo);
	}
	
	@Override
	public int updateDrvPlant(String sqlId, DrvPlantCaseInfo drvplant)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, drvplant);
	}
	
	
	@Override
	public int insertblack(String sqlId, drvBlackList blacklist)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, blacklist);
	}
	
	@Override
	public List<Map> selectDrvComplain(String sqlId,int pageInt) throws Exception {
		return (List<Map>) baseDaoSupport.findForList(sqlId, pageInt);
	}
	
	@Override
	public List<Map> pageCount(String sqlId) throws Exception {
		return (List<Map>) baseDaoSupport.findForList(sqlId, null);
	}
	
	@Override
	public List<Map> findAppealbyId(String sqlId, String complain_code) throws Exception {
		return (List<Map>) baseDaoSupport.findForList(sqlId, complain_code);
	}
	
	@Override
	public List<Map> findDrvAppealbyId(String sqlId, String complain_code) throws Exception {
		return (List<Map>) baseDaoSupport.findForList(sqlId, complain_code);
	}
	
	@Override
	public List<Map> selectAllAppeal(String sqlId,int pageInt) throws Exception {
		return (List<Map>) baseDaoSupport.findForList(sqlId,pageInt);
	}
	
	@Override
	public drvComplainInfo findcompcodebyId(String sqlId, String complain_code)
			throws Exception {
		return  (drvComplainInfo)baseDaoSupport.findForObject(sqlId,complain_code);
	}
	
	@Override
	public drvComplainDispose finddisposebyId(String sqlId, int drv_complain_info_id)
			throws Exception {
		return  (drvComplainDispose)baseDaoSupport.findForObject(sqlId,drv_complain_info_id);
	}
	
	@Override
	public comComplainInfo findcompbyId(String sqlId, String complain_code)
			throws Exception {
		return  (comComplainInfo)baseDaoSupport.findForObject(sqlId,complain_code);
	}
	
	@Override
	public String findcomnName(String sqlId, String userName)
			throws Exception {
		return  (String)baseDaoSupport.findForObject(sqlId,userName);
	}
	
	@Override
	public int drvUpdate(String sqlId, drvComplainInfo drvcomplaintinfo)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, drvcomplaintinfo);
	}
	
	@Override
	public List<Map> selectblack(String sqlId,String drv_license)
			throws Exception {
		return (List<Map>) baseDaoSupport.findForList(sqlId, drv_license);
	}
	
	@Override
	public int comUpdate(String sqlId, comComplainInfo comcomplaintinfo)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, comcomplaintinfo);
	}
	
	@Override
	public int toHandleComit(String sqlId, drvComplainDispose drvcomplaindispose)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, drvcomplaindispose);
	}
	
	@Override
	public int appealComit(String sqlId, comComplainAppeal comcomplainappeal)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, comcomplainappeal);
	}
	
	@Override
	public int drvAppealComit(String sqlId, drvComplainAppeal drvcomplainappeal)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, drvcomplainappeal);
	}

}
