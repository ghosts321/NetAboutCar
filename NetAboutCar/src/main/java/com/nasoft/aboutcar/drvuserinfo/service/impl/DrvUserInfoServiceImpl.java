package com.nasoft.aboutcar.drvuserinfo.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.drvuserinfo.domain.DrvUserinfo;
import com.nasoft.aboutcar.drvuserinfo.domain.DrvUserreg;
import com.nasoft.aboutcar.drvuserinfo.service.DrvUserInfoService;

@Service("drvUserInfoService")
public class DrvUserInfoServiceImpl implements DrvUserInfoService {

	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public List<DrvUserinfo> findDrvUserList(String sqlId,Map<String,String> map) throws Exception {
		
		return (List<DrvUserinfo>) baseDaoSupport.findForList(sqlId,map);
	}

	@Override
	public DrvUserreg findDrvUserByCertno(String sqlId, String certno) throws Exception {
		
		return (DrvUserreg) baseDaoSupport.findForObject(sqlId, certno);
	}

	@Override
	public void updateDrvUserByCertno(String sqlId, Map<String,String> map) throws Exception {
		 
		baseDaoSupport.update(sqlId,map);
		
	}

	
}