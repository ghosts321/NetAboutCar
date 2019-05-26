package com.nasoft.SSM.service;

import java.util.List;
import java.util.Map;

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




public interface BnsComplainService {

	public void addBnsComplain(String sqlId,BnsComplain BnsComplain) throws Exception;
	
	public void saveDisAppeal(String sqlId,drvDisAppeal drvdisappeal) throws Exception;
	  
	public List<Map> selectAllComplain(String sqlId, Map<String, Object> map) throws Exception;
	
	public List<Map> selectDrvComplain(String sqlId,int pageInt) throws Exception;
	
	public List<Map> drvCount(String sqlId) throws Exception;
	
	public List<Map> selectAllAppeal(String sqlId,int pageInt) throws Exception;
	
	public List<Map> pageCount(String sqlId) throws Exception;
	
	public List<Map> findcomZS(String sqlId,String comnName) throws Exception;
	
	public List<Map> findAppealbyId(String sqlId,String complain_code) throws Exception;
	
	public List<Map> findDrvAppealbyId(String sqlId,String complain_code) throws Exception;
	
	public drvComplainInfo findcompcodebyId(String sqlId, String complain_code)throws Exception;
	
	public drvComplainDispose finddisposebyId(String sqlId, int drv_complain_info_id)throws Exception;
	
	public int insertblack(String sqlId, drvBlackList blacklist)throws Exception;
	
	public int updatetblack(String sqlId, drvBlackList blacklist)throws Exception;
	
	public int deleteblack(String sqlId, drvBlackList blacklist)throws Exception;
	
	public comComplainInfo findcompbyId(String sqlId, String complain_code)throws Exception;
	
	public int drvUpdate(String sqlId, drvComplainInfo drvcomplaintinfo)throws Exception;
	
	public int updateDrvPlant(String sqlId, DrvPlantCaseInfo drvplant)throws Exception;
	
	public int insertdrvplant(String sqlId, DrvPlantCaseInfo drvplantcase)throws Exception;
	
	public int comUpdate(String sqlId, comComplainInfo comcomplaintinfo)throws Exception;
    
	public int toHandleComit(String sqlId, drvComplainDispose drvcomplaindispose)throws Exception;
	
	public int updateplant(String sqlId, PlantCaseInfo plantcaseinfo)throws Exception;
	
	public int appealComit(String sqlId, comComplainAppeal comcomplainappeal)throws Exception;
	
	public int drvAppealComit(String sqlId, drvComplainAppeal drvcomplainappeal)throws Exception;
	
	public List<Map> selectblack(String sqlId,String drv_license)throws Exception;
	
	public String findcomnName(String sqlId, String userName)throws Exception;
}
