<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Head Page</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <!--echarts文件-->
    <%--<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>--%>
    <script type="text/javascript" src="../js/ECharts/echarts.min.js"></script>
    <style>
        #fitness_logo{
            padding-top: 20px;
            padding-left: 20px;
        }
        .navbar-form{
            padding-top:8px;
        }
    </style>
</head>
<body>
<div class="fitness_brand_nav">
    <nav class="navbar navbar-inverse navbar-static-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#fitness-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" id="fitness_logo" href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cuizb_logo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
            </div>

            <%--<div class="collapse navbar-collapse" id="fitness-navbar-collapse-1">--%>
                <%--<ul class="nav navbar-nav">--%>
                    <%--<li class="active">--%>
                        <%--<a href="#">健身会员管理   </a>--%>
                    <%--</li>--%>
                    <%--<li><a href="#">健身器材管理</a></li>--%>
                    <%--<li><a href="#">健身课程管理</a></li>--%>
                    <%--<li><a href="#">健身教练管理</a></li>--%>
                    <%--<li><a href="#">健身房管理</a></li>--%>
                <%--</ul>--%>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><img src="../images/head/0.png" style="width: 35px; height: 35px;" alt="管理员">&nbsp;&nbsp;崔宗保<span class="caret"></span></a>
                        <ul class="dropdown-menu nav nav-pills nav-stacked">
                            <li class="active"><a href="#"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 修改信息</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 头像更换</a></li>
                            <li><a href="#" class="logout"><span class="glyphicon glyphicon-off" aria-hidden="true"></span> 账号退出</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="navbar-form navbar-right">
                    <div class="form-group">
                        <input type="text" id="search" class="form-control" placeholder="站内搜索">
                    </div>
                    <button type="submit" class="btn btn-default">搜索</button>
                </form><!-- /.nav navbar-nav navbar-right -->
            </div><!-- /.navbar-collapse -->
    </nav>
</div><!-- /.hrms_brand_nav -->
<script type="text/javascript">
    $(function () {
        var logined = '<%= session.getAttribute("logined")%>';
        if (logined != "success") {
            alert("没有登录，请登录后再来！");
            window.location.href = "/login/login.jsp";
        }
    });
    //主页面
    $("#fitness_logo").click(function () {
        $(this).attr("href", "/main/back_main.jsp");
    });
    //账号退出
    $(".logout").click(function () {
        $(".logout").attr("href", "/user/logout");
    });

</script>
</body>
</html>
