package com.cd.clothes.controller;

import com.cd.clothes.model.Cloth;
import com.cd.clothes.service.ClothService;
import com.google.gson.Gson;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @RequestMapping("/AddClothServlet.do")
    public String addCloth(Cloth cloth, ModelMap modelMap){
        try {
            clothService.add(cloth);
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message","系统维护升级中");
            return "views/message";
        }
        return "cloth/QueryAllClothServlet.do";
    }
//    http://localhost:8080/csms/cloth/QueryAllClothServlet.do
    @RequestMapping("/QueryAllClothServlet.do")
    public String queryAllClothServlet(ModelMap modelMap){
        List<Cloth> cloth = null;
        try {
            cloth = clothService.getCloth();
            modelMap.addAttribute("allCloth",cloth);
            return "redirect:system/CLOTHING1001";
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
           List<Cloth> list = clothService.getbyCname(cname);
           System.out.print(list.size());
           modelMap.addAttribute("allCloth", list);
           return "system/CLOTHING1001";

       } catch (Exception e) {
           return "cloth/QueryAllClothServlet.do";
       }
   }

   @RequestMapping("/QueryByCcolorServlet.do")
    public String queryByCcolorServlet(@Param("ccolor") String ccolor,ModelMap modelMap){
       try {
           List<Cloth> list = clothService.getbyCcolor(ccolor);
//           System.out.print(list.size());
           modelMap.addAttribute("allCloth", list);
           return "system/CLOTHING1001";
       } catch (Exception e) {
           return "cloth/QueryAllClothServlet.do";
       }
   }
}
