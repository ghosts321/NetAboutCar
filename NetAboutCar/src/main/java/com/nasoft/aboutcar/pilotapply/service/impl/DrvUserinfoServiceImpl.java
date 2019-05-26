package com.nasoft.aboutcar.pilotapply.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.pilotapply.domain.DrvUserinfo;
import com.nasoft.aboutcar.pilotapply.service.DrvUserinfoService;

@Service("DrvUserinfoService")
public class DrvUserinfoServiceImpl implements DrvUserinfoService {

	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public void addDrvUserinfo(String sqlId, DrvUserinfo DrvUserinfo) throws Exception {
		// TODO Auto-generated method stub
		baseDaoSupport.save(sqlId, DrvUserinfo);
	}

	@Override
	public List<DrvUserinfo> findDrvUserInfo(String sqlId, Map<String ,Object> map) {
		// TODO Auto-generated method stub
		try {
			return (List<DrvUserinfo>) baseDaoSupport.findForList(sqlId, map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	@Override
	public int updateDrvUser(String sqlId, Map<String, Object> map) {
		try {
			return (int) baseDaoSupport.update(sqlId, map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}
	
	public DrvUserinfo  findDrvUserByCertNo(String sqlId, String certno) throws Exception {

		return (DrvUserinfo)baseDaoSupport.findForObject(sqlId, certno);}
}
