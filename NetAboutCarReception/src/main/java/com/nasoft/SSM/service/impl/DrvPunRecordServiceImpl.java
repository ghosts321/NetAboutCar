package com.nasoft.SSM.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.SSM.base.dao.BaseDao;
import com.nasoft.SSM.domain.DrvAppeals;
import com.nasoft.SSM.service.DrvPunRecordService;
@Service
public class DrvPunRecordServiceImpl implements DrvPunRecordService{
	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public List<Map> findAllRecord(String sqlId, String certno) throws Exception {
		
		return (List<Map>) baseDaoSupport.findForList(sqlId, certno);
	}

	@Override
	public List<Map> findAllRecord(String sqlId, Map<String, String> map)
			throws Exception {
		
		return (List<Map>) baseDaoSupport.findForList(sqlId, map);
	}

	@Override
	public List<Map> findAllIndicType(String sqlId, String certno)
			throws Exception {
		
		return (List<Map>) baseDaoSupport.findForList(sqlId, certno);
	}

	@Override
	public void addAppeal(String sqlId, DrvAppeals drvAppeals) throws Exception {
		baseDaoSupport.save(sqlId, drvAppeals);
		
	}
	

}
