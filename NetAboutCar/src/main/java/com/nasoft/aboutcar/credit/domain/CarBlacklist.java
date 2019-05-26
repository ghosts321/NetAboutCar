package com.nasoft.aboutcar.credit.domain;

import java.io.Serializable;
import java.util.Date;

public class CarBlacklist implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String carid;//车辆编号
	private String carnum;//车牌号
	private String enginenum;//发动机号
	private String certno;//身份证号码
	private Date storage_date;//入库日期
	private String storage_reason;//入库原因
	private String storage_file;//入库材料
	private String storager;//入库经办人
	private Date remove_date;//移除日期
	private String remove_reason;//移除原因
	private String remove_file;//移除材料
	private String remover;//移除经办人
	private Date pre_remove_date;//预定移除日期
	private String status;//状态（0：未移除，1：移除）
	private String bl_type;//类型
	private Integer create_user;
	private String create_time;
	private Integer update_user;
	private String update_time;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCarid() {
		return carid;
	}
	public void setCarid(String carid) {
		this.carid = carid;
	}
	public String getCarnum() {
		return carnum;
	}
	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}
	public String getEnginenum() {
		return enginenum;
	}
	public void setEnginenum(String enginenum) {
		this.enginenum = enginenum;
	}
	public String getCertno() {
		return certno;
	}
	public void setCertno(String certno) {
		this.certno = certno;
	}
	public Date getStorage_date() {
		return storage_date;
	}
	public void setStorage_date(Date storage_date) {
		this.storage_date = storage_date;
	}
	public String getStorage_reason() {
		return storage_reason;
	}
	public void setStorage_reason(String storage_reason) {
		this.storage_reason = storage_reason;
	}
	public String getStorage_file() {
		return storage_file;
	}
	public void setStorage_file(String storage_file) {
		this.storage_file = storage_file;
	}
	public String getStorager() {
		return storager;
	}
	public void setStorager(String storager) {
		this.storager = storager;
	}
	public Date getRemove_date() {
		return remove_date;
	}
	public void setRemove_date(Date remove_date) {
		this.remove_date = remove_date;
	}
	public String getRemove_reason() {
		return remove_reason;
	}
	public void setRemove_reason(String remove_reason) {
		this.remove_reason = remove_reason;
	}
	public String getRemove_file() {
		return remove_file;
	}
	public void setRemove_file(String remove_file) {
		this.remove_file = remove_file;
	}
	public String getRemover() {
		return remover;
	}
	public void setRemover(String remover) {
		this.remover = remover;
	}
	public Date getPre_remove_date() {
		return pre_remove_date;
	}
	public void setPre_remove_date(Date pre_remove_date) {
		this.pre_remove_date = pre_remove_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getBl_type() {
		return bl_type;
	}
	public void setBl_type(String bl_type) {
		this.bl_type = bl_type;
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
	
}
