package com.nasoft.aboutcar.complaint.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nasoft.aboutcar.administrativePenalty.domain.DrvPlantCaseInfo;
import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.complaint.domain.comBlackList;
import com.nasoft.aboutcar.complaint.domain.comComplainDistribute;
import com.nasoft.aboutcar.complaint.domain.comComplainInfo;
import com.nasoft.aboutcar.complaint.domain.drvBlackList;
import com.nasoft.aboutcar.complaint.domain.drvComplainAppeal;
import com.nasoft.aboutcar.complaint.domain.drvComplainDispose;
import com.nasoft.aboutcar.complaint.domain.drvComplainDistribute;
import com.nasoft.aboutcar.complaint.domain.drvComplainInfo;
import com.nasoft.aboutcar.complaint.domain.drvDisAppeal;
import com.nasoft.aboutcar.complaint.service.drvComplaintService;


@Service("drvComplaintService")
public class drvComplaintServiceImpl implements drvComplaintService {

	@Resource
	private BaseDao baseDaoSupport;

	
	@Override
	public List<Map> findDrvComplaint(String sqlId,Map<String, Object> map) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}
	
	@Override
	public List<Map> finddrvaccept(String sqlId,Map<String, Object> map) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}
	
	@Override
	public List<Map> selectAllCompn(String sqlId) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId,null);
		return list;
	}
	
	@Override
	public Map selectdrvStatistics(String sqlId,Map<String, Object> m) throws Exception {
		return (Map) baseDaoSupport.findForObject(sqlId, m);

	}
	
	@Override
	public List<Map> findDrvAppeal(String sqlId,Map<String, Object> map) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}
	
	@Override
	public List<Map> findDrvHandle(String sqlId,Map<String, Object> map) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}
	
	@Override
	public List<Map> selectdrv(String sqlId,Map<String, Object> map) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}
	
	@Override
	public void addDrvComplaint(String sqlId, drvComplainInfo drvcomplaininfo)
			throws Exception {
		baseDaoSupport.save(sqlId, drvcomplaininfo);	
	}
	
	@Override
	public void saveDisAppeal(String sqlId, drvDisAppeal drvdisappeal)
			throws Exception {
		baseDaoSupport.save(sqlId, drvdisappeal);	
	}
	
	@Override
	public drvComplainInfo findcompcodebyId(String sqlId, String complain_code)
			throws Exception {
		return  (drvComplainInfo)baseDaoSupport.findForObject(sqlId,complain_code);
	}
	
	@Override
	public drvDisAppeal findDisAppealbyID(String sqlId, int drv_complain_info_id)
			throws Exception {
		return  (drvDisAppeal)baseDaoSupport.findForObject(sqlId,drv_complain_info_id);
	}
	
	@Override
	public drvComplainDispose finddisposebyId(String sqlId, int drv_complain_info_id)
			throws Exception {
		return  (drvComplainDispose)baseDaoSupport.findForObject(sqlId,drv_complain_info_id);
	}
	
	@Override
	public drvComplainAppeal findDrvAppealbyId(String sqlId, int drv_complain_info_id)
			throws Exception {
		return  (drvComplainAppeal)baseDaoSupport.findForObject(sqlId,drv_complain_info_id);
	}
	
	@Override
	public drvComplainDistribute findacceptbyId(String sqlId, int drv_complain_info_id)
			throws Exception {
		return  (drvComplainDistribute)baseDaoSupport.findForObject(sqlId,drv_complain_info_id);
	}
	
	@Override
	public int drvUpdate(String sqlId, drvComplainInfo drvcomplaintinfo)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, drvcomplaintinfo);
	}
	
	@Override
	public List<Map> reg(String sqlId, String driver_licence)
			throws Exception {
		return (List<Map>) baseDaoSupport.findForList(sqlId, driver_licence);
	}
	
	@Override
	public int updateDrvPlant(String sqlId, DrvPlantCaseInfo drvplant)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, drvplant);
	}
	
	@Override
	public int drvAcceptComit(String sqlId, drvComplainDistribute drvcomplaincistribute)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, drvcomplaincistribute);
	}
	
	@Override
	public int insertblack(String sqlId, drvBlackList blacklist)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, blacklist);
	}
	
	@Override
	public int insertdrvplant(String sqlId, DrvPlantCaseInfo drvplantcase)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, drvplantcase);
	}
	
	@Override
	public int updatetblack(String sqlId, drvBlackList blacklist)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, blacklist);
	}
	
	@Override
	public int drvAppealComit(String sqlId, drvComplainAppeal drvcomplainappeal)
			throws Exception {
		return (Integer) baseDaoSupport.save(sqlId, drvcomplainappeal);
	}
	
	@Override
	public List<Map> selectblack(String sqlId,String drv_license)
			throws Exception {
		return (List<Map>) baseDaoSupport.findForList(sqlId, drv_license);
	}
	
	@Override
	public int deleteblack(String sqlId, drvBlackList blacklist)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, blacklist);
	}
	
	@Override
	public int toHandleComit(String sqlId, drvComplainDispose drvcomplaindispose)
			throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, drvcomplaindispose);
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
	public void drvFeedBack(String sqlId, String comids) throws Exception {
		String[] compids = comids.split(",");
		for(String complain_code : compids){
			baseDaoSupport.delete(sqlId, complain_code);
		}
		
	}
	
	@Override
	public List<Map> drvHandleSelect(String sqlId,Map<String, Object> map) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}
	
	@Override
	public List<Map> drvDaichuliDetail(String sqlId , Map map) throws Exception {
		return (List<Map>) baseDaoSupport.findForList(sqlId,map);
	}
}
