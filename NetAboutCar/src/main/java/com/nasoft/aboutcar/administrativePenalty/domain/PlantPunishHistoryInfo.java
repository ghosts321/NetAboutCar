package com.nasoft.aboutcar.administrativePenalty.domain;

import java.io.Serializable;
import java.util.Date;

public class PlantPunishHistoryInfo implements Serializable{
		private String CaseDealInfo;    //处理状态
		private String caseId;			//案件编号
		private int dealuserid;			//处理人
		private int roleid;				//处理角色
		private String dealcontent;		//处理内容
		private String dealview;		//处理意见
		private Date dealdatetime;		//处理时间
		private int createuserid;		//创建人
		private int createinstid;		//创建机构
		private Date createtime;		//创建时间
		private int upduserid;			//修改人
		private int updinstid;			//修改机构
		private Date upddatetime;		//修改时间
		private int delflag;			//删除标识
		public String getCaseDealInfo() {
			return CaseDealInfo;
		}
		public void setCaseDealInfo(String caseDealInfo) {
			CaseDealInfo = caseDealInfo;
		}
		public String getCaseId() {
			return caseId;
		}
		public void setCaseId(String caseId) {
			this.caseId = caseId;
		}
		public int getDealuserid() {
			return dealuserid;
		}
		public void setDealuserid(int dealuserid) {
			this.dealuserid = dealuserid;
		}
		public int getRoleid() {
			return roleid;
		}
		public void setRoleid(int roleid) {
			this.roleid = roleid;
		}
		public String getDealcontent() {
			return dealcontent;
		}
		public void setDealcontent(String dealcontent) {
			this.dealcontent = dealcontent;
		}
		public String getDealview() {
			return dealview;
		}
		public void setDealview(String dealview) {
			this.dealview = dealview;
		}
		public Date getDealdatetime() {
			return dealdatetime;
		}
		public void setDealdatetime(Date dealdatetime) {
			this.dealdatetime = dealdatetime;
		}
		public int getCreateuserid() {
			return createuserid;
		}
		public void setCreateuserid(int createuserid) {
			this.createuserid = createuserid;
		}
		public int getCreateinstid() {
			return createinstid;
		}
		public void setCreateinstid(int createinstid) {
			this.createinstid = createinstid;
		}
		public Date getCreatetime() {
			return createtime;
		}
		public void setCreatetime(Date createtime) {
			this.createtime = createtime;
		}
		public int getUpduserid() {
			return upduserid;
		}
		public void setUpduserid(int upduserid) {
			this.upduserid = upduserid;
		}
		public int getUpdinstid() {
			return updinstid;
		}
		public void setUpdinstid(int updinstid) {
			this.updinstid = updinstid;
		}
		public Date getUpddatetime() {
			return upddatetime;
		}
		public void setUpddatetime(Date upddatetime) {
			this.upddatetime = upddatetime;
		}
		public int getDelflag() {
			return delflag;
		}
		public void setDelflag(int delflag) {
			this.delflag = delflag;
		}
		
}
