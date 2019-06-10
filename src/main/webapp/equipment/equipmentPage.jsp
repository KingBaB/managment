<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/26
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>健身器材管理</title>
    <style type="text/css">
        th {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="equipments_container">
    <!-- 导航条 -->
    <%@ include file="../main/common/head.jsp"%>

    <!-- 中间部分（包括左边栏和器材/部门表单显示部分） -->
    <div class="equipments_body" style="position:relative; top:-15px;">

        <!-- 左侧栏 -->
        <%@ include file="../main/common/leftsidebar.jsp"%>

        <!-- 中间器材表格信息展示内容 -->
        <div class="equipment_info col-sm-10">

            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li><a href="#">健身器材管理</a></li>
                        <li class="active">设备信息</li>
                    </ol>
                </div>
                <!-- Table -->
                <table class="table table-bordered table-hover" id="equipment_table">
                    <thead style="text-align: center">
                    <th>设备编号</th>
                    <th>设备名称</th>
                    <th>设备数量</th>
                    <th>创建日期</th>
                    <th>修改日期</th>
                    <th>设备简介</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                    <c:forEach items="${equipments}" var="equip">
                        <tr style="text-align: center">
                            <td>${equip.equipment_id}</td>
                            <td><a href="#" class="equipment_name" id="${equip.equipment_id}">${equip.equipment_name}</a></td>
                            <td>${equip.number}</td>
                            <td>${equip.create_date}</td>
                            <td>${equip.update_date}</td>
                            <td>${equip.introduce}</td>
                            <td>
                                <a href="#" role="button" class="btn btn-primary equipment_edit_btn" data-toggle="modal" data-target=".equipment-update-modal">编辑</a>
                                <a href="#" role="button" class="btn btn-danger equipment_page_del_btn">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>

                <div class="panel-body">
                    <div class="table_items">
                        当前第<span class="badge">${curPage}</span>页，共有<span class="badge">${totalPages}</span>页，总记录数<span class="badge">${totalItems}</span>条。
                    </div>
                    <nav aria-label="Page navigation" class="pull-right">
                        <ul class="pagination">
                            <li><a readonly="readonly"><input name="" id="inputPageNo" value="${curPage}" type="text" size="15" style="width:25px;height:20px;text-align:center;"/></a></li>
                            <li><a href="#" id="jump_btn">跳转</a></li>
                            <li><a href="/equipment/getAllEquipment?pageNo=1">首页</a></li>
                            <c:if test="${curPage==1}">
                                <li class="disabled">
                                    <a href="#" aria-label="Previous" class="prePage">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${curPage!=1}">
                                <li>
                                    <a href="#" aria-label="Previous" class="prePage">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>

                            <c:forEach begin="1" end="${totalPages<5?totalPages:5}" step="1" var="itemPage">
                                <c:if test="${curPage == itemPage}">
                                    <li class="active"><a href="/equipment/getAllEquipment?pageNo=${itemPage}">${itemPage}</a></li>
                                </c:if>
                                <c:if test="${curPage != itemPage}">
                                    <li><a href="/equipment/getAllEquipment?pageNo=${itemPage}">${itemPage}</a></li>
                                </c:if>
                            </c:forEach>

                            <c:if test="${curPage==totalPages}">
                                <li class="disabled" class="nextPage">
                                    <a href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${curPage!=totalPages}">
                                <li>
                                    <a href="#" aria-label="Next" class="nextPage">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <li><a href="/equipment/getAllEquipment?pageNo=${totalPages}">尾页</a></li>
                        </ul>
                    </nav>
                </div>
            </div><!-- /.panel panel-success -->
        </div><!-- /.emp_info -->

        <!-- 尾部 -->
        <%@ include file="../main/common/foot.jsp"%>
    </div>
</div><!-- /.container -->

<%@ include file="equipmentAdd.jsp"%>
<%@ include file="equipmentUpdate.jsp"%>
<%@ include file="equipmentDelete.jsp"%>


<script>
    $("#jump_btn").click(function () {
        var jump_page = $("#inputPageNo").val();
        $("#jump_btn").attr("href", "/equipment/getAllEquipment?pageNo="+jump_page);
//       $.ajax({
//           url:"/equipment/getAllEquipment?pageNo="+jump_page,
//           type:"GET",
//           success:function (result) {
//           }
//       });
    });
    $(function () {

        //上一页
        var curPage = ${curPage};
        var totalPages = ${totalPages};
        $(".prePage").click(function () {
            if (curPage > 1){
                var pageNo = curPage-1;
                $(this).attr("href", "/equipment/getAllEquipment?pageNo="+pageNo);
            }
        });
        //下一页
        $(".nextPage").click(function () {
            if (curPage < totalPages){
                var pageNo = curPage+1;
                $(this).attr("href", "/equipment/getAllEquipment?pageNo="+pageNo);
            }
        });
    })

    <!-- ==========================器材删除操作=================================== -->
    $(".equipment_page_del_btn").click(function () {
        var curPage = ${curPage};
        var delEquipmentId = $(this).parent().parent().find("td:eq(0)").text();
        var delEquipmentName = $(this).parent().parent().find("td:eq(1)").text();
        if (confirm("确认删除【" + delEquipmentName+ "】的信息吗？")){
            $.ajax({
                url:"/equipment/deleteEquipmentById",
                type:"GET",
                data:"equipment_id="+delEquipmentId,
                success:function (result) {
                    if (result.code == 100){
                        alert("删除成功！");
                        window.location.href="/equipment/getAllEquipment?pageNo="+curPage;
                    }else {
                        alert(result.extendInfo.equipment_modal_del_error);
                    }
                }
            });

        }
    });
    $(".equipment_name").click(function () {
        var equipment_id = $(this).attr("id");
        $(".equipment_name").attr("href", "/equipment/equipmentInfo.jsp?equipment_id="+equipment_id);
//        $.ajax({
//            url: "/equipment/equipmentInfo.jsp",
//            type: "GET",
//            data: "equipment_id="+equipment_id,
//            success:function () {
//            }
//        });
    });

</script>
</body>
</html>

