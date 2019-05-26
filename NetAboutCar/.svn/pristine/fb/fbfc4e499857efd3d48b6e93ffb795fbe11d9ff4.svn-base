package com.nasoft.aboutcar.platform.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.instInfo.domain.InstInfo;
import com.nasoft.aboutcar.platform.domain.Platform;
import com.nasoft.aboutcar.platform.domain.PlatformApply;
import com.nasoft.aboutcar.platform.domain.PlatformApprove;
import com.nasoft.aboutcar.platform.domain.PlatformPermitcert;
import com.nasoft.aboutcar.platform.service.PlatformService;

@Service("platformService")
public class PlatformServiceImpl implements PlatformService {
	
	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public Platform findPlatformById(String sqlId, String creditCode) throws Exception{
		return (Platform) baseDaoSupport.findForObject(sqlId, creditCode);
	}

	@Override
	public List<PlatformApply> findAllPlatformApply(String sqlId, Map<String, Object> map) throws Exception{
		return (List<PlatformApply>) baseDaoSupport.findForList(sqlId, map);
	}

	@Override
	public PlatformApply findPlatformApplyById(String sqlId, String creditCode) throws Exception{
		// TODO Auto-generated method stub
		return (PlatformApply) baseDaoSupport.findForObject(sqlId, creditCode);
	}

	@Override
	public void updateApplyStatus(String sqlId, PlatformApply pa)
			throws Exception {
		// TODO Auto-generated method stub
		baseDaoSupport.update(sqlId, pa);
	}

	@Override
	public PlatformApprove findApproveById(String sqlId, String creditCode)
			throws Exception {
		// TODO Auto-generated method stub
		return (PlatformApprove) baseDaoSupport.findForObject(sqlId, creditCode);
	}

	@Override
	public void addPlatformApprove(String sqlId, PlatformApprove platformApprove)
			throws Exception {
		// TODO Auto-generated method stub
		baseDaoSupport.save(sqlId, platformApprove);
	}

	@Override
	public void addPlatformPermitcert(String sqlId,
			PlatformPermitcert platformPermitcert) throws Exception {
		// TODO Auto-generated method stub
		baseDaoSupport.save(sqlId, platformPermitcert);
	}

	@Override
	public List<Platform> findAllPlatform(String sqlId, String flag)
			throws Exception {
		return (List<Platform>) baseDaoSupport.findForList(sqlId, flag);
	}

	@Override
	public void updateCertByApplyid(String sqlId, PlatformPermitcert platformPermitcert) throws Exception {
		baseDaoSupport.update(sqlId, platformPermitcert);
	}

	@Override
	public List<Map> selectAllCertInfo(String sqlId,Map<String, Object> map) throws Exception {
		return (List<Map>) baseDaoSupport.findForList(sqlId, map);
	}

	@Override
	public PlatformPermitcert findPermitcertByCredCode(String sqlId, String creditCode) throws Exception {
		
		return (PlatformPermitcert) baseDaoSupport.findForObject(sqlId, creditCode);
	}

	@Override
	public List<Map> findInstByCreditcode(String sqlId, String creditCode)throws Exception {
		
		return (List<Map>)baseDaoSupport.findForList(sqlId,creditCode);
	}

	@Override
	public List<Map> findApproveListByApplyId(String sqlId, String applyId)throws Exception {
		
		return (List<Map>)baseDaoSupport.findForList(sqlId,applyId);
	}

	@Override
	public PlatformApply findPlatformApplyByMap(String string, Map<String, Object> map) throws Exception {
		return (PlatformApply) baseDaoSupport.findForObject(string, map);
	}

}
