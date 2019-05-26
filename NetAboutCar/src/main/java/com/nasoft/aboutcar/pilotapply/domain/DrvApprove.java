package com.nasoft.aboutcar.pilotapply.domain;

import java.util.Date;

public class DrvApprove {
	private Integer apprid;//审核id
	private String certno;//身份证号码
	private String apprtype;//审核类型
	private Integer applyid;//申请编号
	private String opinions;//审核意见
	private String description;//说明
	private Integer appruserid;//审核人
	private Integer apprinstid;//审核机构
	private Date apprdatetime;//审核时间
	
	private String username;//审核用户名称
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getApprid() {
		return apprid;
	}
	public void setApprid(Integer apprid) {
		this.apprid = apprid;
	}
	public String getCertno() {
		return certno;
	}
	public void setCertno(String certno) {
		this.certno = certno;
	}
	public String getApprtype() {
		return apprtype;
	}
	public void setApprtype(String apprtype) {
		this.apprtype = apprtype;
	}
	public Integer getApplyid() {
		return applyid;
	}
	public void setApplyid(Integer applyid) {
		this.applyid = applyid;
	}
	public String getOpinions() {
		return opinions;
	}
	public void setOpinions(String opinions) {
		this.opinions = opinions;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getAppruserid() {
		return appruserid;
	}
	public void setAppruserid(Integer appruserid) {
		this.appruserid = appruserid;
	}
	public Integer getApprinstid() {
		return apprinstid;
	}
	public void setApprinstid(Integer apprinstid) {
		this.apprinstid = apprinstid;
	}
	public Date getApprdatetime() {
		return apprdatetime;
	}
	public void setApprdatetime(Date apprdatetime) {
		this.apprdatetime = apprdatetime;
	}
}