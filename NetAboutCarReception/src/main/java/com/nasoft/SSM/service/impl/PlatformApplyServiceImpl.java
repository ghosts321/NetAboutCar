package com.nasoft.SSM.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.SSM.base.dao.BaseDao;
import com.nasoft.SSM.domain.ComAppealD;
import com.nasoft.SSM.domain.ComAppeals;
import com.nasoft.SSM.domain.ComScoreRecord;
import com.nasoft.SSM.domain.Platform;
import com.nasoft.SSM.domain.PlatformApply;
import com.nasoft.SSM.domain.PlatformPermitcert;
import com.nasoft.SSM.service.PlatformApplyService;

@Service("platformApplyService")
public class PlatformApplyServiceImpl implements PlatformApplyService {

	
	@Resource
	private BaseDao baseDaoSupport;
	@Override
	public void addPlatform(String sqlId, Platform platform) throws Exception {
		// TODO Auto-generated method stub
		baseDaoSupport.save(sqlId, platform);
	}

	@Override
	public void addPlatformtApply(String sqlId, PlatformApply platformApply)
			throws Exception {
		// TODO Auto-generated method stub
		baseDaoSupport.save(sqlId, platformApply);
	}

	@Override
	public List<PlatformApply> findPlatformtApplyByNo(String sqlId, String creditCode)
			throws Exception {
		return (List<PlatformApply>) baseDaoSupport.findForList(sqlId, creditCode);
	}
	
	@Override
	public List<Platform> selectAllPlatForm(String sqlId) throws Exception {
		return (List<Platform>) baseDaoSupport.findForList(sqlId, null);
	}
	 
	@Override
	public void deletePermitApplyByApplyId(String sqlId, String applyId)
			throws Exception {
		// TODO Auto-generated method stub
		baseDaoSupport.delete(sqlId, applyId);
	}
	@Override
	public void deletePlatformByCreditCode(String sqlId, String creditCode)
			throws Exception {
		// TODO Auto-generated method stub
		baseDaoSupport.delete(sqlId, creditCode);
	}

	@Override
	public Platform findPlatformByCreditCode(String sqlId, String applyId)
			throws Exception {
		// TODO Auto-generated method stub
		return (Platform) baseDaoSupport.findForObject(sqlId, applyId);
	}

	public PlatformPermitcert selectByCondition(String sqlId, Map<String, String> map) throws Exception {
		return (PlatformPermitcert)baseDaoSupport.findForObject(sqlId, map);
	}
	
	@Override
	public PlatformApply findComPermitApplyByApplyid(String sqlId, String applyId)throws Exception {
		return (PlatformApply) baseDaoSupport.findForObject(sqlId, applyId);
	}

	@Override
	public void updatePlatform(String sqlId, Platform platform) throws Exception {
		baseDaoSupport.update(sqlId, platform);
		
	}

	@Override
	public PlatformApply findComChangeApplyByApplyid(String sqlId, String applyId) throws Exception {
		return (PlatformApply) baseDaoSupport.findForObject(sqlId, applyId);
		
	}

	@Override
	public PlatformApply findComPermitApplyByMap(String sqlId, HashMap<String, Object> map) throws Exception {
		
		return (PlatformApply) baseDaoSupport.findForObject(sqlId, map);
	}
	
	@Override
	public List<Map<String,Object>> findPunishInfo(String sqlId,String creditcode) throws Exception {
		
		return (List<Map<String,Object>>) baseDaoSupport.findForList(sqlId, creditcode);
	}

	@Override
	public List<ComScoreRecord> findComScoreRecord(String sqlId, String creditCode)throws Exception {
		return (List<ComScoreRecord>) baseDaoSupport.findForList(sqlId, creditCode);
	}
	
	@Override
	public void addComAppealD(String sqlId, ComAppealD comAppealD)throws Exception {
		baseDaoSupport.save(sqlId, comAppealD);
	}
	
	@Override
	public void addComAppeals(String sqlId, ComAppeals comAppeals)throws Exception {
		baseDaoSupport.save(sqlId, comAppeals);
	}
	
	@Override
	public ComAppeals findComAppealsByCreditcode(String sqlId, String creditcode) throws Exception {
		return (ComAppeals) baseDaoSupport.findForObject(sqlId, creditcode);
	}
	
	@Override
	public void updateComScoreRecord(String sqlId, Map map) throws Exception {
		baseDaoSupport.update(sqlId, map);
	}
}
