package com.nasoft.SSM.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 驾驶员考试预约
 * @author wanglei
 *
 */
public class DrvExamBespeak implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer driver_bespeak_id;//驾驶员考试预约号
	private String certno;//驾驶员身证号
	private Integer bespeak_id;//预约号
	private String bespeak_time;//预约时段(1-上午 2 -下午)
	private Integer applyid;//驾驶员资格证申请编号
	private Integer create_user;//创建人
	private Date create_time;//创建时间
	private Integer update_user;//更改人
	private Date update_time;//更改时间
	
	private String year;//年份
	private String month;//月份
	private String address;//考试地点
	private Integer morning_count;//上午预约人数
	private Integer afternoon_count;//下午预约人数
	private Integer bespeaksum;//预约日期当天总人数
	private String bespeak_date;//预约时间
	private String exam_type;//考试类型（1：全国，2：地方）
	private Integer quanguoafternoon_count;//全国下午人数
	private Integer quanguomorning_count;//全国上午人数
	private Integer difangmorning_count;//地方上午人数
	private Integer difangafternoon_count;//地方下午人数
	private String quanguobespeak_time;//全国预约时段
	private String difangbespeak_time;//地方预约时段
	private Integer quanguobespeak_id;
	private Integer difangbespeak_id;
	public Integer getQuanguobespeak_id() {
		return quanguobespeak_id;
	}
	public void setQuanguobespeak_id(Integer quanguobespeak_id) {
		this.quanguobespeak_id = quanguobespeak_id;
	}
	public Integer getDifangbespeak_id() {
		return difangbespeak_id;
	}
	public void setDifangbespeak_id(Integer difangbespeak_id) {
		this.difangbespeak_id = difangbespeak_id;
	}
	public String getQuanguobespeak_time() {
		return quanguobespeak_time;
	}
	public void setQuanguobespeak_time(String quanguobespeak_time) {
		this.quanguobespeak_time = quanguobespeak_time;
	}
	public String getDifangbespeak_time() {
		return difangbespeak_time;
	}
	public void setDifangbespeak_time(String difangbespeak_time) {
		this.difangbespeak_time = difangbespeak_time;
	}
	public Integer getQuanguoafternoon_count() {
		return quanguoafternoon_count;
	}
	public void setQuanguoafternoon_count(Integer quanguoafternoon_count) {
		this.quanguoafternoon_count = quanguoafternoon_count;
	}
	public Integer getQuanguomorning_count() {
		return quanguomorning_count;
	}
	public void setQuanguomorning_count(Integer quanguomorning_count) {
		this.quanguomorning_count = quanguomorning_count;
	}
	public Integer getDifangmorning_count() {
		return difangmorning_count;
	}
	public void setDifangmorning_count(Integer difangmorning_count) {
		this.difangmorning_count = difangmorning_count;
	}
	public Integer getDifangafternoon_count() {
		return difangafternoon_count;
	}
	public void setDifangafternoon_count(Integer difangafternoon_count) {
		this.difangafternoon_count = difangafternoon_count;
	}
	public String getExam_type() {
		return exam_type;
	}
	public void setExam_type(String exam_type) {
		this.exam_type = exam_type;
	}
	public Integer getBespeaksum() {
		return bespeaksum;
	}
	public void setBespeaksum(Integer bespeaksum) {
		this.bespeaksum = bespeaksum;
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
	public Integer getBespeak_id() {
		return bespeak_id;
	}
	public void setBespeak_id(Integer bespeak_id) {
		this.bespeak_id = bespeak_id;
	}
	public String getBespeak_time() {
		return bespeak_time;
	}
	public void setBespeak_time(String bespeak_time) {
		this.bespeak_time = bespeak_time;
	}
	public Integer getApplyid() {
		return applyid;
	}
	public void setApplyid(Integer applyid) {
		this.applyid = applyid;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public String getBespeak_date() {
		return bespeak_date;
	}
	public void setBespeak_date(String bespeak_date) {
		this.bespeak_date = bespeak_date;
	}
	
}
