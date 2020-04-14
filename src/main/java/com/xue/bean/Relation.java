package com.xue.bean;

import java.io.Serializable;

public class Relation implements Serializable {
    private Integer id;

    /**
     * 主ID
     */
    private Integer userId;

    /**
     * 关系ID
     */
    private Integer relationId;

    /**
     * 附件ID
     */
    private Integer srId;

    /**
     * 关系类型 1：关注 2 订阅 3 学习 4 作业
     */
    private String relationType;

    /**
     * 关系标志 1 生效 0 失效
     */
    private String rFlag;

    /**
     * 关系备注
     */
    private String rRemark;

    /**
     * 发布时间
     */
    private String upTime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getRelationId() {
        return relationId;
    }

    public void setRelationId(Integer relationId) {
        this.relationId = relationId;
    }

    public Integer getSrId() {
        return srId;
    }

    public void setSrId(Integer srId) {
        this.srId = srId;
    }

    public String getRelationType() {
        return relationType;
    }

    public void setRelationType(String relationType) {
        this.relationType = relationType == null ? null : relationType.trim();
    }

    public String getrFlag() {
        return rFlag;
    }

    public void setrFlag(String rFlag) {
        this.rFlag = rFlag == null ? null : rFlag.trim();
    }

    public String getrRemark() {
        return rRemark;
    }

    public void setrRemark(String rRemark) {
        this.rRemark = rRemark == null ? null : rRemark.trim();
    }

    public String getUpTime() {
        return upTime;
    }

    public void setUpTime(String upTime) {
        this.upTime = upTime == null ? null : upTime.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", userId=").append(userId);
        sb.append(", relationId=").append(relationId);
        sb.append(", srId=").append(srId);
        sb.append(", relationType=").append(relationType);
        sb.append(", rFlag=").append(rFlag);
        sb.append(", rRemark=").append(rRemark);
        sb.append(", upTime=").append(upTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}