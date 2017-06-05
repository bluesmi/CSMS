package com.cd.clothes.model;

import java.io.Serializable;

/**
 * autour m199
 * mail  2803934061@qq.com
 * date 2017/6/4
 * time 15:07
 */
public class Cloth implements Serializable{
    /**
     * 服装ID
     */
    private int cid;
    /**
     * 服装名称
     */
    private String cname;
    /**
     * 服装颜色
     */
    private String ccolor;
    /**
     * 服装大小
     */
    private String csize;
    /**
     * 数量
     */
    private int cnumber;
    /**
     * 头像
     */
    private String cimage;
    /**
     * 进价
     */
    private float cfacprice;
    /**
     * 出货价
     */
    private float cretprice;

    private int flag;

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCcolor() {
        return ccolor;
    }

    public void setCcolor(String ccolor) {
        this.ccolor = ccolor;
    }

    public String getCsize() {
        return csize;
    }

    public void setCsize(String csize) {
        this.csize = csize;
    }

    public int getCnumber() {
        return cnumber;
    }

    public void setCnumber(int cnumber) {
        this.cnumber = cnumber;
    }

    public String getCimage() {
        return cimage;
    }

    public void setCimage(String cimage) {
        this.cimage = cimage;
    }

    public float getCfacprice() {
        return cfacprice;
    }

    public void setCfacprice(float cfacprice) {
        this.cfacprice = cfacprice;
    }

    public float getCretprice() {
        return cretprice;
    }

    public void setCretprice(float cretprice) {
        this.cretprice = cretprice;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Cloth cloth = (Cloth) o;

        if (cid != cloth.cid) return false;
        if (cnumber != cloth.cnumber) return false;
        if (Float.compare(cloth.cfacprice, cfacprice) != 0) return false;
        if (Float.compare(cloth.cretprice, cretprice) != 0) return false;
        if (flag != cloth.flag) return false;
        if (cname != null ? !cname.equals(cloth.cname) : cloth.cname != null) return false;
        if (ccolor != null ? !ccolor.equals(cloth.ccolor) : cloth.ccolor != null) return false;
        if (csize != null ? !csize.equals(cloth.csize) : cloth.csize != null) return false;
        return cimage != null ? cimage.equals(cloth.cimage) : cloth.cimage == null;
    }

    @Override
    public int hashCode() {
        int result = cid;
        result = 31 * result + (cname != null ? cname.hashCode() : 0);
        result = 31 * result + (ccolor != null ? ccolor.hashCode() : 0);
        result = 31 * result + (csize != null ? csize.hashCode() : 0);
        result = 31 * result + cnumber;
        result = 31 * result + (cimage != null ? cimage.hashCode() : 0);
        result = 31 * result + (cfacprice != +0.0f ? Float.floatToIntBits(cfacprice) : 0);
        result = 31 * result + (cretprice != +0.0f ? Float.floatToIntBits(cretprice) : 0);
        result = 31 * result + flag;
        return result;
    }

    @Override
    public String toString() {
        return "Cloth{" +
                "cid=" + cid +
                ", cname='" + cname + '\'' +
                ", ccolor='" + ccolor + '\'' +
                ", csize='" + csize + '\'' +
                ", cnumber=" + cnumber +
                ", cimage='" + cimage + '\'' +
                ", cfacprice=" + cfacprice +
                ", cretprice=" + cretprice +
                ", flag=" + flag +
                '}';
    }
}
