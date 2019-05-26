package com.nasoft.aboutcar.supervise.domain;

import java.util.Date;

/**
 * 车辆定位信息
 * @author wanglei
 *
 */
public class YyjgCarPositionInfoH{
	private Integer id;//主键id
	private String company_id;//网约车公司统一社会信用代码
	private String vehicle_no;//车辆号牌
	private Integer vehicle_region_code;//行政区划代码
	private String position_time;//定位时间
	private Double longitude;//车辆经度
	private Double latitude;//车辆纬度
	private Double speed;//瞬时速度
	private Double direction;//方向角
	private Double elevation;//海拔髙度
	private Double mileage;//行驶里程
	private Integer warnstatus;//预警状态（0正常 1预警）
	private Integer veh_status;//车辆状态
	private Integer biz_status;//营运状态
	private String order_id;//订单编号
	private String encrypt;//坐标加密标识
	private Integer create_user;//创建人
	private Date create_time;//创建时间
	private Integer update_user;//更改人
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
	public Double getLongitude() {
		return longitude;
	}
	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}
	public Double getLatitude() {
		return latitude;
	}
	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
	public Double getSpeed() {
		return speed;
	}
	public void setSpeed(Double speed) {
		this.speed = speed;
	}
	public Double getDirection() {
		return direction;
	}
	public void setDirection(Double direction) {
		this.direction = direction;
	}
	public Double getElevation() {
		return elevation;
	}
	public void setElevation(Double elevation) {
		this.elevation = elevation;
	}
	public Double getMileage() {
		return mileage;
	}
	public void setMileage(Double mileage) {
		this.mileage = mileage;
	}
	public Integer getWarnstatus() {
		return warnstatus;
	}
	public void setWarnstatus(Integer warnstatus) {
		this.warnstatus = warnstatus;
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
	
}
