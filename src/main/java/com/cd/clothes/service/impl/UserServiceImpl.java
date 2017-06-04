package com.cd.clothes.service.impl;

import com.cd.clothes.dao.UserDAO;
import com.cd.clothes.model.User;
import com.cd.clothes.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * autour m199
 * mail  2803934061@qq.com
 * date 2017/6/4
 * time 11:07
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDAO userDAO;
    @Override
    public User login(User user) throws Exception{
        return userDAO.findByLoginnameAndLoginpass(user);
    }

    public void updatePassword(int uid, String newPass, String oldPass) throws Exception{
        /*
         * 1. 校验老密码
         */
        boolean bool = userDAO.findByUidAndPassword(uid, oldPass);
        if(!bool) {//如果老密码错误
            throw new UserException("旧密码错误！");
        }
			/*
			 * 2. 修改密码
			 */
        userDAO.updatePassword(uid, newPass);
    }
    public User findUser(int uid) throws Exception{
            return userDAO.findUserByUid(uid);
    }
}
