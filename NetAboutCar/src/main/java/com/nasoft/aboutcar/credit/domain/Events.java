package com.nasoft.aboutcar.credit.domain;

import java.util.Date;

public class Events {
	private String event_no;//事件编号
	private String event_desc;//事件概要
	private String event_detail;//事件详情
	private String attachment;//内容附件
	private String ar_fact;//违规事实
	private Date occur_date;//发生日期
	private String occur_address;//发生地点
	private String com_creditcode;//涉事平台
	private String driver_certno;//涉事驾驶员
	private String data_source;//数据来源
	private Date storage_date;//入库日期
	private String event_status;//事件状态 未处理、已处理、忽略
	private Integer create_user;
	private Date create_time;
	private Integer update_user;
	private Date update_time;
	private String arCode;//违规代码
	
	public String getEvent_no() {
		return event_no;
	}
	public void setEvent_no(String event_no) {
		this.event_no = event_no;
	}
	public String getEvent_desc() {
		return event_desc;
	}
	public void setEvent_desc(String event_desc) {
		this.event_desc = event_desc;
	}
	public String getEvent_detail() {
		return event_detail;
	}
	public void setEvent_detail(String event_detail) {
		this.event_detail = event_detail;
	}
	public String getAttachment() {
		return attachment;
	}
	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}
	public String getAr_fact() {
		return ar_fact;
	}
	public void setAr_fact(String ar_fact) {
		this.ar_fact = ar_fact;
	}
	public Date getOccur_date() {
		return occur_date;
	}
	public void setOccur_date(Date occur_date) {
		this.occur_date = occur_date;
	}
	public String getOccur_address() {
		return occur_address;
	}
	public void setOccur_address(String occur_address) {
		this.occur_address = occur_address;
	}
	public String getcom_creditcode() {
		return com_creditcode;
	}
	public void setcom_creditcode(String com_creditcode) {
		this.com_creditcode = com_creditcode;
	}
	public String getdriver_certno() {
		return driver_certno;
	}
	public void setdriver_certno(String driver_certno) {
		this.driver_certno = driver_certno;
	}
	public String getData_source() {
		return data_source;
	}
	public void setData_source(String data_source) {
		this.data_source = data_source;
	}
	public Date getStorage_date() {
		return storage_date;
	}
	public void setStorage_date(Date storage_date) {
		this.storage_date = storage_date;
	}
	public String getEvent_status() {
		return event_status;
	}
	public void setEvent_status(String event_status) {
		this.event_status = event_status;
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
	public String getArCode() {
		return arCode;
	}
	public void setArCode(String arCode) {
		this.arCode = arCode;
	}
	
}