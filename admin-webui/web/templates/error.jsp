<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keys" content="">
    <meta name="author" content="">
    <base href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
    <link rel="stylesheet" href="../static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../static/css/font-awesome.min.css">
    <link rel="stylesheet" href="../static/css/login.css">
    <script src="../static/jquery/jquery-2.1.1.min.js"></script>
    <script src="../static/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../static/layer-v3.1.1/layer/layer.js"></script>
    <title>Error</title>
    <script>
        $(function(){
           $("button").click(function(){
              window.history.back();
           });
        });
    </script>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <div><a class="navbar-brand" href="index.html" style="font-size:32px;">RaiseNow</a></div>
        </div>
    </div>
</nav>

<div class="container">
    <h2 class="form-signin-heading" style="text-align:center;"></i>RaiseNow Error</h2>
    <br><br><br>

    <%--    requestScope存放的是request域中的数据的集合    --%>
    <%--    requestScope.exception.message相当于request.getAttribute("exception").getMessage()    --%>
    <h5 class="form-signin-heading" style="text-align:center;"></i>${requestScope.exception.message}</h5>
    <br><br><br>
</div>
<button style="width: 125px; margin: auto" class="btn btn-success btn-lg">Go back</button>
</body>
</html>