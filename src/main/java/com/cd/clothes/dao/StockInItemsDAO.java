package com.cd.clothes.dao;

import com.cd.clothes.model.StockInItems;
import org.apache.ibatis.annotations.Param;

import java.sql.SQLException;
import java.util.List;


public interface StockInItemsDAO {
    /**
     * 增加一个订单条目
     * @param si
     * @throws SQLException
     */
     void add(StockInItems si) throws SQLException;



    /**
     * 按订单条目id删除一个订单条目
     * @param siid
     * @throws SQLException
     */
     void delete(@Param("siid") Integer siid) throws SQLException;
    /**
     * 删除入库子项
     * @param sid
     * @throws SQLException
     */
    void deleteBysid(@Param("sid") String sid) throws SQLException;

    /**
     *更新一个订单条目
     * @param si
     * @throws SQLException
     */
    void update(StockInItems si) throws SQLException;


    /**
     * 按订单号查找所有的订单条目
     * @param sid
     * @return
     * @throws SQLException
     */
    List<StockInItems> findAllBySid(@Param("sid") String sid) throws SQLException;



    /**
     * 按照订单条目id来查找一个订单条目
     * @param siid
     * @return
     * @throws SQLException
     */

     StockInItems findbySiid(@Param("siid") int siid) throws SQLException;


}
