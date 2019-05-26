package com.nasoft.aboutcar.setAssemblePlace.domain;

import java.sql.Timestamp;

public class SetAssemblePlace {
	private Integer id;					//主键ID
	
	private String place_name;			//聚集地名称
	
	private String time_rate;			//时间频率
	
	private String car_warning_val;		//车辆数预警阈值
	
	private String car_alarm_val;		//车辆数报警阈值
	
	private double is_use;				//是否启用
	
	private String map_sign;			//地图标记（json格式字符串）
	
	private Integer create_user;		//创建人
	
	private Timestamp create_time;		//创建时间
	
	private Integer update_user;		//更改人
	
	private Timestamp update_time;		//更改时间
	
	private String map_type;			//图形类型（1-圆型，2-多边型）
	
	private String rotundity_radius;	//圆形半径
	
	private String count;				//聚集区域内车辆个数

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public Timestamp getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Timestamp create_time) {
		this.create_time = create_time;
	}

	public Timestamp getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(Timestamp update_time) {
		this.update_time = update_time;
	}

	public String getMap_sign() {
		return map_sign;
	}

	public void setMap_sign(String map_sign) {
		this.map_sign = map_sign;
	}

	public String getMap_type() {
		return map_type;
	}

	public void setMap_type(String map_type) {
		this.map_type = map_type;
	}

	public String getRotundity_radius() {
		return rotundity_radius;
	}

	public void setRotundity_radius(String rotundity_radius) {
		this.rotundity_radius = rotundity_radius;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPlace_name() {
		return place_name;
	}

	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}

	public String getTime_rate() {
		return time_rate;
	}

	public void setTime_rate(String time_rate) {
		this.time_rate = time_rate;
	}

	public String getCar_warning_val() {
		return car_warning_val;
	}

	public void setCar_warning_val(String car_warning_val) {
		this.car_warning_val = car_warning_val;
	}

	public String getCar_alarm_val() {
		return car_alarm_val;
	}

	public void setCar_alarm_val(String car_alarm_val) {
		this.car_alarm_val = car_alarm_val;
	}

	public double getIs_use() {
		return is_use;
	}

	public void setIs_use(double is_use) {
		this.is_use = is_use;
	}

	public Integer getCreate_user() {
		return create_user;
	}

	public void setCreate_user(Integer create_user) {
		this.create_user = create_user;
	}

	public Integer getUpdate_user() {
		return update_user;
	}

	public void setUpdate_user(Integer update_user) {
		this.update_user = update_user;
	}

}
