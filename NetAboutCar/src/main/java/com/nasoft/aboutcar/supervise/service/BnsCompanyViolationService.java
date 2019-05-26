package com.nasoft.aboutcar.supervise.service;
import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.supervise.domain.BnsCompanyViolation;

public interface BnsCompanyViolationService {
	
	public List<BnsCompanyViolation> selectAll(String sqlId,Map<String, Object> map) throws Exception;
	
	public int addBnsCompanyViolation(String sqlId, BnsCompanyViolation bnsCompanyViolation);

}