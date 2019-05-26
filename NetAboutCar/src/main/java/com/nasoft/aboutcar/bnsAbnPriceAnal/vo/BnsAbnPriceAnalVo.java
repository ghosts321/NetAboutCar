package com.nasoft.aboutcar.bnsAbnPriceAnal.vo;

/**
 * 异常运价分析VO
 * @author wangyating
 *
 */
public class BnsAbnPriceAnalVo {
	private String comname;				//网约车公司名称
	
	private String companyId;			//网约车公司标识
	
	private Integer orderTotal;			//订单总数
	
	private String exceptionDesc;		//异常说明
	
	private Integer exceptionTotal;		//异常订单总数
	
	private Double abnormalRate;		//异常率

	public String getComname() {
		return comname;
	}

	public void setComname(String comname) {
		this.comname = comname;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public Integer getOrderTotal() {
		return orderTotal;
	}

	public void setOrderTotal(Integer orderTotal) {
		this.orderTotal = orderTotal;
	}

	public String getExceptionDesc() {
		return exceptionDesc;
	}

	public void setExceptionDesc(String exceptionDesc) {
		this.exceptionDesc = exceptionDesc;
	}

	public Integer getExceptionTotal() {
		return exceptionTotal;
	}

	public void setExceptionTotal(Integer exceptionTotal) {
		this.exceptionTotal = exceptionTotal;
	}

	public Double getAbnormalRate() {
		return abnormalRate;
	}

	public void setAbnormalRate(Double abnormalRate) {
		this.abnormalRate = abnormalRate;
	}
	
}
