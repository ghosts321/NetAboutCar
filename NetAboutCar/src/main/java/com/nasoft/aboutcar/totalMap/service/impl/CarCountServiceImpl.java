package com.nasoft.aboutcar.totalMap.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.totalMap.domain.vo.CountAuditCarVo;
import com.nasoft.aboutcar.totalMap.domain.vo.CountOnlineCarVo;
import com.nasoft.aboutcar.totalMap.domain.vo.CountPeopleVo;
import com.nasoft.aboutcar.totalMap.service.CarCountService;

@Service
public class CarCountServiceImpl implements CarCountService {
	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public List<CountAuditCarVo> getCountAuditCarList(String sqlId) throws Exception {
		return (List<CountAuditCarVo>) baseDaoSupport.findForList(sqlId,null);
	}
	
	@Override
	public List<CountOnlineCarVo> getCountOnlineCarList(String sqlId) throws Exception {
		return (List<CountOnlineCarVo>) baseDaoSupport.findForList(sqlId,null);
	}
	
	@Override
	public List<CountPeopleVo> getCountPeople(String sqlId) throws Exception {
		return (List<CountPeopleVo>) baseDaoSupport.findForList(sqlId,null);
	}
}
