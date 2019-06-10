<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/27
  Time: 22:00
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
        margin-left: 70px;
        border:2px;
    }
    .th{
        padding-left: 5px;
        font-family: "Microsoft YaHei UI";
        font-size: 15px;
        width: 90px;
    }
</style>
<body >
<div class="equipments_container">
    <!-- 导航条 -->
    <%@ include file="../main/common/head.jsp" %>

    <!-- 中间部分（包括左边栏和员工/部门表单显示部分） -->
    <div class="equipments_body" style="position:relative; top:-15px;">

        <!-- 左侧栏 -->
        <%@ include file="../main/common/leftsidebar.jsp" %>

        <!-- 中间员工表格信息展示内容 -->
        <div class="equipment_info col-sm-10">

            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li><a href="#">健身设备管理</a></li>
                        <li><a href="/equipment/getAllEquipment?pageNo=${curPage}">设备信息</a></li>
                        <li class="active" id="selfInfo"></li>
                    </ol>
                </div>
                <!-- Table -->

                <div class="profile" style="background-color: #6dd5ed">
                    <div class="wrap">
                        <div class="profile-main">
                            <div class="profile-pic wthree">
                                <a href="#" class="pic_update_btn" data-toggle="modal" data-target=".pic-update-modal"><img src="" id="pic" alt=""></a>
                                <h4 class="equipment_name"></h4>
                                <div class="equipment" style="height: 350px">
                                    <table style="border-spacing: 10px 15px;">
                                        <tr>
                                            <td class="th">设备编号：</td>
                                            <td><span class="equipment_id"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td class="th">设备名称：</td>
                                            <td><span class="equipment_name"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td class="th">设备数量：</td>
                                            <td><span class="equipment_number"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td class="th">创建日期：</td>
                                            <td><span class="equipment_create"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td class="th">更新日期：</td>
                                            <td><span class="equipment_update"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td class="th">设备简介：</td>
                                            <td><span class="equipment_introduce"></span></td>
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

<%@ include file="equipmentAdd.jsp" %>
<%@ include file="equipmentUpdate.jsp" %>
<%@ include file="equipmentDelete.jsp" %>
<%@ include file="equipmentPicUpdate.jsp" %>
<script type="text/javascript">
    $(document).ready(function(){
        var url = window.location.href;
        var index=url.lastIndexOf("=");
        var equipment_id = url.substring(index+1,url.length);
        $.ajax({
            url: "/equipment/getInfoByEquipment_id",
            type: "GET",
            data: "equipment_id="+equipment_id,
            success:function (result) {
                if (result.code == 100){
                    var equipment = result.extendInfo.equipment;
                    $(".equipment_id").text(equipment.equipment_id);
                    $(".equipment_name").text(equipment.equipment_name);
                    $(".equipment_number").text(equipment.number);
                    $(".equipment_price").text(equipment.price);
                    $(".equipment_create").text(equipment.create_date);
                    $(".equipment_update").text(equipment.update_date);
                    $(".equipment_introduce").text(equipment.introduce);
                    $("#pic").attr("src", ".."+equipment.pic);
                    $("#pic").attr("alt",""+equipment.equipment_name);
                    $("#selfInfo").text("设备【"+equipment.equipment_name+"】的详细信息");
                    $(document).attr("title","设备【"+equipment.equipment_name+"】的信息");
                }
            }
        });
    });
</script>
</body>
</html>



