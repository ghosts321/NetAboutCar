package com.nasoft.aboutcar.complaint.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.administrativePenalty.domain.PlantCaseInfo;
import com.nasoft.aboutcar.car.domain.CarPermitApply;
import com.nasoft.aboutcar.complaint.domain.comBlackList;
import com.nasoft.aboutcar.complaint.domain.comComplainAppeal;
import com.nasoft.aboutcar.complaint.domain.comComplainDispose;
import com.nasoft.aboutcar.complaint.domain.comComplainDistribute;
import com.nasoft.aboutcar.complaint.domain.comComplainInfo;
import com.nasoft.aboutcar.complaint.domain.comDisAppeal;


public interface ComplaintService {
	public void addComplaint(String sqlId,comComplainInfo comcomplaintinfo) throws Exception;

	public List<Map> findAllComplaint(String sqlId,Map<String, Object> map) throws Exception;
	
	public List<Map> findaccept(String sqlId,Map<String, Object> map) throws Exception;
	
	public Map selectComStatistics(String sqlId,Map<String, Object> m) throws Exception;
	
	public Map selectComCode(String sqlId,String compn_compy) throws Exception;

	public void comDel(String sqlId, String compids) throws Exception;
	
	public void feedback(String sqlId, String compids) throws Exception;
	
	public void saveDisAppeal(String sqlId, comDisAppeal comdisappeal) throws Exception;

	public comComplainInfo findcompcodebyId(String sqlId, String complain_code)throws Exception;
	
	public List<Map> selectAllCompn(String sqlId)throws Exception;
	
	public comComplainAppeal findappealbyId(String sqlId, int complain_info_id)throws Exception;
	
	public comDisAppeal findDisAppealbyID(String sqlId, int complain_info_id)throws Exception;
	
	public comComplainDispose finddisposebyId(String sqlId, int complain_info_id)throws Exception;

	public int updatecomp(String sqlId, comComplainInfo comcomplaintinfo)throws Exception;

	public int acceptcomit(String sqlId, comComplainDistribute complaindistribute)throws Exception;
	
	public int appealcomit(String sqlId, comComplainAppeal complainappeal)throws Exception;
	
	public int selectblack(String sqlId, String compn_compy)throws Exception;
	
	public int insertblack(String sqlId, comBlackList blacklist)throws Exception;
	
	public int insertplantcase(String sqlId, PlantCaseInfo plantcaseinfo)throws Exception;
	
	public int updatetblack(String sqlId, comBlackList blacklist)throws Exception;
	
	public int deleteblack(String sqlId, String compn_compy)throws Exception;
	
	public int updateplant(String sqlId, PlantCaseInfo plantcaseinfo)throws Exception;

	public List<Map> findhandle(String sqlId, Map<String, Object> map)throws Exception;
	
	public List<Map> comHandleSelect(String sqlId, Map<String, Object> map)throws Exception;
	
	public List<Map> findappeal(String sqlId, Map<String, Object> map)throws Exception;
	
	public List<Map> selectcom(String sqlId, Map<String, Object> map)throws Exception;

	public int tohandlecomit(String sqlId, comComplainDispose comcomplaintdispose)throws Exception;

	public comComplainDistribute findacceptbyId(String sqlId, int complain_info_id)throws Exception;
	
	public List<Map> comDaichuliDetails(String sqlId, Map<String, Object> map)throws Exception;
	
	public List<Map> comEndDetails(String sqlId, Map<String, Object> map)throws Exception;



}
