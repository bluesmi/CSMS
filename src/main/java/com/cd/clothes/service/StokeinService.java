package com.cd.clothes.service;

import com.cd.clothes.model.StockInItems;
import com.cd.clothes.model.Stockin;

import java.util.Date;
import java.util.List;

/**
 * Created by Forgets on 2017/6/4.
 */
public interface StokeinService {
    public void addStockin_items(StockInItems s) throws  Exception;
    public Stockin findlastStockin_number() throws Exception;
    public void deleteStockin_items(String siid) throws Exception;
    public void updateStockin_items(StockInItems si) throws Exception;
    public List<StockInItems> findAllStockin_items(String sid) throws Exception;
    public StockInItems findbySiid(String siid) throws Exception;
    public void addStockin() throws Exception;
    public List<Stockin> getAllStockin() throws Exception;
    public List<Stockin> getAllbyWid(int wid) throws Exception;
    public List<Stockin> getAllbyTime(Date time1,Date time2) throws Exception;
    public Stockin findStockin(String sid) throws Exception;
    public void updateStockin(Stockin stockin) throws Exception;
    public void deleteStockin(String sid) throws Exception;

}
