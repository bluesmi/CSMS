package com.cd.clothes.service;

import com.cd.clothes.model.StockoutItems;

import java.util.List;

/**
 * Created by Forgets on 2017/6/7.
 */
public interface StockoutItemsService {
    public void addStockoutitem(StockoutItems sout)throws Exception;
    public void updateStockoutitem(StockoutItems sout)throws Exception;
    public List<StockoutItems> getAll()throws Exception;
    public List<StockoutItems> findStockoutitem(String soid)throws Exception;
    public void deleteStockoutitem(int soiid)throws Exception;
    public void deleteStockoutitemBySoid(String soid)throws Exception;
}
