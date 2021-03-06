package com.cd.clothes.model;

import java.io.Serializable;

/**
 * autour m199
 * mail  2803934061@qq.com
 * date 2017/6/4
 * time 10:33
 */
public class User implements Serializable {
    private int uid;
    private String loginName;
    private String password;
    private String realName;
    private String phone;
    private String newpass;//新密码
    private String repassword;
    private int flag;

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", loginName='" + loginName + '\'' +
                ", password='" + password + '\'' +
                ", realName='" + realName + '\'' +
                ", phone='" + phone + '\'' +
                ", newpass='" + newpass + '\'' +
                ", repassword='" + repassword + '\'' +
                ", flag=" + flag +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (uid != user.uid) return false;
        if (flag != user.flag) return false;
        if (loginName != null ? !loginName.equals(user.loginName) : user.loginName != null) return false;
        if (password != null ? !password.equals(user.password) : user.password != null) return false;
        if (realName != null ? !realName.equals(user.realName) : user.realName != null) return false;
        if (phone != null ? !phone.equals(user.phone) : user.phone != null) return false;
        if (newpass != null ? !newpass.equals(user.newpass) : user.newpass != null) return false;
        return repassword != null ? repassword.equals(user.repassword) : user.repassword == null;
    }

    @Override
    public int hashCode() {
        int result = uid;
        result = 31 * result + (loginName != null ? loginName.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (realName != null ? realName.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (newpass != null ? newpass.hashCode() : 0);
        result = 31 * result + (repassword != null ? repassword.hashCode() : 0);
        result = 31 * result + flag;
        return result;
    }

    public int getFlag() {

        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getNewpass() {
        return newpass;
    }

    public void setNewpass(String newpass) {
        this.newpass = newpass;
    }

    public String getRepassword() {
        return repassword;
    }

    public void setRepassword(String repassword) {
        this.repassword = repassword;
    }

}
