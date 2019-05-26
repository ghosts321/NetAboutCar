package com.nasoft.aboutcar.customer.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nasoft.aboutcar.customer.domain.Customer;
import com.nasoft.aboutcar.customer.service.CustomerSerice;

@Controller
@RequestMapping("/customer")
public class CustomerController{

	@Resource
	private CustomerSerice customerService;
	
	@RequestMapping("/customerList")
	public String index(HttpServletRequest request,Model model){
//		List<Customer> list = (List<Customer>) customerService.getCustomerList("com.nasoft.aboutcar.customer.domain.CustomerInfo.findCustomer",null);
		List<Customer> list = (List<Customer>) customerService.getCustomerList("com.nasoft.aboutcar.customer.domain.CustomerInfo.findCustomer",null);
		//JsonUtil.formatJson(list, list.size());
		JSONArray jsonArray = JSONArray.fromObject(list);
		
		if(list != null && list.size()>0){
			for(Customer cus:list){
				System.out.println(cus.toString());
			}
		}
		System.out.println("进入customerList。。。。。"+"\n"+jsonArray);
		return "customerList";
	}
	@RequestMapping("/updateCustomerById")
	public void updateCustomerById(){
		customerService.updateCustomerById();
	}
	
}
