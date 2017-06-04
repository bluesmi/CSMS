package com.cd.clothes.dao;

import com.cd.clothes.model.User;

/**
 * autour m199
 * mail  2803934061@qq.com
 * date 2017/6/4
 * time 10:42
 */
public interface UserDAO {
    User findByLoginnameAndLoginpass(User user);
    boolean findByUidAndPassword(int uid, String password);
    void updatePassword(int uid,String password);
}
