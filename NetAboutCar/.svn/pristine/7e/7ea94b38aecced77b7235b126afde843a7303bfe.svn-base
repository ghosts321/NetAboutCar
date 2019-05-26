package com.nasoft.aboutcar.pilotapply.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.pilotapply.domain.DrvExamplan;

public interface DrvExamplanService {

	public void addDrvExamplan(String sqlId,DrvExamplan drvExamplan) throws Exception;
	
	public void updateExamstatus(String sqlId,DrvExamplan drvExamplan) throws Exception;
	
	public List<DrvExamplan> findAll(String sqlId,Map<String, Object> map);
	
	public List<DrvExamplan> findStatusByCertno(String sqlId,String certno) throws Exception;
	
	public DrvExamplan findById(String sqlId,int planid) throws Exception;

}
