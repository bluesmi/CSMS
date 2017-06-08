package com.cd.clothes.service.impl;

import com.cd.clothes.dao.StockInDAO;
import com.cd.clothes.dao.StockInItemsDAO;
import com.cd.clothes.model.StockInItems;
import com.cd.clothes.model.Stockin;
import com.cd.clothes.service.StockInService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

/**
 * autour m199
 * mail  2803934061@qq.com
 * date 2017/6/7
 * time 9:49
 */

@Service("stockInService")
public class StockInServiceImpl implements StockInService {

    @Autowired
    private StockInDAO stockInDAO;
    @Autowired
    private StockInItemsDAO stockInItemsDAO;

    @Override
    public void addStockin_items(StockInItems s) throws Exception {
        try {
            stockInItemsDAO.add(s);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Stockin findlastStockin_number() throws Exception {
        try {
            return stockInDAO.querysid();
        }catch (Exception e){
            throw new RuntimeException();
        }

    }

    @Override
    public void deleteStockin_items(String siid) throws Exception {
        try {
           stockInItemsDAO.delete(Integer.parseInt(siid));
        }catch (Exception e){
            throw new RuntimeException();
        }
    }

    @Override
    public void updateStockin_items(StockInItems si) throws Exception {
        try {
            stockInItemsDAO.update(si);
        }catch (Exception e){
            throw new RuntimeException();
        }
    }

    @Override
    public List<StockInItems> findAllStockin_items(String sid) throws Exception {
        try {
            return stockInItemsDAO.findAllBySid(sid);
        }catch (Exception e){
            throw new RuntimeException();
        }
    }

    @Override
    public StockInItems findbySiid(String siid) throws Exception {
        try {
            return stockInItemsDAO.findbySiid(Integer.parseInt(siid));
        }catch (Exception e){
            throw new RuntimeException();
        }
    }

    @Override
    public void addStockin(Stockin stockin) throws Exception {
        try {
            stockInDAO.add(stockin);
        }catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

    @Override
    public List<Stockin> getAllStockin() throws Exception {
        try {
            return stockInDAO.findAll();
        }catch (Exception e){
            throw new RuntimeException();
        }
    }

    @Override
    public List<Stockin> getAllbyWid(int wid) throws Exception {
        try {
            return stockInDAO.findAllbyWid(wid);
        }catch (Exception e){
            throw new RuntimeException();
        }
    }

    @Override
    public List<Stockin> getAllbyTime(Date time1, Date time2) throws Exception {
        try {
            return stockInDAO.findAllbyTime(time1, time2);
        }catch (Exception e){
            throw new RuntimeException();
        }
    }

    @Override
    public Stockin findStockin(String sid) throws Exception {
        try {
           return stockInDAO.findBySid(sid);
        }catch (Exception e){
            throw new RuntimeException();
        }
    }

    @Override
    public void updateStockin(Stockin stockin) throws Exception {
        try {
            stockInDAO.update(stockin);
        }catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

    @Override
    public void deleteStockin(String sid) throws Exception {
        try {
            stockInDAO.delete(sid);
            stockInItemsDAO.deleteBysid(sid);
        }catch (Exception e){
            throw new RuntimeException();
        }
    }
}
