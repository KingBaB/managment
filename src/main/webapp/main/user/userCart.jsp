<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/5/9
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
</head>
<link href="../css/fontawesome-all.min.css" rel="stylesheet" type="text/css" media="all">
<link href="../css/info.css" rel='stylesheet' type='text/css'/>
<body>
<div class="members_container">
    <!-- 导航条 -->
    <%@ include file="/main/common/userHead.jsp" %>

    <!-- 中间部分（包括左边栏和员工/部门表单显示部分） -->
    <div class="members_body" style="position:relative; top:-15px;">

        <!-- 左侧栏 -->
        <%@ include file="/main/common/userLeft.jsp" %>

        <!-- 中间员工表格信息展示内容 -->
        <div class="member_info col-sm-10" style="position: absolute;left: 150px">

            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li><a href="#">收藏夹</a></li>
                        <li class="active" id="selfInfo"></li>
                    </ol>
                </div>
                <!-- Table -->

                <div class="profile">
                    <div class="wrap">
                        <div class="col-md-10 column">
                            <div class="row clearfix">

                                <c:forEach items="${members}" var="mem">
                                    <div class="col-md-3 column">
                                        <img alt="140x140" src="/images/head/0008.png" />
                                        <h3>
                                            h3. 这是一套可视化布局系统.
                                        </h3>
                                    </div>
                                </c:forEach>

                            </div>
                            <ul class="pagination pagination-sm">
                                <li>
                                    <a href="#">Prev</a>
                                </li>
                                <li>
                                    <a href="#">1</a>
                                </li>
                                <li>
                                    <a href="#">2</a>
                                </li>
                                <li>
                                    <a href="#">3</a>
                                </li>
                                <li>
                                    <a href="#">4</a>
                                </li>
                                <li>
                                    <a href="#">5</a>
                                </li>
                                <li>
                                    <a href="#">Next</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="col-md-4 column">
                        </div>
                        <div class="col-md-8 column">
                        </div>
                    </div>
                    </div>
                </div><!-- /.panel panel-success -->
            </div><!-- /.emp_info -->

            <!-- 尾部 -->
            <%--<%@ include file="../main/common/foot.jsp" %>--%>
        </div>
    </div><!-- /.container -->
</div>
    <script>
        //    <div class="class_left img2 box" style="width:253px;height: 272px">
        //        <img id="course_train_pic2" src="/images/course/半身照%20(1).png">
        //        <div class="box-content">
        //              <span class="title"> <a href="#" id="signUp2" class="btn btn-danger">立即报名</a> </span>
        //              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        //               <span class="title"> <a onclick="collections(id)" id="cart2" class="btn btn-danger">收藏</a> </span>
        //        </div>
        //    </div>
        //    $(".wthree").append("<div class=\"class_left img2 box\" style=\"width:253px;height: 272px\"><img id=\"course_train_pic2\" src=\"/images/course/半身照%20(1).png\"><div class=\"box-content\"><span class=\"title\"> <a href=\"#\" id=\"signUp2\" class=\"btn btn-danger\">立即报名</a> </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=\"title\"> <a onclick=\"collections(id)\" id=\"cart2\" class=\"btn btn-danger\">收藏</a> </span></div></div>");
    </script>
</body>
</html>
