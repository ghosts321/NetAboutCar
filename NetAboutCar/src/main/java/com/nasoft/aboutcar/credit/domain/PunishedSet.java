package com.nasoft.aboutcar.credit.domain;

import java.util.Date;

public class PunishedSet {
	private String pun_type;//处分对象
	private String pun_code;//处分代码
	private String pun_text;//处分内容
	private String pun_desc;//处分描述
	private Integer min_score;//阀值下限
	private Integer max_score;//阀值上限
	private String valid_date;//生效日期
	private String invalid_date;//失效日期
	private String available;//有效性
	private Integer create_user;
	private Date create_time;
	private Integer update_user;
	private Date update_time;
	
	public String getPun_type() {
		return pun_type;
	}
	public void setPun_type(String pun_type) {
		this.pun_type = pun_type;
	}
	public String getPun_code() {
		return pun_code;
	}
	public void setPun_code(String pun_code) {
		this.pun_code = pun_code;
	}
	public String getPun_text() {
		return pun_text;
	}
	public void setPun_text(String pun_text) {
		this.pun_text = pun_text;
	}
	public String getPun_desc() {
		return pun_desc;
	}
	public void setPun_desc(String pun_desc) {
		this.pun_desc = pun_desc;
	}
	public Integer getMin_score() {
		return min_score;
	}
	public void setMin_score(Integer min_score) {
		this.min_score = min_score;
	}
	public Integer getMax_score() {
		return max_score;
	}
	public void setMax_score(Integer max_score) {
		this.max_score = max_score;
	}
	public String getValid_date() {
		return valid_date;
	}
	public void setValid_date(String valid_date) {
		this.valid_date = valid_date;
	}
	public String getInvalid_date() {
		return invalid_date;
	}
	public void setInvalid_date(String invalid_date) {
		this.invalid_date = invalid_date;
	}
	public String getAvailable() {
		return available;
	}
	public void setAvailable(String available) {
		this.available = available;
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
	
}