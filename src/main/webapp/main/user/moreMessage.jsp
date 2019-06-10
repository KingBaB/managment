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
    <title>更多留言</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <style type="text/css">
        th {
            text-align: center;
        }
    </style>

</head>
<body>
<div class="members_container" style="position: absolute;left: 280px;top: 30px">
    <!-- 导航条 -->

    <!-- 中间部分（包括左边栏和员工/部门表单显示部分） -->
    <div class="members_body" style="position:relative; top:-15px;">

        <!-- 左侧栏 -->

        <!-- 中间员工表格信息展示内容 -->
        <div class="member_info col-sm-10">

            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li class="active">更多留言</li>
                    </ol>
                </div>
                <!-- Table -->
                <div class="container">
                    <div class="row clearfix">
                        <div class="col-md-12 column">
                            <div class="row clearfix">
                                <div class="col-md-10 column" style="padding-top: 10px;padding-left: 100px;">
                                    <textarea id="add_message" rows="3" cols="80"></textarea>
                                    <button id="add_meesage_btn" type="button" class="btn btn-light" style="position: absolute;left: 725px; top:25px;">留言</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:forEach items="${messages}" var="message">

                            <div class="row clearfix">
                                <div class="col-md-4 column" style="padding-top:25px;">
                                    <%--<a target="_blank" href="/course/courseDetail?member_id=${member_id}&course_id=${course.course_id}">--%>
                                        <%--<img alt="140x140" src="..${course.pic}" style="width: 100px;height: 100px;"  />--%>
                                    <span>用户名：</span>
                                    <span>${message.member.member_name}</span>
                                    <%--</a>--%>
                                </div>
                                <div class="col-md-6 column" style="padding-top:10px;">
                                    <textarea style="position: absolute;left: 5px"  rows="3" cols="50" disabled>${message.message}</textarea>
                                    <span style="position: absolute;left: 450px; top:25px;">
                                        <a id="id${message.id}" class="glyphicon glyphicon-heart-empty" onclick="supportBtn(${message.id})" href="#" style="text-decoration: none;"></a>
                                        <span id="supportSum${message.id}" class="badge">${message.supportSum}</span>
                                    </span>
                                </div>
                            </div><br><br>

                    </c:forEach>
                </div>
                <div class="panel-body">
                    <div class="table_items">
                        当前第<span class="badge">${curPage}</span>页，共有<span class="badge">${totalPages}</span>页，总记录数<span class="badge">${totalItems}</span>条。
                    </div>
                    <nav aria-label="Page navigation" class="pull-right">
                        <ul class="pagination">
                            <li><a readonly="readonly"><input name="" id="inputPageNo" value="${curPage}" type="text" size="15" style="width:25px;height:20px;text-align:center;"/></a></li>
                            <li><a href="#" id="jump_btn">跳转</a></li>
                            <li><a href="/message/getAllMessage?member_id=${member_id}&pageNo=1">首页</a></li>
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
                                    <li class="active"><a href="/message/getAllMessage?member_id=${member_id}&pageNo=${itemPage}">${itemPage}</a></li>
                                </c:if>
                                <c:if test="${curPage != itemPage}">
                                    <li><a href="/message/getAllMessage?member_id=${member_id}&pageNo=${itemPage}">${itemPage}</a></li>
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
                            <li><a href="/message/getAllMessage?member_id=${member_id}&pageNo=${totalPages}">尾页</a></li>
                        </ul>
                    </nav>
                </div>
            </div><!-- /.panel panel-success -->
        </div><!-- /.emp_info -->

        <!-- 尾部 -->
    </div>
</div><!-- /.container -->


<script>
    $(function(){
        $.ajax({
            url: "/message/getallMessage",
            type: "GET",
            success: function (result) {
                if(result.code==100) {
                    var i = 1;
                    $.each(result.extendInfo.messageList, function () {
                        var id = this.id;
                        $.ajax({
                            url:"/message/selectSupport",
                            type:"GET",
                            data:"id="+this.id+"&member_id=${member_id}",
                            success:function (result) {
                                var status = result.extendInfo.status;
                                if(status=="Y"){
                                    $("#id"+id).removeClass("glyphicon-heart-empty");
                                    $("#id"+id).addClass("glyphicon-heart");
                                }
                            }
                        });
                    });
                }
                }
        });
    });
    function supportBtn(message_id) {
        var i = parseInt($("#supportSum"+message_id).text());
        if($("#id"+message_id).attr("class") == "glyphicon glyphicon-heart-empty"){
            $("#id"+message_id).removeClass("glyphicon-heart-empty");
            $("#id"+message_id).addClass("glyphicon-heart");
            $.ajax({
                url: "/message/addSupportSum",
                type: "GET",
                data: "id="+message_id+"&member_id=${member_id}",
                success: function (result) {
                    var status = result.extendInfo.status;
                    if(result.code==100){
                        $("#supportSum"+message_id).text(i+1);
                    }else {
                        alert(status);
                    }
                }
            });
            $.ajax({
                url: "/message/insertSupportByMM",
                type: "GET",
                data: "id="+message_id+"&member_id=${member_id}",
            });
        }else{
            $("#id"+message_id).removeClass("glyphicon-heart");
            $("#id"+message_id).addClass("glyphicon-heart-empty");
            $.ajax({
                url: "/message/subSupportSum",
                type: "GET",
                data: "id="+message_id+"&member_id=${member_id}",
                success: function (result) {
                    var status = result.extendInfo.status;
                    if(result.code==100){
                        $("#supportSum"+message_id).text(i-1);
                    }else {
                        alert(status);
                    }
                }
            });
            $.ajax({
                url: "/message/delSupportByMM",
                type: "GET",
                data: "id="+message_id+"&member_id=${member_id}",
            });
        }
    }
    $("#add_meesage_btn").click(function () {
        var logined = '<%= session.getAttribute("logined")%>';
        var username = '<%= session.getAttribute("username")%>';
        if (logined != "success") {
            alert("没有登录，请登录后再来！");
            window.location.href = "/login/login.jsp";
        }else {
            if($("#add_message").val() == "" || $.trim($("#add_message").val()).length == 0) {
                alert("留言内容不能为空！");
            }else {
                var message = $("#add_message").val();
                $.ajax({
                    url:"/message/addMessage",
                    type:"GET",
                    data: "message="+message+"&member_id=${member_id}",
                    success:function (result) {
                        var status = result.extendInfo.status;
                        if(result.code==100){
                            window.location.href="/message/getAllMessage?member_id=${member_id}&pageNo=${totalPages}";
                            $("#add_message").text("");
                        }else{
                            alert(status);
                        }
                    }
                });
            }
        }
    });
</script>
</body>
</html>
