package com.cd.clothes.dao;

import com.cd.clothes.model.StockoutItems;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface StockoutItemsDAO {
    public void add(StockoutItems sout) throws Exception;

    public void update(StockoutItems sout) throws Exception;

    public List<StockoutItems> findAll() throws Exception;

    public List<StockoutItems> findBySoid(@Param("soid") String soid) throws Exception;

    public void deleteBySOiid(@Param("soiid") int soiid) throws Exception;

    public void deleteBySoid(@Param("soid") String soid) throws Exception;
    public StockoutItems findStockoutitemBySoiid(@Param("soiid") int soiid)throws Exception;
}
