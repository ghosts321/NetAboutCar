package com.nasoft.aboutcar.supervise.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.pilotapply.domain.DrvExamresult;
import com.nasoft.aboutcar.supervise.domain.BnsCompanyViolation;
import com.nasoft.aboutcar.supervise.service.BnsCompanyViolationService;

@Service("BnsCompanyViolationService")
public class BnsCompanyViolationServiceImpl implements BnsCompanyViolationService {

	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public int addBnsCompanyViolation(String sqlId, BnsCompanyViolation bnsCompanyViolation) {
		try {
			int i = (Integer) baseDaoSupport.save(sqlId, bnsCompanyViolation);
			return i;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<BnsCompanyViolation> selectAll(String sqlId, Map<String, Object> map) throws Exception {
		
		return (List<BnsCompanyViolation>) baseDaoSupport.findForList(sqlId,map);
	}
	
}