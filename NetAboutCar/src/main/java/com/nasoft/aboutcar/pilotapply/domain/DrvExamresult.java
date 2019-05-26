package com.nasoft.aboutcar.pilotapply.domain;

import java.io.Serializable;
import java.util.Date;

public class DrvExamresult implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer resultid;//结果编号
	private String certno;//身份证号码
	private String examname;//考试名称
	private Date examdate;//考试时间
	private String examplace;//考试地点
	private String examcontent;//考试内容
	private Integer score;//得分
	private Integer totalscore;//最高得分
	private String certificate;//考评证明
	private String examresult;//考试结果
	private String remark;//备注
	private Integer createuserid;//创建人
	private Integer createinstid;//创建机构
	private Date createdatetime;//创建时间
	private Integer upduserid;//修改人
	private Integer updinstid;//修改机构
	private Date upddatetime;//修改时间
	private String examtype;//考试类型(1全国、2地方)
	public Integer getResultid() {
		return resultid;
	}
	public void setResultid(Integer resultid) {
		this.resultid = resultid;
	}
	public String getCertno() {
		return certno;
	}
	public void setCertno(String certno) {
		this.certno = certno;
	}
	public String getExamname() {
		return examname;
	}
	public void setExamname(String examname) {
		this.examname = examname;
	}
	public Date getExamdate() {
		return examdate;
	}
	public void setExamdate(Date examdate) {
		this.examdate = examdate;
	}
	public String getExamplace() {
		return examplace;
	}
	public void setExamplace(String examplace) {
		this.examplace = examplace;
	}
	public String getExamcontent() {
		return examcontent;
	}
	public void setExamcontent(String examcontent) {
		this.examcontent = examcontent;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public Integer getTotalscore() {
		return totalscore;
	}
	public void setTotalscore(Integer totalscore) {
		this.totalscore = totalscore;
	}
	public String getCertificate() {
		return certificate;
	}
	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}
	public String getExamresult() {
		return examresult;
	}
	public void setExamresult(String examresult) {
		this.examresult = examresult;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integer getCreateuserid() {
		return createuserid;
	}
	public void setCreateuserid(Integer createuserid) {
		this.createuserid = createuserid;
	}
	public Integer getCreateinstid() {
		return createinstid;
	}
	public void setCreateinstid(Integer createinstid) {
		this.createinstid = createinstid;
	}
	public Date getCreatedatetime() {
		return createdatetime;
	}
	public void setCreatedatetime(Date createdatetime) {
		this.createdatetime = createdatetime;
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
	public String getExamtype() {
		return examtype;
	}
	public void setExamtype(String examtype) {
		this.examtype = examtype;
	}
	
}