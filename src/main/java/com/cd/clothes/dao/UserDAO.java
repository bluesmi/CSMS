package com.cd.clothes.dao;

import com.cd.clothes.model.User;
import org.apache.ibatis.annotations.Param;

import java.sql.SQLException;
import java.util.List;


public interface UserDAO {
    User findByLoginnameAndLoginpass(User user) throws Exception;
    User findByUidAndPassword(@Param("uid") int uid,@Param("password") String password) throws Exception;
    void updatePassword(@Param("uid") int uid, @Param("password") String password) throws Exception;
    List<User> findByRealnameAndLoginname(@Param("loginName") String loginnamne,@Param("realname") String realname) throws SQLException;
    boolean ajaxValidateLoginname(@Param("loginName") String loginName) throws SQLException ;
    void add(User user) throws SQLException;
    void delete(@Param("uid") int uid) throws SQLException;
    void update(User user) throws SQLException;
    List<User> findAll() throws SQLException;
    User findUserByUid(@Param("uid") int uid) throws SQLException;
    int getTotalrecord() throws SQLException;
    List<User> getPageData(@Param("startindex") int startindex, @Param("pagesize") int pagesize) throws SQLException;

}
