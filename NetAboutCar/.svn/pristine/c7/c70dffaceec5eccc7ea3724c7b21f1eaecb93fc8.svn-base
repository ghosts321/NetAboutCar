package com.nasoft.aboutcar.complaint.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nasoft.aboutcar.administrativePenalty.domain.PlantCaseInfo;
import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.car.domain.CarPermitApply;
import com.nasoft.aboutcar.complaint.domain.comBlackList;
import com.nasoft.aboutcar.complaint.domain.comComplainAppeal;
import com.nasoft.aboutcar.complaint.domain.comComplainDispose;
import com.nasoft.aboutcar.complaint.domain.comComplainDistribute;
import com.nasoft.aboutcar.complaint.domain.comComplainInfo;
import com.nasoft.aboutcar.complaint.domain.comDisAppeal;
import com.nasoft.aboutcar.complaint.service.ComplaintService;

@Service("ComplaintService")
public class ComplaintServiceImpl implements ComplaintService {
	
	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public void addComplaint(String sqlId, comComplainInfo comcomplaintinfo)
			throws Exception {
		baseDaoSupport.save(sqlId, comcomplaintinfo);	
	}
	
	@Override
	public void saveDisAppeal(String sqlId, comDisAppeal comdisappeal)
			throws Exception {
		baseDaoSupport.save(sqlId, comdisappeal);	
	}

	@Override
	public List<Map> findAllComplaint(String sqlId,Map<String, Object> map) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}
	
	@Override
	public List<Map> comHandleSelect(String sqlId,Map<String, Object> map) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}
	
	@Override
	public List<Map> selectAllCompn(String sqlId) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId,null);
		return list;
	}
	
	@Override
	public Map selectComStatistics(String sqlId,Map<String, Object> m) throws Exception {
		return (Map)baseDaoSupport.findForObject(sqlId, m);
	}
	
	@Override
	public Map selectComCode(String sqlId,String compn_compy) throws Exception {
		return (Map)baseDaoSupport.findForObject(sqlId, compn_compy);
	}
	
	@Override
	public List<Map> selectcom(String sqlId,Map<String, Object> map) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}
	
	@Override
	public List<Map> findaccept(String sqlId,Map<String, Object> map) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}
	
	@Override
	public List<Map> findhandle(String sqlId,Map<String, Object> map) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}
	
	@Override
	public List<Map> findappeal(String sqlId,Map<String, Object> map) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}
	
	@Transactional
	@Override
	public void comDel(String sqlId, String comids) throws Exception {
		String[] compids = comids.split(",");
		for(String complain_code : compids){
			baseDaoSupport.delete(sqlId, complain_code);
		}
		
	}
	
	@Transactional
	@Override
	public void feedback(String sqlId, String comids) throws Exception {
		String[] compids = comids.split(",");
		for(String complain_code : compids){
			baseDaoSupport.save(sqlId, complain_code);
		}
		
	}

	@Override
	public comComplainInfo findcompcodebyId(String sqlId, String complain_code)
			throws Exception {
		return  (comComplainInfo)baseDaoSupport.findForObject(sqlId,complain_code);
	}
	
	@Override
	public comComplainAppeal findappealbyId(String sqlId, int complain_info_id)
			throws Exception {
		return  (comComplainAppeal)baseDaoSupport.findForObject(sqlId,complain_info_id);
	}
	
	@Override
	public comDisAppeal findDisAppealbyID(String sqlId, int complain_info_id)
			throws Exception {
		return  (comDisAppeal)baseDaoSupport.findForObject(sqlId,complain_info_id);
	}
	
	
	@Override
	public comComplainDistribute findacceptbyId(String sqlId, int complain_info_id)
			throws Exception {
		return  (comComplainDistribute)baseDaoSupport.findForObject(sqlId,complain_info_id);
	}
	
	@Override
	public comComplainDispose finddisposebyId(String sqlId, int complain_info_id)
			throws Exception {
		return  (comComplainDispose)baseDaoSupport.findForObject(sqlId,complain_info_id);
	}

	@Override
	public int updatecomp(String sqlId, comComplainInfo comcomplaintinfo)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, comcomplaintinfo);
	}
	
	@Override
	public int insertplantcase(String sqlId, PlantCaseInfo plantcaseinfo)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, plantcaseinfo);
	}
	
	@Override
	public int selectblack(String sqlId, String compn_compy)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, compn_compy);
	}
	
	@Override
	public int updatetblack(String sqlId, comBlackList blacklist)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, blacklist);
	}
	
	@Override
	public int acceptcomit(String sqlId, comComplainDistribute complaindistribute)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, complaindistribute);
	}
	
	@Override
	public int insertblack(String sqlId, comBlackList blacklist)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, blacklist);
	}
	
	@Override
	public int deleteblack(String sqlId, String compn_compy)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, compn_compy);
	}
	
	@Override
	public int updateplant(String sqlId, PlantCaseInfo plantcaseinfo)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, plantcaseinfo);
	}
	
	@Override
	public int appealcomit(String sqlId, comComplainAppeal complainappeal)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, complainappeal);
	}
	
	@Override
	public int tohandlecomit(String sqlId,comComplainDispose comcomplaintdispose)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, comcomplaintdispose);
	}
	
	@Override
	public List<Map> comDaichuliDetails(String sqlId,Map<String, Object> map) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}
	
	@Override
	public List<Map> comEndDetails(String sqlId,Map<String, Object> map) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}


}
