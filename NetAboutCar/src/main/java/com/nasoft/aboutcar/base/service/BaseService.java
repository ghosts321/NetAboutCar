package com.nasoft.aboutcar.base.service;

import java.util.List;

import com.nasoft.aboutcar.runtime.mybatis.Page;
import com.nasoft.aboutcar.runtime.mybatis.Pageable;

public interface BaseService {
	public <P> void insert2(String sql,P obj) throws Exception;
	public <P> void update2(String sql,P obj) throws Exception;
	public <P> void delete2(String sql,P obj) throws Exception;
	public <T,P> T findForObject2(String sql,P obj) throws Exception;
	public <T,P> List<T> findForList2(String sql, P obj) throws Exception;
	public <T,P> Page<T> findForList2(String sql, P obj,Pageable pageable) throws Exception;
}
