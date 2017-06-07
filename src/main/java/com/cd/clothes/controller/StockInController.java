package com.cd.clothes.controller;

import com.cd.clothes.model.Cloth;
import com.cd.clothes.model.StockInItems;
import com.cd.clothes.model.Stockin;
import com.cd.clothes.service.ClothService;
import com.cd.clothes.service.StockInService;
import com.cd.clothes.util.StringUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

    @RequestMapping(value = "/AddStockinOrderItemServlet.do",method = RequestMethod.POST)
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
//    http://localhost:8080/csms/stockIn/AddStockinOrderServlet.do?stime=2007-06-21&wid=1&loginName=%E5%AE%8C&sremark=%E2%80%9C%E2%80%9D
    @RequestMapping(value = "/AddStockinOrderServlet.do",method = RequestMethod.GET)
    public String addStockinOrderServlet(@Param("stime") String stime,@Param("wid") String wid,
                                        @Param("loginName") String loginName,
                                       @Param("sremark") String sremark, ModelMap modelMap){
        System.out.println("进来了");
        Stockin stockin = new Stockin();
        stockin.setSid(StringUtil.getSid(stime));
        stockin.setStime(Date.valueOf(stime));
        stockin.setWid(Integer.parseInt(wid));
        stockin.setLoginName(loginName);
        stockin.setSremark(sremark);
        stockin.setStute(1);
        try {
            stockInService.addStockin(stockin);
            Stockin stockin_number = stockInService.findlastStockin_number();
            modelMap.addAttribute("lastnumber",stockin_number.getSid());
            modelMap.addAttribute("stockin",stockin);
            return "stock/order2004";
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message","系统维护升级中");
            return "views/message";
        }
//        stockinService.addStockin();
//        Stockin stockin_number = stockinService.findlastStockin_number();
//        request.setAttribute("lastnumber", stockin_number.getSid());
//        request.getRequestDispatcher("stock/order2002.jsp").forward(request, response);
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

    @RequestMapping("/DeleteStockinOrderItemServlet.do")
    public String deleteStockinOrderItemServlet(@Param("siid") String siid,ModelMap modelMap){
        //前台页面需要参数 siid  商品号 cid 订单项的数量 number
        //订单项表中删除一个订单项
        System.out.println("进来了删除明细");


        StockInItems stockIn_items = null;
        try {
            stockIn_items = stockInService.findbySiid(siid);
            stockInService.deleteStockin_items(siid);
            //在商品表中加库存
            Cloth cloth = clothService.findCloth(Integer.toString(stockIn_items.getCid()));
            clothService.updateNumber(cloth.getCid(), cloth.getCnumber()-stockIn_items.getSinumber());
            String str="redirect:QueryAllStockinOrderItemsServlet.do?sid="+stockIn_items.getSid();
            return str;
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message","系统维护升级中");
            return "views/message";
        }
    }

    @RequestMapping("/UpdateStockinOrderServlet.do")
    public String updateStockinOrderServlet(Stockin stockin,ModelMap modelMap){
        try {
            stockInService.updateStockin(stockin);
            String str="redirect:QueryAllStockinOrderItemsServlet.do?sid="+stockin.getSid();
            return str;
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message","系统维护升级中");
            return "views/message";
        }
    }

    @RequestMapping("/UpdateStockinOrderItemServlet.do")
    public void updateStockinOrderItemServlet(StockInItems stockInItems){
        try {
            stockInService.updateStockin_items(stockInItems);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
