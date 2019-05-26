package com.nasoft.aboutcar.mnguserinfo.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.googlecode.ehcache.annotations.Cacheable;
import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;
import com.nasoft.aboutcar.mnguserinfo.service.MngUserInfoService;

@Service("mngUserInfoService")
public class MngUserInfoServiceImpl implements MngUserInfoService {

	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public MngUserInfo searchById(String sqlId, String uid) {
		try {
			MngUserInfo mngUserInfo = (MngUserInfo) baseDaoSupport.findForObject(sqlId, uid);
			return mngUserInfo;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int insertUserInfo(String sqlId, MngUserInfo user) {
		try {
			int i = (Integer) baseDaoSupport.save(sqlId, user);
			return i;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int updateUserInfo(String sqlId, MngUserInfo user) {
		try {
			int i = (Integer)baseDaoSupport.update(sqlId, user);
			return i;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int deleteUserInfo(String sqlId, Map<String ,Object> map) {
		try {
			int i = (Integer)baseDaoSupport.update(sqlId, map);
			return i;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	@Cacheable(cacheName="baseCache")
	public List<MngUserInfo> findUser(String sqlId,Map<String ,Object> map) {
		try {
			List<MngUserInfo> userList = (List<MngUserInfo>) baseDaoSupport.findForList(sqlId, map);
			return userList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public MngUserInfo LoginVerification(String sqlId, String userName) {
		try {
			MngUserInfo mngUserInfo = (MngUserInfo) baseDaoSupport.findForObject(sqlId, userName);
			return mngUserInfo;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public MngUserInfo findUserByCertno(String sqlId, String certno) throws Exception {

		return (MngUserInfo) baseDaoSupport.findForObject(sqlId, certno);
	}

	@Override
	public List<Map> findUserByUsername(String sqlId, String username)
			throws Exception {
		
		return (List<Map>) baseDaoSupport.findForList(sqlId, username);
	}
	
	@Override
	public List<Map> searchApprovalLimitById(String sqlId, Map<String ,Object> map) throws Exception {
		return (List<Map>) baseDaoSupport.findForList(sqlId, map);
	}
	
}