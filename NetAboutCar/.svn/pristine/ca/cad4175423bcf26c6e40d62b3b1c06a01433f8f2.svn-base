package com.nasoft.aboutcar.credit.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.credit.domain.ComScoreRecord;
import com.nasoft.aboutcar.credit.service.ComScoreRecordService;

@Service("ComScoreRecordService")
public class ComScoreRecordServiceImpl implements ComScoreRecordService {
	
	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public void addComScoreRecord(String sqlId, ComScoreRecord comScoreRecord)throws Exception {
		baseDaoSupport.save(sqlId, comScoreRecord);	
	}
	
	@Override
	public List<ComScoreRecord> selectByEventNo(String sqlId, String event_no)throws Exception {
		return (List<ComScoreRecord>) baseDaoSupport.findForList(sqlId, event_no);	
	}

}
