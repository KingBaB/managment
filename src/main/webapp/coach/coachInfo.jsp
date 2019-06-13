<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/23
  Time: 17:37
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
    th{
        font-family: "Microsoft YaHei UI";
        font-size: 15px;
    }
    td{
        padding-left: 5px;
        font-family: "Microsoft YaHei UI";
        font-size: 15px;
    }
</style>
<body >
<div class="coachs_container">
    <!-- 导航条 -->
    <%@ include file="../main/common/head.jsp" %>

    <!-- 中间部分（包括左边栏和员工/部门表单显示部分） -->
    <div class="coachs_body" style="position:relative; top:-15px;">

        <!-- 左侧栏 -->
        <%@ include file="../main/common/leftsidebar.jsp" %>

        <!-- 中间员工表格信息展示内容 -->
        <div class="coach_info col-sm-10">

            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li><a href="#">健身教练管理</a></li>
                        <li><a href="/coach/getAllCoach?pageNo=${curPage}">教练信息</a></li>
                        <li class="active" id="selfInfo"></li>
                    </ol>
                </div>
                <!-- Table -->

                <div class="profile" style="background-color: #6dd5ed">
                    <div class="wrap">
                        <div class="profile-main">
                            <div class="profile-pic wthree">
                                <a href="#" class="pic_update_btn" data-toggle="modal" data-target=".pic-update-modal"><img src="" id="pic" alt=""></a>
                                <h4 class="coach_name"></h4>
                                <div class="coach" style="height: 350px">
                                    <table style="border-spacing: 10px 15px;">
                                        <tr>
                                            <td>教练编号：</td>
                                            <td><span class="coach_id"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>课程名单：</td>
                                            <td><span class="coach_courseList"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
                                            <td><span class="coach_sex"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>居住地址：</td>
                                            <td><span class="coach_address"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>联系方式：</td>
                                            <td><span class="coach_phone"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>邮箱地址：</td>
                                            <td><span class="coach_email"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>创建日期：</td>
                                            <td><span class="coach_create"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>更新日期：</td>
                                            <td><span class="coach_update"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>最后登录时间：</td>
                                            <td><span class="coach_lastTime"></span></td>
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

<%@ include file="coachAdd.jsp" %>
<%@ include file="coachUpdate.jsp" %>
<%@ include file="coachDelete.jsp" %>
<%@ include file="coachPicUpdate.jsp" %>
<script>
    $(document).ready(function(){
        var url = window.location.href;
        var index=url.lastIndexOf("=");
        var coach_id = url.substring(index+1,url.length);
        $.ajax({
            url: "/coach/getInfoByCoach_id",
            type: "GET",
            data: "coach_id="+coach_id,
            success:function (result) {
                if (result.code == 100){
                    var coach = result.extendInfo.coach;
                    $(".coach_id").text(coach.coach_id);
                    $(".coach_sex").text(coach.sex == "F" ? "女" : "男");
                    $(".coach_address").text(coach.address);
                    $(".coach_birth").text(coach.birthday);
                    $(".coach_email").text(coach.email);
                    $(".coach_phone").text(coach.phone);
                    $(".coach_create").text(coach.create_date);
                    $(".coach_update").text(coach.update_date);
                    $(".coach_lastTime").text("2018-04-21 19:14:59");
                    $(".coach_name").text(coach.coach_name);
                    $("#pic").attr("src", ".."+coach.pic);
                    $("#pic").attr("alt",""+coach.coach_name);
                    $("#selfInfo").text("教练【"+coach.coach_name+"】的详细信息");
                    $.ajax({
                        url: "/course/getInfoByCoach_id",
                        type: "GET",
                        data: "coach_id="+coach_id,
                        success:function (result) {
                            if(result.code==100){
                                var str = "";
                                $.each(result.extendInfo.courseList, function () {
                                    if(str == ""){
                                        str = "<span id=\"\"><a href=\"/course/courseInfo.jsp?course_id="+this.course_id+"\">"+this.course_name+"</a></span>";
                                    }else {
                                        str = str+ "，" + "<span id=\"\"><a href=\"/course/courseInfo.jsp?course_id="+this.course_id+"\">"+this.course_name+"</a></span>";
                                    }
                                });
                                $(".coach_courseList").html(str);
                            }
                        }
                    });
                    $(document).attr("title",coach.coach_name);
                }
            }
        });
    });
</script>
</body>
</html>

