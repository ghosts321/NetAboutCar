package com.nasoft.SSM.domain;

import java.io.Serializable;
import java.util.Date;

public class drvBlackList implements Serializable{
	private String drv_license;//驾驶证号
	private String drv_id;//身份证号
	private String drv_name;//姓名
	private String status;//状态
	private Date storage_date;//入库日期
	private String storage_reason;//入库原因
	private String storage_file;//入库材料
	private String storager;//入库经办人
	private Date remove_date;//移除日期
	private String remove_reason;//移出原因
	private String remove_file;//移出材料
	private String remover;//移出经办人
	private Date pre_remove_date;//预定移出日期
	private int create_user;//创建人
	private String create_time;//创建时间
	private int update_user;//修改人
	private String update_time;//修改时间
	
	public String getDrv_license() {
		return drv_license;
	}
	public void setDrv_license(String drv_license) {
		this.drv_license = drv_license;
	}
	public String getDrv_id() {
		return drv_id;
	}
	public void setDrv_id(String drv_id) {
		this.drv_id = drv_id;
	}
	public String getDrv_name() {
		return drv_name;
	}
	public void setDrv_name(String drv_name) {
		this.drv_name = drv_name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public int getCreate_user() {
		return create_user;
	}
	public void setCreate_user(int create_user) {
		this.create_user = create_user;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public int getUpdate_user() {
		return update_user;
	}
	public void setUpdate_user(int update_user) {
		this.update_user = update_user;
	}
	public String getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(String update_time) {
		this.update_time = update_time;
	}

	
}
