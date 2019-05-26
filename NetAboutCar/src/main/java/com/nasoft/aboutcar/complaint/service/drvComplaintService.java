package com.nasoft.aboutcar.complaint.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.administrativePenalty.domain.DrvPlantCaseInfo;
import com.nasoft.aboutcar.complaint.domain.comBlackList;
import com.nasoft.aboutcar.complaint.domain.comComplainDistribute;
import com.nasoft.aboutcar.complaint.domain.comComplainInfo;
import com.nasoft.aboutcar.complaint.domain.drvBlackList;
import com.nasoft.aboutcar.complaint.domain.drvComplainAppeal;
import com.nasoft.aboutcar.complaint.domain.drvComplainDispose;
import com.nasoft.aboutcar.complaint.domain.drvComplainDistribute;
import com.nasoft.aboutcar.complaint.domain.drvComplainInfo;
import com.nasoft.aboutcar.complaint.domain.drvDisAppeal;

public  interface drvComplaintService {

	
	public List<Map> findDrvComplaint(String sqlId,Map<String, Object> map) throws Exception;
	
	public drvComplainDistribute findacceptbyId(String sqlId, int drv_complain_info_id)throws Exception;
	
	public drvComplainAppeal findDrvAppealbyId(String sqlId, int drv_complain_info_id)throws Exception;
	
	public drvDisAppeal findDisAppealbyID(String sqlId, int drv_complain_info_id)throws Exception;
	
	public List<Map> finddrvaccept(String sqlId,Map<String, Object> map) throws Exception;
	
	public List<Map> findDrvAppeal(String sqlId,Map<String, Object> map) throws Exception;
	
	public List<Map> findDrvHandle(String sqlId,Map<String, Object> map) throws Exception;
	
	public List<Map> selectdrv(String sqlId, Map<String, Object> map)throws Exception;
	
	public List<Map> selectAllCompn(String sqlId)throws Exception;
	
	public Map selectdrvStatistics(String sqlId, Map<String, Object> m)throws Exception;

	public void addDrvComplaint(String sqlId, drvComplainInfo drvcomplaininfo)throws Exception;
	
	public void saveDisAppeal(String sqlId, drvDisAppeal drvdisappeal)throws Exception;

	public drvComplainInfo findcompcodebyId(String sqlId, String complain_code)throws Exception;
	
	public drvComplainDispose finddisposebyId(String sqlId, int drv_complain_info_id)throws Exception;

	public int drvUpdate(String sqlId, drvComplainInfo drvcomplaintinfo)throws Exception;
	
	public List<Map> reg(String sqlId, String driver_licence)throws Exception;
	
	public int updateDrvPlant(String sqlId, DrvPlantCaseInfo drvplant)throws Exception;
	
	public int drvAcceptComit(String sqlId, drvComplainDistribute drvcomplaincistribute)throws Exception;
	
	public int insertdrvplant(String sqlId, DrvPlantCaseInfo drvplantcase)throws Exception;
	
	public int drvAppealComit(String sqlId, drvComplainAppeal drvcomplainappeal)throws Exception;
	
	public int toHandleComit(String sqlId, drvComplainDispose drvcomplaindispose)throws Exception;
	
	public int insertblack(String sqlId, drvBlackList blacklist)throws Exception;
	
	public int updatetblack(String sqlId, drvBlackList blacklist)throws Exception;
	
	public List<Map> selectblack(String sqlId,String drv_license)throws Exception;
	
	public int deleteblack(String sqlId, drvBlackList blacklist)throws Exception;

	public void comDel(String sqlId, String compids) throws Exception;
	
	public void drvFeedBack(String sqlId, String compids) throws Exception;
	
	public List<Map> drvHandleSelect(String sqlId, Map<String, Object> map)throws Exception;
	
	public List<Map> drvDaichuliDetail(String sqlId , Map map) throws Exception;
}

