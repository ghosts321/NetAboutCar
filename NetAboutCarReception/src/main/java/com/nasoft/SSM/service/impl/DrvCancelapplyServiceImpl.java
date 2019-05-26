package com.nasoft.SSM.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.SSM.service.AreaCodeService;
import com.nasoft.SSM.service.DrvCancelapplyService;
import com.nasoft.SSM.base.dao.BaseDao;
import com.nasoft.SSM.domain.AreaCode;
import com.nasoft.SSM.domain.DrvCancelapply;

@Service("drvCancelapplyService")
public class DrvCancelapplyServiceImpl implements DrvCancelapplyService {

	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public DrvCancelapply findDrvCancelapplyByCertNo(String sqlId, String certno) throws Exception {
		
		return (DrvCancelapply) baseDaoSupport.findForObject(sqlId, certno);
	}

	@Override
	public void addDrvCancelapply(String sqlId, DrvCancelapply drvCancelapply) throws Exception {
		baseDaoSupport.save(sqlId, drvCancelapply);
		
	}

	

	
}