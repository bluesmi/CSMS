package com.cd.clothes.test;

import com.cd.clothes.dao.StockoutDAO;
import com.cd.clothes.dao.StockoutItemsDAO;
import com.cd.clothes.model.Stockout;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Date;
import java.util.List;

/**
 * Created by Forgets on 2017/6/7.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class StockoutDAOTest {
    @Autowired
    StockoutDAO stockoutDAO;
    @Autowired
    StockoutItemsDAO stockoutItemsDAO;
    @Test
    public void testGetsoid() throws Exception {
        stockoutDAO.Querysoid();
    }
    @Test
    public void testAdd() throws Exception {
        Stockout stockout = new Stockout();
        stockout.setSoid("ck2017060200001");
        stockout.setWid(3);
        stockout.setLoginName("a");
        stockout.setSoremark("东莞");
        stockout.setSostute(1);
        stockout.setAdress("长沙");
        stockout.setSphone("16523658974");
        stockoutDAO.add(stockout);
    }
    @Test
    public void testGetAll() throws Exception {
        List<Stockout> stockoutList = stockoutDAO.findAll();
        for (Stockout stockout:stockoutList){
            System.out.println(stockout.getSoid());
        }
    }

    @Test
    public void testQuery() throws Exception {
//        System.out.println(stockoutDAO.queryStockout(null,"rk2016061100003",null,null));
        System.out.println(stockoutDAO.findAllbyTime(
                Date.valueOf("2016-6-1"),Date.valueOf("2016-7-1")));
    }

    @Test
    public void testItemsDelete() throws Exception {
//        System.out.println(stockoutDAO.queryStockout(null,"rk2016061100003",null,null));
        stockoutItemsDAO.deleteBySOiid(Integer.parseInt("27"));
    }

}
