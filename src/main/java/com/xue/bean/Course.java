package com.xue.bean;

import java.io.Serializable;
import java.util.Date;

public class Course implements Serializable {
    /**
     * 课程ID
     */
    private Integer cId;

    /**
     * 课程名称
     */
    private String cName;

    /**
     * 作者ID
     */
    private Integer cSuId;

    /**
     * 图片资源ID
     */
    private Integer cSrId;

    /**
     * 排序字段由大到小排序
     */
    private Integer cOrder;

    /**
     * 作者名字
     */
    private String cAuthor;

    private String cVideo;

    /**
     * 分数
     */
    private String cScoure;

    /**
     * 发布时间
     */
    private String cUptime;

    /**
     * 生效标识 1、生效 2 失效
     */
    private String cFlag;

    private Date cCreateTime;

    private Date cUpdateTime;

    private String fileUrl;

    private String courseContent;

    private String userUid;

    public String getUserUid() {
        return userUid;
    }

    public void setUserUid(String userUid) {
        this.userUid = userUid;
    }

    public String getCourseContent() {
        return courseContent;
    }

    public void setCourseContent(String courseContent) {
        this.courseContent = courseContent;
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }

    private static final long serialVersionUID = 1L;

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName == null ? null : cName.trim();
    }

    public Integer getcSuId() {
        return cSuId;
    }

    public void setcSuId(Integer cSuId) {
        this.cSuId = cSuId;
    }

    public Integer getcSrId() {
        return cSrId;
    }

    public void setcSrId(Integer cSrId) {
        this.cSrId = cSrId;
    }

    public Integer getcOrder() {
        return cOrder;
    }

    public void setcOrder(Integer cOrder) {
        this.cOrder = cOrder;
    }

    public String getcAuthor() {
        return cAuthor;
    }

    public void setcAuthor(String cAuthor) {
        this.cAuthor = cAuthor == null ? null : cAuthor.trim();
    }

    public String getcVideo() {
        return cVideo;
    }

    public void setcVideo(String cVideo) {
        this.cVideo = cVideo == null ? null : cVideo.trim();
    }

    public String getcScoure() {
        return cScoure;
    }

    public void setcScoure(String cScoure) {
        this.cScoure = cScoure == null ? null : cScoure.trim();
    }

    public String getcUptime() {
        return cUptime;
    }

    public void setcUptime(String cUptime) {
        this.cUptime = cUptime == null ? null : cUptime.trim();
    }

    public String getcFlag() {
        return cFlag;
    }

    public void setcFlag(String cFlag) {
        this.cFlag = cFlag == null ? null : cFlag.trim();
    }

    public Date getcCreateTime() {
        return cCreateTime;
    }

    public void setcCreateTime(Date cCreateTime) {
        this.cCreateTime = cCreateTime;
    }

    public Date getcUpdateTime() {
        return cUpdateTime;
    }

    public void setcUpdateTime(Date cUpdateTime) {
        this.cUpdateTime = cUpdateTime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", cId=").append(cId);
        sb.append(", cName=").append(cName);
        sb.append(", cSuId=").append(cSuId);
        sb.append(", cSrId=").append(cSrId);
        sb.append(", cOrder=").append(cOrder);
        sb.append(", cAuthor=").append(cAuthor);
        sb.append(", cVideo=").append(cVideo);
        sb.append(", cScoure=").append(cScoure);
        sb.append(", cUptime=").append(cUptime);
        sb.append(", cFlag=").append(cFlag);
        sb.append(", cCreateTime=").append(cCreateTime);
        sb.append(", cUpdateTime=").append(cUpdateTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}