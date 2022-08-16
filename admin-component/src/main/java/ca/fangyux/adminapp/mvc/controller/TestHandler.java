package ca.fangyux.adminapp.mvc.controller;

import ca.fangyux.adminapp.entity.Admin;
import ca.fangyux.adminapp.entity.Student;
import ca.fangyux.adminapp.service.AdminService;
import ca.fangyux.adminapp.utils.Props;
import ca.fangyux.adminapp.utils.ResultEntity;
import ca.fangyux.adminapp.utils.Utils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class TestHandler {

    @Resource
    private AdminService adminService;

    private Logger logger=LoggerFactory.getLogger(TestHandler.class);

    @RequestMapping(value={"/index.html","/#", "/"})
    public String goHome(HttpSession session){
        logger.debug("inside index controller method");

        if(session.getAttribute(Props.SESSION_ATTRIBUTE_ADMIN)==null || session.getAttribute(Props.SESSION_ATTRIBUTE_ADMIN).toString()==""){
            return "admin-login";
        }
        return "redirect:/admin-home.html";
    }

    @RequestMapping("/test/ssm.html")
    public String testSSM(Model model){
        logger.debug("inside ssm controller method");

        List<Admin> adminlist=adminService.getAll();
        model.addAttribute("admins", adminlist);
        return "ssm";
    }

    @RequestMapping("/send/array.html")
    @ResponseBody
    public String testAjaxArray(@RequestBody int[] array){
        for (int i:array) {
            logger.info(String.valueOf(i));
        }
        return "Yes";
    }

    @ResponseBody
    @RequestMapping("/send/object.json")
    public ResultEntity<Student> testAjaxObject(@RequestBody Student student, HttpServletRequest request){
        logger.info(String.valueOf(student));

        //判断请求类型是普通请求还是Ajax请求
        logger.info("请求是Ajax请求： "+String.valueOf(Utils.detectRequestTypeForExceptionHandling(request)));

        String a = null;
        System.out.println(a.length());

        ResultEntity<Student> result=ResultEntity.successWithtData(student);
        return result;
    }
}