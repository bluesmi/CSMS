package com.cd.clothes.controller;

import com.cd.clothes.model.Cloth;
import com.cd.clothes.model.StockInItems;
import com.cd.clothes.model.Stockout;
import com.cd.clothes.model.StockoutItems;
import com.cd.clothes.service.ClothService;
import com.cd.clothes.service.StockoutItemsService;
import com.cd.clothes.service.StockoutService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
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
    @Autowired
    private StockoutService stockoutService;

    @RequestMapping("/AddStockoutitemServletUI.do")
    public String addStockoutItmesUI(@Param("soid") String soid,StockoutItems stockoutItems, ModelMap modelMap){
        try {
            modelMap.addAttribute("soid",soid);
            return "redirect:ListStockoutitemServlet.do?sid="+stockoutItems.getSoid();
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
            return "redirect:ListStockoutitemServlet.do?sid="+stockoutItems.getSoid();
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
    public String ListStockoutitemServlet(@Param("soid") String soid,ModelMap modelMap){
        Stockout stockout = null;
        try {
            stockout = stockoutService.findStockout(soid);
            modelMap.addAttribute("stockout", stockout);
            List<StockoutItems> list = new ArrayList();
            List<StockoutItems> allStockoutitem = stockoutItemsService.findStockoutitem(soid);
            for(StockoutItems item:allStockoutitem){
                int id = item.getCid();
                String cid = id+"";
                Cloth cloth = clothService.findCloth(cid);
                item.setCloth(cloth);
                list.add(item);
            }
            modelMap.addAttribute("list", list);
            modelMap.addAttribute("allStockoutitem", allStockoutitem);
            return "stock/order3004";
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
