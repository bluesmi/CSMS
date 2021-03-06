package com.cd.clothes.test;

import com.cd.clothes.dao.UserDAO;
import com.cd.clothes.model.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * autour m199
 * mail  2803934061@qq.com
 * date 2017/6/4
 * time 10:59
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class UserDAOTest {
    @Autowired
    private UserDAO userDAO;

    @Test
    public void testSelectUser() throws Exception {
        User testUser = new User();
        testUser.setLoginName("xiaoyou");
        testUser.setPassword("123");
        User user = userDAO.findByLoginnameAndLoginpass(testUser);
        System.out.println(user.getRealName());
    }

    @Test
    public void testupdatePassword() throws Exception {
        userDAO.updatePassword(1,"123456");
    }

    @Test
    public void testFind() throws Exception {
        User user = userDAO.findByUidAndPassword(1,"123456");
        System.out.println(user.getRealName());
    }

    @Test
    public void testfindByRealnameAndLoginname() throws Exception {
        List<User> userList = userDAO.findByRealnameAndLoginname("xiaoyou","游昌劲");
        System.out.println(userList);
    }

    @Test
    public void testajaxValidateLoginname() throws Exception {
        boolean userList = userDAO.ajaxValidateLoginname("xiaoyou");
        System.out.println(userList);
    }
}
