package com.nasoft.aboutcar.content.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.content.domain.Content;
import com.nasoft.aboutcar.content.domain.LbContent;

public interface ContentService {

	public List<Content> findAllContent(String sqlId,Map<String, Object> map) throws Exception;
	
	public List<LbContent> findAllLbContent(String sqlId) throws Exception;
	
    public void addContent(String sqlId,Content content) throws Exception;
    
    public void addLbContent(String sqlId,LbContent lbContent) throws Exception;
    
    public Content findContentById(String sqlId,String id) throws Exception;
    
    public void updateContent(String sqlId,Content content) throws Exception;
    
    public void deleteContent(String sqlId,String id) throws Exception;
    
    public void deleteLbContent(String sqlId,String id) throws Exception;
    
	
}
