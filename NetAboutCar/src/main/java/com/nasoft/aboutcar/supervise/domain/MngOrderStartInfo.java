package com.nasoft.aboutcar.supervise.domain;

import java.math.BigDecimal;
import java.util.Date;

public class MngOrderStartInfo {
    private Integer orderStartId;

    private String companyId;

    private Integer address;

    private String orderId;

    private Integer departTime;

    private Integer orderTime;

    private String passengerNote;

    private String departure;

    private BigDecimal depLongitude;

    private BigDecimal depLatitude;

    private String destination;

    private BigDecimal deptLongitude;

    private BigDecimal deptLatitude;

    private String fareType;

    private String encrypt;

    private Integer createUser;

    private Date createTime;

    private Integer updateUser;

    private Date updateTime;

	public Integer getOrderStartId() {
		return orderStartId;
	}

	public void setOrderStartId(Integer orderStartId) {
		this.orderStartId = orderStartId;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public Integer getAddress() {
		return address;
	}

	public void setAddress(Integer address) {
		this.address = address;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public Integer getDepartTime() {
		return departTime;
	}

	public void setDepartTime(Integer departTime) {
		this.departTime = departTime;
	}

	public Integer getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Integer orderTime) {
		this.orderTime = orderTime;
	}

	public String getPassengerNote() {
		return passengerNote;
	}

	public void setPassengerNote(String passengerNote) {
		this.passengerNote = passengerNote;
	}

	public String getDeparture() {
		return departure;
	}

	public void setDeparture(String departure) {
		this.departure = departure;
	}

	public BigDecimal getDepLongitude() {
		return depLongitude;
	}

	public void setDepLongitude(BigDecimal depLongitude) {
		this.depLongitude = depLongitude;
	}

	public BigDecimal getDepLatitude() {
		return depLatitude;
	}

	public void setDepLatitude(BigDecimal depLatitude) {
		this.depLatitude = depLatitude;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public BigDecimal getDeptLongitude() {
		return deptLongitude;
	}

	public void setDeptLongitude(BigDecimal deptLongitude) {
		this.deptLongitude = deptLongitude;
	}

	public BigDecimal getDeptLatitude() {
		return deptLatitude;
	}

	public void setDeptLatitude(BigDecimal deptLatitude) {
		this.deptLatitude = deptLatitude;
	}

	public String getFareType() {
		return fareType;
	}

	public void setFareType(String fareType) {
		this.fareType = fareType;
	}

	public String getEncrypt() {
		return encrypt;
	}

	public void setEncrypt(String encrypt) {
		this.encrypt = encrypt;
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