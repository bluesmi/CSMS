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
            System.out.println(cloth);
        }
    }

    @Test
    public void testFind()throws Exception{
        Cloth cloth = clothDAO.find("1");
        System.out.println(cloth.getCname());
    }
    @Test
    public void testupdateNumber()throws Exception{
        clothDAO.updateNumber(1,200);
    }

    @Test
    public void testfindClotheNumber()throws Exception{
        System.out.println(clothDAO.findClotheNumber(1));
    }


    @Test
    public void testfindbyCname()throws Exception{
        System.out.println(clothDAO.findbyCname("长裤"));
    }
    @Test
    public void testfindAdd()throws Exception{
        Cloth cloth = new Cloth();
        cloth.setCname("西装");
        cloth.setCnumber(200);
        cloth.setFlag(0);
        cloth.setCfacprice(400);
        cloth.setCretprice(400);
        cloth.setCsize("250");
        clothDAO.add(cloth);
        System.out.println(clothDAO.findAll());

    }
    @Test
    public void testSelectClothByName() throws Exception {
        List<Cloth> clothList = clothDAO.findbyCname("西装");
        for (Cloth cloth:clothList) {
            System.out.println(cloth);
        }
    }


}
