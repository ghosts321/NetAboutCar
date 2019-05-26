package com.nasoft.SSM.domain;

import java.io.Serializable;

public class drvComplainDispose implements Serializable {

	private int id;//投诉处理id
	private int drv_complain_info_id;//投诉信息id
	private String dis_type;//处理类型（0-不做处理；1-口头警告；2-培训教育；3-退款；4-转发行政处罚）
	private String is_integrity;//是否纳入诚信考核（0-不纳入诚信考核；1-纳入诚信考核【处理类型非0的都记录诚信考核】）
	private String is_blacklist;//是否加入黑名单（0-不加入黑名单；1-加入黑名单）
	private String survey_file;//调查文件
	private String survey_idea;//调查意见
	private String dis_idea;//处理意见
	private String idea_peo;//处理人
	private String idea_time;//处理时间
	private String appl_idea_peo;//申诉处理人
	private String appl_idea_time;//申诉处理时间
	

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDrv_complain_info_id() {
		return drv_complain_info_id;
	}
	public void setDrv_complain_info_id(int drv_complain_info_id) {
		this.drv_complain_info_id = drv_complain_info_id;
	}
	public String getDis_type() {
		return dis_type;
	}
	public void setDis_type(String dis_type) {
		this.dis_type = dis_type;
	}
	public String getIs_integrity() {
		return is_integrity;
	}
	public void setIs_integrity(String is_integrity) {
		this.is_integrity = is_integrity;
	}
	public String getIs_blacklist() {
		return is_blacklist;
	}
	public void setIs_blacklist(String is_blacklist) {
		this.is_blacklist = is_blacklist;
	}
	public String getSurvey_file() {
		return survey_file;
	}
	public void setSurvey_file(String survey_file) {
		this.survey_file = survey_file;
	}
	public String getSurvey_idea() {
		return survey_idea;
	}
	public void setSurvey_idea(String survey_idea) {
		this.survey_idea = survey_idea;
	}
	public String getDis_idea() {
		return dis_idea;
	}
	public void setDis_idea(String dis_idea) {
		this.dis_idea = dis_idea;
	}
	public String getIdea_peo() {
		return idea_peo;
	}
	public void setIdea_peo(String idea_peo) {
		this.idea_peo = idea_peo;
	}
	public String getIdea_time() {
		return idea_time;
	}
	public void setIdea_time(String idea_time) {
		this.idea_time = idea_time;
	}
	public String getAppl_idea_peo() {
		return appl_idea_peo;
	}
	public void setAppl_idea_peo(String appl_idea_peo) {
		this.appl_idea_peo = appl_idea_peo;
	}
	public String getAppl_idea_time() {
		return appl_idea_time;
	}
	public void setAppl_idea_time(String appl_idea_time) {
		this.appl_idea_time = appl_idea_time;
	}
	
}
