package com.nasoft.aboutcar.credit.domain;

import java.util.Date;

public class CxkhComPunListD {
	private String listNo;//名单编号
	private String comLicense;//营业许可证号
	private String removeStatus;//移除标记
	private Date removeDate;//移除日期
	private String removeReason;//移除说明
	private Integer createUser;
	private Date createTime;
	private Integer updateUser;
	private Date updateTime;
	public String getListNo() {
		return listNo;
	}
	public void setListNo(String listNo) {
		this.listNo = listNo;
	}
	public String getComLicense() {
		return comLicense;
	}
	public void setComLicense(String comLicense) {
		this.comLicense = comLicense;
	}
	public String getRemoveStatus() {
		return removeStatus;
	}
	public void setRemoveStatus(String removeStatus) {
		this.removeStatus = removeStatus;
	}
	public Date getRemoveDate() {
		return removeDate;
	}
	public void setRemoveDate(Date removeDate) {
		this.removeDate = removeDate;
	}
	public String getRemoveReason() {
		return removeReason;
	}
	public void setRemoveReason(String removeReason) {
		this.removeReason = removeReason;
	}
	public Integer getCreateUser() {
		return createUser;
	}
	public void setCreateUser(Integer createUser) {
		this.createUser = createUser;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Integer getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(Integer updateUser) {
		this.updateUser = updateUser;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
}
