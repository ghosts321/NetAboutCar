package com.nasoft.SSM.domain;

import java.util.Date;

public class DrvContract {
    private Integer contractid;

    private String url;

    private String type;

    private Date startdate;

    private Date enddate;

    private String createman;

    private String createinstid;

    private Date createdate;

    private String upduserid;

    private String updinstid;

    private Date upddatetime;

	public Integer getContractid() {
		return contractid;
	}

	public void setContractid(Integer contractid) {
		this.contractid = contractid;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public String getCreateman() {
		return createman;
	}

	public void setCreateman(String createman) {
		this.createman = createman;
	}

	public String getCreateinstid() {
		return createinstid;
	}

	public void setCreateinstid(String createinstid) {
		this.createinstid = createinstid;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public String getUpduserid() {
		return upduserid;
	}

	public void setUpduserid(String upduserid) {
		this.upduserid = upduserid;
	}

	public String getUpdinstid() {
		return updinstid;
	}

	public void setUpdinstid(String updinstid) {
		this.updinstid = updinstid;
	}

	public Date getUpddatetime() {
		return upddatetime;
	}

	public void setUpddatetime(Date upddatetime) {
		this.upddatetime = upddatetime;
	}
    
}