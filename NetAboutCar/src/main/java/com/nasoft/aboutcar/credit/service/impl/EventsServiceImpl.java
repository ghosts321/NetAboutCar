package com.nasoft.aboutcar.credit.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.credit.domain.Events;
import com.nasoft.aboutcar.credit.service.EventsService;

@Service("EventsService")
public class EventsServiceImpl implements EventsService {
	
	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public void addEvents(String sqlId, Events events)throws Exception {
		baseDaoSupport.save(sqlId, events);	
	}
	
	@Override
	public List<Map> findDrvEvents(String sqlId,Map<String, Object> map) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}
	
	@Override
	public List<Map> findComEvents(String sqlId,Map<String, Object> map) throws Exception {
		List<Map> list=(List<Map>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}
	
	@Override
	public Events findEventsByNo(String sqlId,String event_no) throws Exception {
		return (Events) baseDaoSupport.findForObject(sqlId, event_no);
	}
	
	@Override
	public void updateStatus(String sqlId, Events events)throws Exception {
		baseDaoSupport.update(sqlId, events);	
	}

}
