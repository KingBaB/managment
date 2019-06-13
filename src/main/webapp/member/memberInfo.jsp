<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/21
  Time: 16:45
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
<div class="members_container">
    <!-- 导航条 -->
    <%@ include file="../main/common/head.jsp" %>

    <!-- 中间部分（包括左边栏和员工/部门表单显示部分） -->
    <div class="members_body" style="position:relative; top:-15px;">

        <!-- 左侧栏 -->
        <%@ include file="../main/common/leftsidebar.jsp" %>

        <!-- 中间员工表格信息展示内容 -->
        <div class="member_info col-sm-10">

            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li><a href="#">健身会员管理</a></li>
                        <li><a href="/member/getAllMember?pageNo=${curPage}">会员信息</a></li>
                        <li class="active" id="selfInfo"></li>
                    </ol>
                </div>
                <!-- Table -->

                <div class="profile" style="background-color: #6dd5ed">
                    <div class="wrap">
                        <div class="profile-main">
                            <div class="profile-pic wthree">
                                <a href="#" class="pic_update_btn" data-toggle="modal" data-target=".pic-update-modal"><img src="" id="pic" alt=""></a>
                                <h4 class="member_name"></h4>
                                <div class="member" style="height: 350px">
                                    <table style="border-spacing: 10px 15px;">
                                        <tr>
                                            <td>会员编号：</td>
                                            <td><span class="member_id"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>报名课程：</td>
                                            <td><span class="member_course"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
                                            <td><span class="member_sex"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>居住地址：</td>
                                            <td><span class="member_address"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>联系方式：</td>
                                            <td><span class="member_phone"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>邮箱地址：</td>
                                            <td><span class="member_email"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>创建日期：</td>
                                            <td><span class="member_create"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>更新日期：</td>
                                            <td><span class="member_update"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>最后登录时间：</td>
                                            <td><span class="member_lastTime"></span></td>
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

<%@ include file="memberAdd.jsp" %>
<%@ include file="memberUpdate.jsp" %>
<%@ include file="memberDelete.jsp" %>
<%@ include file="memberPicUpdate.jsp" %>
<script>
    $(document).ready(function(){
        var url = window.location.href;
//        //展开导航栏
//        var str = new RegExp('member');
//        if (str.test(url)){
//            $("#collapse_member").removeAttr("hidden");
//        }

        var index=url.lastIndexOf("=");
        var member_id = url.substring(index+1,url.length);
        $.ajax({
            url: "/member/getInfoByMember_id",
            type: "GET",
            data: "member_id="+member_id,
            success:function (result) {
                if (result.code == 100){
                    var member = result.extendInfo.member;
                    $(".member_id").text(member.member_id);
                    $(".member_sex").text(member.sex == "F" ? "女" : "男");
                    $(".member_address").text(member.address);
                    $(".member_birth").text(member.birthday);
                    $(".member_email").text(member.email);
                    $(".member_phone").text(member.phone);
                    $(".member_create").text(member.create_date);
                    $(".member_update").text(member.update_date);
                    $(".member_lastTime").text("2018-04-21 19:14:59");
                    $(".member_name").text(member.member_name);
                    $("#pic").attr("src", ".."+member.pic);
                    $("#pic").attr("alt",""+member.member_name);
                    $("#selfInfo").text("会员【"+member.member_name+"】的详细信息");
                    $.ajax({
                        url: "/orders/getOrderListByMember_id",
                        type: "GET",
                        data: "member_id="+member_id,
                        success:function (result) {
                            if(result.code==100){
                                var str = "";
                                $.each(result.extendInfo.ordersList, function () {
                                    if(str == ""){
                                        str = "<span id=\"\"><a href=\"/course/courseInfo.jsp?course_id="+this.course.course_id+"\">"+this.course.course_name+"</a></span>";
                                    }else {
                                        str = str+ "，" + "<span id=\"\"><a href=\"/course/courseInfo.jsp?course_id="+this.course.course_id+"\">"+this.course.course_name+"</a></span>";
                                    }
                                });
                                $(".member_course").html(str);
                            }
                        }
                    });
                    $(document).attr("title",member.member_name);
                }
            }
        });
    });
</script>
</body>
</html>
