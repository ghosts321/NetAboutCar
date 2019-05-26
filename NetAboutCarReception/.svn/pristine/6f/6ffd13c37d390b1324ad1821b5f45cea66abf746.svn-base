package com.nasoft.SSM.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.SSM.base.dao.BaseDao;
import com.nasoft.SSM.domain.DrvPermitcert;
import com.nasoft.SSM.service.DrvPermitcertService;

@Service("DrvPermitcertService")
public class DrvPermitcertServiceImpl implements DrvPermitcertService {
	
	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public List<DrvPermitcert> selectByCertno(String sqlId, String certno) throws Exception {
		return (List<DrvPermitcert>) baseDaoSupport.findForList(sqlId, certno);
	}

	public DrvPermitcert selectByCondition(String sqlId, Map<String, String> map) throws Exception {
		return (DrvPermitcert) baseDaoSupport.findForObject(sqlId, map);
	}

}
