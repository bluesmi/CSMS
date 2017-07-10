package com.cd.clothes.model;

import java.io.Serializable;

/**
 * 出库详情
 */
public class StockoutItems implements Serializable {
    /**
     * 出库详情主键
     */
    private int soiid;
    /**
     * 出库表的主键
     */
    private String soid;
    /**
     * 服装ID
     */
    private int cid;
    private Cloth cloth;
    /**
     * 出库数量
     */
    private int sonumber;
    public int getSoiid() {
        return soiid;
    }
    public Cloth getCloth() {
        return cloth;
    }
    public void setCloth(Cloth cloth) {
        this.cloth = cloth;
    }
    public void setSoiid(int soiid) {
        this.soiid = soiid;
    }
    public String getSoid() {
        return soid;
    }
    public void setSoid(String soid) {
        this.soid = soid;
    }
    public int getCid() {
        return cid;
    }
    public void setCid(int cid) {
        this.cid = cid;
    }
    public int getSonumber() {
        return sonumber;
    }
    public void setSonumber(int sonumber) {
        this.sonumber = sonumber;
    }

    @Override
    public String toString() {
        return "StockoutItems{" +
                "soiid=" + soiid +
                ", soid='" + soid + '\'' +
                ", cid=" + cid +
                ", cloth=" + cloth +
                ", sonumber=" + sonumber +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        StockoutItems that = (StockoutItems) o;

        if (soiid != that.soiid) return false;
        if (cid != that.cid) return false;
        if (sonumber != that.sonumber) return false;
        if (soid != null ? !soid.equals(that.soid) : that.soid != null) return false;
        return cloth != null ? cloth.equals(that.cloth) : that.cloth == null;
    }

    @Override
    public int hashCode() {
        int result = soiid;
        result = 31 * result + (soid != null ? soid.hashCode() : 0);
        result = 31 * result + cid;
        result = 31 * result + (cloth != null ? cloth.hashCode() : 0);
        result = 31 * result + sonumber;
        return result;
    }
}
