package com.xue.bean;

/**
 * @ClassName AllMyWorkInfo
 * 描述 :
 * @Author weijunjie
 * @Date 2020/5/8 16:48
 */
public class AllMyWorkInfo extends TMyWork {

    private String cId;

    private String cName;

    private String suName;

    private String suUid;

    public String getSuName() {
        return suName;
    }

    public void setSuName(String suName) {
        this.suName = suName;
    }

    public String getSuUid() {
        return suUid;
    }

    public void setSuUid(String suUid) {
        this.suUid = suUid;
    }

    public String getcId() {
        return cId;
    }

    public void setcId(String cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }
}
