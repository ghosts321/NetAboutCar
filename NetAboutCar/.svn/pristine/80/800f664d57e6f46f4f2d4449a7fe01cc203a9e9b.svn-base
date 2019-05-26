package com.nasoft.aboutcar.exam.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.exam.domain.MngExamBespeak;
import com.nasoft.aboutcar.exam.service.MngExamBespeakService;


@Service("MngExamBespeakService")
public class MngExamBespeakServiceImpl implements MngExamBespeakService {
	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public int addMngExamBespeak(String sqlId, MngExamBespeak mngExamBespeak) throws Exception {
		
		return (Integer) baseDaoSupport.save(sqlId, mngExamBespeak);

	}

	@Override
	public List<MngExamBespeak> findAllExamBespeak(String sqlId, Map<String, Object> map) throws Exception {
		return (List<MngExamBespeak>) baseDaoSupport.findForList(sqlId, map);
		
	}

	@Override
	public MngExamBespeak finMngExamBespeakById(String sqlId, String bespeakid) throws Exception {
		
		return  (MngExamBespeak) baseDaoSupport.findForObject(sqlId, bespeakid);
	}

	@Override
	public int updateMngExamBespeak(String sqlId, MngExamBespeak mngExamBespeak) throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, mngExamBespeak);
	}

	@Transactional
	@Override
	public void batchDelMngExamBespeak(String sqlId, String bespeakids) throws Exception {
		String[] mngbespeakids = bespeakids.split(",");
		for(String bespeak_id : mngbespeakids){
			baseDaoSupport.delete(sqlId, bespeak_id);
		}
		
	}

}
