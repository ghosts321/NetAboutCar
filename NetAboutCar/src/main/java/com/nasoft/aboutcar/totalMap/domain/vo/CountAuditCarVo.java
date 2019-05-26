package com.nasoft.aboutcar.totalMap.domain.vo;

/**
 * 申请通过车辆VO
 * @author wangyating
 *
 */
public class CountAuditCarVo {
	private String creditcode;			//网约车公司标识
	
	private String comname;				//公司名称
	
	private String auditPassCount;		//申请通过的车辆数
	
	private String onlineCount = "0";	//当天在线车辆数

	public String getOnlineCount() {
		return onlineCount;
	}

	public void setOnlineCount(String onlineCount) {
		this.onlineCount = onlineCount;
	}

	public String getCreditcode() {
		return creditcode;
	}

	public void setCreditcode(String creditcode) {
		this.creditcode = creditcode;
	}

	public String getComname() {
		return comname;
	}

	public void setComname(String comname) {
		this.comname = comname;
	}

	public String getAuditPassCount() {
		return auditPassCount;
	}

	public void setAuditPassCount(String auditPassCount) {
		this.auditPassCount = auditPassCount;
	}
	
}
