package com.cd.clothes.model;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Forgets on 2017/6/6.
 */
public class Stockout implements Serializable{
    private String soid;
    private int wid;
    private String loginName;
    private String soremark;
    private Date sotime;
    private int sostute;
    private String adress;
    private String sphone;
    private int flag;
    public int getFlag() {
        return flag;
    }
    public void setFlag(int flag) {
        this.flag = flag;
    }
    public String getSphone() {
        return sphone;
    }
    public void setSphone(String sphone) {
        this.sphone = sphone;
    }
    public String getAdress() {
        return adress;
    }
    public void setAdress(String adress) {
        this.adress = adress;
    }
    public String getSoid() {
        return soid;
    }
    public void setSoid(String soid) {
        this.soid = soid;
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
    public String getSoremark() {
        return soremark;
    }
    public void setSoremark(String soremark) {
        this.soremark = soremark;
    }
    public Date getSotime() {
        return sotime;
    }
    public void setSotime(Date sotime) {
        this.sotime = sotime;
    }
    public int getSostute() {
        return sostute;
    }
    public void setSostute(int sostute) {
        this.sostute = sostute;
    }

    @Override
    public String toString() {
        return "Stockout{" +
                "soid='" + soid + '\'' +
                ", wid=" + wid +
                ", loginName='" + loginName + '\'' +
                ", soremark='" + soremark + '\'' +
                ", sotime=" + sotime +
                ", sostute=" + sostute +
                ", adress='" + adress + '\'' +
                ", sphone='" + sphone + '\'' +
                ", flag=" + flag +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Stockout stockout = (Stockout) o;

        if (wid != stockout.wid) return false;
        if (sostute != stockout.sostute) return false;
        if (flag != stockout.flag) return false;
        if (soid != null ? !soid.equals(stockout.soid) : stockout.soid != null) return false;
        if (loginName != null ? !loginName.equals(stockout.loginName) : stockout.loginName != null) return false;
        if (soremark != null ? !soremark.equals(stockout.soremark) : stockout.soremark != null) return false;
        if (sotime != null ? !sotime.equals(stockout.sotime) : stockout.sotime != null) return false;
        if (adress != null ? !adress.equals(stockout.adress) : stockout.adress != null) return false;
        return sphone != null ? sphone.equals(stockout.sphone) : stockout.sphone == null;
    }

    @Override
    public int hashCode() {
        int result = soid != null ? soid.hashCode() : 0;
        result = 31 * result + wid;
        result = 31 * result + (loginName != null ? loginName.hashCode() : 0);
        result = 31 * result + (soremark != null ? soremark.hashCode() : 0);
        result = 31 * result + (sotime != null ? sotime.hashCode() : 0);
        result = 31 * result + sostute;
        result = 31 * result + (adress != null ? adress.hashCode() : 0);
        result = 31 * result + (sphone != null ? sphone.hashCode() : 0);
        result = 31 * result + flag;
        return result;
    }
}
