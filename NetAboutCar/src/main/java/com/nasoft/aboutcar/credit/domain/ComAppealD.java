package com.nasoft.aboutcar.credit.domain;

import java.util.Date;

public class ComAppealD {
	private Integer id;
	private String rec_no;//记分记录编号
	private String appeal_no;//申诉编号
	private String appeal_text;//申诉内容
	private String appeal_file;//申诉材料
	private String appeal_status;//处理状态
	private String appeal_result;//申诉结论
	private String deal_result;//处理结论
	private String result_file;//结论材料
	private Integer create_user;
	private Date create_time;
	private Integer update_user;
	private Date update_time;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRec_no() {
		return rec_no;
	}
	public void setRec_no(String rec_no) {
		this.rec_no = rec_no;
	}
	public String getAppeal_no() {
		return appeal_no;
	}
	public void setAppeal_no(String appeal_no) {
		this.appeal_no = appeal_no;
	}
	public String getAppeal_text() {
		return appeal_text;
	}
	public void setAppeal_text(String appeal_text) {
		this.appeal_text = appeal_text;
	}
	public String getAppeal_file() {
		return appeal_file;
	}
	public void setAppeal_file(String appeal_file) {
		this.appeal_file = appeal_file;
	}
	public String getAppeal_status() {
		return appeal_status;
	}
	public void setAppeal_status(String appeal_status) {
		this.appeal_status = appeal_status;
	}
	public String getAppeal_result() {
		return appeal_result;
	}
	public void setAppeal_result(String appeal_result) {
		this.appeal_result = appeal_result;
	}
	public String getResult_file() {
		return result_file;
	}
	public void setResult_file(String result_file) {
		this.result_file = result_file;
	}
	public Integer getCreate_user() {
		return create_user;
	}
	public void setCreate_user(Integer create_user) {
		this.create_user = create_user;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public Integer getUpdate_user() {
		return update_user;
	}
	public void setUpdate_user(Integer update_user) {
		this.update_user = update_user;
	}
	public Date getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}
	public String getDeal_result() {
		return deal_result;
	}
	public void setDeal_result(String deal_result) {
		this.deal_result = deal_result;
	}
	
}