package com.nasoft.aboutcar.customer.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.googlecode.ehcache.annotations.Cacheable;
import com.googlecode.ehcache.annotations.TriggersRemove;
import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.customer.service.CustomerSerice;
@Service("customerSerice")
public class CustomerSericeImpl implements CustomerSerice{

	@Resource
	private BaseDao baseDaoSupport;
	
	@Cacheable(cacheName="baseCache")
	public List<?> getCustomerList(String sqlId,Object obj) {
		System.out.println("customerDao = " + baseDaoSupport);
		List<?> list = new ArrayList<Object>();
		try {
			list = (List<?>) baseDaoSupport.findForList(sqlId,obj);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@TriggersRemove(cacheName="baseCache",removeAll=true)
	public void updateCustomerById(){
		try {
			//baseDaoSupport.update("", "");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
