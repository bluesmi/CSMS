package com.cd.clothes.controller;

import com.cd.clothes.exception.UserException;
import com.cd.clothes.model.User;
import com.cd.clothes.service.UserService;
import com.cd.clothes.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
    private UserService userService;

    @RequestMapping("/enterServlet.do")
    public String enterLogin(){
        return "views/login";
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
                return "views/login";
            }else{
                HttpSession session = request.getSession(false);
                if(null == session){
                    session = request.getSession(true);
                }

                session.setAttribute("sessionUser", user);

                loginName = URLEncoder.encode(loginName, "utf-8");
                Cookie cookie = new Cookie("loginName", loginName);
                cookie.setMaxAge(60 * 60 * 24 * 10);
                response.addCookie(cookie);
                return "redirect:/views/Main.jsp";
            }
        }catch(Exception e){
            e.printStackTrace();
            modelMap.addAttribute("message","系统正在维护升级中");
            return"views/message";
        }
    }
    @RequestMapping("UpdateUserPasswordServlet.do")
    public String userUpdatePass(User formuser,
                                 HttpServletRequest request,
                                 ModelMap modelMap) {
		/*
		 * 1. 封装表单数据到user中
		 * 2. 从session中获取uid
		 * 3. 使用uid和表单中的oldPass和newPass来调用service方法
		 *   > 如果出现异常，保存异常信息到request中，转发到pwd.jsp
		 * 4. 保存成功信息到rquest中
		 * 5. 转发到msg.jsp
		 */

        User user = (User)request.getSession().getAttribute("sessionUser");
        // 如果用户没有登录，返回到登录页面，显示错误信息
        if(user == null) {
            modelMap.addAttribute("message","您还没有登录！");
            return "views/message";
        }
        try {

            if(formuser.getNewpass().equals(formuser.getRepassword())){
                userService.updatePassword(user.getUid(), formuser.getNewpass(), user.getPassword());
                modelMap.addAttribute("message", "修改密码成功");
                return "views/message";
            }else {
                modelMap.addAttribute("message","请重新确认您的密码！");//保存异常信息到request
                modelMap.addAttribute("user", formuser);//为了回显
                return "common/updatepassword";
            }
        }catch (UserException us){
            modelMap.addAttribute("message","请重新确认您的密码！");//保存异常信息到request
            modelMap.addAttribute("user", formuser);//为了回显
            return "common/updatepassword";
        }
        catch (Exception e) {
            modelMap.addAttribute("message","系统维护升级中");
            return "views/message";
        }
    }
}
