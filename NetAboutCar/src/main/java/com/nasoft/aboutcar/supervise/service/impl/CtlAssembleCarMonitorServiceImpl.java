package com.nasoft.aboutcar.supervise.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.supervise.domain.CtlCarPositionInfo;
import com.nasoft.aboutcar.supervise.service.CtlAssembleCarMonitorService;

@Service("CtlAssembleCarMonitorService")
public class CtlAssembleCarMonitorServiceImpl implements CtlAssembleCarMonitorService {
	@Resource
	private BaseDao baseDaoSupport;
	@Override
	public int addAssembleCar(String sqlId, String[] ids) throws Exception {
		int count = 0;
		for(String id : ids){
			baseDaoSupport.save(sqlId, id);
			count++;
		}
		
		return count;
	}
	@Override
	public CtlCarPositionInfo findIllegalCarById(String sqlId, String id) throws Exception {
		
		return (CtlCarPositionInfo) baseDaoSupport.findForObject(sqlId, id);
	}

}
