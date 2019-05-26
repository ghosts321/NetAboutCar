package com.nasoft.aboutcar.base.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.base.service.BaseService;
import com.nasoft.aboutcar.runtime.mybatis.Page;
import com.nasoft.aboutcar.runtime.mybatis.Pageable;

@Service
public class BaseServiceImpl implements BaseService {

	@Resource
	protected BaseDao baseDaoSupport;
	
	public <P> void insert2(String sql,P obj) throws Exception{
		baseDaoSupport.save2(sql, obj);
	}

	public <P> void update2(String sql,P obj) throws Exception{
		baseDaoSupport.update2(sql, obj);
	}

	public <P> void delete2(String sql,P obj) throws Exception{
		baseDaoSupport.delete2(sql, obj);
	}
	
	public <T,P> T findForObject2(String sql,P obj) throws Exception{
		return baseDaoSupport.findForObject2(sql, obj);
	}
	
	public <T,P> List<T> findForList2(String sql, P obj) throws Exception{
		return baseDaoSupport.findForList2(sql, obj);
	}

	public <T,P> Page<T> findForList2(String sql, P obj,Pageable pageable) throws Exception{
		return baseDaoSupport.findForList2(sql, obj,pageable);
	}
}
