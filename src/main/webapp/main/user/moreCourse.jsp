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
    <title>健身课程</title>
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
                        <li class="active">更多课程</li>
                        <form class="navbar-form navbar-right" style="margin-top:-7px;margin-right:-30px;">
                            <div class="form-group">
                                <input type="text" id="search" class="form-control" placeholder="类型搜索">
                            </div>
                            <button type="button" id="search_btn" class="btn btn-default">搜索</button>
                        </form>
                    </ol>
                </div>
                <!-- Table -->
                    <c:forEach items="${courses}" var="course">
                        <div class="container">
                            <div class="row clearfix">
                                <div class="col-md-4 column">
                                    <a target="_blank" href="/course/courseDetail?member_id=${member_id}&course_id=${course.course_id}">
                                        <img alt="140x140" src="..${course.pic}" style="width: 100px;height: 100px;"  />
                                        <span id="name${course.course_id}">${course.course_name}</span>
                                    </a>
                                    <span id="type${course.type}" style="position: absolute;left: 256px;top:40px;">类型：${course.type}</span>
                                </div>
                                <div class="col-md-6 column" style="padding-top:10px;">
                                    <textarea style="position: absolute;left: 5px"  rows="3" cols="50" disabled>${course.introduce}</textarea>
                                    <span style="position: absolute;left: 450px; top:25px;"><a class="btn btn-success" onclick="collections(${member_id},${course.course_id})" href="#">移入收藏夹</a></span>
                                </div>
                                <div class="col-md-2 column" style="padding-top:10px;">

                                </div>
                            </div><br>
                        </div>
                    </c:forEach>

                <div class="panel-body">
                    <div class="table_items">
                        当前第<span class="badge">${curPage}</span>页，共有<span class="badge">${totalPages}</span>页，总记录数<span class="badge">${totalItems}</span>条。
                    </div>
                    <nav aria-label="Page navigation" class="pull-right">
                        <ul class="pagination">
                            <li><a readonly="readonly"><input name="" id="inputPageNo" value="${curPage}" type="text" size="15" style="width:25px;height:20px;text-align:center;"/></a></li>
                            <li><a href="#" id="jump_btn">跳转</a></li>
                            <li><a href="/course/getallCourse?pageNo=1">首页</a></li>
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
                                    <li class="active"><a href="/course/getallCourse?pageNo=${itemPage}">${itemPage}</a></li>
                                </c:if>
                                <c:if test="${curPage != itemPage}">
                                    <li><a href="/course/getallCourse?pageNo=${itemPage}">${itemPage}</a></li>
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
                            <li><a href="/course/getallCourse?pageNo=${totalPages}">尾页</a></li>
                        </ul>
                    </nav>
                </div>
            </div><!-- /.panel panel-success -->
        </div><!-- /.emp_info -->

        <!-- 尾部 -->
    </div>
</div><!-- /.container -->


<script>
    function collections(member_id,course_id) {
        $.ajax({
            url: "/collections/addCollections",
            type: "GET",
            data: "course_id="+course_id+"&member_id="+member_id,
            success: function (result) {
                var status = result.extendInfo.status;
                if (result.code==100){
                    alert(status);
                }else {
                    alert(status);
                }
            }
        });
    }
</script>
</body>
</html>
