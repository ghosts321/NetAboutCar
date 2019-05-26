package com.nasoft.aboutcar.pilotapply.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.pilotapply.domain.DrvExamresult;

public interface DrvExamresultService {

	public void addDrvExamresult(String sqlId,DrvExamresult drvExamresult) throws Exception;

	public List<DrvExamresult> findByCertno(String sqlId, String certno);

	public void updateDrvExamresult(String sqlId, DrvExamresult examresult) throws Exception;

	public List<DrvExamresult> findByExamdate(String sqlId, Map<String, Object> map) throws Exception;
	//考试系统对接接口
	public List<Map> examSystemByCertno(String sqlId, String certno)throws Exception;
	
}
