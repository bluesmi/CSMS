package com.cd.clothes.service.impl;

import com.cd.clothes.dao.StockoutItemsDAO;
import com.cd.clothes.model.StockoutItems;
import com.cd.clothes.service.StockoutItemsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Forgets on 2017/6/7.
 */
@Service("StockoutItemsService")
public class StockoutItemsServiceImpl implements StockoutItemsService {
    @Autowired
    StockoutItemsDAO stockoutItemsDAO;

    @Override
    public void addStockoutitem(StockoutItems sout) throws Exception {
        stockoutItemsDAO.add(sout);
    }

    @Override
    public void updateStockoutitem(StockoutItems sout) throws Exception {
        stockoutItemsDAO.update(sout);
    }

    @Override
    public List<StockoutItems> getAll() throws Exception {
        return stockoutItemsDAO.findAll();
    }

    @Override
    public List<StockoutItems> findStockoutitem(String soid) throws Exception {
        return stockoutItemsDAO.findBySoid(soid);
    }

    @Override
    public StockoutItems findStockoutitemBySoiid(int soiid) throws Exception {
        return stockoutItemsDAO.findStockoutitemBySoiid(soiid);
    }

    @Override
    public void deleteStockoutitem(int soiid) throws Exception {
        stockoutItemsDAO.deleteBySOiid(soiid);
    }

    @Override
    public void deleteStockoutitemBySoid(String soid) throws Exception {
        stockoutItemsDAO.deleteBySoid(soid);
    }
}
