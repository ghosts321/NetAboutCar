package com.nasoft.aboutcar.rolemenu.domain;

import java.io.Serializable;

public class RoleMenu implements Serializable{

	private int rmId;//权限编号
	  
	private int roleId;//角色编号
	  
	private String menuId;//菜单编号
	  
	private int createUserId;//创建人
	  
	private String createInstId;//创建机构
	  
	private String createDateTime;//创建时间
	  
	private int updUserId;//修改人
	  
	private String updInstId;//修改机构

	public RoleMenu() {
		super();
	}

	public RoleMenu(int roleId, String menuId, int createUserId,
			String createInstId, String createDateTime) {
		this.roleId = roleId;
		this.menuId = menuId;
		this.createUserId = createUserId;
		this.createInstId = createInstId;
		this.createDateTime = createDateTime;
	}

	public int getRmId() {
		return rmId;
	}

	public void setRmId(int rmId) {
		this.rmId = rmId;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public int getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(int createUserId) {
		this.createUserId = createUserId;
	}

	public String getCreateInstId() {
		return createInstId;
	}

	public void setCreateInstId(String createInstId) {
		this.createInstId = createInstId;
	}

	public String getCreateDateTime() {
		return createDateTime;
	}

	public void setCreateDateTime(String createDateTime) {
		this.createDateTime = createDateTime;
	}

	public int getUpdUserId() {
		return updUserId;
	}

	public void setUpdUserId(int updUserId) {
		this.updUserId = updUserId;
	}

	public String getUpdInstId() {
		return updInstId;
	}

	public void setUpdInstId(String updInstId) {
		this.updInstId = updInstId;
	}
	
	
}
