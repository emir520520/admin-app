<%--
  Created by IntelliJ IDEA.
  User: Yuxiao_Fang
  Date: 2022-07-18
  Time: 10:44 a.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Home page</title>
    <base href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
    <script type="text/javascript" src="../static/jquery/jquery-2.1.1.min.js"></script>
    <script>
      $(function() {
        $("#btn1").click(function () {
          //准备要发送的数组
          var array=[2,5,8];

          //"['2','5','8']"
          var requestBody=JSON.stringify(array);

          $.ajax({
            url:"send/array.html",
            type:"post",
            data:requestBody,
            contentType:"application/json;charset=UTF-8",
            dataType:"text",      //按照text解析服务器端返回的数据
            success:function (response) {
              alert(response);
            },
            error:function (response) {
              alert(response);
            }
          })
        });

        $("#btn2").click(function () {
          //准备要发送的Student
          var student={
            "studentID":11,
            "studentName":"Frank",
            "address":{
              "province":"安徽",
              "city":"合肥",
              "street":"沿河路"
            },
            "subjects":[
              {
                "subjectName":"语文",
                "subjectScore":88
              },
              {
                "subjectName":"数学",
                "subjectScore":99
              }
            ]
          }

          var requestBody=JSON.stringify(student);

          $.ajax({
            url:"send/object.json",
            type:"post",
            data:requestBody,
            contentType:"application/json;charset=UTF-8",
            dataType:"json",      //按照text解析服务器端返回的数据
            success:function (response) {
              alert(response);
            },
            error:function (response) {
              alert(response);
            }
          })
        });
      });
    </script>
  </head>
  <body>
    <a href="test/ssm.html">test SSM integration</a>

    <br><br><br>

    <button id="btn1">send [2,5,8]</button>

    <br><br><br>

    <button id="btn2">send Student</button>
  </body>
</html>
