package com.nasoft.aboutcar.bnsAbnPriceAnal.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.bnsAbnPriceAnal.service.BnsAbnPriceAnalService;
import com.nasoft.aboutcar.bnsAbnPriceAnal.vo.BnsAbnPriceAnalVo;

@Service
public class BnsAbnPriceAnalServiceImpl  implements BnsAbnPriceAnalService {
	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public List<BnsAbnPriceAnalVo> findAllBnsAbnPriceAnalList(String sqlId, Map<String, Object> map) throws Exception {
		
		return  (List<BnsAbnPriceAnalVo>) baseDaoSupport.findForList(sqlId, map);
	}
}
