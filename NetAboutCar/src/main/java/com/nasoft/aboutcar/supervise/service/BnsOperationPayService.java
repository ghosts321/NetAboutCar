package com.nasoft.aboutcar.supervise.service;
import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.runtime.mybatis.Page;
import com.nasoft.aboutcar.runtime.mybatis.Pageable;
import com.nasoft.aboutcar.supervise.domain.BnsOperationPay;

public interface BnsOperationPayService {
	
	public int addBnsOperationPay(String sqlId, BnsOperationPay bnsOperationPay);

	public List<BnsOperationPay> findOperationPay(String sqlId, Map<String, Object> map) throws Exception;

	public Page<BnsOperationPay> findOperationPay(String sqlId, Map<String, Object> map,Pageable pageable) throws Exception;
	public List<Map> globalOperationAnalyzing(String sqlId,Map map) throws Exception;
	
	public List<Map> selectOnArea(String sqlId) throws Exception;
}