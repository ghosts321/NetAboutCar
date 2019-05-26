package com.nasoft.SSM.domain;

import java.util.List;
import java.util.Map;

/** 
 * 定义一个页面类
 *
 * */
public class PageBean {

	private int pageDQ=1;//当前页面的页码数,默认从1开始
	private int pageJL=12;//每页显示多少条。
	private int pageZS;//数据总数
	private int pageInt;//当前记录数,用于在数据库查询时截取数据
	private int pageZYS;//总页数
		
	public int getPageDQ() {
		return pageDQ;
	}	
	public void setPageDQ(int pageDQ) {
		this.pageDQ = pageDQ;
	}
	public int getPageJL() {
		return pageJL;
	}
	public void setPageJL(int pageJL) {
		this.pageJL = pageJL;
	}
	public int getPageZS() {
		return pageZS;
	}
	//在设置从数据库查询出来的数据总数时，同时计算出总页数;
	public void setPageZS(int pageZS) {
		this.pageZS = pageZS;
		setPageZYS(getPageZYS());//触发set方法调用计算页数算法
	}	
	//计算页数的算法
	public int getPageZYS() {
		int tp=pageZS/pageJL;
		 if(pageZS<pageJL){//页数修正
			tp=1;
		}else{
			tp=pageZS%pageJL==0?tp:tp+1;
		}
		return tp;
	}
	
	public void setPageZYS(int pageZYS) {
		this.pageZYS = pageZYS;
	}
	//计算需要截取的数据
	public int getPageInt() {
		if(getPageDQ()==1||getPageDQ()==0){
			pageInt=0;
			return pageInt;
		}else{
			pageInt=(getPageDQ()-1)*getPageJL();
			return pageInt;
		}	
	}

	public void setPageInt(int pageInt) {
		this.pageInt = pageInt;
	}

	
	
}
