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

    @RequestMapping(value = "/AddWarehouseServlet.do",method = RequestMethod.GET)
    public String addWarehouse(Warehouse warehouse, ModelMap modelMap) {
        try {
            warehouseService.addWarehouse(warehouse);
            return "redirect:ListWarehouseServlet.do";
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message", "系统维护升级中");
            return "views/message";
        }
    }

    @RequestMapping(value = "/QueryWarehouseServlet.do",method = RequestMethod.GET)
    public String queryWarehouseServlet(@Param("wid") String wid,@Param("wname") String wname, ModelMap modelMap) {
        List<Warehouse> warehouseList = null;
        try {
            Integer reWid = "".endsWith(wid) ? null : Integer.parseInt(wid);
            warehouseList = warehouseService.queryWarehouse(reWid,wname);
            modelMap.addAttribute("wid", wid);
            modelMap.addAttribute("wname", wname);
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
            return "redirect:ListWarehouseServlet.do";
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



    @RequestMapping("/UpdateWarehouseServletUI.do")
    public String updateWarehouseServletUI(@Param("wid") String wid,ModelMap modelMap){

        try{
            Warehouse warehouse = warehouseService.findByWid(Integer.parseInt(wid));
            modelMap.addAttribute("warehouse", warehouse);
            return "system/updatewarehouse";
        }catch(Exception e){
            e.printStackTrace();
            modelMap.addAttribute("message", "系统正在维护升级中");
            return "views/message";
        }
    }

    @RequestMapping("/enter.do")
    public String enter(){
        return "system/addwarehouse";
    }
}
