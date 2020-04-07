package com.xue.bean;

import java.io.Serializable;

public class CourseComment implements Serializable {
    private Integer id;

    /**
     * 评论课程
     */
    private Integer cId;

    /**
     * 评论下标
     */
    private Integer ccIndex;

    /**
     * 评论人
     */
    private String ccUser;

    /**
     * 评论人ID
     */
    private Integer ccUserId;

    /**
     * 评论时间
     */
    private String ccTime;

    /**
     * 评分
     */
    private String ccScoure;

    /**
     * 生效标识
     */
    private String ccFlag;

    /**
     * 1、课程评论 2 问题评论
     */
    private String ccType;

    /**
     * 评论内容
     */
    private String ccComment;

    private String userFile;

    private String userName;

    private String userUId;

    public String getUserUId() {
        return userUId;
    }

    public void setUserUId(String userUId) {
        this.userUId = userUId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserFile() {
        return userFile;
    }

    public void setUserFile(String userFile) {
        this.userFile = userFile;
    }

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

    public Integer getCcIndex() {
        return ccIndex;
    }

    public void setCcIndex(Integer ccIndex) {
        this.ccIndex = ccIndex;
    }

    public String getCcUser() {
        return ccUser;
    }

    public void setCcUser(String ccUser) {
        this.ccUser = ccUser == null ? null : ccUser.trim();
    }

    public Integer getCcUserId() {
        return ccUserId;
    }

    public void setCcUserId(Integer ccUserId) {
        this.ccUserId = ccUserId;
    }

    public String getCcTime() {
        return ccTime;
    }

    public void setCcTime(String ccTime) {
        this.ccTime = ccTime == null ? null : ccTime.trim();
    }

    public String getCcScoure() {
        return ccScoure;
    }

    public void setCcScoure(String ccScoure) {
        this.ccScoure = ccScoure == null ? null : ccScoure.trim();
    }

    public String getCcFlag() {
        return ccFlag;
    }

    public void setCcFlag(String ccFlag) {
        this.ccFlag = ccFlag == null ? null : ccFlag.trim();
    }

    public String getCcType() {
        return ccType;
    }

    public void setCcType(String ccType) {
        this.ccType = ccType == null ? null : ccType.trim();
    }

    public String getCcComment() {
        return ccComment;
    }

    public void setCcComment(String ccComment) {
        this.ccComment = ccComment == null ? null : ccComment.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", cId=").append(cId);
        sb.append(", ccIndex=").append(ccIndex);
        sb.append(", ccUser=").append(ccUser);
        sb.append(", ccUserId=").append(ccUserId);
        sb.append(", ccTime=").append(ccTime);
        sb.append(", ccScoure=").append(ccScoure);
        sb.append(", ccFlag=").append(ccFlag);
        sb.append(", ccType=").append(ccType);
        sb.append(", ccComment=").append(ccComment);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}