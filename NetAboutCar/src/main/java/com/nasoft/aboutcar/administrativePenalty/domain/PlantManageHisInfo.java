package com.nasoft.aboutcar.administrativePenalty.domain;

import java.io.Serializable;
import java.util.Date;

public class PlantManageHisInfo implements Serializable{
			private String caseId;				//案件编号
			private String altercontentb;		//修改内容(之前)
			private String alterzd;				//修改字段
			private int createuserid;			//创建人
			private int createinstid;			//创建机构
			private Date createtime;			//创建时间
			private String upduserid;				//修改人
			private int updinstid;				//修改机构
			private Date updatetime;			//修改时间
			private int delflag;				//删除标识
			private String altercontenta;		//修改内容(之后)
			
			
			public String getAltercontenta() {
				return altercontenta;
			}
			public void setAltercontenta(String altercontenta) {
				this.altercontenta = altercontenta;
			}
			public String getCaseId() {
				return caseId;
			}
			public void setCaseId(String caseId) {
				this.caseId = caseId;
			}
			public String getAltercontentb() {
				return altercontentb;
			}
			public void setAltercontentb(String altercontentb) {
				this.altercontentb = altercontentb;
			}
			public String getAlterzd() {
				return alterzd;
			}
			public void setAlterzd(String alterzd) {
				this.alterzd = alterzd;
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
			
			public String getUpduserid() {
				return upduserid;
			}
			public void setUpduserid(String upduserid) {
				this.upduserid = upduserid;
			}
			public int getUpdinstid() {
				return updinstid;
			}
			public void setUpdinstid(int updinstid) {
				this.updinstid = updinstid;
			}
			
			public Date getUpdatetime() {
				return updatetime;
			}
			public void setUpdatetime(Date updatetime) {
				this.updatetime = updatetime;
			}
			public int getDelflag() {
				return delflag;
			}
			public void setDelflag(int delflag) {
				this.delflag = delflag;
			}
			
			
}
