<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>健康点—登录页面</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet"
          href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script
            src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .span {
            margin: -2px;
            padding: -2px;
        }
        .bs-example{
            padding-top:0px;
        }
        #registerBtn {
            margin-left: 100px;
        }

    </style>

</head>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    if (username == null || password == null){
        username = "";
        password = "";
    }
%>
<body background="../images/login/login.jpg" style="background-size:100% 100%;">
<div class="container" style="padding: 260px 100px 10px; width:650px;">
    <div style="width:450px;height:45px;background-color:rgba(0,0,0,0.0);" class="alert alert-danger alert-dismissable">
        <button type="button" class="close" data-dismiss="alert">
            &times;
        </button>
        <span id="msg">${msg}</span>
    </div>
    <form class="bs-example bs-example-form" action="/user/login" method="post" role="form">
        <div class="input-group input-group-lg">
            <span class="input-group-addon">账&nbsp;&nbsp;&nbsp;&nbsp;号</span>
            <input type="text" class="form-control" name="username" id="username"
                   placeholder="请输入账号" value="<%=username%>">
        </div>
        <br>
        <div class="input-group input-group-lg">
            <span class="input-group-addon">密&nbsp;&nbsp;&nbsp;&nbsp;码</span>
            <input type="password" class="form-control" name="password" id="password"
                   placeholder="请输入密码" value="<%=password%>">
        </div>
        <br>
        <div>
            <button style="height:46px;width:450px;" id="loginBtn" class="btn btn-lg">登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录</button>
            <%--<button id="registerBtn" class="btn btn-lg">注册</button>--%>
        </div>
    </form>
</div>
<script>
    $(function() {
        $("#loginBtn").click(function(){
            location.href ="<%=basePath%>";
        });
        $("#registerBtn").click(function() {
            $(".bs-example").attr("action", "<%=basePath%>views/register.jsp");
        });
    });
//    $("#loginBtn").click(function () {
//        var username = $("#username").val();
//        var password = $("#password").val();
//        $.ajax({
//            url: "/user/login1",
//            type: "POST",
//            data:  "loginid="+username+"&password="+password,
//            success:function (result) {
//                alert("aaaa");
//                var status = result.extendInfo.status;
//                if(result.code==100){
//                    alert(status);
//                    window.location.href="/main/front_main.jsp";
//                }else{
//                    alert(status);
//                    $("#msg").text(status);
//                }
//            }
//        });
//    });
</script>
</body>
</html>
