package com.nasoft.aboutcar.mngarchive.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.mngarchive.domain.MngArchive;
import com.nasoft.aboutcar.mngarchive.service.MngArchiveService;

@Service("mngArchiveService")
public class MngArchiveServiceImpl implements MngArchiveService {

	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public int addMngArchive(String sqlId, MngArchive mngArchive) {
		try {
			int i = (Integer) baseDaoSupport.save(sqlId, mngArchive);
			return i;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
}