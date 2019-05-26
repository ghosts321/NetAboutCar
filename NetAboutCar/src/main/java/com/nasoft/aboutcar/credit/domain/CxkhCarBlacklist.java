package com.nasoft.aboutcar.credit.domain;

import java.io.Serializable;

public class CxkhCarBlacklist implements Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "CxkhCarBlacklist";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_CARID = "è½¦è¾†ç¼–å�·";
	public static final String ALIAS_CARNUM = "è½¦ç‰Œå�·";
	public static final String ALIAS_ENGINENUM = "å�‘åŠ¨æœºå�·";
	public static final String ALIAS_CERTNO = "èº«ä»½è¯�å�·ç �";
	public static final String ALIAS_STORAGE_DATE = "å…¥åº“æ—¥æœŸ";
	public static final String ALIAS_STORAGE_REASON = "å…¥åº“åŽŸå› ";
	public static final String ALIAS_STORAGE_FILE = "å…¥åº“æ��æ–™";
	public static final String ALIAS_STORAGER = "å…¥åº“ç»�åŠžäºº";
	public static final String ALIAS_REMOVE_DATE = "ç§»é™¤æ—¥æœŸ";
	public static final String ALIAS_REMOVE_REASON = "ç§»é™¤åŽŸå› ";
	public static final String ALIAS_REMOVE_FILE = "ç§»é™¤æ��æ–™";
	public static final String ALIAS_REMOVER = "ç§»é™¤ç»�åŠžäºº";
	public static final String ALIAS_PRE_REMOVE_DATE = "é¢„å®šç§»é™¤æ—¥æœŸ";
	public static final String ALIAS_STATUS = "çŠ¶æ€�ï¼ˆ0ï¼šæœªç§»é™¤ï¼Œ1ï¼šç§»é™¤ï¼‰";
	public static final String ALIAS_BL_TYPE = "ç±»åž‹";
	public static final String ALIAS_CREATE_USER = "createUser";
	public static final String ALIAS_CREATE_TIME = "createTime";
	public static final String ALIAS_UPDATE_USER = "updateUser";
	public static final String ALIAS_UPDATE_TIME = "updateTime";
	
	
	//columns START
	private Integer id;
	private String carid;
	private String carnum;
	private String enginenum;
	private String certno;
	private java.util.Date storageDate;
	private java.util.Date storageDateBegin;
	private java.util.Date storageDateEnd;
	private String storageReason;
	private String storageFile;
	private String storager;
	private java.util.Date removeDate;
	private java.util.Date removeDateBegin;
	private java.util.Date removeDateEnd;
	private String removeReason;
	private String removeFile;
	private String remover;
	private java.util.Date preRemoveDate;
	private java.util.Date preRemoveDateBegin;
	private java.util.Date preRemoveDateEnd;
	private String status;
	private String blType;
	private Integer createUser;
	private java.util.Date createTime;
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	private Integer updateUser;
	private java.util.Date updateTime;
	private java.util.Date updateTimeBegin;
	private java.util.Date updateTimeEnd;
	//columns END

	public CxkhCarBlacklist(){
	}

	public CxkhCarBlacklist(
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
	public void setCarid(String value) {
		this.carid = value;
	}
	
	public String getCarid() {
		return this.carid;
	}
	public void setCarnum(String value) {
		this.carnum = value;
	}
	
	public String getCarnum() {
		return this.carnum;
	}
	public void setEnginenum(String value) {
		this.enginenum = value;
	}
	
	public String getEnginenum() {
		return this.enginenum;
	}
	public void setCertno(String value) {
		this.certno = value;
	}
	
	public String getCertno() {
		return this.certno;
	}
	
	public void setStorageDateBegin(java.util.Date value) {
		this.storageDateBegin = value;
	}
	
	public java.util.Date getStorageDateBegin() {
		return this.storageDateBegin;
	}

	public void setStorageDateEnd(java.util.Date value) {
		this.storageDateEnd = value;
	}
	
	public java.util.Date getStorageDateEnd() {
		return this.storageDateEnd;
	}

	public void setStorageDate(java.util.Date value) {
		this.storageDate = value;
	}
	
	public java.util.Date getStorageDate() {
		return this.storageDate;
	}
	public void setStorageReason(String value) {
		this.storageReason = value;
	}
	
	public String getStorageReason() {
		return this.storageReason;
	}
	public void setStorageFile(String value) {
		this.storageFile = value;
	}
	
	public String getStorageFile() {
		return this.storageFile;
	}
	public void setStorager(String value) {
		this.storager = value;
	}
	
	public String getStorager() {
		return this.storager;
	}
	
	public void setRemoveDateBegin(java.util.Date value) {
		this.removeDateBegin = value;
	}
	
	public java.util.Date getRemoveDateBegin() {
		return this.removeDateBegin;
	}

	public void setRemoveDateEnd(java.util.Date value) {
		this.removeDateEnd = value;
	}
	
	public java.util.Date getRemoveDateEnd() {
		return this.removeDateEnd;
	}

	public void setRemoveDate(java.util.Date value) {
		this.removeDate = value;
	}
	
	public java.util.Date getRemoveDate() {
		return this.removeDate;
	}
	public void setRemoveReason(String value) {
		this.removeReason = value;
	}
	
	public String getRemoveReason() {
		return this.removeReason;
	}
	public void setRemoveFile(String value) {
		this.removeFile = value;
	}
	
	public String getRemoveFile() {
		return this.removeFile;
	}
	public void setRemover(String value) {
		this.remover = value;
	}
	
	public String getRemover() {
		return this.remover;
	}
	
	public void setPreRemoveDateBegin(java.util.Date value) {
		this.preRemoveDateBegin = value;
	}
	
	public java.util.Date getPreRemoveDateBegin() {
		return this.preRemoveDateBegin;
	}

	public void setPreRemoveDateEnd(java.util.Date value) {
		this.preRemoveDateEnd = value;
	}
	
	public java.util.Date getPreRemoveDateEnd() {
		return this.preRemoveDateEnd;
	}

	public void setPreRemoveDate(java.util.Date value) {
		this.preRemoveDate = value;
	}
	
	public java.util.Date getPreRemoveDate() {
		return this.preRemoveDate;
	}
	public void setStatus(String value) {
		this.status = value;
	}
	
	public String getStatus() {
		return this.status;
	}
	public void setBlType(String value) {
		this.blType = value;
	}
	
	public String getBlType() {
		return this.blType;
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