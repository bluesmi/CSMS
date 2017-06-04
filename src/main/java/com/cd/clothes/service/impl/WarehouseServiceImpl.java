package com.cd.clothes.service.impl;

import com.cd.clothes.dao.WarehouseDAO;
import com.cd.clothes.model.Warehouse;
import com.cd.clothes.service.WarehouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Forgets on 2017/6/4.
 */
@Service("warehouseService")
public class WarehouseServiceImpl implements WarehouseService {
    @Autowired
    WarehouseDAO warehouseDAO;
    @Override
    public void addWarehouse(Warehouse w) throws Exception {
        warehouseDAO.add(w);
    }


    public void deleteWarehouse(Integer wid) throws Exception {
        warehouseDAO.delete(wid);
    }

    @Override
    public void updateWarehouse(Warehouse w) throws Exception {
        warehouseDAO.update(w);
    }

    @Override
    public List<Warehouse> findAll() throws Exception {
        return warehouseDAO.findAll();
    }

    public Warehouse findByWid(Integer wid) throws Exception {
        return warehouseDAO.findByWid(wid);
    }

    @Override
    public List<Warehouse> queryWarehouse(Integer wid, String wname) throws Exception {
        return warehouseDAO.queryWarehouse(wid, wname);
    }
}
