<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/23
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>健身课程管理</title>
    <style type="text/css">
        th {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="course_container">
    <!-- 导航条 -->
    <%@ include file="../main/common/head.jsp"%>

    <!-- 中间部分（包括左边栏和员工/部门表单显示部分） -->
    <div class="courses_body" style="position:relative; top:-15px;">

        <!-- 左侧栏 -->
        <%@ include file="../main/common/leftsidebar.jsp"%>

        <!-- 中间员工表格信息展示内容 -->
        <div class="course_info col-sm-10">

            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li><a href="#">健身教练管理</a></li>
                        <li class="active">教练信息</li>
                    </ol>
                </div>
                <!-- Table -->
                <table class="table table-bordered table-hover" id="course_table">
                    <thead style="text-align: center">
                    <th style="text-align: center">课程编号</th>
                    <th style="text-align: center">课程名称</th>
                    <th style="text-align: center">教练名字</th>
                    <th style="text-align: center">课程类型</th>
                    <th style="text-align: center">价格</th>
                    <th style="text-align: center">创建日期</th>
                    <th style="text-align: center">更新日期</th>
                    <th style="text-align: center">操作</th>
                    </thead>
                    <tbody>
                    <c:forEach items="${courses}" var="courses">
                        <tr style="text-align: center">
                            <td>${courses.course_id}</td>
                            <td><a href="#" class="course_name" id="${courses.course_id}">${courses.course_name}</a></td>
                            <td>${courses.coach.coach_name}</td>
                            <td>${courses.type}</td>
                            <td>${courses.price}</td>
                            <td>${courses.create_date}</td>
                            <td>${courses.update_date}</td>
                            <td>
                                <a href="#" role="button" class="btn btn-primary course_edit_btn" data-toggle="modal" data-target=".course-update-modal">编辑</a>
                                <a href="#" role="button" class="btn btn-danger course_page_del_btn">删除</a>
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
                            <li><a href="/course/getAllCourse?pageNo=1">首页</a></li>
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
                                    <li class="active"><a href="/course/getAllCourse?pageNo=${itemPage}">${itemPage}</a></li>
                                </c:if>
                                <c:if test="${curPage != itemPage}">
                                    <li><a href="/course/getAllCourse?pageNo=${itemPage}">${itemPage}</a></li>
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
                            <li><a href="/course/getAllCourse?pageNo=${totalPages}">尾页</a></li>
                        </ul>
                    </nav>
                </div>
            </div><!-- /.panel panel-success -->
        </div><!-- /.emp_info -->

        <!-- 尾部 -->
        <%@ include file="../main/common/foot.jsp"%>
    </div>
</div><!-- /.container -->

<%@ include file="courseAdd.jsp"%>
<%@ include file="courseUpdate.jsp"%>
<%@ include file="courseDelete.jsp"%>


<script>
    $("#jump_btn").click(function () {
        var jump_page = $("#inputPageNo").val();
        $("#jump_btn").attr("href", "/course/getAllCourse?pageNo="+jump_page);
//       $.ajax({
//           url:"/course/getAllCourse?pageNo="+jump_page,
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
                $(this).attr("href", "/course/getAllCourse?pageNo="+pageNo);
            }
        });
        //下一页
        $(".nextPage").click(function () {
            if (curPage < totalPages){
                var pageNo = curPage+1;
                $(this).attr("href", "/course/getAllCourse?pageNo="+pageNo);
            }
        });
    })

    <!-- ==========================会员删除操作=================================== -->
    $(".course_page_del_btn").click(function () {
        var curPage = ${curPage};
        var delCourseId = $(this).parent().parent().find("td:eq(0)").text();
        var delCourseName = $(this).parent().parent().find("td:eq(1)").text();
        if (confirm("确认删除【" + delCourseName+ "】的信息吗？")){
            $.ajax({
                url:"/course/deleteCourseById",
                type:"GET",
                data:"course_id="+delCourseId,
                success:function (result) {
                    if (result.code == 100){
                        alert("删除成功！");
                        window.location.href="/course/getAllCourse?pageNo="+curPage;
                    }else {
                        alert(result.extendInfo.course_modal_del_error);
                    }
                }
            });

        }
    });
    $(".course_name").click(function () {
        var course_id = $(this).attr("id");
        $(".course_name").attr("href", "/course/courseInfo.jsp?course_id="+course_id);
//        $.ajax({
//            url: "/course/courseInfo.jsp",
//            type: "GET",
//            data: "course_id="+course_id,
//            success:function () {
//            }
//        });
    });

</script>
</body>
</html>

