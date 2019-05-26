package com.nasoft.SSM.domain;

import java.util.Date;

public class DrvPermitapply {
	private Integer applyid;//申请编号
	private String certno;//身份证号
	private String instid;//申请机构代码
	private Integer driveyears;//驾龄
	private String company;//服务网约车平台公司
	private String contractid;//合同id
	private String workstatus;//工作状态
	private String photo;//个人照片(白底1寸)
	private String certphoto;//身份证照片
	private String drivecardphoto;//驾驶证照片
	private Date applydate;//申请时间
	private String crimemark;//有无犯罪记录标识
	private String recordcont;//记录内容
	private String appstatus;//审批状态(0未审批、1身份审批驳回、2身份审批通过、3考试未通过、4考试通过、5窗口办理不通过、6窗口办理通过、7已发证)
	private String checkstatus;//身份验证状态（1提交验证、2验证中、3验证未通过、4验证通过）
	private String remark;//备注
	private Integer upduserid;//修改人
	private Integer updinstid;//修改机构
	private Date upddatetime;//修改时间
	private String source;//来源(1个人、2平台)
	private String applytype;//申请类型(1申请、2变更、3注销)
	private String description;//描述

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getApplyid() {
		return applyid;
	}
	public void setApplyid(Integer applyid) {
		this.applyid = applyid;
	}
	public String getCertno() {
		return certno;
	}
	public void setCertno(String certno) {
		this.certno = certno;
	}
	public String getInstid() {
		return instid;
	}
	public void setInstid(String instid) {
		this.instid = instid;
	}
	public Integer getDriveyears() {
		return driveyears;
	}
	public void setDriveyears(Integer driveyears) {
		this.driveyears = driveyears;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getContractid() {
		return contractid;
	}
	public void setContractid(String contractid) {
		this.contractid = contractid;
	}
	public String getWorkstatus() {
		return workstatus;
	}
	public void setWorkstatus(String workstatus) {
		this.workstatus = workstatus;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getCertphoto() {
		return certphoto;
	}
	public void setCertphoto(String certphoto) {
		this.certphoto = certphoto;
	}
	public String getDrivecardphoto() {
		return drivecardphoto;
	}
	public void setDrivecardphoto(String drivecardphoto) {
		this.drivecardphoto = drivecardphoto;
	}
	public Date getApplydate() {
		return applydate;
	}
	public void setApplydate(Date applydate) {
		this.applydate = applydate;
	}
	public String getCrimemark() {
		return crimemark;
	}
	public void setCrimemark(String crimemark) {
		this.crimemark = crimemark;
	}
	public String getRecordcont() {
		return recordcont;
	}
	public void setRecordcont(String recordcont) {
		this.recordcont = recordcont;
	}
	public String getAppstatus() {
		return appstatus;
	}
	public void setAppstatus(String appstatus) {
		this.appstatus = appstatus;
	}
	public String getCheckstatus() {
		return checkstatus;
	}
	public void setCheckstatus(String checkstatus) {
		this.checkstatus = checkstatus;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integer getUpduserid() {
		return upduserid;
	}
	public void setUpduserid(Integer upduserid) {
		this.upduserid = upduserid;
	}
	public Integer getUpdinstid() {
		return updinstid;
	}
	public void setUpdinstid(Integer updinstid) {
		this.updinstid = updinstid;
	}
	public Date getUpddatetime() {
		return upddatetime;
	}
	public void setUpddatetime(Date upddatetime) {
		this.upddatetime = upddatetime;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getApplytype() {
		return applytype;
	}
	public void setApplytype(String applytype) {
		this.applytype = applytype;
	}

}