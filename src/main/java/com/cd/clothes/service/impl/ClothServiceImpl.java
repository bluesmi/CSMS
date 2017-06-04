package com.cd.clothes.service.impl;

import com.cd.clothes.dao.ClothDAO;
import com.cd.clothes.model.Cloth;
import com.cd.clothes.service.ClothService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Forgets on 2017/6/4.
 */
@Service("clothService")
public class ClothServiceImpl implements ClothService {
    @Autowired
    ClothDAO clothDAO;
    @Override
    public boolean add(Cloth cloth){
        try {
            clothDAO.add(cloth);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Cloth> getCloth(){
        try {
            return clothDAO.findAll();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Cloth> getbyCname(String cname) {
        try {
            return clothDAO.findbyCname(cname);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Cloth> getbyCcolor(String ccolor) throws Exception {
        return clothDAO.findbyCcolor(ccolor);
    }

    @Override
    public List<Cloth> getbyCsize(String csize) throws Exception {
        return clothDAO.findbyCsize(csize);
    }

    @Override
    public Cloth findCloth(String cid) throws Exception {
        return clothDAO.find(cid);
    }

    @Override
    public boolean updateCloth(Cloth c) {
        try {
            clothDAO.update(c);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean updateNumber(int cid, int cnumber){
        try {
            clothDAO.updateNumber(cid, cnumber);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteCloth(String cid) {
        try {
            clothDAO.delete(cid);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public int findClotheNumber(int cid) throws Exception {
        return clothDAO.findClotheNumber(cid);
    }
}
