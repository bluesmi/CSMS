package com.cd.clothes.service.impl;

import com.cd.clothes.dao.UserDAO;
import com.cd.clothes.exception.UserException;
import com.cd.clothes.model.User;
import com.cd.clothes.service.UserService;
import com.cd.clothes.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    public void updatePassword(int uid, String newPass, String oldPass) throws UserException {

        /*
         * 1. 校验老密码
         */
        try {
           User user =  userDAO.findByUidAndPassword(uid, oldPass);
            System.out.println(user);
            userDAO.updatePassword(uid, newPass);
            if(null == user) {//如果老密码错误
                throw new UserException("旧密码错误！");
            }else {
              /*
			 * 2. 修改密码
			 */
                userDAO.updatePassword(uid, newPass);
            }
        }catch (Exception e){
            throw new RuntimeException();
        }
    }

    @Override
    public boolean ajaxValidateLoginname(String loginName) {
        return false;
    }

    @Override
    public List<User> getAllUser() {
        return null;
    }

    @Override
    public List<User> load(String loginname, String realname) {
        return null;
    }

    @Override
    public void addUser(User user) {

    }

    @Override
    public void deleteUser(int uid) {

    }

    @Override
    public void updateUser(User user) {

    }

    @Override
    public Page getPageData(String pagenum, String url) {
        return null;
    }
}
