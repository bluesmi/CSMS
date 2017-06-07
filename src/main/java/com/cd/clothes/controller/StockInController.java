package com.cd.clothes.controller;

import com.cd.clothes.model.Cloth;
import com.cd.clothes.model.StockInItems;
import com.cd.clothes.model.Stockin;
import com.cd.clothes.service.ClothService;
import com.cd.clothes.service.StockInService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 * autour m199
 * mail  2803934061@qq.com
 * date 2017/6/7
 * time 10:06
 */
@Controller
@RequestMapping("/stockIn")
public class StockInController {
    @Autowired
    private StockInService stockInService;
    @Autowired
    private ClothService clothService;

    @RequestMapping("/QueryAllStockinOrderServlet.do")
    public String queryAllStockinOrderServlet(ModelMap modelMap){
        List<Stockin> allStockin = null;
        try {
            allStockin = stockInService.getAllStockin();
            modelMap.addAttribute("allStockin", allStockin);
            return "stock/order2001";
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message","系统维护升级中");
            return "views/message";
        }

    }

    @RequestMapping("/QueryAllStockinOrderItemsServlet.do")
    public String queryAllStockinOrderItemsServlet(@Param("sid") String sid,ModelMap modelMap){
        Stockin stockin = null;

        try {
            stockin = stockInService.findStockin(sid);
            modelMap.addAttribute("stockin", stockin);
            List<StockInItems> list = new ArrayList();
            List<StockInItems> findAllStockin_items = stockInService.findAllStockin_items(sid);
            for(StockInItems item:findAllStockin_items){
                int id = item.getCid();
                String cid = id+"";
                Cloth cloth = clothService.findCloth(cid);
                item.setCloth(cloth);
                list.add(item);
            }
            modelMap.addAttribute("list", list);
            return "stock/order2004";
        } catch (Exception e) {

            modelMap.addAttribute("lastnumber", stockin.getSid());
            return "stock/order2002";
        }
    }

    @RequestMapping("/QuerybySid.do")
    public String querybySid(@Param("sid") String sid,ModelMap modelMap){
        try {

            Stockin stockin = stockInService.findStockin(sid);
            List<Stockin> list = new ArrayList<Stockin>();
            list.add(stockin);
            modelMap.addAttribute("stockin", list);
            return "stock/order2001";
        } catch (Exception e) {
            return "redirect:QueryAllStockinOrderServlet.do";
        }
    }

    @RequestMapping("/QueryByWid.do")
    public String queryByWid(@Param("wid") String wid,ModelMap modelMap){
        try {

            List<Stockin> allbyWid = stockInService.getAllbyWid(Integer.parseInt(wid));
           modelMap.addAttribute("allStockin", allbyWid);
           return "stock/order2001";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:QueryAllStockinOrderServlet.do";
        }
    }

    @RequestMapping("/QueryByTime.do")
    public String queryByTime(@Param("btime") String btime,@Param("otime") String otime,ModelMap modelMap){
        try {

            List<Stockin> allbytime = stockInService.getAllbyTime(Date.valueOf(btime), Date.valueOf(otime));
            modelMap.addAttribute("allStockin", allbytime);
            return "stock/order2001";
        } catch (Exception e) {
            return "redirect:QueryAllStockinOrderServlet.do";
        }
    }

    @RequestMapping("/AddStockinOrderItemServlet.do")
    public String addStockinOrderItemServlet(StockInItems stockInItems,ModelMap modelMap){
        try {
            stockInService.addStockin_items(stockInItems);
            //更新商品表中的库存数据
            Cloth cloth = clothService.findCloth(stockInItems.getCid()+"");
            clothService.updateNumber(stockInItems.getCid(), cloth.getCnumber() + stockInItems.getSinumber());
            return "redirect:QueryAllStockinOrderItemsServlet?sid="+stockInItems.getSid();
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message","系统维护升级中");
            return "views/message";
        }
    }

    @RequestMapping("/DeleteStockinorderServlet.do")
    public String deleteStockinorderServlet(@Param("sid") String sid,ModelMap modelMap){
        try {
            stockInService.deleteStockin(sid);
            return "redirect:QueryAllStockinOrderServlet.do";
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message","系统维护升级中");
            return "views/message";
        }
    }

}
