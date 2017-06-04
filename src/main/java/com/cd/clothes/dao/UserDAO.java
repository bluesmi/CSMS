package com.cd.clothes.dao;

import com.cd.clothes.model.User;
import org.apache.ibatis.annotations.Param;

/**
 * autour m199
 * mail  2803934061@qq.com
 * date 2017/6/4
 * time 10:42
 */
public interface UserDAO {
    User findByLoginnameAndLoginpass(User user) throws Exception;
    boolean findByUidAndPassword(int uid, String password) throws Exception;
    void updatePassword(@Param("uid") int uid, @Param("password") String password) throws Exception;
}
