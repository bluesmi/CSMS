package com.cd.clothes.model;

import java.io.Serializable;

/**
 * 仓库名
 */
public class Warehouse implements Serializable {
    /**
     * 仓库号
     */
    private int wid;
    /**
     * 仓库名，地址
     */
    private String wname;
    /**
     * 仓库管理员姓名
     */
    private String wuser;
    /**
     * 仓库管理员电话
     */
    private String wphone;
    /**
     * 最大库存
     */
    private int wnumber;

    public int getWid() {
        return wid;
    }

    public void setWid(int wid) {
        this.wid = wid;
    }

    public String getWname() {
        return wname;
    }

    public void setWname(String wname) {
        this.wname = wname;
    }

    public String getWuser() {
        return wuser;
    }

    public void setWuser(String wuser) {
        this.wuser = wuser;
    }

    public String getWphone() {
        return wphone;
    }

    public void setWphone(String wphone) {
        this.wphone = wphone;
    }

    public int getWnumber() {
        return wnumber;
    }

    public void setWnumber(int wnumber) {
        this.wnumber = wnumber;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Warehouse warehouse = (Warehouse) o;

        if (wid != warehouse.wid) return false;
        if (wnumber != warehouse.wnumber) return false;
        if (wname != null ? !wname.equals(warehouse.wname) : warehouse.wname != null) return false;
        if (wuser != null ? !wuser.equals(warehouse.wuser) : warehouse.wuser != null) return false;
        return wphone != null ? wphone.equals(warehouse.wphone) : warehouse.wphone == null;
    }

    @Override
    public int hashCode() {
        int result = wid;
        result = 31 * result + (wname != null ? wname.hashCode() : 0);
        result = 31 * result + (wuser != null ? wuser.hashCode() : 0);
        result = 31 * result + (wphone != null ? wphone.hashCode() : 0);
        result = 31 * result + wnumber;
        return result;
    }

    @Override
    public String toString() {
        return "Warehouse{" +
                "wid=" + wid +
                ", wname='" + wname + '\'' +
                ", wuser='" + wuser + '\'' +
                ", wphone='" + wphone + '\'' +
                ", wnumber=" + wnumber +
                '}';
    }
}
