package com.cd.clothes.dao;

import com.cd.clothes.model.Cloth;

import java.sql.SQLException;
import java.util.List;

/**
 * autour m199
 * mail  2803934061@qq.com
 * date 2017/6/4
 * time 15:10
 */
public interface ClothDAO {

    /**
     * 查询所有的商品 返回值 :一个存储商品实体的list exception:null 没有查询到这些商品
     *
     * @throws SQLException
     */
    public List<Cloth> findAll() throws SQLException;

    /**
     *根据品名查询一些商品
     * @param cname 商品名
     * @return
     * @throws SQLException
     */
    public List<Cloth> findbyCname(String cname) throws SQLException;
    /**
     *根据颜色查询一些商品
     * @param ccolor 颜色
     * @return
     * @throws SQLException
     */
    public List<Cloth> findbyCcolor(String ccolor) throws SQLException;
    /**
     *根据颜色查询一些商品
     * @param csize
     * @return
     * @throws SQLException
     */
    public List<Cloth> findbyCsize(String csize) throws SQLException;
    /**
     * 按商品id查询商品 返回值：一个商品实体 exception:null 没有查询到这个商品
     *
     * @throws SQLException
     */

    public Cloth find(String id) throws SQLException;

    /**
     * 增加一个商品实体 返回值：true；增加成功 false：增加失败
     *
     * @throws SQLException
     *
     * */
    public void add(Cloth c) throws SQLException;

    /**
     * 删除一个商品实体
     *
     * @param cid
     * @throws SQLException
     */
    public void delete(String cid) throws SQLException;

    /**
     * 更新一个商品信息 返回值；true 更新成功 false：更新失败
     *
     * @throws SQLException
     */
    public void update(Cloth c) throws SQLException;
    /**
     * 按照商品id更新商品的库存量
     */
    public void updateNumber(int cid,int cunmber) throws SQLException;

    /**
     * 查询库存
     * @param cid
     * @return
     * @throws SQLException
     */
    public int findClotheNumber(int cid) throws SQLException;


}
