<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/23
  Time: 20:53
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
<style>
    table{
        width:320px;
        padding-left: 55px;
        margin-left: 55px;
    }
    td{
        padding-left: 5px;
        font-family: "Microsoft YaHei UI";
        font-size: 15px;
    }
</style>
<body >
<div class="courses_container">
    <!-- 导航条 -->
    <%@ include file="../main/common/head.jsp" %>

    <!-- 中间部分（包括左边栏和员工/部门表单显示部分） -->
    <div class="courses_body" style="position:relative; top:-15px;">

        <!-- 左侧栏 -->
        <%@ include file="../main/common/leftsidebar.jsp" %>

        <!-- 中间员工表格信息展示内容 -->
        <div class="course_info col-sm-10">

            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li><a href="#">健身课程管理</a></li>
                        <li><a href="/course/getAllCourse?pageNo=${curPage}">课程信息</a></li>
                        <li class="active" id="selfInfo"></li>
                    </ol>
                </div>
                <!-- Table -->

                <div class="profile" style="background-color: #6dd5ed">
                    <div class="wrap">
                        <div class="profile-main">
                            <div class="profile-pic wthree">
                                <a href="#" class="pic_update_btn" data-toggle="modal" data-target=".pic-update-modal"><img src="../images" id="pic" alt=""></a>
                                <h4 class="course_name"></h4>
                                <div class="course" style="height: 350px">
                                    <table style="border-spacing: 10px 15px;">
                                        <tr>
                                            <td>课程编号：</td>
                                            <td><span class="course_id"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>课程名称：</td>
                                            <td><span class="course_name"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>课程教练：</td>
                                            <td><span class="coach_id"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>课程类型：</td>
                                            <td><span class="course_type"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>课程价格：</td>
                                            <td><span class="course_price"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>创建日期：</td>
                                            <td><span class="course_create"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>更新日期：</td>
                                            <td><span class="course_update"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>课程简介：</td>
                                            <td><span class="course_introduce"></span></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div><!-- /.panel panel-success -->
        </div><!-- /.emp_info -->

        <!-- 尾部 -->
        <%@ include file="../main/common/foot.jsp" %>
    </div>
</div><!-- /.container -->

<%@ include file="courseAdd.jsp" %>
<%@ include file="courseUpdate.jsp" %>
<%@ include file="courseDelete.jsp" %>
<%@ include file="coursePicUpdate.jsp" %>
<script type="text/javascript">
    $(document).ready(function(){
        var url = window.location.href;
        var index=url.lastIndexOf("=");
        var course_id = url.substring(index+1,url.length);
        $.ajax({
            url: "/course/getInfoByCourse_id",
            type: "GET",
            data: "course_id="+course_id,
            success:function (result) {
                if (result.code == 100){
                    var course = result.extendInfo.course;
                    $(".course_id").text(course.course_id);
                    $(".course_name").text(course.course_name);
                    var coach_name = "<span id=\"\"><a href=\"/coach/coachInfo.jsp?coach_id="+course.coach.coach_id+"\">"+course.coach.coach_name+"</a></span>";
                    $(".coach_id").html(coach_name);
                    $(".course_type").text(course.type);
                    $(".course_price").text(course.price);
                    $(".course_create").text(course.create_date);
                    $(".course_update").text(course.update_date);
                    $(".course_introduce").text(course.introduce);
                    $("#pic").attr("src", ".."+course.pic);
                    $("#pic").attr("alt",""+course.course_name);
                    $("#selfInfo").text("课程【"+course.course_name+"】的详细信息");
                    $(document).attr("title",course.course_name);
                }
            }
        });
    });
</script>
</body>
</html>


