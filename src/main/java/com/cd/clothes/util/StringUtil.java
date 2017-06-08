package com.cd.clothes.util;

/**
 * autour m199
 * mail  2803934061@qq.com
 * date 2017/6/7
 * time 21:27
 */
public class StringUtil {
    public static String getSid(String time,int size){
        String sid = "rk"+time.replace("-","")+String.format("%05d", size+1);
        return sid;
    }

    public static String getSoid(String time,int size){
        String soid = "ck"+time.replace("-","")+String.format("%05d", size+1);;
        return soid;
    }
}
