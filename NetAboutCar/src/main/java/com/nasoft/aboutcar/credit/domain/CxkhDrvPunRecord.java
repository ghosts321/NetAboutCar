package com.nasoft.aboutcar.credit.domain;

import java.io.Serializable;

public class CxkhDrvPunRecord implements Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
		
	//columns START
	private Integer id;
	private String listNo;
	private String drvLicense;
	private String punCode;
	private String punText;
	private String punStatus;
	private java.util.Date punDate;
	private java.util.Date punDateBegin;
	private java.util.Date punDateEnd;
	private java.util.Date cancelDate;
	private java.util.Date cancelDateBegin;
	private java.util.Date cancelDateEnd;
	private java.util.Date preCancelDate;
	private java.util.Date preCancelDateBegin;
	private java.util.Date preCancelDateEnd;
	private String cancelReason;
	private String cancelFile;
	private String shared;
	private Integer createUser;
	private java.util.Date createTime;
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	private Integer updateUser;
	private java.util.Date updateTime;
	private java.util.Date updateTimeBegin;
	private java.util.Date updateTimeEnd;
	//columns END

	public CxkhDrvPunRecord(){
	}

	public CxkhDrvPunRecord(
		java.lang.Integer id
	){
		this.id = id;
	}

	public void setId(Integer value) {
		this.id = value;
	}
	
	public Integer getId() {
		return this.id;
	}
	public void setListNo(String value) {
		this.listNo = value;
	}
	
	public String getListNo() {
		return this.listNo;
	}
	public void setDrvLicense(String value) {
		this.drvLicense = value;
	}
	
	public String getDrvLicense() {
		return this.drvLicense;
	}
	public void setPunCode(String value) {
		this.punCode = value;
	}
	
	public String getPunCode() {
		return this.punCode;
	}
	public void setPunText(String value) {
		this.punText = value;
	}
	
	public String getPunText() {
		return this.punText;
	}
	public void setPunStatus(String value) {
		this.punStatus = value;
	}
	
	public String getPunStatus() {
		return this.punStatus;
	}
	
	public void setPunDateBegin(java.util.Date value) {
		this.punDateBegin = value;
	}
	
	public java.util.Date getPunDateBegin() {
		return this.punDateBegin;
	}

	public void setPunDateEnd(java.util.Date value) {
		this.punDateEnd = value;
	}
	
	public java.util.Date getPunDateEnd() {
		return this.punDateEnd;
	}

	public void setPunDate(java.util.Date value) {
		this.punDate = value;
	}
	
	public java.util.Date getPunDate() {
		return this.punDate;
	}
	
	public void setCancelDateBegin(java.util.Date value) {
		this.cancelDateBegin = value;
	}
	
	public java.util.Date getCancelDateBegin() {
		return this.cancelDateBegin;
	}

	public void setCancelDateEnd(java.util.Date value) {
		this.cancelDateEnd = value;
	}
	
	public java.util.Date getCancelDateEnd() {
		return this.cancelDateEnd;
	}

	public void setCancelDate(java.util.Date value) {
		this.cancelDate = value;
	}
	
	public java.util.Date getCancelDate() {
		return this.cancelDate;
	}
	
	public void setPreCancelDateBegin(java.util.Date value) {
		this.preCancelDateBegin = value;
	}
	
	public java.util.Date getPreCancelDateBegin() {
		return this.preCancelDateBegin;
	}

	public void setPreCancelDateEnd(java.util.Date value) {
		this.preCancelDateEnd = value;
	}
	
	public java.util.Date getPreCancelDateEnd() {
		return this.preCancelDateEnd;
	}

	public void setPreCancelDate(java.util.Date value) {
		this.preCancelDate = value;
	}
	
	public java.util.Date getPreCancelDate() {
		return this.preCancelDate;
	}
	public void setCancelReason(String value) {
		this.cancelReason = value;
	}
	
	public String getCancelReason() {
		return this.cancelReason;
	}
	public void setCancelFile(String value) {
		this.cancelFile = value;
	}
	
	public String getCancelFile() {
		return this.cancelFile;
	}
	public void setShared(String value) {
		this.shared = value;
	}
	
	public String getShared() {
		return this.shared;
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