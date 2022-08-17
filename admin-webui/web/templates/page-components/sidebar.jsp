<%--
  Created by IntelliJ IDEA.
  User: fangyuxiao
  Date: 2022-08-16
  Time: 5:18 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-sm-3 col-md-2 sidebar">
    <div class="tree">
        <ul style="padding-left:0px;" class="list-group">
            <li class="list-group-item tree-closed" >
                <a href="main.html"><i class="glyphicon glyphicon-dashboard"></i>Control Panel</a>
            </li>
            <li class="list-group-item tree-closed">
                <span><i class="glyphicon glyphicon glyphicon-tasks"></i> Permission Control <span class="badge" style="float:right">3</span></span>
                <ul style="margin-top:10px;display:none;">
                    <li style="height:30px;">
                        <a href="user.html"><i class="glyphicon glyphicon-user"></i> Users Management</a>
                    </li>
                    <li style="height:30px;">
                        <a href="role.html"><i class="glyphicon glyphicon-king"></i> Role Management</a>
                    </li>
                    <li style="height:30px;">
                        <a href="permission.html"><i class="glyphicon glyphicon-lock"></i> Menu Management</a>
                    </li>
                </ul>
            </li>
            <li class="list-group-item tree-closed">
                <span><i class="glyphicon glyphicon-ok"></i> Services Review <span class="badge" style="float:right">3</span></span>
                <ul style="margin-top:10px;display:none;">
                    <li style="height:30px;">
                        <a href="auth_cert.html"><i class="glyphicon glyphicon-check"></i> ID Verification</a>
                    </li>
                    <li style="height:30px;">
                        <a href="auth_adv.html"><i class="glyphicon glyphicon-check"></i> Ad Verification</a>
                    </li>
                    <li style="height:30px;">
                        <a href="auth_project.html"><i class="glyphicon glyphicon-check"></i> Project Verification</a>
                    </li>
                </ul>
            </li>
            <li class="list-group-item tree-closed">
                <span><i class="glyphicon glyphicon-th-large"></i> Services Management <span class="badge" style="float:right">7</span></span>
                <ul style="margin-top:10px;display:none;">
                    <li style="height:30px;">
                        <a href="cert.html"><i class="glyphicon glyphicon-picture"></i> Resources Management</a>
                    </li>
                    <li style="height:30px;">
                        <a href="type.html"><i class="glyphicon glyphicon-equalizer"></i> Category Management</a>
                    </li>
                    <li style="height:30px;">
                        <a href="process.html"><i class="glyphicon glyphicon-random"></i> Flow Control</a>
                    </li>
                    <li style="height:30px;">
                        <a href="advertisement.html"><i class="glyphicon glyphicon-hdd"></i> Ad management</a>
                    </li>
                    <li style="height:30px;">
                        <a href="message.html"><i class="glyphicon glyphicon-comment"></i> Message Templates</a>
                    </li>
                    <li style="height:30px;">
                        <a href="project_type.html"><i class="glyphicon glyphicon-list"></i> Project Category</a>
                    </li>
                    <li style="height:30px;">
                        <a href="tag.html"><i class="glyphicon glyphicon-tags"></i> Project Tag</a>
                    </li>
                </ul>
            </li>
            <li class="list-group-item tree-closed" >
                <a href="param.html"><i class="glyphicon glyphicon-list-alt"></i> Parameter Management</a>
            </li>
        </ul>
    </div>
</div>