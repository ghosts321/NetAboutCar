package com.nasoft.aboutcar.supervise.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.supervise.domain.MngOrderStartInfo;
import com.nasoft.aboutcar.supervise.service.MngOrderStartInfoService;

@Service("MngOrderStartInfoService")
public class MngOrderStartInfoServiceImpl implements MngOrderStartInfoService {

	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public Map selectOrderReceivingTime(String sqlId,Map map) throws Exception {
		return (Map) baseDaoSupport.findForObject(sqlId, map);
	}

	@Override
	public int addMngOrderStartInfo(String sqlId, MngOrderStartInfo MngOrderStartInfo) {
		try {
			int i = (Integer) baseDaoSupport.save(sqlId, MngOrderStartInfo);
			return i;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List selectAddress(String sqlId) throws Exception {
		return (List) baseDaoSupport.findForList(sqlId, null);
	}

	@Override
	public List selectCompany(String sqlId) throws Exception {
		return (List) baseDaoSupport.findForList(sqlId, null);
	}

}