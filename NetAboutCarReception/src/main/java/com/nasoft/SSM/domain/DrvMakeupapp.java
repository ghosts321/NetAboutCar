package com.nasoft.SSM.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 驾驶员营运资格许可补换申请表
 * @author wanglei
 * 2016/12/20
 *
 */
public class DrvMakeupapp implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer applyid;//申请编号
	private String certno;//身份证号
	private Integer applytype;//申请类型
	private Date applydate;//申请日期
	private String originalcertnum;//原从业资格证件号
	private Date certdate;//初领从业资格证件日期
	private String appstatus;//审批状态(0未验证、1已通过、2已发证)
	private String remark;//备注
	
	private Integer upduserid;//修改人
	private Integer updinstid;//修改机构
	private Date upddatetime;//修改时间
	
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
	public Integer getApplytype() {
		return applytype;
	}
	public void setApplytype(Integer applytype) {
		this.applytype = applytype;
	}
	public Date getApplydate() {
		return applydate;
	}
	public void setApplydate(Date applydate) {
		this.applydate = applydate;
	}
	public String getOriginalcertnum() {
		return originalcertnum;
	}
	public void setOriginalcertnum(String originalcertnum) {
		this.originalcertnum = originalcertnum;
	}
	public Date getCertdate() {
		return certdate;
	}
	public void setCertdate(Date certdate) {
		this.certdate = certdate;
	}
	public String getAppstatus() {
		return appstatus;
	}
	public void setAppstatus(String appstatus) {
		this.appstatus = appstatus;
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
	
	
}
