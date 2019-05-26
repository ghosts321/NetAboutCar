package com.nasoft.aboutcar.credit.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.credit.domain.Events;


public interface EventsService {

	public void addEvents(String sqlId,Events events) throws Exception;

	public List<Map> findDrvEvents(String sqlId,Map<String, Object> map) throws Exception;

	public List<Map> findComEvents(String sqlId, Map<String, Object> map) throws Exception;

	public Events findEventsByNo(String sqlId, String event_no) throws Exception;

	public void updateStatus(String sqlId, Events events) throws Exception;

}
