package com.nasoft.SSM.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.SSM.base.dao.BaseDao;
import com.nasoft.SSM.domain.BespeakSum;
import com.nasoft.SSM.domain.DrvBespeak;
import com.nasoft.SSM.domain.DrvPermitapply;
import com.nasoft.SSM.service.DrvBespeakService;


@Service("DrvBespeakService")
public class DrvBespeakServiceImpl implements DrvBespeakService{
	@Resource
	private BaseDao baseDaoSupport;
	@Override
	public void addDrvSpeak(String sqlId,DrvBespeak ds) throws Exception {
		baseDaoSupport.save(sqlId, ds);
		
	}
	@Override
	public List selectbespeak(String sqlId, String bespeakDate) throws Exception {
		List<BespeakSum> ls = (List<BespeakSum>) baseDaoSupport.findForList(sqlId,bespeakDate);
		return ls;
	}
	@Override
	public Integer updateOrderInfo(String sqlId, BespeakSum bespeakSum) throws Exception {
		int i = (Integer)baseDaoSupport.update(sqlId, bespeakSum);
		return i;
	}
	@Override
	public List<DrvPermitapply> selectDrvApply(String sqlId, String certno) throws Exception {
		List<DrvPermitapply> list =(List) baseDaoSupport.findForList(sqlId, certno);
		return list;
	}
	@Override
	public List<BespeakSum> selectByDistinctDate(String sqlId, BespeakSum bespeakSum) throws Exception {
		List<BespeakSum> ls = (List<BespeakSum>) baseDaoSupport.findForList(sqlId,bespeakSum);
		return ls;
	}
}
