package com.cd.clothes.controller;

import com.cd.clothes.model.Cloth;
import com.cd.clothes.model.Stockout;
import com.cd.clothes.model.Warehouse;
import com.cd.clothes.service.StockoutService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by Forgets on 2017/6/6.
 */
@Controller
@RequestMapping("/stockout")
public class StockoutController {

    @Autowired
    private StockoutService stockoutService;

    @RequestMapping(value = "/AddStockoutServlet.do",method = RequestMethod.GET)
    public String addStockout(Stockout stockout, ModelMap modelMap){
        try {
            stockout.setFlag(0);
            stockoutService.addStockout(stockout);
            modelMap.addAttribute("stockout",stockout);
            System.out.println(stockout);
            return "stock/order3002";
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message","系统维护升级中");
            return "views/message";
        }
    }


    @RequestMapping("/UpdateStockoutServlet.do")
    public String UpdateStockoutServlet(Stockout stockout,ModelMap modelMap){

        try{
            stockoutService.updateStockout(stockout);
            return "redirect:ListStockoutServlet.do";
        }catch(Exception e){
            e.printStackTrace();
            modelMap.addAttribute("message", "系统正在维护升级中");
            return "views/message";
        }
    }

    @RequestMapping(value = "/UpdateStockoutServletUI.do",method = RequestMethod.POST)
    public String updateStockoutUI(@Param("soid") String soid, ModelMap modelMap){
        try {
            Stockout stockout=stockoutService.findStockout(soid);
            modelMap.addAttribute("stockout",stockout);
            return "stock/order3004";

        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message","系统维护升级中");
            return "views/message";
        }
    }



    @RequestMapping(value = "/UpdateStockoutServlet2.do",method = RequestMethod.GET)
    public String updateStockout2(Stockout stockout, ModelMap modelMap){
        try {
            stockoutService.updateStockout(stockout);
            modelMap.addAttribute("soid", stockout.getSoid());
            return "redirect:UpdateStockoutServletUI2.do";

        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message","系统维护升级中");
            return "views/message";
        }
    }

    @RequestMapping("/DeleteStockoutServlet.do")
    public String DeleteStockoutServlet(@Param("soid") String soid){
        try {
            stockoutService.deleteStockout(soid);
            return "redirect:ListStockoutServlet.do";
        } catch (Exception e) {
            return "ListStockoutServlet.do";
        }
    }

    @RequestMapping("/ListStockoutServlet.do")
    public String ListStockoutServlet(ModelMap modelMap){
        try {
            List<Stockout> allStockout = stockoutService.getAllStockout();
            modelMap.addAttribute("allStockout", allStockout);
            return "stock/liststockout";
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message", "查询失败");
            return "views/message";
        }
    }

    @RequestMapping("/QueryStockoutServlet.do")
    public String QueryStockoutServlet(@Param("wid") String wid,@Param("soid") String soid,
                                       @Param("starttime")String starttime,@Param("endtime")String endtime,
                                       ModelMap modelMap){
        Integer reWid = "".endsWith(wid) ? null : Integer.parseInt(wid);
        List<Stockout> allStockout=null;
        try {
            allStockout = stockoutService.queryStockout(reWid,soid,starttime,endtime);
            modelMap.addAttribute("allStockout", allStockout);
            modelMap.addAttribute("soid", soid);
            return "stock/liststockout";
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message","查询失败");
            return "views/message";
        }
    }

    @RequestMapping("/enter.do")
    public String enter(){
        return "stock/order3002";
    }

}
