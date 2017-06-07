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

/**
 * Created by Forgets on 2017/6/7.
 */
@Controller
@RequestMapping("/stockoutitems")
public class StockoutItemsController {
    @Autowired
    private StockoutItemsService stockoutItemsService;
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

    @RequestMapping(value = "/AddStockoutitemServlet.do",method = RequestMethod.GET)
    public String addStockoutItmes(StockoutItems stockoutItems, Cloth cloth,
                                   @RequestParam("sonumber") int sonumber, @Param("soid") String soid,
                                   ModelMap modelMap){
        try {

            stockoutItemsService.addStockoutitem(stockoutItems);
            clothService.findCloth(String.valueOf(cloth.getCid()));
            clothService.updateNumber(cloth.getCid(),cloth.getCnumber() - sonumber);
            modelMap.addAttribute("soid",soid);
            return "UpdateStockoutServletUI";
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message","系统维护升级中");
            return "views/message";
        }
    }
}
