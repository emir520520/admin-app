package ca.fangyux.adminapp.mvc.controller;

import ca.fangyux.adminapp.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class RoleHandler {

    @Autowired
    private RoleService roleService;
}