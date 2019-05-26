package com.nasoft.aboutcar.orderset.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.orderset.domain.CarBespeak;
import com.nasoft.aboutcar.orderset.domain.DrvBesList;
import com.nasoft.aboutcar.orderset.domain.DrvBespeak;
import com.nasoft.aboutcar.orderset.domain.OrderInfo;
import com.nasoft.aboutcar.orderset.service.OrderInfoService;


@Service("orderInfoServiceImpl")
public class OrderInfoServiceImpl implements OrderInfoService {

	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public int addOrderInfo(String sqlId, List<OrderInfo> list) throws Exception {
		return  (Integer) baseDaoSupport.save(sqlId, list);
	}

	@Override
	public List<OrderInfo> findAllOrderInfo(String sqlId, Map<String,Object> map) throws Exception {
		List<OrderInfo> list = (List<OrderInfo>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}

	@Override
	public OrderInfo findOrderInfoByOrderId(String sqlId, int orderId) throws Exception {
		OrderInfo order = (OrderInfo)baseDaoSupport.findForObject(sqlId, orderId);
		return order;
	}

	@Override
	public Integer updateOrderInfo(String sqlId, OrderInfo order) throws Exception {
		return (Integer)baseDaoSupport.update(sqlId,order);
	}

	@Override
	public List<OrderInfo> findAllDrvOrderInfo(String sqlId, Map<String, Object> map) throws Exception {
		List<OrderInfo> list = (List<OrderInfo>) baseDaoSupport.findForList(sqlId, map);
		return list;
	}

	@Override
	public List<DrvBespeak> findAllDrvBespeak(String sqlId, Map<String,Object> map) throws Exception {
		List<DrvBespeak> list = (List<DrvBespeak>) baseDaoSupport.findForList(sqlId,map);
 		return list;
	}

	@Override
	public List<CarBespeak> findAllCarBespeak(String sqlId,Map<String,Object> map) throws Exception {
		List<CarBespeak> list = (List<CarBespeak>) baseDaoSupport.findForList(sqlId,map);
		return list;
	}

	@Override
	public String findDrvBespeakDate(String sqlId, String date) throws Exception {
		String s = (String)baseDaoSupport.findForObject(sqlId, date);
	
		return s;
	}

	@Override
	public String findCarBespeakDate(String sqlId, String date) throws Exception {
		String s = (String)baseDaoSupport.findForObject(sqlId, date);
		return s;
	}

	@Override
	public List<DrvBesList> findDrvBespeakList(String sqlId, Map map) throws Exception {
		List<DrvBesList> list = (List<DrvBesList>)baseDaoSupport.findForList(sqlId, map);
		return list;
	}
	
	 
}
