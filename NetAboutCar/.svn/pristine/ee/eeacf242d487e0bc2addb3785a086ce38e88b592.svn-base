package com.nasoft.aboutcar.supervise.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.supervise.domain.BnsNotOperateCar;
import com.nasoft.aboutcar.supervise.service.BnsNotOperateCarService;
@Service("BnsNotOperateCarService")
public class BnsNotOperateCarServiceImpl implements BnsNotOperateCarService {
	@Resource
	private BaseDao baseDaoSupport;
	@Override
	public List<BnsNotOperateCar> selectAll(String sqlId, Map<String, Object> map) throws Exception {
		
		return  (List<BnsNotOperateCar>) baseDaoSupport.findForList(sqlId,map);
	}

}
