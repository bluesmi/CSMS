package com.cd.clothes.controller;

import com.cd.clothes.model.Cloth;
import com.cd.clothes.model.StockInItems;
import com.cd.clothes.service.ClothService;
import com.google.gson.Gson;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by Forgets on 2017/6/4.
 */
@Controller
@RequestMapping("/cloth")
public class ClothController {
    @Autowired
    private ClothService clothService;

    @RequestMapping(value = "/AddClothServlet.do",method = RequestMethod.POST)
    public String addCloth(Cloth cloth, ModelMap modelMap){
        try {
            cloth.setFlag(0);
            clothService.add(cloth);
            System.out.println(cloth);
            return "redirect:QueryAllClothServlet.do";
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message","系统维护升级中");
            return "views/message";
        }
    }

    @RequestMapping(value = "/UpdateClothServlet.do",method = RequestMethod.POST)
    public String updateCloth(Cloth cloth, ModelMap modelMap){
        try {
            clothService.updateCloth(cloth);
            modelMap.addAttribute("stute", 2);
            return "redirect:QueryAllClothServlet.do";

        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message","系统维护升级中");
            return "views/message";
        }
    }
//    http://localhost:8080/csms/cloth/QueryAllClothServlet.do
    @RequestMapping("/QueryAllClothServlet.do")
    public String queryAllClothServlet(ModelMap modelMap){
        List<Cloth> allCloth = null;
        try {
            allCloth = clothService.getCloth();
            modelMap.addAttribute("allCloth",allCloth);
            return "system/CLOTHING1001";
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message","系统维护升级中");
            return "views/message";
        }
    }

    @RequestMapping("/AjaxQueryAllclothServlet.do")
    public void ajaxQueryAllclothServlet(HttpServletResponse response){
        List<Cloth> cloth = null;
        try {
            cloth = clothService.getCloth();
            String json =new Gson().toJson(cloth);
            response.setCharacterEncoding("utf-8");
            response.getWriter().print(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("/AjaxQueryclothServlet.do")
    public void ajaxQueryclothServlet(@Param("cid")String cid, HttpServletResponse response){
        Cloth cloth = null;
        try {
            cloth = clothService.findCloth(cid);
            String json =new Gson().toJson(cloth);
            response.setCharacterEncoding("utf-8");
            response.getWriter().print(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

  @RequestMapping("/QueryClothServlet.do")
   public String queryClothServlet(@Param("cid") String cid,ModelMap modelMap){

      Cloth cloth = null;
      try {
          cloth = clothService.findCloth(cid);
          modelMap.addAttribute("oneCloth", cloth);
          return "system/CLOTHING1003";
      } catch (Exception e) {
          e.printStackTrace();
          modelMap.addAttribute("message","系统维护升级中");
          return "views/message";
      }
  }

   @RequestMapping("/QueryByCnameServlet.do")
    public String queryByCnameServlet(@Param("cname") String cname,ModelMap modelMap){
       try {
           cname = java.net.URLDecoder.decode(cname, "UTF-8");
           List<Cloth> allCloth = clothService.getbyCname(cname);
           modelMap.addAttribute("allCloth", allCloth);
           return "system/CLOTHING1001";

       } catch (Exception e) {
           return "redirect:QueryAllClothServlet.do";
       }
   }

   @RequestMapping("/QueryByCcolorServlet.do")
    public String queryByCcolorServlet(@Param("ccolor") String ccolor,ModelMap modelMap){
       try {
           ccolor = java.net.URLDecoder.decode(ccolor, "UTF-8");
           List<Cloth> list = clothService.getbyCcolor(ccolor);
//           System.out.print(list.size());
           modelMap.addAttribute("allCloth", list);
           return "system/CLOTHING1001";
       } catch (Exception e) {
           return "redirect:QueryAllClothServlet.do";
       }
   }


    @RequestMapping("/QueryBycSizeServlet.do")
    public String queryByCsizeServlet(@Param("csize") String csize,ModelMap modelMap){
        try {
            csize = java.net.URLDecoder.decode(csize, "UTF-8");
            List<Cloth> list = clothService.getbyCsize(csize);
//           System.out.print(list.size());
            modelMap.addAttribute("allCloth", list);
            return "system/CLOTHING1001";
        } catch (Exception e) {
            return "redirect:QueryAllClothServlet.do";
        }
    }

    @RequestMapping("/DeleteClothServlet.do")
    public String deleteClothServlet(@Param("cid") String cid){
        try {
            clothService.deleteCloth(cid);
            return "redirect:QueryAllClothServlet.do";
        } catch (Exception e) {
            return "redirect:QueryAllClothServlet.do";
        }
    }

    @RequestMapping("/enter.do")
    public String enter(){
        return "system/CLOTHING1002";
    }

}
