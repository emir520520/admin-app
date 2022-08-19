package ca.fangyux.adminapp.mvc.controller;

import ca.fangyux.adminapp.entity.Admin;
import ca.fangyux.adminapp.service.AdminService;
import ca.fangyux.adminapp.utils.Props;
import ca.fangyux.adminapp.utils.exception.LoginFailedException;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
            if(account==null || account=="" || password==null ||password==""){
                throw new LoginFailedException("Please enter both account name and password!");
            }

            if(session.getAttribute(Props.SESSION_ATTRIBUTE_ADMIN)==null){
                //检查登录信息
                Admin admin=adminService.getAdminByCredentials(account,password);

                session.setAttribute(Props.SESSION_ATTRIBUTE_ADMIN,admin);

                return "admin-home";
            }
            Logger logger=LoggerFactory.getLogger(AdminHandler.class);
            logger.error("=================>"+session.getAttribute(Props.SESSION_ATTRIBUTE_ADMIN).toString());


        return "redirect:/admin-home.html";
    }

    @RequestMapping("/admin/do/logout.html")
    public String doLogout(HttpSession session){
        session.invalidate();

        return "redirect:/admin/login.html";
    }

    @RequestMapping("/admin/get/page.html")
    public String getPageInfo(
            @RequestParam(value = "keyword", defaultValue = "")String keyword,
            @RequestParam(value = "pageNum", defaultValue = "1")Integer pageNum,
            @RequestParam(value = "pageSize",defaultValue = "5")Integer pageSize,
            Model model
    ){
        PageInfo<Admin> pageInfo=adminService.getPageInfo(keyword,pageNum,pageSize);

        model.addAttribute(Props.MODEL_ATTRIBUTE_PAGE_INFO,pageInfo);

        //用于关键词搜素后点击分页页面按钮时还带有之前的关键词
        if(keyword!=""){
            model.addAttribute(Props.MODEL_ATTRIBUTE_KEYWORD,keyword);
        }

        return "admin-page";
    }
}