package ca.fangyux.adminapp.mvc.controller;

import ca.fangyux.adminapp.entity.Admin;
import ca.fangyux.adminapp.service.AdminService;
import ca.fangyux.adminapp.utils.Props;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class AdminHandler {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/admin/do/login.html")
    public String doLogin(
            @RequestParam("login")String account,
            @RequestParam("password")String password,
            HttpSession session) throws Exception {
        //检查登录信息
        Admin admin=adminService.getAdminByCredentials(account,password);

        session.setAttribute(Props.SESSION_ATTRIBUTE_ADMIN,admin);

        return "admin-home";
    }
}