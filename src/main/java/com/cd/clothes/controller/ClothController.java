package com.cd.clothes.controller;

import com.cd.clothes.model.Cloth;
import com.cd.clothes.service.ClothService;
import com.google.gson.Gson;
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

    @RequestMapping("AddClothServlet.do")
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

    @RequestMapping("QueryAllClothServlet.do")
    public String QueryAllClothServlet(ModelMap modelMap){
        List<Cloth> cloth = null;
        try {
            cloth = clothService.getCloth();
            modelMap.addAttribute("allCloth", cloth);
            return "system/CLOTHING1001";
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message","系统维护升级中");
            return "views/message";
        }
    }

    @RequestMapping("AjaxQueryAllclothServlet.do")
    public void AjaxQueryAllclothServlet(HttpServletResponse response){
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
}
