package com.nasoft.aboutcar.credit.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.credit.domain.DrvScoreRecord;
import com.nasoft.aboutcar.credit.service.DrvScoreRecordService;

@Service("DrvScoreRecordService")
public class DrvScoreRecordServiceImpl implements DrvScoreRecordService {
	
	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public void addDrvScoreRecord(String sqlId, DrvScoreRecord drvScoreRecord)throws Exception {
		baseDaoSupport.save(sqlId, drvScoreRecord);	
	}
	
	@Override
	public List<DrvScoreRecord> selectByEventNo(String sqlId, String event_no)throws Exception {
		return (List<DrvScoreRecord>) baseDaoSupport.findForList(sqlId, event_no);	
	}

}
