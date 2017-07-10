package com.cd.clothes.dao;

import com.cd.clothes.model.Stockin;
import org.apache.ibatis.annotations.Param;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;


public interface StockInDAO {

    /**
     * 增加一个订单的订单号
     * @throws SQLException
     */
    void add(Stockin stockin) throws SQLException;



    /**
     * 查询刚创建的订单号,返回一个Stockin对象
     */
     Stockin querysid() throws SQLException;




    /**
     *更新入库订单
     * @param stockin
     * @throws SQLException
     */
     void update(Stockin stockin) throws SQLException;



    /**
     * 按id删除订单
     * @param sid
     * @throws SQLException
     */
     void delete(String sid) throws SQLException;


    /**
     * 查找所有的订单
     * @return
     * @throws SQLException
     */
     List<Stockin> findAll() throws SQLException;
    /**
     * 按仓库号查找所有的订单
     * @return
     * @throws SQLException
     */

     List<Stockin> findAllbyWid(@Param("wid") int wid) throws SQLException;



    /**
     * 按时间查找所有的订单
     * @return
     * @throws SQLException
     */
     List<Stockin> findAllbyTime(@Param("time1") Date time1,@Param("time2") Date time2) throws SQLException;


    /**
     * 按订单号查询订单
     * @param sid
     * @return
     * @throws SQLException
     */
     Stockin findBySid(@Param("sid") String sid) throws SQLException;
//        String sql = "";

}
