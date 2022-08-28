package ca.fangyux.adminapp.mvc.controller;

import ca.fangyux.adminapp.entity.Role;
import ca.fangyux.adminapp.service.RoleService;
import ca.fangyux.adminapp.utils.ResultEntity;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RoleHandler {

    @Autowired
    private RoleService roleService;

    //因为响应的是ajax请求，所以请求地址是以json结尾，返回类型是ResultEntity
    @RequestMapping("/role/get/page/info.json")
    @ResponseBody
    public ResultEntity<PageInfo<Role>> getPageInfo(
            @RequestParam(value = "pageNum", defaultValue = "1")Integer pageNum,
            @RequestParam(value = "pageSize", defaultValue = "5")Integer pageSize,
            @RequestParam(value = "keyword", defaultValue = "")String keyword
    ){
        //由于之前已经写过了MyExceptionResolver，这里就不用try,catch了（因为有可能数据库不能正常返回数据）
        PageInfo<Role> pageInfo = roleService.getPageInfo(pageNum, pageSize, keyword);

        return ResultEntity.successWithtData(pageInfo);
    }
}