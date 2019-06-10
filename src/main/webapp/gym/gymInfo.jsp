<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/27
  Time: 23:15
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
        margin-left: 55px;
        border:2px;
    }
    .th{
        padding-left: 0px;
        font-family: "Microsoft YaHei UI";
        font-size: 15px;
        width: 100px;
    }
</style>
<body >
<div class="gyms_container">
    <!-- 导航条 -->
    <%@ include file="../main/common/head.jsp" %>

    <!-- 中间部分（包括左边栏和员工/部门表单显示部分） -->
    <div class="gyms_body" style="position:relative; top:-15px;">

        <!-- 左侧栏 -->
        <%@ include file="../main/common/leftsidebar.jsp" %>

        <!-- 中间员工表格信息展示内容 -->
        <div class="gym_info col-sm-10">

            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li><a href="#">健身房管理</a></li>
                        <li><a href="/gym/getAllGym?pageNo=${curPage}">健身房信息</a></li>
                        <li class="active" id="selfInfo"></li>
                    </ol>
                </div>
                <!-- Table -->

                <div class="profile" style="background-color: #6dd5ed">
                    <div class="wrap">
                        <div class="profile-main">
                            <div class="profile-pic wthree">
                                <a href="#" class="pic_update_btn" data-toggle="modal" data-target=".pic-update-modal"><img src="" id="pic" alt=""></a>
                                <h4 class="gym_name"></h4>
                                <div class="gym" style="height: 500px">
                                    <table style="border-spacing: 10px 15px;">
                                        <tr>
                                            <td class="th">健身房编号：</td>
                                            <td><span class="gym_id"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td class="th">健身房名称：</td>
                                            <td><span class="gym_name"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td class="th">总公司：</td>
                                            <td><span class="gym_company"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td class="th">管理者：</td>
                                            <td><span class="gym_manage"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td class="th">健身房地址：</td>
                                            <td><span class="gym_address"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td class="th">联系方式：</td>
                                            <td><span class="gym_phone"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td class="th">面积：</td>
                                            <td><span class="gym_area"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td class="th">创建日期：</td>
                                            <td><span class="gym_create"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td class="th">更新日期：</td>
                                            <td><span class="gym_update"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td class="th">健身房简介：</td>
                                            <td><span class="gym_introduce"></span></td>
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

<%--<%@ include file="gymAdd.jsp" %>--%>
<%--<%@ include file="gymUpdate.jsp" %>--%>
<%--<%@ include file="gymDelete.jsp" %>--%>
<%--<%@ include file="gymPicUpdate.jsp" %>--%>
<script type="text/javascript">
    $(document).ready(function(){
        var url = window.location.href;
        var index=url.lastIndexOf("=");
        var gym_id = url.substring(index+1,url.length);
        $.ajax({
            url: "/gym/getInfoByGym_id",
            type: "GET",
            data: "gym_id="+gym_id,
            success:function (result) {
                if (result.code == 100){
                    var gym = result.extendInfo.gym;
                    $(".gym_id").text(gym.gym_id);
                    $(".gym_name").text(gym.gym_name);
                    $(".gym_company").text(gym.subjection);
                    $(".gym_manage").text(gym.manager);
                    $(".gym_address").text(gym.address);
                    $(".gym_phone").text(gym.phone);
                    $(".gym_area").text(gym.area);
                    $(".gym_create").text(gym.create_date);
                    $(".gym_update").text(gym.update_date);
                    $(".gym_introduce").text(gym.introduce);
                    $("#pic").attr("src", ".."+gym.pic);
                    $("#pic").attr("alt",""+gym.gym_name);
                    $("#selfInfo").text("健身房【"+gym.gym_name+"】的详细信息");
                    $(document).attr("title","健身房【"+gym.gym_name+"】的信息");
                }
            }
        });
    });
</script>
</body>
</html>



