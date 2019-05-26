package com.nasoft.SSM.domain;

import java.util.Date;



/**
 * 车辆注销申请表
 * @author 
 *
 */
public class CancelApply {

	 private String cancelId;
	 private int cancelApply;
	 private String pcertNo;
	 private String manCompany;
	 private int createMan;
	 private Date createDate;
	 private String applyType;
	 private String appStatus;
	 
	 
	
	
	public String getCancelId() {
		return cancelId;
	}
	public void setCancelId(String cancelId) {
		this.cancelId = cancelId;
	}
	public int getCancelApply() {
			return cancelApply;
		}
		public void setCancelApply(int cancelApply) {
			this.cancelApply = cancelApply;
		}
	public String getApplyType() {
		return applyType;
	}
	public void setApplyType(String applyType) {
		this.applyType = applyType;
	}
	
	public String getAppStatus() {
		return appStatus;
	}
	public void setAppStatus(String appStatus) {
		this.appStatus = appStatus;
	}
	public String getPcertNo() {
		return pcertNo;
	}
	public void setPcertNo(String pcertNo) {
		this.pcertNo = pcertNo;
	}
	public String getManCompany() {
		return manCompany;
	}
	public void setManCompany(String manCompany) {
		this.manCompany = manCompany;
	}
	public int getCreateMan() {
		return createMan;
	}
	public void setCreateMan(int createMan) {
		this.createMan = createMan;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
	 
	 
}
