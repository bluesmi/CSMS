package com.cd.clothes.controller;

import com.cd.clothes.model.Cloth;
import com.cd.clothes.model.Stockout;
import com.cd.clothes.model.StockoutItems;
import com.cd.clothes.service.ClothService;
import com.cd.clothes.service.StockoutItemsService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Created by Forgets on 2017/6/7.
 */
@Controller
@RequestMapping("/stockoutitems")
public class StockoutItemsController {
    @Autowired
    private StockoutItemsService stockoutItemsService;
    @Autowired
    private ClothService clothService;

    @RequestMapping("/AddStockoutitemServletUI.do")
    public String addStockoutItmesUI(@Param("soid") String soid, ModelMap modelMap){
        try {
            modelMap.addAttribute("soid",soid);
            return "stock/order3005";
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message","系统维护升级中");
            return "views/message";
        }
    }

    @RequestMapping("/AddStockoutitemServletUI2.do")
    public String addStockoutItmesUI2(@Param("soid") String soid, ModelMap modelMap){
        try {
            modelMap.addAttribute("soid",soid);
            return "/stock/order3003";
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message","系统维护升级中");
            return "views/message";
        }
    }

    @RequestMapping(value = "/AddStockoutitemServlet.do",method = RequestMethod.GET)
    public String addStockoutItmes(StockoutItems stockoutItems, Cloth cloth,
                                   @RequestParam("sonumber") String sonumber, @Param("soid") String soid,
                                   ModelMap modelMap){
        try {

            stockoutItemsService.addStockoutitem(stockoutItems);
            clothService.findCloth(String.valueOf(cloth.getCid()));
            clothService.updateNumber(cloth.getCid(),(cloth.getCnumber() - Integer.parseInt(sonumber)));
            modelMap.addAttribute("soid",soid);
            return "UpdateStockoutServletUI.do";
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message","系统维护升级中");
            return "views/message";
        }
    }

    @RequestMapping("/DeleteStockoutitemServlet.do")
    public String DeleteStockoutitemServlet(@Param("soiid") String soiid,ModelMap modelMap){
        try {
            stockoutItemsService.deleteStockoutitem(Integer.parseInt(soiid));
            return "/message";
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message","系统维护升级中");
            return "views/message";
        }
    }

    @RequestMapping("/ListStockoutitemServlet.do")
    public String ListStockoutitemServlet(ModelMap modelMap){
        try {
            List<StockoutItems> allStockoutitem = stockoutItemsService.getAll();
            modelMap.addAttribute("allStockoutitem", allStockoutitem);
            return "/message";
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message", "查询失败");
            return "views/message";
        }
    }

    @RequestMapping("/UpdateStockoutitemServlet.do")
    public String UpdateStockoutitemServlet(StockoutItems stockoutItems,ModelMap modelMap){

        try{
            stockoutItemsService.updateStockoutitem(stockoutItems);
            return "/message";
        }catch(Exception e){
            e.printStackTrace();
            modelMap.addAttribute("message", "系统正在维护升级中");
            return "views/message";
        }
    }
}
