package com.nasoft.aboutcar.exam.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 预约管理
 * @author wanglei
 *
 */
public class MngExamBespeak implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer bespeak_id;//考试预约号
	private String address;//考试地点
	private String exam_name;//考试名称
	private String exam_type;//考试类型
	private String exam_content;//考试内容
	private String year;//年份
	private String month;//月份
	private String bespeak_date;//预约日期
	private Integer morning_count;//上午预约人数
	private Integer afternoon_count;//下午预约人数
	private Integer create_user;//创建人
	private Date create_time;//创建时间
	private Integer update_user;//更改人
	private Date update_time;//更改时间
	
	private Integer driver_bespeak_id;//驾驶员考试预约号
	private String username;//驾驶员姓名
	private String certno;//驾驶员身份证号
	private Integer bespeak_time;//预约时段（1：上午，2：下午）
	private Integer applyid;//申请编号
	private Integer score;//考试成绩
	private String examresult;//考试结果（1：通过，2：不通过）
	private String createdatetime;//成绩导入时间
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public String getExamresult() {
		return examresult;
	}
	public void setExamresult(String examresult) {
		this.examresult = examresult;
	}
	public String getCreatedatetime() {
		return createdatetime;
	}
	public void setCreatedatetime(String createdatetime) {
		this.createdatetime = createdatetime;
	}
	public Integer getBespeak_id() {
		return bespeak_id;
	}
	public void setBespeak_id(Integer bespeak_id) {
		this.bespeak_id = bespeak_id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getExam_name() {
		return exam_name;
	}
	public void setExam_name(String exam_name) {
		this.exam_name = exam_name;
	}
	public String getExam_type() {
		return exam_type;
	}
	public void setExam_type(String exam_type) {
		this.exam_type = exam_type;
	}
	public String getExam_content() {
		return exam_content;
	}
	public void setExam_content(String exam_content) {
		this.exam_content = exam_content;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getBespeak_date() {
		return bespeak_date;
	}
	public void setBespeak_date(String bespeak_date) {
		this.bespeak_date = bespeak_date;
	}
	public Integer getMorning_count() {
		return morning_count;
	}
	public void setMorning_count(Integer morning_count) {
		this.morning_count = morning_count;
	}
	public Integer getAfternoon_count() {
		return afternoon_count;
	}
	public void setAfternoon_count(Integer afternoon_count) {
		this.afternoon_count = afternoon_count;
	}
	public Integer getCreate_user() {
		return create_user;
	}
	public void setCreate_user(Integer create_user) {
		this.create_user = create_user;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public Integer getUpdate_user() {
		return update_user;
	}
	public void setUpdate_user(Integer update_user) {
		this.update_user = update_user;
	}
	public Date getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}
	public Integer getDriver_bespeak_id() {
		return driver_bespeak_id;
	}
	public void setDriver_bespeak_id(Integer driver_bespeak_id) {
		this.driver_bespeak_id = driver_bespeak_id;
	}
	public String getCertno() {
		return certno;
	}
	public void setCertno(String certno) {
		this.certno = certno;
	}
	public Integer getBespeak_time() {
		return bespeak_time;
	}
	public void setBespeak_time(Integer bespeak_time) {
		this.bespeak_time = bespeak_time;
	}
	public Integer getApplyid() {
		return applyid;
	}
	public void setApplyid(Integer applyid) {
		this.applyid = applyid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
}
