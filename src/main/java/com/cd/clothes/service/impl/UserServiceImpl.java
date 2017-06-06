package com.cd.clothes.service.impl;

import com.cd.clothes.dao.UserDAO;
import com.cd.clothes.exception.UserException;
import com.cd.clothes.model.User;
import com.cd.clothes.service.UserService;
import com.cd.clothes.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
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

    /**
     * 按uid查找用户
     * @param uid
     * @return
     */
    @Override
    public User findUser(int uid) throws Exception{
        return userDAO.findUserByUid(uid);
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
        try {
            return userDAO.ajaxValidateLoginname(loginName);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

    @Override
    public List<User> getAllUser() {

        try {
            return userDAO.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

    @Override
    public List<User> load(String loginname, String realname) {

        try {
            return userDAO.findByRealnameAndLoginname(loginname, realname);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

    @Override
    public void addUser(User user) {
        try {
            userDAO.add(user);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

    @Override
    public void deleteUser(int uid) {
        try {
            userDAO.delete(uid);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

    @Override
    public void updateUser(User user) {
        try {
            userDAO.update(user);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

    @Override
    public Page getPageData(String pagenum, String url) {
        int totalrecord = -1;
        try {
            totalrecord = userDAO.getTotalrecord();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(pagenum==null){
            Page page = new Page(totalrecord,1);//算出了总页数和用户想看的页以及从哪里开始取
            List list;
            try {
                list = userDAO.getPageData(page.getStartindex(),page.getPagesize());
                page.setList(list);
                page.setUrl(url);
                return page;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else{
            Page page = new Page(totalrecord,Integer.parseInt(pagenum));
            List list;
            try {
                list = userDAO.getPageData(page.getStartindex(),page.getPagesize());
                page.setList(list);
                return page;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
