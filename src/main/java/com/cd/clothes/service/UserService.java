package com.cd.clothes.service;

import com.cd.clothes.exception.UserException;
import com.cd.clothes.model.User;
import com.cd.clothes.util.Page;

import java.util.List;

/**
 * autour m199
 * mail  2803934061@qq.com
 * date 2017/6/4
 * time 11:05
 */
public interface UserService {
    User login(User user) throws Exception;
    void updatePassword(int uid, String newPass, String oldPass) throws Exception;

    /**
     * 用户名注册校验
     * @param loginName
     * @return
     */
    public boolean ajaxValidateLoginname(String loginName);

    /**
     * 得到所有用户
     * @return
     */
    public List<User> getAllUser();
    /**
     * 模糊查询
     * @param loginname
     * @param realname
     * @return
     */

    public List<User> load(String loginname, String realname);



    /**
     * 添加用户
     * @param user
     */
    public void addUser(User user);
    /**
     * 删除用户
     * @param uid
     */
    public void deleteUser(int uid);

    /**
     * 修改用户
     * @param user
     */
    public void updateUser(User user);

    /**
     * 分页查询用户
     * @param pagenum
     * @param url
     * @return
     */

    Page getPageData(String pagenum, String url);

}
