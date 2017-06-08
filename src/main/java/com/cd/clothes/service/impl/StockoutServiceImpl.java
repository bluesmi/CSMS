package com.cd.clothes.service.impl;

import com.cd.clothes.dao.StockoutDAO;
import com.cd.clothes.model.Stockout;
import com.cd.clothes.service.StockoutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

/**
 * Created by Forgets on 2017/6/6.
 */
@Service("stockoutService")
public class StockoutServiceImpl implements StockoutService {
    @Autowired
    StockoutDAO stockoutDAO;

    @Override
    public Stockout getSoid() throws Exception {
        return stockoutDAO.Querysoid();
    }

    @Override
    public void addStockout(Stockout stockout) throws Exception {
        stockoutDAO.add(stockout);
    }

    @Override
    public List<Stockout> getAllStockout() throws Exception {
        return stockoutDAO.findAll();
    }

    @Override
    public Stockout findStockout(String soid) throws Exception {
        return stockoutDAO.findBySoid(soid);
    }

    @Override
    public void updateStockout(Stockout stockout) throws Exception {
        stockoutDAO.update(stockout);
    }

    @Override
    public void deleteStockout(String soid) throws Exception {
        stockoutDAO.delete(soid);
    }

    @Override
    public List<Stockout> queryStockout(Integer wid, String soid, Date starttime, Date endtime) throws Exception {
        return stockoutDAO.queryStockout(wid,soid,starttime,endtime);
    }

    @Override
    public List<Stockout> findAllbyTime(Date time1, Date time2) {
        try {
            return stockoutDAO.findAllbyTime(time1, time2);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }
}
