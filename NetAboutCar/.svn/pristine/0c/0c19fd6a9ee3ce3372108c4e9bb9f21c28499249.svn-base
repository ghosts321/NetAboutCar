package com.nasoft.aboutcar.mngoperating.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.mngoperating.domain.MngOperatingTimeSet;

public interface MngOperatingTimeSetService {
	public List<MngOperatingTimeSet> findAllMngOperatingTimeSet(String sqlId,Map<String, Object> map) throws Exception;
	
	public void batchDelOperatingTime(String sqlId, String operatingids) throws Exception;
	
	public List<MngOperatingTimeSet> selectOperatingSetById(String sqlId, Map<String, Object> map) throws Exception;
	
	public int addMngOperatingSet(String sqlId, MngOperatingTimeSet mngOperatingTimeSet) throws Exception;
	
	public MngOperatingTimeSet findOperatingSetById(String sqlId, String operating_time_id) throws Exception;
	
	public int updateOperatingSet(String sqlId, MngOperatingTimeSet mngOperatingTimeSet) throws Exception;
	
}
