package com.cd.clothes.model;

/**
 * Created by Forgets on 2017/6/7.
 */
public class StockoutItems {
    private int soiid;
    private String soid;
    private int cid;
    private Cloth cloth;
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
}
