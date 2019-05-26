package com.nasoft.aboutcar.totalMap.domain.vo;

/**
 * 审批通过驾驶员VO
 * @author wangyating
 *
 */
public class CountPeopleVo {
	private String comname;		//公司名称
	
	private String peopleCount;		//当天在线车辆数

	public String getComname() {
		return comname;
	}

	public void setComname(String comname) {
		this.comname = comname;
	}

	public String getPeopleCount() {
		return peopleCount;
	}

	public void setPeopleCount(String peopleCount) {
		this.peopleCount = peopleCount;
	}
	
}
