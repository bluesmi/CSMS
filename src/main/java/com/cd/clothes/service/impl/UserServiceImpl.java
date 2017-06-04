package com.cd.clothes.service.impl;

import com.cd.clothes.dao.UserDAO;
import com.cd.clothes.model.User;
import com.cd.clothes.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

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
    public User login(User user) {
        return userDAO.findByLoginnameAndLoginpass(user);
    }
}
