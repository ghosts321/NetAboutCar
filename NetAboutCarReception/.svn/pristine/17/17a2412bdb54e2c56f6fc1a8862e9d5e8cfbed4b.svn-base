package com.nasoft.SSM.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.SSM.base.dao.BaseDao;
import com.nasoft.SSM.domain.BespeakSum;
import com.nasoft.SSM.domain.CarPermitApply;
import com.nasoft.SSM.domain.DrvBespeak;
import com.nasoft.SSM.domain.PilotBespeak;
import com.nasoft.SSM.service.PilotBespeakService;


@Service("PilotBespeakService")
public class PilotBespeakServiceImpl implements PilotBespeakService{
	@Resource
	private BaseDao baseDaoSupport;
	@Override
	public void addDrvSpeak(String sqlId,PilotBespeak ds) throws Exception {
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
	public List<CarPermitApply> selectCarInfo(String sqlId, String certno) throws Exception {
		List<CarPermitApply> list =(List) baseDaoSupport.findForList(sqlId, certno);
		return list;
	}
	@Override
	public List<BespeakSum> selectByDistinctDate(String sqlId, BespeakSum bespeakSum) throws Exception {
		List<BespeakSum> ls = (List<BespeakSum>) baseDaoSupport.findForList(sqlId,bespeakSum);
		return ls;
		
	}
	
	 
}
