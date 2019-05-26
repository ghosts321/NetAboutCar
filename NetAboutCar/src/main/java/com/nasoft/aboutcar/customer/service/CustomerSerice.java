package com.nasoft.aboutcar.customer.service;

import java.util.List;

public interface CustomerSerice {

	public List<?> getCustomerList(String sqlId,Object obj);
	
	public void updateCustomerById();
}
