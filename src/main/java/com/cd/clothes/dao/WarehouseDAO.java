package com.cd.clothes.dao;

import com.cd.clothes.model.Warehouse;

import java.sql.SQLException;
import java.util.List;

/**
 * autour m199
 * mail  2803934061@qq.com
 * date 2017/6/4
 * time 16:05
 */
public interface WarehouseDAO {

    /**
     * 增加仓库
     * @param w 仓库对象
     * @throws SQLException
     */
    public void add(Warehouse w) throws SQLException;

    /**
     * 根据仓库ID删除仓库
     * @param wid 仓库ID
     * @throws SQLException
     */
    public void delete(String wid) throws SQLException;

    /**
     * 修改仓库信息
     * @param w 仓库对象
     * @throws SQLException
     */
    public void update(Warehouse w) throws SQLException;

    /**
     *
     * @return
     * @throws SQLException
     */
    public List<Warehouse> findAll() throws SQLException;
    public Warehouse findByWid(String wid) throws SQLException;


    public List<Warehouse> queryWarehouse(String wid, String wname) throws SQLException;

}
