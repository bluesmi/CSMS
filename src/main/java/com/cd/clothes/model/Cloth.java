package com.cd.clothes.model;

/**
 * autour m199
 * mail  2803934061@qq.com
 * date 2017/6/4
 * time 15:07
 */
public class Cloth {
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
}
