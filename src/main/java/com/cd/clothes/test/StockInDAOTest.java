package com.cd.clothes.test;

import com.cd.clothes.dao.StockInDAO;
import com.cd.clothes.model.Cloth;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * autour m199
 * mail  2803934061@qq.com
 * date 2017/6/6
 * time 19:32
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class StockInDAOTest {
    @Autowired
    private StockInDAO stockInDAO;

    @Test
    public void testadd() throws Exception {

    }

}
