package com.nasoft.aboutcar.complaint.domain;

import java.io.Serializable;

public class comDisAppeal implements Serializable{

	private int id;//申诉处理id
	private int complain_info_id;//投诉信息id
	private String disappeal_idea;//申诉处理意见
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getComplain_info_id() {
		return complain_info_id;
	}
	public void setComplain_info_id(int complain_info_id) {
		this.complain_info_id = complain_info_id;
	}
	public String getDisappeal_idea() {
		return disappeal_idea;
	}
	public void setDisappeal_idea(String disappeal_idea) {
		this.disappeal_idea = disappeal_idea;
	}
		
}
