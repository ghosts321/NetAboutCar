package com.nasoft.aboutcar.credit.controller;

import java.io.Serializable;

import com.nasoft.aboutcar.pilotapply.domain.DrvPermitcert;

public class DrvPermitcertModel extends DrvPermitcert implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 655941549696447452L;

	private String comname;
	private String carnum;

	public String getComname() {
		return comname;
	}

	public void setComname(String comname) {
		this.comname = comname;
	}

	public String getCarnum() {
		return carnum;
	}

	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}

	
}
