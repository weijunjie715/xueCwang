package com.xue.bean;

import java.io.Serializable;

public class TMyWork implements Serializable {
    private Integer id;

    private Integer wId;

    private Integer suId;

    private String wType;

    private Integer srId;

    private String wName;

    private String wCommon;

    private String wUptime;

    private String wScore = "";

    private String wStatus;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getwId() {
        return wId;
    }

    public void setwId(Integer wId) {
        this.wId = wId;
    }

    public Integer getSuId() {
        return suId;
    }

    public void setSuId(Integer suId) {
        this.suId = suId;
    }

    public String getwType() {
        return wType;
    }

    public void setwType(String wType) {
        this.wType = wType == null ? null : wType.trim();
    }

    public Integer getSrId() {
        return srId;
    }

    public void setSrId(Integer srId) {
        this.srId = srId;
    }

    public String getwName() {
        return wName;
    }

    public void setwName(String wName) {
        this.wName = wName == null ? null : wName.trim();
    }

    public String getwCommon() {
        return wCommon;
    }

    public void setwCommon(String wCommon) {
        this.wCommon = wCommon == null ? null : wCommon.trim();
    }

    public String getwUptime() {
        return wUptime;
    }

    public void setwUptime(String wUptime) {
        this.wUptime = wUptime == null ? null : wUptime.trim();
    }

    public String getwScore() {
        return wScore;
    }

    public void setwScore(String wScore) {
        this.wScore = wScore == null ? null : wScore.trim();
    }

    public String getwStatus() {
        return wStatus;
    }

    public void setwStatus(String wStatus) {
        this.wStatus = wStatus == null ? null : wStatus.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", wId=").append(wId);
        sb.append(", suId=").append(suId);
        sb.append(", wType=").append(wType);
        sb.append(", srId=").append(srId);
        sb.append(", wName=").append(wName);
        sb.append(", wCommon=").append(wCommon);
        sb.append(", wUptime=").append(wUptime);
        sb.append(", wScore=").append(wScore);
        sb.append(", wStatus=").append(wStatus);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}