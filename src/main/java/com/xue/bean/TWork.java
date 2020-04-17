package com.xue.bean;

import java.io.Serializable;

public class TWork implements Serializable {
    private Integer id;

    /**
     * 课程ID
     */
    private Integer cId;

    /**
     * 用户ID
     */
    private Integer uId;

    /**
     * 资源ID
     */
    private Integer srId;

    /**
     * 标志
     */
    private String wFlag;

    /**
     * 作业名称
     */
    private String wName;

    /**
     * 作业描述
     */
    private String wComment;

    /**
     * 作业发布时间
     */
    private String wUptime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public Integer getSrId() {
        return srId;
    }

    public void setSrId(Integer srId) {
        this.srId = srId;
    }

    public String getwFlag() {
        return wFlag;
    }

    public void setwFlag(String wFlag) {
        this.wFlag = wFlag == null ? null : wFlag.trim();
    }

    public String getwName() {
        return wName;
    }

    public void setwName(String wName) {
        this.wName = wName == null ? null : wName.trim();
    }

    public String getwComment() {
        return wComment;
    }

    public void setwComment(String wComment) {
        this.wComment = wComment == null ? null : wComment.trim();
    }

    public String getwUptime() {
        return wUptime;
    }

    public void setwUptime(String wUptime) {
        this.wUptime = wUptime == null ? null : wUptime.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", cId=").append(cId);
        sb.append(", uId=").append(uId);
        sb.append(", srId=").append(srId);
        sb.append(", wFlag=").append(wFlag);
        sb.append(", wName=").append(wName);
        sb.append(", wComment=").append(wComment);
        sb.append(", wUptime=").append(wUptime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}