package com.cd.clothes.model;

import java.io.Serializable;

/**
 * autour m199
 * mail  2803934061@qq.com
 * date 2017/6/4
 * time 15:46
 */
public class StockInItems implements Serializable {
    /**
     * 入库详情ID
     */
    private int siid;
    /**
     * 入库号
     */
    private String sid;
    /**
     * 服装编号
     */
    private int sinumber;

    private int cid;
    /**
     * 服装对象
     */
    private Cloth cloth;

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getSiid() {
        return siid;
    }

    public void setSiid(int siid) {
        this.siid = siid;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public int getSinumber() {
        return sinumber;
    }

    public void setSinumber(int sinumber) {
        this.sinumber = sinumber;
    }

    public Cloth getCloth() {
        return cloth;
    }

    public void setCloth(Cloth cloth) {
        this.cloth = cloth;
    }

    @Override
    public String toString() {
        return "StockInItems{" +
                "siid=" + siid +
                ", sid='" + sid + '\'' +
                ", sinumber=" + sinumber +
                ", cid=" + cid +
                ", cloth=" + cloth +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        StockInItems that = (StockInItems) o;

        if (siid != that.siid) return false;
        if (sinumber != that.sinumber) return false;
        if (cid != that.cid) return false;
        if (sid != null ? !sid.equals(that.sid) : that.sid != null) return false;
        return cloth != null ? cloth.equals(that.cloth) : that.cloth == null;
    }

    @Override
    public int hashCode() {
        int result = siid;
        result = 31 * result + (sid != null ? sid.hashCode() : 0);
        result = 31 * result + sinumber;
        result = 31 * result + cid;
        result = 31 * result + (cloth != null ? cloth.hashCode() : 0);
        return result;
    }

}
