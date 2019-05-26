package com.nasoft.aboutcar.supervise.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.runtime.mybatis.Page;
import com.nasoft.aboutcar.runtime.mybatis.Pageable;
import com.nasoft.aboutcar.supervise.domain.BnsOperationPay;
import com.nasoft.aboutcar.supervise.service.BnsOperationPayService;

@Service("BnsOperationPayService")
public class BnsOperationPayServiceImpl implements BnsOperationPayService {

	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public int addBnsOperationPay(String sqlId, BnsOperationPay bnsOperationPay) {
		try {
			int i = (Integer) baseDaoSupport.save(sqlId, bnsOperationPay);
			return i;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	@Override
	public List<BnsOperationPay> findOperationPay(String sqlId, Map<String, Object> map) throws Exception {
		return (List<BnsOperationPay>) baseDaoSupport.findForList(sqlId, map);
	}


	@Override
	public Page<BnsOperationPay> findOperationPay(String sqlId, Map<String, Object> map,Pageable pageable) throws Exception {
		return (Page<BnsOperationPay>) baseDaoSupport.findForList(sqlId, map,pageable);
	}


	@Override
	public List<Map> globalOperationAnalyzing(String sqlId, Map map) throws Exception {
		return (List<Map>) baseDaoSupport.findForList(sqlId, map);
	}

	@Override
	public List<Map> selectOnArea(String sqlId) throws Exception {
		return (List<Map>) baseDaoSupport.findForList(sqlId,null);
	}
}