package com.nasoft.aboutcar.orderset.controller;

import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;
import com.nasoft.aboutcar.orderset.domain.CarBespeak;
import com.nasoft.aboutcar.orderset.domain.DrvBesList;
import com.nasoft.aboutcar.orderset.domain.DrvBespeak;
import com.nasoft.aboutcar.orderset.domain.OrderInfo;
import com.nasoft.aboutcar.orderset.service.OrderInfoService;
import com.nasoft.aboutcar.pilotapply.domain.DrvUserinfo;
import com.nasoft.aboutcar.pilotapply.service.DrvUserinfoService;
import com.nasoft.aboutcar.vehicle.domain.Vehicle;
import com.nasoft.aboutcar.vehicle.service.VehicleService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/orderSet")
public class OrderController extends BaseController  {
	
	@Resource
	private OrderInfoService orderInfoService;
	@Resource
	DrvUserinfoService drvUserinfoService;
	@Resource
	VehicleService vehicleService;
	@RequestMapping("/driverIndex")
	public String driverIndex(){
		return "order/driverIndex";
	}
	@RequestMapping("/driverList")
	public void driverList(HttpServletRequest request,HttpServletResponse response){
		String applyid = request.getParameter("applyid");
		Map<String, String> map = new HashMap<String, String>();
		map.put("applyid", applyid);
		try {
			List<DrvBesList> list = orderInfoService.findDrvBespeakList("com.nasoft.aboutcar.orderInfo.findDrvBespeakList", map);
			JSONArray array = JSONArray.fromObject(list);
			writer(response,array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	@RequestMapping("/carIndex")
	public String carIndex(){
		return "order/carIndex";
	}
	@RequestMapping("/carList")
	public void carList(HttpServletRequest request,HttpServletResponse response){
		String applyid = request.getParameter("applyid");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("applyid", applyid);
		try {
			List<CarBespeak> list2 = new ArrayList<CarBespeak>();
			Map map2 = new HashMap();
			List<CarBespeak> list = orderInfoService.findAllCarBespeak("com.nasoft.aboutcar.orderInfo.findAllCarBespeak", map);
			for (CarBespeak carBespeak : list) {
				String carId = carBespeak.getCarid();
				Vehicle vc = vehicleService.findVehicleByCarId("com.nasoft.aboutcar.VehicleMapper.findVehicleByCarId", carId);
				String certno = vc.getCertno();
				DrvUserinfo di = (DrvUserinfo)drvUserinfoService.findDrvUserByCertNo("com.nasoft.aboutcar.DrvUserinfoMapper.findDrvUserByCertNo", certno);
				 if(null!=di){
					carBespeak.setUsername(di.getUsername());
					carBespeak.setTelno(di.getTelno());
				 }
				carBespeak.setCarnum(vc.getCarnum());
				
				list2.add(carBespeak);
			}
			JSONArray array = JSONArray.fromObject(list2);
			writer(response,array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	
	
	@RequestMapping("/orderIndex")
	public String index(){
		return "order/orderIndex";
	}
	@RequestMapping("/orderList")
	public String orderList(HttpServletRequest request,HttpServletResponse response){
		String orderDate = request.getParameter("bespeakDate");
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("bespeakDate",orderDate);
		
		try {
			List<OrderInfo> list = orderInfoService.findAllOrderInfo("com.nasoft.aboutcar.orderInfo.findAllOrderInfo",map);
			JSONArray array = JSONArray.fromObject(list);
			writer(response,array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
		
	@RequestMapping("toAdd")
	public String toAdd(){
		return "order/add";
	}
	
	@RequestMapping("/addOrder")
	public ModelAndView addOrder(OrderInfo orderinfo) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		ModelAndView mv=new ModelAndView();
		List<OrderInfo> list = new ArrayList<OrderInfo>();
		String msg="";
		MngUserInfo userInfo = getCurrentUser();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String now =df.format(new Date());
		String n[] =now.split("-");
		int today = (int)Integer.parseInt(n[2]);

		String a[]= orderinfo.getBespeakDate().split("-"); //受理时段

		try {
			String s =orderInfoService.findDrvBespeakDate("com.nasoft.aboutcar.orderInfo.findDrvBespeakDate", orderinfo.getBespeakDate());
			if (s==null){
				Calendar c = Calendar.getInstance();
				c.set(Calendar.YEAR, Integer.parseInt(a[0]));
				c.set(Calendar.MONTH, Integer.parseInt(a[1])-1); 
		        int days = c.getActualMaximum(Calendar.DATE);  
				//获取指定月份月天数
				
				int rows =0;
				if(n[0].equals(a[0])&n[1].equals(a[1])){
					 rows = days - Integer.parseInt(a[2]);
					 String orderDate ="";

						for(int i=0;i<rows;i++){
							orderDate=""+a[0]+"-"+a[1]+"-"+(Integer.parseInt(a[2])+i);
							OrderInfo order = new OrderInfo();
							PropertyUtils.copyProperties(order, orderinfo);
							order.setMonth(a[1]);
							order.setYear(a[0]);
							order.setBespeakDate(orderDate);
							order.setCreateTime(getStringDate());
							order.setCreateUser(userInfo.getUserId());
							order.setOrderType("0");
							list.add(order);
						}
						
				}else{
					rows = days;
					String orderDate ="";
					for(int i=1;i<=rows;i++){
						orderDate=""+a[0]+"-"+a[1]+"-"+i;
						OrderInfo order = new OrderInfo();
						PropertyUtils.copyProperties(order, orderinfo);
						order.setMonth(a[1]);
						order.setYear(a[0]);
						order.setBespeakDate(orderDate);
						order.setCreateTime(getStringDate());
						order.setCreateUser(userInfo.getUserId());
						order.setOrderType("0");
						list.add(order);
					}
				}
				
				try {
					int result = orderInfoService.addOrderInfo("com.nasoft.aboutcar.orderInfo.insertOrderInfo", list);
					if(result>0){
						msg="success";
					}else{
						msg="failed";
					}
				} catch (Exception e) {
					msg="failed";
					e.printStackTrace();
				}
				mv.addObject("msg",msg);
				mv.setViewName("save_result");
			}else{
				msg="已设置预约";
				mv.addObject("msg",msg);
				mv.setViewName("save_result");

			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		return mv;
	}
	
	@RequestMapping("toUpdate")
	public ModelAndView toUpdate(String bespeakId){
		ModelAndView mv = new ModelAndView();
		try {
			OrderInfo order =(OrderInfo) orderInfoService.findOrderInfoByOrderId("com.nasoft.aboutcar.orderInfo.findOrderInfoByOrderId",Integer.parseInt(bespeakId));
			mv.addObject("orderInfo",order);
			mv.setViewName("order/update");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("/update")
	public ModelAndView update(OrderInfo orderinfo){
		ModelAndView mv=new ModelAndView();
		String msg="";
		MngUserInfo userInfo = getCurrentUser();
		try {orderinfo.setUpdateTime(getStringDate());
		orderinfo.setUpdateUser(userInfo.getUserId());
			int result=orderInfoService.updateOrderInfo("com.nasoft.aboutcar.orderInfo.updateOrderInfo", orderinfo);
		    if(result>0){
		    	msg="success";
		    }else{
		    	msg="failed";
		    }
		} catch (Exception e) {
			msg="failed";
			e.printStackTrace();
		}
		mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
	}
	public String getStringDate(){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(new Date());
		
	}
	
	
	//车辆窗口预约------------------------------
	
	@RequestMapping("/drvOrderIndex")
	public String drvOrderIndex(){
		return "order/drvOrderIndex";
	}
	
	@RequestMapping("/drvOrderList")
	public String drvOrderList(HttpServletRequest request,HttpServletResponse response){
		String orderDate = request.getParameter("bespeakDate");
		
		Map<String,Object> map = new HashMap<String, Object>();
			map.put("bespeakDate",orderDate);
		try {
			List<OrderInfo> list = orderInfoService.findAllDrvOrderInfo("com.nasoft.aboutcar.orderInfo.findAllDrvOrderInfo",map);
			JSONArray array = JSONArray.fromObject(list);
			writer(response,array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
		
	@RequestMapping("toDrvAdd")
	public String toDrvAdd(){
		return "order/drvAdd";
	}
	
	@RequestMapping("/addDrvOrder")
	public ModelAndView addDrvOrder(OrderInfo orderinfo) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		ModelAndView mv=new ModelAndView();
		List<OrderInfo> list = new ArrayList<OrderInfo>();
		String msg="";
		MngUserInfo userInfo = getCurrentUser();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String now =df.format(new Date());
		String n[] =now.split("-");
		int today = (int)Integer.parseInt(n[2]);

		String a[]= orderinfo.getBespeakDate().split("-"); //受理时段
		
	
		try {
			String s =orderInfoService.findCarBespeakDate("com.nasoft.aboutcar.orderInfo.findCarBespeakDate", orderinfo.getBespeakDate());
			if(s == null){
				Calendar c = Calendar.getInstance();
				c.set(Calendar.YEAR, Integer.parseInt(a[0]));
				c.set(Calendar.MONTH, Integer.parseInt(a[1])); 
				//获取指定月份月天数
				int days = c.getActualMaximum(Calendar.DAY_OF_MONTH);
				
				int rows =0;
				if(n[0].equals(a[0])&n[1].equals(a[1])){
					 rows = days - Integer.parseInt(a[2]);
					 String orderDate ="";

						for(int i=0;i<rows;i++){
							orderDate=""+a[0]+"-"+a[1]+"-"+(Integer.parseInt(a[2])+i);
							OrderInfo order = new OrderInfo();
							PropertyUtils.copyProperties(order, orderinfo);
							order.setMonth(a[1]);
							order.setYear(a[0]);
							order.setBespeakDate(orderDate);
							order.setCreateTime(getStringDate());
							order.setCreateUser(userInfo.getUserId());
							order.setOrderType("1");
							list.add(order);
						}
						
				}else{
					rows = days;
					String orderDate ="";
					for(int i=1;i<=rows;i++){
						orderDate=""+a[0]+"-"+a[1]+"-"+i;
						OrderInfo order = new OrderInfo();
						PropertyUtils.copyProperties(order, orderinfo);
						order.setMonth(a[1]);
						order.setYear(a[0]);
						order.setBespeakDate(orderDate);
						order.setCreateTime(getStringDate());
						order.setCreateUser(userInfo.getUserId());
						order.setOrderType("1");
						list.add(order);
					}
				}
				
				try {
					int result = orderInfoService.addOrderInfo("com.nasoft.aboutcar.orderInfo.insertOrderInfo", list);
					if(result>0){
						msg="success";
					}else{
						msg="failed";
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else{
				msg="已设置预约";
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		
		mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
	}
	
	@RequestMapping("toDrvUpdate")
	public ModelAndView toDrvUpdate(String bespeakId){
		ModelAndView mv = new ModelAndView();
		try {
			OrderInfo order =(OrderInfo) orderInfoService.findOrderInfoByOrderId("com.nasoft.aboutcar.orderInfo.findOrderInfoByOrderId",Integer.parseInt(bespeakId));
			mv.addObject("orderInfo",order);
			mv.setViewName("order/drvUpdate");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	
	@RequestMapping("/drvUpdate")
	public ModelAndView drvUpdate(OrderInfo orderinfo){
		ModelAndView mv=new ModelAndView();
		String msg="";
		MngUserInfo userInfo = getCurrentUser();
		try {orderinfo.setUpdateTime(getStringDate());
		orderinfo.setUpdateUser(userInfo.getUserId());
			int result=orderInfoService.updateOrderInfo("com.nasoft.aboutcar.orderInfo.updateOrderInfo", orderinfo);
		    if(result>0){
		    	msg="success";
		    }else{
		    	msg="failed";
		    }
		} catch (Exception e) {
			msg="failed";
			e.printStackTrace();
		}
		mv.addObject("msg",msg);
		mv.setViewName("save_result");
		return mv;
	}
	
}
