package com.nasoft.aboutcar.pilotapply.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.pilotapply.domain.DrvRecord;

public interface DrvRecordService {

	public void addDrvRecord(String sqlId,DrvRecord drvRecord) throws Exception;
	
	public List<Map> selectAllRecord(String sqlId,Map<String, Object> map) throws Exception;

	public DrvRecord findRecord(String sqlId, Map<String, Object> map) throws Exception;

	public Map selectDetailById(String sqlId, String recordid) throws Exception;

	public void updateDrvRecord(String sqlId, DrvRecord drvRecord) throws Exception;

	public Map selectDetailByCertno(String sqlId, String certno) throws Exception;

}
