package com.cd.clothes.model;

import java.io.Serializable;
import java.util.Date;

/**
 * autour m199
 * mail  2803934061@qq.com
 * date 2017/6/4
 * time 15:46
 */
public class Stockin implements Serializable {
    /**
     * 入库号
     */
    private String sid;
    /**
     * 仓库号
     */
    private int wid;
    /**
     * 当前账户姓名
     */
    private String loginName;
    /**
     * 入库时间
     */
    private Date stime;
    /**
     * 经手人
     */
    private String sremark;
    /**
     * 状态
     */
    private int stute;

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public int getWid() {
        return wid;
    }

    public void setWid(int wid) {
        this.wid = wid;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }


    public Date getStime() {
        return stime;
    }

    public void setStime(Date stime) {
        this.stime = stime;
    }

    public String getSremark() {
        return sremark;
    }

    public void setSremark(String sremark) {
        this.sremark = sremark;
    }

    public int getStute() {
        return stute;
    }

    public void setStute(int stute) {
        this.stute = stute;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Stockin stockin = (Stockin) o;

        if (wid != stockin.wid) return false;
        if (stute != stockin.stute) return false;
        if (sid != null ? !sid.equals(stockin.sid) : stockin.sid != null) return false;
        if (loginName != null ? !loginName.equals(stockin.loginName) : stockin.loginName != null) return false;
        if (stime != null ? !stime.equals(stockin.stime) : stockin.stime != null) return false;
        return sremark != null ? sremark.equals(stockin.sremark) : stockin.sremark == null;
    }

    @Override
    public int hashCode() {
        int result = sid != null ? sid.hashCode() : 0;
        result = 31 * result + wid;
        result = 31 * result + (loginName != null ? loginName.hashCode() : 0);
        result = 31 * result + (stime != null ? stime.hashCode() : 0);
        result = 31 * result + (sremark != null ? sremark.hashCode() : 0);
        result = 31 * result + stute;
        return result;
    }

    @Override
    public String toString() {
        return "Stockin{" +
                "sid='" + sid + '\'' +
                ", wid=" + wid +
                ", loginName='" + loginName + '\'' +
                ", stime=" + stime +
                ", sremark='" + sremark + '\'' +
                ", stute=" + stute +
                '}';
    }
}
