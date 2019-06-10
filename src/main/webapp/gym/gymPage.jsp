<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/27
  Time: 23:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>健身房管理</title>
    <style type="text/css">
        th {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="gyms_container">
    <!-- 导航条 -->
    <%@ include file="../main/common/head.jsp"%>

    <!-- 中间部分（包括左边栏和健身房/部门表单显示部分） -->
    <div class="gyms_body" style="position:relative; top:-15px;">

        <!-- 左侧栏 -->
        <%@ include file="../main/common/leftsidebar.jsp"%>

        <!-- 中间健身房表格信息展示内容 -->
        <div class="gym_info col-sm-10">

            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li><a href="#">健身房管理</a></li>
                        <li class="active">健身房信息</li>
                    </ol>
                </div>
                <!-- Table -->
                <table class="table table-bordered table-hover" id="gym_table">
                    <thead style="text-align: center">
                    <th>健身房编号</th>
                    <th>健身房名称</th>
                    <th>总公司</th>
                    <th>管理者</th>
                    <th>健身房地址</th>
                    <th>联系方式</th>
                    <th>创建时间</th>
                    <th>更新时间</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                    <c:forEach items="${gyms}" var="gym">
                    <tr style="text-align: center">
                        <td>${gym.id}</td>
                        <td><a href="#" class="gym_name" id="${gym.id}">${gym.gym_name}</a></td>
                        <td>${gym.subjection}</td>
                        <td>${gym.manager}</td>
                        <td>${gym.address}</td>
                        <td>${gym.phone}</td>
                        <td>${gym.create_date}</td>
                        <td>${gym.update_date}</td>
                        <td>
                            <a href="#" role="button" class="btn btn-primary gym_edit_btn" data-toggle="modal" data-target=".gym-update-modal">编辑</a>
                            <a href="#" role="button" class="btn btn-danger gym_page_del_btn">删除</a>
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
                            <li><a href="/gym/getAllGym?pageNo=1">首页</a></li>
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
                                    <li class="active"><a href="/gym/getAllGym?pageNo=${itemPage}">${itemPage}</a></li>
                                </c:if>
                                <c:if test="${curPage != itemPage}">
                                    <li><a href="/gym/getAllGym?pageNo=${itemPage}">${itemPage}</a></li>
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
                            <li><a href="/gym/getAllGym?pageNo=${totalPages}">尾页</a></li>
                        </ul>
                    </nav>
                </div>
            </div><!-- /.panel panel-success -->
        </div><!-- /.emp_info -->

        <!-- 尾部 -->
        <%@ include file="../main/common/foot.jsp"%>
    </div>
</div><!-- /.container -->

<%@ include file="gymAdd.jsp"%>
<%@ include file="gymUpdate.jsp"%>
<%@ include file="gymDelete.jsp"%>


<script>
    $("#jump_btn").click(function () {
        var jump_page = $("#inputPageNo").val();
        $("#jump_btn").attr("href", "/gym/getAllGym?pageNo="+jump_page);
//       $.ajax({
//           url:"/gym/getAllGym?pageNo="+jump_page,
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
                $(this).attr("href", "/gym/getAllGym?pageNo="+pageNo);
            }
        });
        //下一页
        $(".nextPage").click(function () {
            if (curPage < totalPages){
                var pageNo = curPage+1;
                $(this).attr("href", "/gym/getAllGym?pageNo="+pageNo);
            }
        });
    })

    <!-- ==========================健身房删除操作=================================== -->
    $(".gym_page_del_btn").click(function () {
        var curPage = ${curPage};
        var delGymId = $(this).parent().parent().find("td:eq(0)").text();
        var delGymName = $(this).parent().parent().find("td:eq(1)").text();
        if (confirm("确认删除【" + delGymName+ "】的信息吗？")){
            $.ajax({
                url:"/gym/deleteGymById",
                type:"GET",
                data:"gym_id="+delGymId,
                success:function (result) {
                    if (result.code == 100){
                        alert("删除成功！");
                        window.location.href="/gym/getAllGym?pageNo="+curPage;
                    }else {
                        alert(result.extendInfo.gym_modal_del_error);
                    }
                }
            });

        }
    });
    $(".gym_name").click(function () {
        var gym_id = $(this).attr("id");
        $(".gym_name").attr("href", "/gym/gymInfo.jsp?gym_id="+gym_id);
//        $.ajax({
//            url: "/gym/gymInfo.jsp",
//            type: "GET",
//            data: "gym_id="+gym_id,
//            success:function () {
//            }
//        });
    });

</script>
</body>
</html>


