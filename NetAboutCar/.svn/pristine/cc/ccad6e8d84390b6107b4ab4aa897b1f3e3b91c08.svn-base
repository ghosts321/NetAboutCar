package com.nasoft.aboutcar.credit.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.credit.domain.DrvBlacklist;
import com.nasoft.aboutcar.credit.service.DrvBlacklistService;
import com.nasoft.aboutcar.pilotapply.domain.DrvUserinfo;

@Service("DrvBlacklistService")
public class DrvBlacklistServiceImpl implements DrvBlacklistService {
	@Resource
	private BaseDao baseDaoSupport;
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<DrvBlacklist> selectAllDrvBlacklist(String sql, HashMap<String, Object> map) throws Exception {
		return  (ArrayList<DrvBlacklist>) baseDaoSupport.findForList(sql, map);
	}

	@Override
	public DrvBlacklist selectOneById(String sql, String type_code) throws Exception {
		return (DrvBlacklist) baseDaoSupport.findForObject(sql, type_code);
	}

	@Override
	public int addDrvBlacklist(String sql, DrvBlacklist drvBlacklist) throws Exception {
		return (int) baseDaoSupport.save(sql, drvBlacklist);
	}

	@Override
	public int updateDrvBlacklist(String sql, DrvBlacklist drvBlacklist) throws Exception {
		return (int) baseDaoSupport.update(sql, drvBlacklist);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DrvUserinfo> getDrvNameList(String sql, Object object) throws Exception {
		
		return (List<DrvUserinfo>) baseDaoSupport.findForList(sql, object);
	}

}
