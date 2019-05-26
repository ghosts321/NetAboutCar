package com.nasoft.aboutcar.supervise.service.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.supervise.domain.CtlRatedPassengerInfo;
import com.nasoft.aboutcar.supervise.service.CtlRatedPassengerInfoService;

@Service("CtlRatedPassengerInfoService")
public class CtlRatedPassengerInfoServiceImpl implements CtlRatedPassengerInfoService {
	
	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public List<CtlRatedPassengerInfo> findAllRatedPassengerInfo(String sqlId, Map<String, Object> map) throws Exception {
		return  (List<CtlRatedPassengerInfo>) baseDaoSupport.findForList(sqlId,map);
	}

	@Override
	public int addCtlRatedPassengerInfo(String sqlId, CtlRatedPassengerInfo ctlRatedPassengerInfo) throws Exception {
		return (Integer) baseDaoSupport.save(sqlId, ctlRatedPassengerInfo);
	}

}
