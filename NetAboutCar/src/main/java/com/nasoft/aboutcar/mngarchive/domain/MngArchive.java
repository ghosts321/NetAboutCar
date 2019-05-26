package com.nasoft.aboutcar.mngarchive.domain;

import java.util.Date;

public class MngArchive {
    private Integer archiveid;

    private String archivenum;

    private String archivename;

    private String archivetype;

    private String applyid;

    private Date createtime;

    public Integer getArchiveid() {
        return archiveid;
    }

    public void setArchiveid(Integer archiveid) {
        this.archiveid = archiveid;
    }

    public String getArchivenum() {
        return archivenum;
    }

    public void setArchivenum(String archivenum) {
        this.archivenum = archivenum;
    }

    public String getArchivename() {
        return archivename;
    }

    public void setArchivename(String archivename) {
        this.archivename = archivename;
    }

    public String getArchivetype() {
        return archivetype;
    }

    public void setArchivetype(String archivetype) {
        this.archivetype = archivetype;
    }

    public String getApplyid() {
        return applyid;
    }

    public void setApplyid(String applyid) {
        this.applyid = applyid;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}