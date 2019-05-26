package com.nasoft.aboutcar.credit.domain;

import java.io.Serializable;

public class CxkhPunishedSet implements Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	
	//columns START
	private Integer punCode;
	private String punType;
	private String punText;
	private String punDesc;
	private Integer minScore;
	private Integer maxScore;
	private java.util.Date validDate;
	private java.util.Date validDateBegin;
	private java.util.Date validDateEnd;
	private java.util.Date invalidDate;
	private java.util.Date invalidDateBegin;
	private java.util.Date invalidDateEnd;
	private String available;
	private Integer createUser;
	private java.util.Date createTime;
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	private Integer updateUser;
	private java.util.Date updateTime;
	private java.util.Date updateTimeBegin;
	private java.util.Date updateTimeEnd;
	//columns END

	public CxkhPunishedSet(){
	}

	public CxkhPunishedSet(
		java.lang.Integer punCode
	){
		this.punCode = punCode;
	}

	public void setPunCode(Integer value) {
		this.punCode = value;
	}
	
	public Integer getPunCode() {
		return this.punCode;
	}
	public void setPunType(String value) {
		this.punType = value;
	}
	
	public String getPunType() {
		return this.punType;
	}
	public void setPunText(String value) {
		this.punText = value;
	}
	
	public String getPunText() {
		return this.punText;
	}
	public void setPunDesc(String value) {
		this.punDesc = value;
	}
	
	public String getPunDesc() {
		return this.punDesc;
	}
	public void setMinScore(Integer value) {
		this.minScore = value;
	}
	
	public Integer getMinScore() {
		return this.minScore;
	}
	public void setMaxScore(Integer value) {
		this.maxScore = value;
	}
	
	public Integer getMaxScore() {
		return this.maxScore;
	}
	
	public void setValidDateBegin(java.util.Date value) {
		this.validDateBegin = value;
	}
	
	public java.util.Date getValidDateBegin() {
		return this.validDateBegin;
	}

	public void setValidDateEnd(java.util.Date value) {
		this.validDateEnd = value;
	}
	
	public java.util.Date getValidDateEnd() {
		return this.validDateEnd;
	}

	public void setValidDate(java.util.Date value) {
		this.validDate = value;
	}
	
	public java.util.Date getValidDate() {
		return this.validDate;
	}
	
	public void setInvalidDateBegin(java.util.Date value) {
		this.invalidDateBegin = value;
	}
	
	public java.util.Date getInvalidDateBegin() {
		return this.invalidDateBegin;
	}

	public void setInvalidDateEnd(java.util.Date value) {
		this.invalidDateEnd = value;
	}
	
	public java.util.Date getInvalidDateEnd() {
		return this.invalidDateEnd;
	}

	public void setInvalidDate(java.util.Date value) {
		this.invalidDate = value;
	}
	
	public java.util.Date getInvalidDate() {
		return this.invalidDate;
	}
	public void setAvailable(String value) {
		this.available = value;
	}
	
	public String getAvailable() {
		return this.available;
	}
	public void setCreateUser(Integer value) {
		this.createUser = value;
	}
	
	public Integer getCreateUser() {
		return this.createUser;
	}
	
	public void setCreateTimeBegin(java.util.Date value) {
		this.createTimeBegin = value;
	}
	
	public java.util.Date getCreateTimeBegin() {
		return this.createTimeBegin;
	}

	public void setCreateTimeEnd(java.util.Date value) {
		this.createTimeEnd = value;
	}
	
	public java.util.Date getCreateTimeEnd() {
		return this.createTimeEnd;
	}

	public void setCreateTime(java.util.Date value) {
		this.createTime = value;
	}
	
	public java.util.Date getCreateTime() {
		return this.createTime;
	}
	public void setUpdateUser(Integer value) {
		this.updateUser = value;
	}
	
	public Integer getUpdateUser() {
		return this.updateUser;
	}
	
	public void setUpdateTimeBegin(java.util.Date value) {
		this.updateTimeBegin = value;
	}
	
	public java.util.Date getUpdateTimeBegin() {
		return this.updateTimeBegin;
	}

	public void setUpdateTimeEnd(java.util.Date value) {
		this.updateTimeEnd = value;
	}
	
	public java.util.Date getUpdateTimeEnd() {
		return this.updateTimeEnd;
	}

	public void setUpdateTime(java.util.Date value) {
		this.updateTime = value;
	}
	
	public java.util.Date getUpdateTime() {
		return this.updateTime;
	}




}