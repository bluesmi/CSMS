package com.cd.clothes.service;

import com.cd.clothes.model.User;

/**
 * autour m199
 * mail  2803934061@qq.com
 * date 2017/6/4
 * time 11:05
 */
public interface UserService {
    User login(User user) throws Exception;
    void updatePassword(int uid, String newPass, String oldPass) throws Exception;
}
