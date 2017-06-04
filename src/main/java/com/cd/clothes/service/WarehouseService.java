package com.cd.clothes.service;

import com.cd.clothes.model.Warehouse;

import java.util.List;

/**
 * Created by Forgets on 2017/6/4.
 */
public interface WarehouseService {
    public void addWarehouse(Warehouse w) throws Exception;
    public void deleteWarehouse(Integer wid) throws Exception;
    public void updateWarehouse(Warehouse w) throws Exception;
    public List<Warehouse> findAll() throws Exception;
    public Warehouse findByWid(Integer wid) throws Exception;
    public List<Warehouse> queryWarehouse(Integer wid,String wname) throws Exception;
}
