<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/5/9
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>我的收藏</title>
</head>
<link href="../css/fontawesome-all.min.css" rel="stylesheet" type="text/css" media="all">
<link href="../css/info.css" rel='stylesheet' type='text/css'/>
<style>
    .col-md-3{
        overflow: hidden;
        text-overflow:ellipsis;
        white-space: nowrap;
    }

</style>
<body>
<div class="members_container">
    <!-- 导航条 -->
    <%@ include file="/main/common/userHead.jsp" %>

    <!-- 中间部分（包括左边栏和员工/部门表单显示部分） -->
    <div class="members_body" style="position:relative; top:-15px;">

        <!-- 左侧栏 -->
        <%@ include file="/main/common/userLeft.jsp" %>

        <!-- 中间员工表格信息展示内容 -->
        <div class="member_info col-sm-10">

            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li class="active">我的收藏夹</li>
                    </ol>
                </div>
                <!-- Table -->
                    <div class="col-md-10 column">
                        <div class="row clearfix" style="width: 1234px">
                        <tbody>
                            <c:forEach items="${carts}" var="cart">
                                    <div id="${cart.id}" class="col-md-3 column" style="width:250px;height: 400px;padding-left: 20px">
                                        <a href="/collections/payPage?member_id=${member_id}&course_id=${cart.course.course_id}" target="_blank">
                                            <img alt="140x140" src="..${cart.course.pic}" style="width:250px;height:250px;" /><br>
                                        </a>
                                        <strong>
                                            ¥ ${cart.course.price}
                                        </strong><br>
                                        <a href="/collections/payPage?member_id=${member_id}&course_id=${cart.course.course_id}" target="_blank">
                                            <span style="color:#1f2223">课程名称：${cart.course.course_name}</span><br>
                                        </a>
                                        <span style="color:#1f2223">课程类型：${cart.course.type}</span><br>
                                        <span style="color:#1f2223">课程教练：${cart.course.coach.coach_name}</span><br>
                                        <span style="color:#1f2223">课程时间：${cart.course.class_time}</span><br>
                                        <span style="color:#1f2223">课程简介：<abbr title="${cart.course.introduce}" aria-valuemax="10">${cart.course.introduce}</abbr></span><br>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <button type="button" onclick="delCollections(${cart.id})" class="btn btn-default">删除</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <button type="button" onclick="addCart(${cart.course.course_id},${cart.member.member_id},${cart.id})" class="btn btn-default">移入购物车</button>
                                    </div>
                            </c:forEach>
                        </tbody>
                        </div>
                    </div>
                <div class="panel-body">
                    <nav aria-label="Page navigation" class="pull-right">
                        <div class="table_items" style="padding-left: 0px">
                            当前第<span class="badge">${curPage}</span>页，共有<span class="badge">${totalPages}</span>页，总记录数<span class="badge">${totalItems}</span>条。
                        </div>
                        <ul class="pagination">
                            <li><a readonly="readonly"><input name="" id="inputPageNo" value="${curPage}" type="text" size="15" style="width:25px;height:20px;text-align:center;"/></a></li>
                            <li><a href="#" id="jump_btn">跳转</a></li>
                            <li><a href="/collections/getCollectionsByMember_id?pageNo=1&member_id=${member_id}">首页</a></li>
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
                                    <li class="active"><a href="/collections/getCollectionsByMember_id?pageNo=${itemPage}&member_id=${member_id}">${itemPage}</a></li>
                                </c:if>
                                <c:if test="${curPage != itemPage}">
                                    <li><a href="/collections/getCollectionsByMember_id?pageNo=${itemPage}&member_id=${member_id}">${itemPage}</a></li>
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
                            <li><a href="/collections/getCollectionsByMember_id?pageNo=${totalPages}&member_id=${member_id}">尾页</a></li>
                        </ul>
                    </nav>
                </div>
            </div><!-- /.panel panel-success -->
        </div><!-- /.emp_info -->

        <!-- 尾部 -->
        <%--<%@ include file="../main/common/foot.jsp" %>--%>
    </div>
</div><!-- /.container -->
</div>
<script>
    function delCollections(id) {
        $.ajax({
            url: "/collections/delCollectionsById",
            type: "GET",
            data: "id="+id,
            success: function (result) {
                if(result.code == 100){
                    $("div#"+id).remove()
                    alert("删除成功");
                }else {
                    alert(result.extendInfo.status);
                }
            }
        });
    }
    function addCart(course_id,member_id,id) {
        $.ajax({
            url: "/cart/addCart",
            type: "POST",
            data: "course_id="+course_id+"&member_id="+member_id,
            success: function (result) {
                var status = result.extendInfo.status;
                if(result.code == 100){
                    $("div#"+id).remove();
                    $.ajax({
                        url: "/collections/delCollectionsById",
                        type: "get",
                        data: "id="+id,
                        success: function () {
                            alert(status);
                        }
                    });

                }else{
                    alert(status);
                }
            }
        });
    }
</script>
</body>
</html>
