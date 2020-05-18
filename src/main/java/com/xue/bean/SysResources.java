package com.xue.bean;

import java.io.Serializable;
import java.util.Date;

public class SysResources implements Serializable {
    private Integer id;

    /**
     * 描述
     */
    private String srName;

    /**
     * 类型 1、轮播图 2 课程图 3 头像
     */
    private String srType;

    /**
     * 文件路径
     */
    private String file;

    /**
     * 访问地址
     */
    private String url;

    /**
     * 下标
     */
    private Integer srIndex;

    /**
     * 外部ID
     */
    private Integer outId;

    /**
     * 标志 1 生效 2 取消
     */
    private Integer flag;

    /**
     * 备注
     */
    private String remarks;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;

    private String userUuId;

    private String userName;

    private String upTime;

    public String getUpTime() {
        return upTime;
    }

    public void setUpTime(String upTime) {
        this.upTime = upTime;
    }

    public String getUserUuId() {
        return userUuId;
    }

    public void setUserUuId(String userUuId) {
        this.userUuId = userUuId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSrName() {
        return srName;
    }

    public void setSrName(String srName) {
        this.srName = srName == null ? null : srName.trim();
    }

    public String getSrType() {
        return srType;
    }

    public void setSrType(String srType) {
        this.srType = srType == null ? null : srType.trim();
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file == null ? null : file.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public Integer getSrIndex() {
        return srIndex;
    }

    public void setSrIndex(Integer srIndex) {
        this.srIndex = srIndex;
    }

    public Integer getOutId() {
        return outId;
    }

    public void setOutId(Integer outId) {
        this.outId = outId;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
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

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", srName=").append(srName);
        sb.append(", srType=").append(srType);
        sb.append(", file=").append(file);
        sb.append(", url=").append(url);
        sb.append(", srIndex=").append(srIndex);
        sb.append(", outId=").append(outId);
        sb.append(", flag=").append(flag);
        sb.append(", remarks=").append(remarks);
        sb.append(", createTime=").append(createTime);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}