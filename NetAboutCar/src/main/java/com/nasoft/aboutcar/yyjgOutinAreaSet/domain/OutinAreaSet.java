package com.nasoft.aboutcar.yyjgOutinAreaSet.domain;

import java.sql.Timestamp;

/**
 * 禁止驶入区域
 * @author user
 *
 */
public class OutinAreaSet {
	private Integer id;				//主键id
	
	private String area_name;		//区域名称
	
	private Double is_use;			//是否启用（0-停用；1-启用）
	
	private String map_type;		//区域绘制类型（1-圆型，2-多边型）
	
	private String rotundity_radius;//圆形半径
	
	private String map_sign;		//地图标记
	
	private Integer create_user;	//创建人
	
	private Timestamp create_time;	//创建时间
	
	private Integer update_user;	//更改人
	
	private Timestamp update_time;	//更改时间
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getArea_name() {
		return area_name;
	}
	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}
	public Double getIs_use() {
		return is_use;
	}
	public void setIs_use(Double is_use) {
		this.is_use = is_use;
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
	public String getMap_sign() {
		return map_sign;
	}
	public void setMap_sign(String map_sign) {
		this.map_sign = map_sign;
	}
	public Integer getCreate_user() {
		return create_user;
	}
	public void setCreate_user(Integer create_user) {
		this.create_user = create_user;
	}
	public Timestamp getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Timestamp create_time) {
		this.create_time = create_time;
	}
	public Integer getUpdate_user() {
		return update_user;
	}
	public void setUpdate_user(Integer update_user) {
		this.update_user = update_user;
	}
	public Timestamp getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Timestamp update_time) {
		this.update_time = update_time;
	}
}
