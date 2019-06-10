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
                    <th>首页照片</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                        <tr style="text-align: center">
                            <td><img src="../images/main/bann2.jpg" style="width: 300px;height: 200px;"></td>
                            <td>
                                <a href="#" role="button" class="btn btn-danger home_pic_btn" data-toggle="modal" data-target=".home-pic-update-modal">修改</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="modal fade home-pic-update-modal" tabindex="-1" role="dialog" aria-labelledby="home-pic-update-modal">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">更改首页背景</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal update_pic_form" enctype="multipart/form-data" method="post">
                                    <div class="form-group">
                                        <label  for="update_pic" class="col-sm-2 control-label">首页背景</label>
                                        <div class="col-sm-8">
                                            <input type="file" name="file" class="form-control" id="update_pic">
                                            <span id="helpBlock_update_pic" class="help-block"></span>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="button" class="btn btn-primary update_pic_btn">更新</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
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
    $(".update_pic_btn").click(function () {
        var max_size = 3000;// 300k
        var path = $("#update_pic").val();
        if (path.length == 0) {
            alert("请上传课程图片！");
            return false;
        } else {
            var extStart = path.lastIndexOf('.'),
                ext = path.substring(extStart, path.length).toUpperCase();
            if (ext !== '.PNG' && ext !== '.JPG' && ext !== '.JPEG' && ext !== '.GIF') {
                alert("请上传图片！");
                $("#update_pic").val("");
                return false;
            }else {
                var pic = document.getElementById("update_pic");
                var fileData = pic.files[0];
                var size = fileData.size;
                if (size > max_size * 1024) {
                    alert("图片大小不能超过3M");
                    $("#update_pic").val("");
                    return false;
                }
            }
        }

        var picFormData = new FormData($(".update_pic_form")[0]);
        $.ajax({
            url: "/pic/updatePic",
            type: "POST",
            data: picFormData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (result) {
                if (result.code == 100){
                    alert("图片修改成功！");
                    $(".home-pic-update-modal").modal("hide");
                }else {
                    alert("图片修改异常！");
                }
            }
        });

    });
</script>
</body>
</html>
