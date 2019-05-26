package com.nasoft.aboutcar.credit.domain;

import java.io.Serializable;

public class CxkhIndicType implements Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "CxkhIndicType";
	public static final String ALIAS_TYPE_NAME = "åˆ†ç±»å��ç§°";
	public static final String ALIAS_TYPE_CODE = "åˆ†ç±»ä»£ç �";
	public static final String ALIAS_TYPE_LEVEL = "åˆ†ç±»ç­‰çº§";
	public static final String ALIAS_TYPE_DESC = "åˆ†ç±»æ��è¿°";
	public static final String ALIAS_UPPER_TYPE_CODE = "ä¸Šçº§åˆ†ç±»";
	public static final String ALIAS_CREATE_USER = "createUser";
	public static final String ALIAS_CREATE_TIME = "createTime";
	public static final String ALIAS_UPDATE_USER = "updateUser";
	public static final String ALIAS_UPDATE_TIME = "updateTime";
	
	
	//columns START
	private String typeName;
	private String typeCode;
	private Integer typeLevel;
	private String typeDesc;
	private String upperTypeCode;
	private Integer createUser;
	private java.util.Date createTime;
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	private Integer updateUser;
	private java.util.Date updateTime;
	private java.util.Date updateTimeBegin;
	private java.util.Date updateTimeEnd;
	//columns END

	public CxkhIndicType(){
	}

	public CxkhIndicType(
		java.lang.String typeCode
	){
		this.typeCode = typeCode;
	}

	public void setTypeName(String value) {
		this.typeName = value;
	}
	
	public String getTypeName() {
		return this.typeName;
	}
	public void setTypeCode(String value) {
		this.typeCode = value;
	}
	
	public String getTypeCode() {
		return this.typeCode;
	}
	public void setTypeLevel(Integer value) {
		this.typeLevel = value;
	}
	
	public Integer getTypeLevel() {
		return this.typeLevel;
	}
	public void setTypeDesc(String value) {
		this.typeDesc = value;
	}
	
	public String getTypeDesc() {
		return this.typeDesc;
	}
	public void setUpperTypeCode(String value) {
		this.upperTypeCode = value;
	}
	
	public String getUpperTypeCode() {
		return this.upperTypeCode;
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