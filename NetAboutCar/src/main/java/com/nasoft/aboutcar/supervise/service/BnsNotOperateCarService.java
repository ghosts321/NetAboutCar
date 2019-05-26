package com.nasoft.aboutcar.supervise.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.supervise.domain.BnsNotOperateCar;

public interface BnsNotOperateCarService {
	public List<BnsNotOperateCar> selectAll(String sqlId,Map<String, Object> map) throws Exception;
}
