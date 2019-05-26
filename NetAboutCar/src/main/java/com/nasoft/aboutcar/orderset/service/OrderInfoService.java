package com.nasoft.aboutcar.orderset.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.orderset.domain.CarBespeak;
import com.nasoft.aboutcar.orderset.domain.DrvBesList;
import com.nasoft.aboutcar.orderset.domain.DrvBespeak;
import com.nasoft.aboutcar.orderset.domain.OrderInfo;

public interface OrderInfoService {
	int addOrderInfo(String sqlId,List<OrderInfo> list) throws Exception;
	List<OrderInfo> findAllOrderInfo(String sqlId, Map<String,Object> map) throws Exception;
	OrderInfo findOrderInfoByOrderId(String sqlId, int orderId) throws Exception;
	Integer updateOrderInfo(String sqlId, OrderInfo order) throws Exception;
	List<OrderInfo> findAllDrvOrderInfo(String sqlId, Map<String,Object> map) throws Exception;
	List<DrvBespeak> findAllDrvBespeak(String sqlId,Map<String, Object> map) throws Exception;
	List<CarBespeak> findAllCarBespeak(String sqlId,Map<String,Object> map) throws Exception;
	
	String findDrvBespeakDate(String sqlId,String date) throws Exception;
	String findCarBespeakDate(String sqlId,String date) throws Exception;
	List<DrvBesList> findDrvBespeakList(String sqlId, Map map) throws Exception;


}
