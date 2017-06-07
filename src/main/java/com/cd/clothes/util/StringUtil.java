package com.cd.clothes.util;

/**
 * autour m199
 * mail  2803934061@qq.com
 * date 2017/6/7
 * time 21:27
 */
public class StringUtil {
    private static int IN = 1;
    private static int OUT = 1;
    public static String getSid(String time){
        String sid = "rk"+time.replace("-","")+"0000"+IN;
        IN++;
        return sid;
    }
}
