package com.cd.clothes.test;

import com.cd.clothes.dao.ClothDAO;
import com.cd.clothes.model.Cloth;
import com.cd.clothes.model.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * autour m199
 * mail  2803934061@qq.com
 * date 2017/6/4
 * time 15:21
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class ClothDAOTest {
    @Autowired
    private ClothDAO clothDAO;

    @Test
    public void testSelectCloth() throws Exception {
        List<Cloth> clothList = clothDAO.findAll();
        for (Cloth cloth:clothList) {
            System.out.println(cloth.getCname());
        }
    }

    @Test
    public void testFind()throws Exception{
        Cloth cloth = clothDAO.find("1");
        System.out.println(cloth.getCname());
    }
}
