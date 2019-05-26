package com.nasoft.aboutcar.credit.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.credit.domain.ComAppealD;
import com.nasoft.aboutcar.credit.service.ComAppealDService;

@Service("ComAppealDService")
public class ComAppealDServiceImpl implements ComAppealDService {
	
	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public List<Map> findComAppealD(String sqlId, Map<String, Object> map) throws Exception {
		return (List<Map>) baseDaoSupport.findForList(sqlId, map);
	}

	@Override
	public ComAppealD findByRecNo(String sqlId, String rec_no) throws Exception {
		return (ComAppealD) baseDaoSupport.findForObject(sqlId, rec_no);
	}

	@Override
	public void updateComAppealD(String sqlId, ComAppealD comAppealD) throws Exception {
		baseDaoSupport.update(sqlId, comAppealD);	
	}

}
