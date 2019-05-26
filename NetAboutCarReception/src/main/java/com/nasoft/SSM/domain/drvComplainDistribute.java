package com.nasoft.SSM.domain;

import java.io.Serializable;
import java.util.Date;

public class drvComplainDistribute implements Serializable {
   
	private int id;//投诉受理ID
	private int drv_complain_info_id;//投诉信息id
	private String allot_depme;//受理分派部门
	private String distri_idea;//受理意见
	private String distri_peo;//受理人
	private String distri_time;//受理时间
	
	
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
	public String getAllot_depme() {
		return allot_depme;
	}
	public void setAllot_depme(String allot_depme) {
		this.allot_depme = allot_depme;
	}
	public String getDistri_idea() {
		return distri_idea;
	}
	public void setDistri_idea(String distri_idea) {
		this.distri_idea = distri_idea;
	}
	public String getDistri_peo() {
		return distri_peo;
	}
	public void setDistri_peo(String distri_peo) {
		this.distri_peo = distri_peo;
	}
	public String getDistri_time() {
		return distri_time;
	}
	public void setDistri_time(String distri_time) {
		this.distri_time = distri_time;
	}
	
	
	
	
}
