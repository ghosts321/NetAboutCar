package com.nasoft.aboutcar.common.domain;

import java.io.Serializable;

import com.nasoft.util.DateTime;

public class MngSerialnumber implements Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	
	//columns START
	private String id;
	private long currNo;
	private long maxNo;
	private long minNo;
	private Integer step;
	private Integer seqLen;
	private Integer isCircle;
	private String circleParam;
	private java.util.Date updateDate;
	private java.util.Date updateDateBegin;
	private java.util.Date updateDateEnd;
	private String head;
	private String tail;
	//columns END

	public MngSerialnumber(){
	}

	public MngSerialnumber(
		java.lang.String id
	){
		this.id = id;
	}

	public void setId(String value) {
		this.id = value;
	}
	
	public String getId() {
		return this.id;
	}
	public void setCurrNo(long value) {
		this.currNo = value;
	}
	
	public long getCurrNo() {
		return this.currNo;
	}
	public void setMaxNo(long value) {
		this.maxNo = value;
	}
	
	public long getMaxNo() {
		return this.maxNo;
	}
	public void setMinNo(long value) {
		this.minNo = value;
	}
	
	public long getMinNo() {
		return this.minNo;
	}
	public void setStep(Integer value) {
		this.step = value;
	}
	
	public Integer getStep() {
		return this.step;
	}
	public void setSeqLen(Integer value) {
		this.seqLen = value;
	}
	
	public Integer getSeqLen() {
		return this.seqLen;
	}
	public void setIsCircle(Integer value) {
		this.isCircle = value;
	}
	
	public Integer getIsCircle() {
		return this.isCircle;
	}
	public void setCircleParam(String value) {
		this.circleParam = value;
	}
	
	public String getCircleParam() {
		return this.circleParam;
	}
	
	public void setUpdateDateBegin(java.util.Date value) {
		this.updateDateBegin = value;
	}
	
	public java.util.Date getUpdateDateBegin() {
		return this.updateDateBegin;
	}

	public void setUpdateDateEnd(java.util.Date value) {
		this.updateDateEnd = value;
	}
	
	public java.util.Date getUpdateDateEnd() {
		return this.updateDateEnd;
	}

	public void setUpdateDate(java.util.Date value) {
		this.updateDate = value;
	}
	
	public java.util.Date getUpdateDate() {
		return this.updateDate;
	}


	public String getformatNo(){
		String currNo=String.valueOf(this.getCurrNo());
		if(this.getSeqLen()>0){
			currNo=String.format("%0"+this.getSeqLen()+"d", this.getCurrNo());
		}
		return head+currNo+tail;
	}
	

	public MngSerialnumber addTail(String tail){
		if(tail!=null && !tail.equals("")){
			this.tail+=tail;
		}
		return this;
	}
	
	public MngSerialnumber addHead(String head){
		if(head!=null && !head.equals("")){
			this.head+=head;
		}
		return this;
	}
	
	public MngSerialnumber addShotDateHead() throws Exception {
		DateTime dt=new DateTime();
		head+=dt.format("yyMMdd");
		return this;
	}
	
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	public String getTail() {
		return tail;
	}
	public void setTail(String tail) {
		this.tail = tail;
	}



}