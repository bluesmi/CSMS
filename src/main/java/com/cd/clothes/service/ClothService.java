package com.cd.clothes.service;

import com.cd.clothes.model.Cloth;

import java.util.List;

/**
 * Created by Forgets on 2017/6/4.
 */
public interface ClothService {
    public boolean add(Cloth cloth) throws Exception;
    public List<Cloth> getCloth() throws Exception;
    public List<Cloth> getbyCname(String cname) throws Exception;
    public List<Cloth> getbyCcolor(String ccolor) throws Exception;
    public List<Cloth> getbyCsize(String csize) throws Exception;
    public Cloth findCloth(String cid) throws Exception;
    public boolean updateCloth(Cloth c) throws Exception;
    public boolean updateNumber(int cid,int cnumber) throws Exception;
    public boolean deleteCloth(String cid) throws Exception;
    public int findClotheNumber(int cid) throws Exception;
}
