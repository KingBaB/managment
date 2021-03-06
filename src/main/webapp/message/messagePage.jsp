<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/11
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>留言管理</title>
    <style type="text/css">
        th {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="messages_container">
    <!-- 导航条 -->
    <%@ include file="../main/common/head.jsp"%>

    <!-- 中间部分（包括左边栏和员工/部门表单显示部分） -->
    <div class="messages_body" style="position:relative; top:-15px;">

        <!-- 左侧栏 -->
        <%@ include file="../main/common/leftsidebar.jsp"%>

        <!-- 中间员工表格信息展示内容 -->
        <div class="message_info col-sm-10">

            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li><a href="#">前台管理</a></li>
                        <li class="active">留言信息</li>
                    </ol>
                </div>
                <!-- Table -->
                <table class="table table-bordered table-hover" id="message_table">
                    <thead style="text-align: center">
                    <th>留言编号</th>
                    <th>会员编号</th>
                    <th>会员姓名</th>
                    <th>留言内容</th>
                    <th>点赞数</th>
                    <th>留言时间</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                    <c:forEach items="${messages}" var="mem">
                        <tr style="text-align: center">
                            <td>${mem.id}</td>
                            <td>${mem.member.member_id}</td>
                            <td>${mem.member.member_name}</td>
                            <td>${mem.message}</td>
                            <td>${mem.supportSum}</td>
                            <td>${mem.create_time}</td>
                            <td>
                                <a href="#" role="button" class="btn btn-danger message_page_del_btn">删除</a>
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
                            <li><a href="/message/getAllMessage2?pageNo=1">首页</a></li>
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
                                    <li class="active"><a href="/message/getAllMessage2?pageNo=${itemPage}">${itemPage}</a></li>
                                </c:if>
                                <c:if test="${curPage != itemPage}">
                                    <li><a href="/message/getAllMessage2?pageNo=${itemPage}">${itemPage}</a></li>
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
                            <li><a href="/message/getAllMessage2?pageNo=${totalPages}">尾页</a></li>
                        </ul>
                    </nav>
                </div>
            </div><!-- /.panel panel-success -->
        </div><!-- /.emp_info -->

        <!-- 尾部 -->
        <%@ include file="../main/common/foot.jsp"%>
    </div>
</div><!-- /.container -->

<%--<%@ include file="messageAdd.jsp"%>--%>
<%--<%@ include file="messageUpdate.jsp"%>--%>
<%--<%@ include file="messageDelete.jsp"%>--%>


<script>
    $("#jump_btn").click(function () {
        var jump_page = $("#inputPageNo").val();
        $("#jump_btn").attr("href", "/message/getAllMessage2?pageNo="+jump_page);
//       $.ajax({
//           url:"/message/getAllMessage2?pageNo="+jump_page,
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
                $(this).attr("href", "/message/getAllMessage2?pageNo="+pageNo);
            }
        });
        //下一页
        $(".nextPage").click(function () {
            if (curPage < totalPages){
                var pageNo = curPage+1;
                $(this).attr("href", "/message/getAllMessage2?pageNo="+pageNo);
            }
        });
    })

    <!-- ==========================会员删除操作=================================== -->
    $(".message_page_del_btn").click(function () {
        var curPage = ${curPage};
        var delMessageId = $(this).parent().parent().find("td:eq(0)").text();
        var delMemberId = $(this).parent().parent().find("td:eq(1)").text();
        if (confirm("确认删除会员编号【" + delMemberId+ "】的留言信息吗？")){
            $.ajax({
                url:"/message/delMessageById",
                type:"GET",
                data:"id="+delMessageId,
                success:function (result) {
                    var status = result.extendInfo.status;
                    if (result.code == 100){
                        alert(status);
                        window.location.href="/message/getAllMessage2?pageNo="+curPage;
                    }else {
                        alert(result.extendInfo.status);
                    }
                }
            });

        }
    });
    $(".message_name").click(function () {
        var message_id = $(this).attr("id");
        $(".message_name").attr("href", "/message/messageInfo.jsp?message_id="+message_id);
//        $.ajax({
//            url: "/message/messageInfo.jsp",
//            type: "GET",
//            data: "message_id="+message_id,
//            success:function () {
//            }
//        });
    });

</script>
</body>
</html>
