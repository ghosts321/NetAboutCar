package com.nasoft.aboutcar.administrativePenalty.domain;

import java.io.Serializable;

/**
 * 驾驶员案件申诉表
 * @author 蒋俊鹏
 *
 */
public class DrvCaseAppeal implements Serializable{

	private String caseid; //案件编号
	private String appealcontent;//申诉内容
	private String endtime;//最后处理时间
	private String dealuserid;//处理人
	private String appealuserid;//申诉人
	private String appealtype;//申诉决定 1 通过 2 不通过
	private int createuserid;//创建人
	private String createInstId;//创建机构
	private String createTime;//创建时间
	private String updUserId;//修改人
	private String updInstId;//修改机构
	private String updateTime;//修改时间
	private String delFlag;//删除标识  00默认 01删除
	
	public String getCaseid() {
		return caseid;
	}
	public void setCaseid(String caseid) {
		this.caseid = caseid;
	}
	public String getAppealcontent() {
		return appealcontent;
	}
	public void setAppealcontent(String appealcontent) {
		this.appealcontent = appealcontent;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getDealuserid() {
		return dealuserid;
	}
	public void setDealuserid(String dealuserid) {
		this.dealuserid = dealuserid;
	}
	public String getAppealuserid() {
		return appealuserid;
	}
	public void setAppealuserid(String appealuserid) {
		this.appealuserid = appealuserid;
	}
	public String getAppealtype() {
		return appealtype;
	}
	public void setAppealtype(String appealtype) {
		this.appealtype = appealtype;
	}
	public int getCreateuserid() {
		return createuserid;
	}
	public void setCreateuserid(int createuserid) {
		this.createuserid = createuserid;
	}
	public String getCreateInstId() {
		return createInstId;
	}
	public void setCreateInstId(String createInstId) {
		this.createInstId = createInstId;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getUpdUserId() {
		return updUserId;
	}
	public void setUpdUserId(String updUserId) {
		this.updUserId = updUserId;
	}
	public String getUpdInstId() {
		return updInstId;
	}
	public void setUpdInstId(String updInstId) {
		this.updInstId = updInstId;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	
	
	
}
