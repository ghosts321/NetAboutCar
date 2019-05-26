package com.nasoft.SSM.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nasoft.SSM.base.dao.BaseDao;
import com.nasoft.SSM.domain.BespeakSum;
import com.nasoft.SSM.domain.DrvExamBespeak;
import com.nasoft.SSM.service.DrvExamBespeakService;

@Service("DrvExamBespeakService")
public class DrvExamBespeakServiceImpl implements DrvExamBespeakService {
	@Override
	public List<DrvExamBespeak> findDrvExamBespeakById(String sqlId, Integer bespeak_id) throws Exception {
		return (List<DrvExamBespeak>) baseDaoSupport.findForList(sqlId, bespeak_id);
	}

	@Resource
	private BaseDao baseDaoSupport;
	
	@Transactional
	@Override
	public void addDrvExamBespeak(String sqlId1, String sqlId2, DrvExamBespeak drvExamBespeak) throws Exception {
		baseDaoSupport.save(sqlId1, drvExamBespeak);
		baseDaoSupport.update(sqlId2, drvExamBespeak);
	}

	@Override
	public List<DrvExamBespeak> getBespeakYear(String sqlId, DrvExamBespeak drvExamBespeak) throws Exception {
		
		return (List<DrvExamBespeak>) baseDaoSupport.findForList(sqlId, drvExamBespeak);
		
	}

	@Override
	public List<DrvExamBespeak> getDrvBespeakSum(String sqlId, HashMap<String, Object> map) throws Exception {
		
		return (List<DrvExamBespeak>) baseDaoSupport.findForList(sqlId,map);
	}

	@Override
	public DrvExamBespeak getBespeakData(String sqlId, DrvExamBespeak drvExamBespeak) throws Exception {
		
		return (DrvExamBespeak) baseDaoSupport.findForObject(sqlId, drvExamBespeak);
	}

	@Override
	public DrvExamBespeak selectByCertno(String sqlId, String certno) throws Exception {
		
		return (DrvExamBespeak) baseDaoSupport.findForObject(sqlId, certno);
	}

}
