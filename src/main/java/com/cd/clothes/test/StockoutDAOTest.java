package com.cd.clothes.test;

import com.cd.clothes.dao.StockoutDAO;
import com.cd.clothes.model.Stockout;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created by Forgets on 2017/6/7.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class StockoutDAOTest {
    @Autowired
    StockoutDAO stockoutDAO;
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
        stockoutDAO.queryStockout(2,"ck2016060200001"," "," ");
    }
}
