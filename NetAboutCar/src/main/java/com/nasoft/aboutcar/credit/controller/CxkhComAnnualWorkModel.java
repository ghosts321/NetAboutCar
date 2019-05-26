package com.nasoft.aboutcar.credit.controller;

import java.io.Serializable;

import com.nasoft.aboutcar.credit.domain.CxkhComAnnualWork;

public class CxkhComAnnualWorkModel extends CxkhComAnnualWork implements
		Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4622941113001747851L;

	private String comName;

	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}
	
}
