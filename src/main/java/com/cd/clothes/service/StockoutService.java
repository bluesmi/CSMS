package com.cd.clothes.service;

import com.cd.clothes.model.Stockout;


import java.util.Date;
import java.util.List;

/**
 * Created by Forgets on 2017/6/6.
 */
public interface StockoutService {

    public Stockout getSoid() throws Exception;
    public void addStockout(Stockout stockout) throws Exception;
    public List<Stockout> getAllStockout() throws Exception;
    public Stockout findStockout(String soid) throws Exception;
    public void updateStockout(Stockout stockout) throws Exception;
    public void deleteStockout(String soid) throws Exception;
    public List<Stockout> queryStockout(Integer wid, String soid, Date starttime, Date endtime) throws Exception;
    List<Stockout> findAllbyTime( Date time1,Date time2);
}
