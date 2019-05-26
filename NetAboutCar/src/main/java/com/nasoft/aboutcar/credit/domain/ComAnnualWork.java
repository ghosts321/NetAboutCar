package com.nasoft.aboutcar.credit.domain;

import java.util.Date;

public class ComAnnualWork {
	private Integer id;
	private String year;//年度
	private String com_license;//营运许可证号
	private Integer score;//总记分值
	private Date start_date;//开始日期
	private Date end_date;//结束日期
	private String assess_level;//预留字段 评价等级
	private Integer create_user;
	private Date create_time;
	private Integer update_user;
	private Date update_time;
	private String is_curr;
	private String com_name;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getCom_license() {
		return com_license;
	}
	public void setCom_license(String com_license) {
		this.com_license = com_license;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getAssess_level() {
		return assess_level;
	}
	public void setAssess_level(String assess_level) {
		this.assess_level = assess_level;
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
	public String getIs_curr() {
		return is_curr;
	}
	public void setIs_curr(String is_curr) {
		this.is_curr = is_curr;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	
}