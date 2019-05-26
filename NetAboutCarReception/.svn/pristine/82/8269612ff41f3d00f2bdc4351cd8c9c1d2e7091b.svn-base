package com.nasoft.SSM.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.SSM.base.dao.BaseDao;
import com.nasoft.SSM.domain.Content;
import com.nasoft.SSM.domain.CxkhDrvPunList;
import com.nasoft.SSM.domain.LbContent;
import com.nasoft.SSM.service.ContentService;


@Service("contentService")
public class ContentServiceImpl implements ContentService{
	
	@Resource
	private BaseDao baseDaoSupport;
	
	
	@Override
	public List<Content> findAllContentByType(String sqlId,Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Content>) baseDaoSupport.findForList(sqlId, map);
	}

	@Override
	public List<Content> findAllContent(String sqlId) throws Exception {
		// TODO Auto-generated method stub
		return (List<Content>) baseDaoSupport.findForList(sqlId, null);
	}

	@Override
	public List<LbContent> findAllLbContent(String sqlId) throws Exception {
		// TODO Auto-generated method stub
		return (List<LbContent>) baseDaoSupport.findForList(sqlId,null);
	}


	public List<CxkhDrvPunList> findDrvPunList(String sqlId,CxkhDrvPunList entity) throws Exception{

		return (List<CxkhDrvPunList>) baseDaoSupport.findForList(sqlId,entity);
		
	}
	 
	

}
