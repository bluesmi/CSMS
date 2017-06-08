package com.cd.clothes.dao;

import com.cd.clothes.model.Stockout;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * Created by Forgets on 2017/6/6.
 */
public interface StockoutDAO {

    public void add(Stockout stockout) throws Exception;

    public Stockout Querysoid() throws Exception;

    public void update(Stockout stockout) throws Exception;

    public void delete(@Param("soid")String soid) throws Exception;

    public List<Stockout> findAll() throws Exception;

    public Stockout findBySoid(@Param("soid")String soid) throws Exception;

    public List<Stockout> queryStockout(@Param("wid")Integer wid, @Param("soid")String soid, @Param("starttime")Date starttime, @Param("endtime")Date endtime) throws Exception;


}
