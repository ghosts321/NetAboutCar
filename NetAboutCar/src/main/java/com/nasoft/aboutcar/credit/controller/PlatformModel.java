package com.nasoft.aboutcar.credit.controller;

import java.io.Serializable;

import com.nasoft.aboutcar.platform.domain.Platform;

public class PlatformModel extends Platform implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3830429108979562781L;


	private String indics;
	private int allScore;


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
