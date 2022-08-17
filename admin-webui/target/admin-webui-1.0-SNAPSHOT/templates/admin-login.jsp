<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<%@ include file="page-components/head.jsp"%>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <div><a class="navbar-brand" href="index.html" style="font-size:32px;">RaiseNow</a></div>
        </div>
    </div>
</nav>

<div class="container">

    <form action="admin/do/login.html" method="post" class="form-signin" role="form">
        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-log-in"></i>Admin Login</h2>
        <p style="color: #b94441">${requestScope.exception.message}</p>
        <div class="form-group has-success has-feedback">
            <input type="text" name="login" class="form-control" placeholder="Please enter your login name" autofocus>
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
        </div>
        <div class="form-group has-success has-feedback">
            <input type="text" name="password" class="form-control" placeholder="Please enter your password" style="margin-top:10px;">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
        <button type="submit" style="width: 125px; margin: auto" class="btn btn-success btn-lg">Login</button>
    </form>
</div>
</body>
</html>