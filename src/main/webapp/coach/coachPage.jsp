<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/23
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>健身教练管理</title>
    <style type="text/css">
        th {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="coach_container">
    <!-- 导航条 -->
    <%@ include file="../main/common/head.jsp"%>

    <!-- 中间部分（包括左边栏和员工/部门表单显示部分） -->
    <div class="coachs_body" style="position:relative; top:-15px;">

        <!-- 左侧栏 -->
        <%@ include file="../main/common/leftsidebar.jsp"%>

        <!-- 中间员工表格信息展示内容 -->
        <div class="coach_info col-sm-10">

            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li><a href="#">健身教练管理</a></li>
                        <li class="active">教练信息</li>
                    </ol>
                </div>
                <!-- Table -->
                <table class="table table-bordered table-hover" id="coach_table">
                    <thead style="text-align: center">
                    <th>教练编号</th>
                    <th>教练姓名</th>
                    <th>性别</th>
                    <th>出生年月</th>
                    <th>联系方式</th>
                    <th>邮箱地址</th>
                    <th>地址</th>
                    <th>创建日期</th>
                    <th>修改日期</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                    <c:forEach items="${coachs}" var="coachs">
                        <tr style="text-align: center">
                            <td>${coachs.coach_id}</td>
                            <td><a href="#" class="coach_name" id="${coachs.coach_id}">${coachs.coach_name}</a></td>
                            <td>${coachs.sex == "F" ? "女" : "男"}</td>
                            <td>${coachs.birthday}</td>
                            <td>${coachs.phone}</td>
                            <td>${coachs.email}</td>
                            <td>${coachs.address}</td>
                            <td>${coachs.create_date}</td>
                            <td>${coachs.update_date}</td>
                            <td>
                                <a href="#" role="button" class="btn btn-primary coach_edit_btn" data-toggle="modal" data-target=".coach-update-modal">编辑</a>
                                <a href="#" role="button" class="btn btn-danger coach_page_del_btn">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <div class="panel-body">
                    <div class="table_items">
                        当前第<span class="badge">${curPage}</span>页，共有<span class="badge">${totalPages}</span>页，总记录数<span class="badge">${totalItems}</span>条。
                    </div>
                    <nav aria-label="Page navigation" class="pull-right">
                        <ul class="pagination">
                            <li><a readonly="readonly"><input name="" id="inputPageNo" value="${curPage}" type="text" size="15" style="width:25px;height:20px;text-align:center;"/></a></li>
                            <li><a href="#" id="jump_btn">跳转</a></li>
                            <li><a href="/coach/getAllCoach?pageNo=1">首页</a></li>
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
                                    <li class="active"><a href="/coach/getAllCoach?pageNo=${itemPage}">${itemPage}</a></li>
                                </c:if>
                                <c:if test="${curPage != itemPage}">
                                    <li><a href="/coach/getAllCoach?pageNo=${itemPage}">${itemPage}</a></li>
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
                            <li><a href="/coach/getAllCoach?pageNo=${totalPages}">尾页</a></li>
                        </ul>
                    </nav>
                </div>
            </div><!-- /.panel panel-success -->
        </div><!-- /.emp_info -->

        <!-- 尾部 -->
        <%@ include file="../main/common/foot.jsp"%>
    </div>
</div><!-- /.container -->

<%@ include file="coachAdd.jsp"%>
<%@ include file="coachUpdate.jsp"%>
<%@ include file="coachDelete.jsp"%>


<script>
    $("#jump_btn").click(function () {
        var jump_page = $("#inputPageNo").val();
        $("#jump_btn").attr("href", "/coach/getAllCoach?pageNo="+jump_page);
//       $.ajax({
//           url:"/coach/getAllCoach?pageNo="+jump_page,
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
                $(this).attr("href", "/coach/getAllCoach?pageNo="+pageNo);
            }
        });
        //下一页
        $(".nextPage").click(function () {
            if (curPage < totalPages){
                var pageNo = curPage+1;
                $(this).attr("href", "/coach/getAllCoach?pageNo="+pageNo);
            }
        });
    })

    <!-- ==========================会员删除操作=================================== -->
    $(".coach_page_del_btn").click(function () {
        var curPage = ${curPage};
        var delCoachId = $(this).parent().parent().find("td:eq(0)").text();
        var delCoachName = $(this).parent().parent().find("td:eq(1)").text();
        if (confirm("确认删除【" + delCoachName+ "】的信息吗？")){
            $.ajax({
                url:"/coach/deleteCoachById",
                type:"GET",
                data:"coach_id="+delCoachId,
                success:function (result) {
                    if (result.code == 100){
                        alert("删除成功！");
                        window.location.href="/coach/getAllCoach?pageNo="+curPage;
                    }else {
                        alert(result.extendInfo.coach_modal_del_error);
                    }
                }
            });

        }
    });
    $(".coach_name").click(function () {
        var coach_id = $(this).attr("id");
        $(".coach_name").attr("href", "/coach/coachInfo.jsp?coach_id="+coach_id);
//        $.ajax({
//            url: "/coach/coachInfo.jsp",
//            type: "GET",
//            data: "coach_id="+coach_id,
//            success:function () {
//            }
//        });
    });

</script>
</body>
</html>
