package com.cd.clothes.model;

import java.util.Date;

/**
 * Created by Forgets on 2017/6/6.
 */
public class Stockout {
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
}
