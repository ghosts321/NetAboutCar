package com.nasoft.aboutcar.pilotapply.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.pilotapply.domain.DrvRecord;
import com.nasoft.aboutcar.pilotapply.service.DrvRecordService;

@Service("DrvRecordService")
public class DrvRecordServiceImpl implements DrvRecordService {
	
	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public void addDrvRecord(String sqlId, DrvRecord drvRecord) throws Exception {
		baseDaoSupport.save(sqlId, drvRecord);
	}
	@Override
	public List<Map> selectAllRecord(String sqlId,Map<String, Object> map) throws Exception {
		return (List<Map>) baseDaoSupport.findForList(sqlId, map);
	}
	@Override
	public Map selectDetailById(String sqlId,String recordid) throws Exception {
		return (Map) baseDaoSupport.findForObject(sqlId, recordid);
	}
	@Override
	public Map selectDetailByCertno(String sqlId,String certno) throws Exception {
		return (Map) baseDaoSupport.findForObject(sqlId, certno);
	}
	@Override
	public DrvRecord findRecord(String sqlId,Map<String, Object> map) throws Exception {
		return (DrvRecord) baseDaoSupport.findForObject(sqlId, map);
	}
	@Override
	public void updateDrvRecord(String sqlId, DrvRecord drvRecord) throws Exception {
		baseDaoSupport.update(sqlId, drvRecord);
	}
}
