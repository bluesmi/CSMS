package com.cd.clothes.controller;

import com.cd.clothes.model.Warehouse;
import com.cd.clothes.service.WarehouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by Forgets on 2017/6/4.
 */
@Controller
@RequestMapping("/warehouse")
public class WarehouseController {
    @Autowired
    WarehouseService warehouseService;

    @RequestMapping("/AddWarehouseServlet.do")
    public String addWarehouse(Warehouse warehouse, ModelMap modelMap) {
        try {
            warehouseService.addWarehouse(warehouse);
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message", "系统维护升级中");
            return "views/message";
        }
        return "warehouse/QueryAllClothServlet.do";
    }

    @RequestMapping("/QueryWarehouseServlet.do")
    public String queryWarehouseServlet(Warehouse warehouse, ModelMap modelMap) {
        List<Warehouse> warehouseList = null;
        try {
            warehouseList = warehouseService.queryWarehouse(warehouse.getWid(), warehouse.getWname());
            modelMap.addAttribute("wid", warehouse.getWid());
            modelMap.addAttribute("wname", warehouse.getWname());
            modelMap.addAttribute("list", warehouseList);
            return "system/listwarehouse";
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message", "系统维护升级中");
            return "views/message";
        }
    }

    @RequestMapping("/ListWarehouseServlet.do")
    public String ListWarehouseServlet(ModelMap modelMap){
        try {
            List<Warehouse> list = warehouseService.findAll();
            modelMap.addAttribute("list", list);
            return "system/listwarehouse";
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message", "系统维护升级中");
            return "views/message";
        }
    }

}
