<%--
  Created by IntelliJ IDEA.
  User: fangyuxiao
  Date: 2022-08-16
  Time: 5:11 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <base href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
  <link rel="stylesheet" href="../static/bootstrap/css/bootstrap.css">
  <link rel="stylesheet" href="../static/css/font-awesome.min.css">
  <link rel="stylesheet" href="../static/css/main.css">

  <script src="../static/jquery/jquery-2.1.1.min.js"></script>
  <script src="../static/layer-v3.1.1/layer/layer.js"></script>
  <script src="../static/bootstrap/js/bootstrap.js"></script>
  <style>
    .tree li {
      list-style-type: none;
      cursor:pointer;
    }
    .tree-closed {
      height : 40px;
    }
    .tree-expanded {
      height : auto;
    }
  </style>
  <script type="text/javascript">
    $(function () {
      $(".list-group-item").click(function(){
        if ( $(this).find("ul") ) {
          $(this).toggleClass("tree-closed");
          if ( $(this).hasClass("tree-closed") ) {
            $("ul", this).hide("fast");
          } else {
            $("ul", this).show("fast");
          }
        }
      });
    });
  </script>
</head>
