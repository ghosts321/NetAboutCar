package com.nasoft.SSM.service;

import java.util.List;
import java.util.Map;

import com.nasoft.SSM.domain.DrvPermitcert;

public interface DrvPermitcertService {

	public List<DrvPermitcert> selectByCertno(String sqlId,String certno) throws Exception;
	public DrvPermitcert selectByCondition(String sqlId,Map<String,String> map) throws Exception;

}
