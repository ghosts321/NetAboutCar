package com.nasoft.aboutcar.pilotapply.domain;

import java.util.Date;

public class DrvRecord {
    private Integer recordid;

    private String certno;
    
    private String pcertno;
    
    private String carid;

    private String creditcode;

    private Integer contractid;

    private String status;

    private Date createdate;

	public String getPcertno() {
		return pcertno;
	}

	public void setPcertno(String pcertno) {
		this.pcertno = pcertno;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public Integer getRecordid() {
		return recordid;
	}

	public void setRecordid(Integer recordid) {
		this.recordid = recordid;
	}

	public String getCertno() {
		return certno;
	}

	public void setCertno(String certno) {
		this.certno = certno;
	}

	public String getCarid() {
		return carid;
	}

	public void setCarid(String carid) {
		this.carid = carid;
	}

	public String getCreditcode() {
		return creditcode;
	}

	public void setCreditcode(String creditcode) {
		this.creditcode = creditcode;
	}

	public Integer getContractid() {
		return contractid;
	}

	public void setContractid(Integer contractid) {
		this.contractid = contractid;
	}
}