package com.nasoft.aboutcar.report.domain;

import java.io.Serializable;

public class JcfxDataDeminsion implements Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "JcfxDataDeminsion";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_DATA_CODE = "æ•°æ�®ä»£ç �";
	public static final String ALIAS_FIELD_TYPE = "å­—æ®µç±»åž‹(demisionã€�value)";
	public static final String ALIAS_DIM_NAME = "ç»´åº¦å��";
	public static final String ALIAS_DIM_CODE = "ç»´åº¦ä»£ç �";
	public static final String ALIAS_DIM_TYPE = "ç»´åº¦å€¼ç±»åž‹";
	public static final String ALIAS_DIM_FIELDNAME = "ç»´åº¦å­—æ®µå��";
	public static final String ALIAS_DIM_PICS = "é€‚ç”¨å›¾å½¢";
	public static final String ALIAS_CREATE_USER = "createUser";
	public static final String ALIAS_CREATE_TIME = "createTime";
	public static final String ALIAS_UPDATE_USER = "updateUser";
	public static final String ALIAS_UPDATE_TIME = "updateTime";
	public static final String ALIAS_DATA_URL = "dataUrl";
	public static final String ALIAS_DATA_CODE_FIELD = "åˆ†ç±»ä»£ç �å­—æ®µå��";
	public static final String ALIAS_DATA_NAME_FIELD = "åˆ†ç±»å��ç§°å­—æ®µå��";
	public static final String ALIAS_DIM_NAMEFIELD = "dimNamefield";
	
	
	//columns START
	private Integer id;
	private String dataCode;
	private String fieldType;
	private String dimName;
	private String dimCode;
	private String dimType;
	private String dimFieldname;
	private String dimPics;
	private Integer createUser;
	private java.util.Date createTime;
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	private Integer updateUser;
	private java.util.Date updateTime;
	private java.util.Date updateTimeBegin;
	private java.util.Date updateTimeEnd;
	private String dataUrl;
	private String dataCodeField;
	private String dataNameField;
	private String dimNamefield;
	//columns END

	public JcfxDataDeminsion(){
	}

	public JcfxDataDeminsion(
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
	public void setDataCode(String value) {
		this.dataCode = value;
	}
	
	public String getDataCode() {
		return this.dataCode;
	}
	public void setFieldType(String value) {
		this.fieldType = value;
	}
	
	public String getFieldType() {
		return this.fieldType;
	}
	public void setDimName(String value) {
		this.dimName = value;
	}
	
	public String getDimName() {
		return this.dimName;
	}
	public void setDimCode(String value) {
		this.dimCode = value;
	}
	
	public String getDimCode() {
		return this.dimCode;
	}
	public void setDimType(String value) {
		this.dimType = value;
	}
	
	public String getDimType() {
		return this.dimType;
	}
	public void setDimFieldname(String value) {
		this.dimFieldname = value;
	}
	
	public String getDimFieldname() {
		return this.dimFieldname;
	}
	public void setDimPics(String value) {
		this.dimPics = value;
	}
	
	public String getDimPics() {
		return this.dimPics;
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
	public void setDataUrl(String value) {
		this.dataUrl = value;
	}
	
	public String getDataUrl() {
		return this.dataUrl;
	}
	public void setDataCodeField(String value) {
		this.dataCodeField = value;
	}
	
	public String getDataCodeField() {
		return this.dataCodeField;
	}
	public void setDataNameField(String value) {
		this.dataNameField = value;
	}
	
	public String getDataNameField() {
		return this.dataNameField;
	}
	public void setDimNamefield(String value) {
		this.dimNamefield = value;
	}
	
	public String getDimNamefield() {
		return this.dimNamefield;
	}




}