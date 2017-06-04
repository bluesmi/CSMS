package com.cd.clothes.test;

import com.cd.clothes.dao.WarehouseDAO;
import com.cd.clothes.model.Warehouse;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.SQLException;

/**
 * autour m199
 * mail  2803934061@qq.com
 * date 2017/6/4
 * time 16:42
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class WarehouseDAOTest {
    @Autowired
    private WarehouseDAO warehouseDAO;

    @Test
    public void testAdd() throws SQLException {
        Warehouse testwarehouse = new Warehouse();
        testwarehouse.setWname("5号仓库");
        testwarehouse.setWuser("老王");
        testwarehouse.setWphone("18374956630");
        testwarehouse.setWnumber(8000);
        warehouseDAO.add(testwarehouse);

    }

}
