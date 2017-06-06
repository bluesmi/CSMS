package com.cd.clothes.controller;

import com.cd.clothes.model.Warehouse;
import com.cd.clothes.service.WarehouseService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by Forgets on 2017/6/4.
 */
@Controller
@RequestMapping("/warehouse")
public class WarehouseController {

    @Autowired
    WarehouseService warehouseService;

    @RequestMapping(value = "/AddWarehouseServlet.do",method = RequestMethod.POST)
    public String addWarehouse(Warehouse warehouse, ModelMap modelMap) {
        try {
            warehouse.setFlag(0);
            warehouseService.addWarehouse(warehouse);
            return "redirect:ListWarehouseServlet.do";
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message", "系统维护升级中");
            return "views/message";
        }
    }

    @RequestMapping(value = "/QueryWarehouseServlet.do",method = RequestMethod.POST)
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
    public String listWarehouseServlet(ModelMap modelMap){
        try {
            List<Warehouse> warehouseList = warehouseService.findAll();
            modelMap.addAttribute("list", warehouseList);
            return "system/listwarehouse";
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message", "系统维护升级中");
            return "views/message";
        }
    }

    @RequestMapping("/DeleteWarehouseServlet.do")
    public String deleteWarehouse(@Param("wid") Integer wid, ModelMap modelMap) {
        try {
            warehouseService.deleteWarehouse(wid);
            return "redirect:DeleteWarehouseServlet.do";
        } catch (Exception e) {
            return "ListWarehouseServlet.do";
        }
    }

    @RequestMapping("/UpdateWarehouseServlet.do")
    public String updateWarehouse(Warehouse warehouse, ModelMap modelMap) {
        try {
            warehouseService.updateWarehouse(warehouse);
            return "redirect:ListWarehouseServlet.do";
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message", "系统维护升级中");
            return "views/message";
        }
    }

}
