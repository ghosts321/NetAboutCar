package com.nasoft.SSM.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.SSM.base.dao.BaseDao;
import com.nasoft.SSM.domain.InstInfo;
import com.nasoft.SSM.service.InstInfoService;



@Service("instInfoService")
public class InstInfoServiceImpl implements InstInfoService {

	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public List<InstInfo> findAllInstInfo(String sqlId) throws Exception {
		List<InstInfo> list=(List<InstInfo>) baseDaoSupport.findForList(sqlId, null);
		return list;
	}
	 
	@Override
	public List<InstInfo> findInstInfoByAreacode(String sqlId,String areaCode) throws Exception {
		List<InstInfo> list=(List<InstInfo>) baseDaoSupport.findForList(sqlId, areaCode);
		return list;
	}

	@Override
	public List<String> findInstNameByInstid(String sqlId, String instid) throws Exception {
		List<String> s=(List) baseDaoSupport.findForList(sqlId, instid);
				return s;
	}
	
}
