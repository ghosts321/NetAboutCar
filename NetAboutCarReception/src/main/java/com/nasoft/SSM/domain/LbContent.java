package com.nasoft.SSM.domain;

import java.io.Serializable;

/**
 * 首页轮播图 
 * @author user
 *
 */
public class LbContent implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -902404232642647163L;

	private int id;
	
	private String title;
	
	private String imgPath;
	
	private String url;
	
	private String createMan;
    
    private String createInstId;
    
    private String createDate;
    
    private String updateUserId;
    
    private String updateInstId;
    
    private String updateDateTime;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getCreateMan() {
		return createMan;
	}

	public void setCreateMan(String createMan) {
		this.createMan = createMan;
	}

	public String getCreateInstId() {
		return createInstId;
	}

	public void setCreateInstId(String createInstId) {
		this.createInstId = createInstId;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getUpdateUserId() {
		return updateUserId;
	}

	public void setUpdateUserId(String updateUserId) {
		this.updateUserId = updateUserId;
	}

	public String getUpdateInstId() {
		return updateInstId;
	}

	public void setUpdateInstId(String updateInstId) {
		this.updateInstId = updateInstId;
	}

	public String getUpdateDateTime() {
		return updateDateTime;
	}

	public void setUpdateDateTime(String updateDateTime) {
		this.updateDateTime = updateDateTime;
	}

    
}
