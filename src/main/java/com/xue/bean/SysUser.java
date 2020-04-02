package com.xue.bean;

import java.io.Serializable;
import java.util.Date;

public class SysUser implements Serializable {
    private Integer suId;

    /**
     * 用户编号
     */
    private String suUuid;

    /**
     * 昵称
     */
    private String suName;

    /**
     * 账号
     */
    private String suCode;

    /**
     * 密码
     */
    private String suPwd;

    /**
     * 邮箱
     */
    private String suEmail;

    /**
     * 性别
     */
    private String suSex;

    /**
     * 手机号
     */
    private String suPhone;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 头像文件ID
     */
    private Integer suSrId;

    /**
     * 生日
     */
    private String suBirthday;

    /**
     * 个人描述
     */
    private String suReason;

    /**
     * 角色
     */
    private String suRole;

    /**
     * 最后登录地址
     */
    private String suLastIp;

    /**
     * 最后登录时间
     */
    private Date suLastTime;

    private static final long serialVersionUID = 1L;

    public Integer getSuId() {
        return suId;
    }

    public void setSuId(Integer suId) {
        this.suId = suId;
    }

    public String getSuUuid() {
        return suUuid;
    }

    public void setSuUuid(String suUuid) {
        this.suUuid = suUuid == null ? null : suUuid.trim();
    }

    public String getSuName() {
        return suName;
    }

    public void setSuName(String suName) {
        this.suName = suName == null ? null : suName.trim();
    }

    public String getSuCode() {
        return suCode;
    }

    public void setSuCode(String suCode) {
        this.suCode = suCode == null ? null : suCode.trim();
    }

    public String getSuPwd() {
        return suPwd;
    }

    public void setSuPwd(String suPwd) {
        this.suPwd = suPwd == null ? null : suPwd.trim();
    }

    public String getSuEmail() {
        return suEmail;
    }

    public void setSuEmail(String suEmail) {
        this.suEmail = suEmail == null ? null : suEmail.trim();
    }

    public String getSuSex() {
        return suSex;
    }

    public void setSuSex(String suSex) {
        this.suSex = suSex == null ? null : suSex.trim();
    }

    public String getSuPhone() {
        return suPhone;
    }

    public void setSuPhone(String suPhone) {
        this.suPhone = suPhone == null ? null : suPhone.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getSuSrId() {
        return suSrId;
    }

    public void setSuSrId(Integer suSrId) {
        this.suSrId = suSrId;
    }

    public String getSuBirthday() {
        return suBirthday;
    }

    public void setSuBirthday(String suBirthday) {
        this.suBirthday = suBirthday == null ? null : suBirthday.trim();
    }

    public String getSuReason() {
        return suReason;
    }

    public void setSuReason(String suReason) {
        this.suReason = suReason == null ? null : suReason.trim();
    }

    public String getSuRole() {
        return suRole;
    }

    public void setSuRole(String suRole) {
        this.suRole = suRole == null ? null : suRole.trim();
    }

    public String getSuLastIp() {
        return suLastIp;
    }

    public void setSuLastIp(String suLastIp) {
        this.suLastIp = suLastIp == null ? null : suLastIp.trim();
    }

    public Date getSuLastTime() {
        return suLastTime;
    }

    public void setSuLastTime(Date suLastTime) {
        this.suLastTime = suLastTime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", suId=").append(suId);
        sb.append(", suUuid=").append(suUuid);
        sb.append(", suName=").append(suName);
        sb.append(", suCode=").append(suCode);
        sb.append(", suPwd=").append(suPwd);
        sb.append(", suEmail=").append(suEmail);
        sb.append(", suSex=").append(suSex);
        sb.append(", suPhone=").append(suPhone);
        sb.append(", createTime=").append(createTime);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", suSrId=").append(suSrId);
        sb.append(", suBirthday=").append(suBirthday);
        sb.append(", suReason=").append(suReason);
        sb.append(", suRole=").append(suRole);
        sb.append(", suLastIp=").append(suLastIp);
        sb.append(", suLastTime=").append(suLastTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}