package com.nasoft.aboutcar.credit.domain;

import java.io.Serializable;

/**
 * 指标细则
 * @author Administrator
 *
 */
public class Indic implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String type_code;//分类代码
	private String type_name;//分类名称
	private String indic_code;//指标代码
	private String indic_text;//指标内容
	private String indic_desc;//指标说明
	private Integer score;//记分值
	private Integer level;//预留字段 严重等级
	private String shared;//信用共享 0：默认不共享，1：默认共享
	private String indic_status;//状态 0:不启用 1:启用
	private String category;//1：驾驶员 2：平台 
	private Integer create_user;
	private String create_time;
	private Integer update_user;
	private String update_time;
	public String getType_code() {
		return type_code;
	}
	public void setType_code(String type_code) {
		this.type_code = type_code;
	}
	public String getIndic_code() {
		return indic_code;
	}
	public void setIndic_code(String indic_code) {
		this.indic_code = indic_code;
	}
	public String getIndic_text() {
		return indic_text;
	}
	public void setIndic_text(String indic_text) {
		this.indic_text = indic_text;
	}
	public String getIndic_desc() {
		return indic_desc;
	}
	public void setIndic_desc(String indic_desc) {
		this.indic_desc = indic_desc;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public String getShared() {
		return shared;
	}
	public void setShared(String shared) {
		this.shared = shared;
	}
	public Integer getCreate_user() {
		return create_user;
	}
	public void setCreate_user(Integer create_user) {
		this.create_user = create_user;
	}
	
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public Integer getUpdate_user() {
		return update_user;
	}
	public void setUpdate_user(Integer update_user) {
		this.update_user = update_user;
	}
	public String getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(String update_time) {
		this.update_time = update_time;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public String getIndic_status() {
		return indic_status;
	}
	public void setIndic_status(String indic_status) {
		this.indic_status = indic_status;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
}
