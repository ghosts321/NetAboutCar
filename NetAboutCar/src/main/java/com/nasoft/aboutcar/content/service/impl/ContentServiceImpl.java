package com.nasoft.aboutcar.content.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.content.domain.Content;
import com.nasoft.aboutcar.content.domain.LbContent;
import com.nasoft.aboutcar.content.service.ContentService;

@Service("contentService")
public class ContentServiceImpl implements ContentService{
	
	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public void addContent(String sqlId, Content content) throws Exception{
		// TODO Auto-generated method stub
		baseDaoSupport.save(sqlId, content);
	}

	@Override
	public Content findContentById(String sqlId, String id) throws Exception{
		// TODO Auto-generated method stub
		return (Content) baseDaoSupport.findForObject(sqlId, id);
	}

	@Override
	public void updateContent(String sqlId, Content content) throws Exception{
		// TODO Auto-generated method stub
		baseDaoSupport.update(sqlId, content);
	}

	@Override
	public void deleteContent(String sqlId, String id)  throws Exception{
		// TODO Auto-generated method stub
		baseDaoSupport.delete(sqlId, id);
	}

	@Override
	public List<LbContent> findAllLbContent(String sqlId) throws Exception {
		// TODO Auto-generated method stub
		return (List<LbContent>) baseDaoSupport.findForList(sqlId, null);
	}

	@Override
	public void addLbContent(String sqlId, LbContent lbContent)
			throws Exception {
		baseDaoSupport.save(sqlId, lbContent);
		
	}

	@Override
	public void deleteLbContent(String sqlId, String id) throws Exception {
		baseDaoSupport.delete(sqlId, id);
		
	}

	@Override
	public List<Content> findAllContent(String sqlId, Map<String, Object> map)
			throws Exception {
		return (List<Content>) baseDaoSupport.findForList(sqlId, map);
	}
	
	
	

}
