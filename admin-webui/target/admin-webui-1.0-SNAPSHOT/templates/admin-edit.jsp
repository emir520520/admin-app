<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%@ include file="page-components/head.jsp"%>
<link rel="stylesheet" href="../static/css/pagination.css" />
<script type="text/javascript" src="../static/jquery/jquery.pagination.js"></script>
<body>
<%@include file="page-components/nav.jsp"%>
<div class="container-fluid">
    <div class="row">
        <%@include file="page-components/sidebar.jsp"%>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <ol class="breadcrumb">
                <li><a href="/admin-home.html">Home</a></li>
                <li><a href="/admin/get/page.html">Admin List</a></li>
                <li class="active">Edit</li>
            </ol>
            <div class="panel panel-default">
                <div class="panel-heading">Table Data<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
                <div class="panel-body">
                    <form action="admin/update.html" role="form">
                        <input type="hidden" name="id" value="${requestScope.admin.id}">
                        <input type="hidden" name="pageNum" value="${requestScope.pageNum}">
                        <input type="hidden" name="keyword" value="${requestScope.keyword}">
                        <p>${requestScope.exception.message}</p>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Login Account</label>
                            <input value="${requestScope.admin.loginAcct}" name="loginAcct" type="text" class="form-control" id="exampleInputPassword1" placeholder="Please enter login account">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">User Name</label>
                            <input value="${requestScope.admin.userName}" name="userName" type="text" class="form-control" id="exampleInputPassword3" placeholder="Please enter user name">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email</label>
                            <input value="${requestScope.admin.email}" name="email" type="email" class="form-control" id="exampleInputEmail1" placeholder="Please enter email address">
                            <p class="help-block label label-warning">Please enter valid email address format： xxxx@xxxx.com</p>
                        </div>
                        <button type="submit" class="btn btn-success"><i class="glyphicon glyphicon-edit"></i> Edit</button>
                        <button type="reset" class="btn btn-danger"><i class="glyphicon glyphicon-refresh"></i> Reset</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
