package com.nasoft.aboutcar.pilotapply.service.impl;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.pilotapply.domain.DrvUsercheck;
import com.nasoft.aboutcar.pilotapply.service.DrvUsercheckService;

@Service("DrvUsercheckService")
public class DrvUsercheckServiceImpl implements DrvUsercheckService {
	
	@Resource
	private BaseDao baseDaoSupport;
	@Override
	public void addDrvUsercheck(String sqlId, DrvUsercheck drvUsercheck) throws Exception {
		baseDaoSupport.save(sqlId, drvUsercheck);
	}
	@Override
	public List<DrvUsercheck> selectByCertno(String sqlId, String certno) throws Exception {
		return (List<DrvUsercheck>) baseDaoSupport.findForList(sqlId, certno);
	}
	@Override
	public void deleteByCertno(String sqlId, String certno) throws Exception {
		baseDaoSupport.delete(sqlId, certno);
	}
}
