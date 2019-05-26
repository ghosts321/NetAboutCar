package com.nasoft.aboutcar.pilotapply.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.pilotapply.domain.DrvCancelapply;
import com.nasoft.aboutcar.pilotapply.service.DrvCancelapplyService;


@Service("drvCancelapplyService")
public class DrvCancelapplyServiceImpl implements DrvCancelapplyService {

	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public DrvCancelapply findDrvCancelapplyByCertNo(String sqlId, String certno) throws Exception {
		
		return (DrvCancelapply) baseDaoSupport.findForObject(sqlId, certno);
	}

	@Override
	public void updateDrvCancelapplyByCertno(String sqlId,DrvCancelapply drvcancelapply) throws Exception {
		baseDaoSupport.update(sqlId, drvcancelapply);
		
	}



	

	
}