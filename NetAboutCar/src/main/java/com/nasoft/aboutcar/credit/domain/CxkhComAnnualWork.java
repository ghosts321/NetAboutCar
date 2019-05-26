package com.nasoft.aboutcar.credit.domain;

import java.util.Date;

public class CxkhComAnnualWork {
	private Integer id;
	private String year;//年度
	private String comLicense;//营运许可证号
	private Integer score;//总记分值
	private Date startDate;//开始日期
	private Date endDate;//结束日期
	private String assessLevel;//预留字段 评价等级
	private Integer createUser;
	private Date createTime;
	private Integer updateUser;
	private Date updateTime;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getComLicense() {
		return comLicense;
	}
	public void setComLicense(String comLicense) {
		this.comLicense = comLicense;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getAssessLevel() {
		return assessLevel;
	}
	public void setAssessLevel(String assessLevel) {
		this.assessLevel = assessLevel;
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
