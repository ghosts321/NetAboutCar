package com.nasoft.aboutcar.instInfo.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.instInfo.domain.InstInfo;
import com.nasoft.aboutcar.instInfo.service.InstInfoService;


@Service("instInfoService")
public class InstInfoServiceImpl implements InstInfoService {

	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public List<InstInfo> findAllInstInfo(String sqlId, Map<String, Object> map) throws Exception {
		List<InstInfo> list=(List<InstInfo>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}
	
	@Override
	public List<InstInfo> findAllInstInfoByAreaCode(String sqlId,
			String areaCode) throws Exception {
		List<InstInfo> list=(List<InstInfo>) baseDaoSupport.findForList(sqlId, areaCode);
		return list;
	}
	
	@Override
	public InstInfo findInstInfoByInstId(String sqlId, String instId) throws Exception {
		InstInfo instInfo=(InstInfo) baseDaoSupport.findForObject(sqlId, instId);
		return instInfo;
	}

	@Override
	public int addInstInfo(String sqlId, InstInfo instInfo) throws Exception {
		return (Integer) baseDaoSupport.save(sqlId, instInfo);
		 
	}

	@Override
	public int updateInstInfo(String sqlId, InstInfo instInfo) throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, instInfo);
	}

	@Override
	public int deleteInstInfoByInstId(String sqlId, String instId) throws Exception {
	    return (Integer) baseDaoSupport.delete(sqlId, instId);
	}

}
