package com.nasoft.aboutcar.credit.domain;

import java.io.Serializable;

public class CxkhDrvScoreRecord implements Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
		
	//columns START
	private String recNo;
	private String drvName;
	private String certno;
	private String drvLicense;
	private java.util.Date recDate;
	private java.util.Date recDateBegin;
	private java.util.Date recDateEnd;
	private String indicCode;
	private String indicText;
	private Integer score;
	private String eventNo;
	private String reviewNo;
	private String appealNo;
	private String year;
	private String recStatus;
	private Integer createUser;
	private java.util.Date createTime;
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	private Integer updateUser;
	private java.util.Date updateTime;
	private java.util.Date updateTimeBegin;
	private java.util.Date updateTimeEnd;
	//columns END

	public CxkhDrvScoreRecord(){
	}

	public CxkhDrvScoreRecord(
		java.lang.String recNo
	){
		this.recNo = recNo;
	}

	public void setRecNo(String value) {
		this.recNo = value;
	}
	
	public String getRecNo() {
		return this.recNo;
	}
	public void setDrvName(String value) {
		this.drvName = value;
	}
	
	public String getDrvName() {
		return this.drvName;
	}
	public void setCertno(String value) {
		this.certno = value;
	}
	
	public String getCertno() {
		return this.certno;
	}
	public void setDrvLicense(String value) {
		this.drvLicense = value;
	}
	
	public String getDrvLicense() {
		return this.drvLicense;
	}
	
	public void setRecDateBegin(java.util.Date value) {
		this.recDateBegin = value;
	}
	
	public java.util.Date getRecDateBegin() {
		return this.recDateBegin;
	}

	public void setRecDateEnd(java.util.Date value) {
		this.recDateEnd = value;
	}
	
	public java.util.Date getRecDateEnd() {
		return this.recDateEnd;
	}

	public void setRecDate(java.util.Date value) {
		this.recDate = value;
	}
	
	public java.util.Date getRecDate() {
		return this.recDate;
	}
	public void setIndicCode(String value) {
		this.indicCode = value;
	}
	
	public String getIndicCode() {
		return this.indicCode;
	}
	public void setIndicText(String value) {
		this.indicText = value;
	}
	
	public String getIndicText() {
		return this.indicText;
	}
	public void setScore(Integer value) {
		this.score = value;
	}
	
	public Integer getScore() {
		return this.score;
	}
	public void setEventNo(String value) {
		this.eventNo = value;
	}
	
	public String getEventNo() {
		return this.eventNo;
	}
	public void setReviewNo(String value) {
		this.reviewNo = value;
	}
	
	public String getReviewNo() {
		return this.reviewNo;
	}
	public void setAppealNo(String value) {
		this.appealNo = value;
	}
	
	public String getAppealNo() {
		return this.appealNo;
	}
	public void setYear(String value) {
		this.year = value;
	}
	
	public String getYear() {
		return this.year;
	}
	public void setRecStatus(String value) {
		this.recStatus = value;
	}
	
	public String getRecStatus() {
		return this.recStatus;
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