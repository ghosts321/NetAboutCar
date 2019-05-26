package com.nasoft.aboutcar.credit.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.credit.domain.ComAppeals;
import com.nasoft.aboutcar.credit.service.ComAppealsService;

@Service("ComAppealsService")
public class ComAppealsServiceImpl implements ComAppealsService {
	
	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public ComAppeals findByAppealNo(String sqlId, String appeal_no) throws Exception {
		return (ComAppeals) baseDaoSupport.findForObject(sqlId, appeal_no);
	}

	@Override
	public void updateComAppeals(String sqlId, ComAppeals comAppeals) throws Exception {
		baseDaoSupport.update(sqlId, comAppeals);	
	}

}
