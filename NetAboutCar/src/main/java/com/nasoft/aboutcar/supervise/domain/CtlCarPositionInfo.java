package com.nasoft.aboutcar.supervise.domain;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 车辆定位信息
 * @author wanglei
 *
 */
public class CtlCarPositionInfo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**主键*/
	private Integer id;
	
	/**网约车公司统一社会信用代码*/
	private String company_id;

	/**车辆号牌*/
	private String vehicle_no;

	/**行政区划代码*/
	private Integer vehicle_region_code;

	/**定位时间*/
	private String position_time;

	/**车辆经度*/
	private BigDecimal longitude;

	/**车辆纬度*/
	private BigDecimal latitude;

	/**瞬时速度*/
	private BigDecimal speed;

	/**方向角*/
	private BigDecimal direction;
	
	/**海拔髙度*/
	private BigDecimal elevation;

	/**行驶里程*/
	private BigDecimal mileage;

	/**预警状态*/
	private Integer warnStatus;

	/**车辆状态*/
	private Integer veh_status;

	/**营运状态*/
	private Integer biz_status;

	/**订单编号*/
	private String order_id;

	/**坐标加密标识*/
	private String encrypt;

	/**创建人*/
	private Integer create_user;

	/**创建时间*/
	private String create_time;
	
	/**更改人*/
	private Integer update_user;
	
	/**更改时间*/
	private String update_time;
	
	/**网约车公司名称*/
	private String comname;
	
	/**经营区域名称*/
	private String areaname;
	
	public String getAreaname() {
		return areaname;
	}

	public void setAreaname(String areaname) {
		this.areaname = areaname;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getComname() {
		return comname;
	}
	
	/** 车主姓名*/
	private String mancompany;

	public void setComname(String comname) {
		this.comname = comname;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}

	public String getVehicle_no() {
		return vehicle_no;
	}

	public void setVehicle_no(String vehicle_no) {
		this.vehicle_no = vehicle_no;
	}

	public Integer getVehicle_region_code() {
		return vehicle_region_code;
	}

	public void setVehicle_region_code(Integer vehicle_region_code) {
		this.vehicle_region_code = vehicle_region_code;
	}

	public String getPosition_time() {
		return position_time;
	}

	public void setPosition_time(String position_time) {
		this.position_time = position_time;
	}

	public BigDecimal getLongitude() {
		return longitude;
	}

	public void setLongitude(BigDecimal longitude) {
		this.longitude = longitude;
	}

	public BigDecimal getLatitude() {
		return latitude;
	}

	public void setLatitude(BigDecimal latitude) {
		this.latitude = latitude;
	}

	public BigDecimal getSpeed() {
		return speed;
	}

	public void setSpeed(BigDecimal speed) {
		this.speed = speed;
	}

	public BigDecimal getDirection() {
		return direction;
	}

	public void setDirection(BigDecimal direction) {
		this.direction = direction;
	}

	public BigDecimal getElevation() {
		return elevation;
	}

	public void setElevation(BigDecimal elevation) {
		this.elevation = elevation;
	}

	public BigDecimal getMileage() {
		return mileage;
	}

	public void setMileage(BigDecimal mileage) {
		this.mileage = mileage;
	}

	public Integer getWarnStatus() {
		return warnStatus;
	}

	public void setWarnStatus(Integer warnStatus) {
		this.warnStatus = warnStatus;
	}

	public Integer getVeh_status() {
		return veh_status;
	}

	public void setVeh_status(Integer veh_status) {
		this.veh_status = veh_status;
	}

	public Integer getBiz_status() {
		return biz_status;
	}

	public void setBiz_status(Integer biz_status) {
		this.biz_status = biz_status;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getEncrypt() {
		return encrypt;
	}

	public void setEncrypt(String encrypt) {
		this.encrypt = encrypt;
	}

	public Integer getCreate_user() {
		return create_user;
	}

	public void setCreate_user(Integer create_user) {
		this.create_user = create_user;
	}

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	public Integer getUpdate_user() {
		return update_user;
	}

	public void setUpdate_user(Integer update_user) {
		this.update_user = update_user;
	}

	public String getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(String update_time) {
		this.update_time = update_time;
	}

	public String getMancompany() {
		return mancompany;
	}

	public void setMancompany(String mancompany) {
		this.mancompany = mancompany;
	}
}
