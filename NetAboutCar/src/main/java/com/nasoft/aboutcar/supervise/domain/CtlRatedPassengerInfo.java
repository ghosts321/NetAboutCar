package com.nasoft.aboutcar.supervise.domain;

import java.util.Date;

public class CtlRatedPassengerInfo {
    private Integer id;

    private String companyId;

    private Integer orderId;

    private Long evaluateTime;

    private Integer serviceScore;

    private Integer driverScore;

    private Integer vehicleScore;

    private String detail;

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

    public String getCompanyId() {
        return companyId;
    }

    public void setCompanyId(String companyId) {
        this.companyId = companyId == null ? null : companyId.trim();
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Long getEvaluateTime() {
        return evaluateTime;
    }

    public void setEvaluateTime(Long evaluateTime) {
        this.evaluateTime = evaluateTime;
    }

    public Integer getServiceScore() {
        return serviceScore;
    }

    public void setServiceScore(Integer serviceScore) {
        this.serviceScore = serviceScore;
    }

    public Integer getDriverScore() {
        return driverScore;
    }

    public void setDriverScore(Integer driverScore) {
        this.driverScore = driverScore;
    }

    public Integer getVehicleScore() {
        return vehicleScore;
    }

    public void setVehicleScore(Integer vehicleScore) {
        this.vehicleScore = vehicleScore;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail == null ? null : detail.trim();
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