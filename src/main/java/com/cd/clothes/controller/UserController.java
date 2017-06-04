package com.cd.clothes.controller;

import com.cd.clothes.model.User;
import com.cd.clothes.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;

/**
 * autour m199
 * mail  2803934061@qq.com
 * date 2017/6/4
 * time 11:11
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserServiceImpl userService;

    @RequestMapping("/enterServlet.do")
    public String enterLogin(){
        return "login";
    }
    @RequestMapping("/LoginServlet.do")
    public String userLogin(@RequestParam("loginName") String loginName,
                                  @RequestParam("password")String password,
                                  HttpServletRequest request,
                                  HttpServletResponse response,
                                  ModelMap modelMap){

        try{
            User formuser = new User();
            formuser.setLoginName(loginName);
            formuser.setPassword(password);
            User user = userService.login(formuser);

            if(user==null){
                modelMap.addAttribute("message","还未登录，请登录");
                return "login";
            }else{


                request.getSession().setAttribute("sessionUser", user);

                loginName = URLEncoder.encode(loginName, "utf-8");
                Cookie cookie = new Cookie("loginName", loginName);
                cookie.setMaxAge(60 * 60 * 24 * 10);
                response.addCookie(cookie);
                return "Main";
            }
        }catch(Exception e){
            e.printStackTrace();
            modelMap.addAttribute("message","系统正在维护升级中");
            return"message";
        }
    }
}