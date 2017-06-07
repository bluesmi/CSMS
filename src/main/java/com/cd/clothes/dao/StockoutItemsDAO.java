package com.cd.clothes.dao;

import com.cd.clothes.model.StockoutItems;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Forgets on 2017/6/7.
 */
public interface StockoutItemsDAO {
    public void add(StockoutItems sout) throws Exception;

    public void update(StockoutItems sout) throws Exception;

    public List<StockoutItems> findAll() throws Exception;

    public List<StockoutItems> findBySoid(@Param("soid") String soid) throws Exception;

    public void delete(@Param("soiid") int soiid) throws Exception;

    public void deleteBySoid(@Param("soid") String soid) throws Exception;
}
