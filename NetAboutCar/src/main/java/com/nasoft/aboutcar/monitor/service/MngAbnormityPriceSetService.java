package com.nasoft.aboutcar.monitor.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.monitor.domain.MngAbnormityPriceSet;

public interface MngAbnormityPriceSetService {
	public List<MngAbnormityPriceSet> findAllMngAbnormityPriceSet(String sqlId,Map<String, Object> map) throws Exception;

	public int addMngAbnormityPriceSet(String sqlId, MngAbnormityPriceSet mngAbnormityPriceSet) throws Exception;

	public List<MngAbnormityPriceSet> selectPriceSetById(String sqlId, Map<String, Object> map) throws Exception;

	public MngAbnormityPriceSet findPriceSetById(String sqlId, String abnormity_id) throws Exception;

	public int updatePriceSet(String sqlId, MngAbnormityPriceSet mngAbnormityPriceSet) throws Exception;

	public void batchDelAbnormityPrice(String sqlId, String abnormityids) throws Exception;
}
