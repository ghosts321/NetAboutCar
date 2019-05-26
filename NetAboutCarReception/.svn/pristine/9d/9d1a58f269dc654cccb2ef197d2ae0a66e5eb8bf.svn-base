package com.nasoft.SSM.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nasoft.SSM.base.dao.BaseDao;
import com.nasoft.SSM.domain.DrvContract;
import com.nasoft.SSM.domain.DrvRecord;
import com.nasoft.SSM.service.DrvRecordService;

@Service("DrvRecordService")
public class DrvRecordServiceImpl implements DrvRecordService {
	
	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void addDrvRecord(DrvContract drvContract, DrvRecord drvRecord) throws Exception {
		baseDaoSupport.save("com.nasoft.SSM.DrvContract.addDrvContract", drvContract);
		drvRecord.setContractid(drvContract.getContractid());
		baseDaoSupport.save("com.nasoft.SSM.DrvRecord.addDrvRecord", drvRecord);
	}
	
	@Override
	public DrvRecord findRecordByCertNo(String sqlId,String certNo) throws Exception {
		return  (DrvRecord) baseDaoSupport.findForObject(sqlId, certNo);
	}

	@Override
	public Map<String,Object> findRecordInfoByCert(String sqlId, String certNo) throws Exception {
		return (Map<String,Object>) baseDaoSupport.findForObject(sqlId, certNo);
	}
	
}
