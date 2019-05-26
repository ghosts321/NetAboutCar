package com.nasoft.aboutcar.credit.controller;

import java.io.Serializable;
import java.util.List;

import com.nasoft.aboutcar.credit.domain.CxkhIndic;

public class DriverModel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -636993370925537821L;

	private String certno; 
	private String username;
	private String platformname;
	private String comname;
	private String shortname;
	private String sex;
	private String carnum;
	private String model;
	private String indics;
	private int allScore;
	
	public String getCertno() {
		return certno;
	}
	public void setCertno(String certno) {
		this.certno = certno;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPlatformname() {
		return platformname;
	}
	public void setPlatformname(String platformname) {
		this.platformname = platformname;
	}
	public String getComname() {
		return comname;
	}
	public void setComname(String comname) {
		this.comname = comname;
	}
	public String getShortname() {
		return shortname;
	}
	public void setShortname(String shortname) {
		this.shortname = shortname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getCarnum() {
		return carnum;
	}
	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public int getAllScore() {
		return allScore;
	}
	public void setAllScore(int allScore) {
		this.allScore = allScore;
	}
	public String getIndics() {
		return indics;
	}
	public void setIndics(String indics) {
		this.indics = indics;
	}

}
