<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/23
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Course Add Page</title>
</head>
<body>
<div class="modal fade course-add-modal" tabindex="-1" role="dialog" aria-labelledby="course-add-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加课程信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal add_course_form" enctype="multipart/form-data">
                    <%--<div class="form-group">--%>
                        <%--<label for="add_inputCourse_id" class="col-sm-2 control-label">课程ID</label>--%>
                        <%--<div class="col-sm-8">--%>
                            <%--<input type="text" name="course_id" class="form-control" id="add_inputCourse_id" placeholder="如：0001">--%>
                        <%--</div>--%>
                        <%--<span id="helpBlock_add_inputCourse_id" class="help-block"></span>--%>
                    <%--</div>--%>
                    <div class="form-group">
                        <label for="add_inputName" class="col-sm-2 control-label">课程姓名</label>
                        <div class="col-sm-8">
                            <input type="text" name="course_name" class="form-control" id="add_inputName" placeholder="如：无氧运动">
                        </div>
                        <span id="helpBlock_add_inputName" class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="add_inputCoach" class="col-sm-2 control-label">课程教练</label>
                        <div class="col-sm-8">
                            <div class="checkbox">
                                <select class="form-control" name="coach_id" id="add_inputCoach">
                                    <option selected="selected" value=""></option>
                                </select>
                            </div>
                            <span id="helpBlock_add_inputCoach" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_inputType" class="col-sm-2 control-label">课程类型</label>
                        <div class="col-sm-8">
                            <input type="text" name="type" class="form-control" id="add_inputType" placeholder="如：无氧运动">
                            <span id="helpBlock_add_inputType" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_inputPrice" class="col-sm-2 control-label">价格</label>
                        <div class="col-sm-8">
                            <input type="text" name="price" class="form-control" id="add_inputPrice" placeholder="如：12345678900">
                            <span id="helpBlock_add_inputPrice" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_inputPic" class="col-sm-2 control-label">课程照片</label>
                        <div class="col-sm-8">
                            <input type="file" name="file" class="form-control" id="add_inputPic">
                            <span id="helpBlock_add_inputPic" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_inputCreate" class="col-sm-2 control-label">创建日期</label>
                        <div class="col-sm-8">
                            <input type="text" name="create_date" readonly = "readonly" class="form-control" id="add_inputCreate" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>">
                            <span id="helpBlock_add_inputCreate" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_inputUpdate" class="col-sm-2 control-label">修改日期</label>
                        <div class="col-sm-8">
                            <input type="text" name="update_date" readonly = "readonly" class="form-control" id="add_inputUpdate" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>">
                            <span id="helpBlock_add_inputUpdate" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_inputIntroduce" class="col-sm-2 control-label">课程介绍</label>
                        <div class="col-sm-8">
                            <textarea rows="3" cols="45" name="introduce" class="form-control" id="add_inputIntroduce" placeholder="如：12345678900"></textarea>
                            <span id="helpBlock_add_inputIntroduce" class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary course_save_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script type="text/javascript">
    $(".course_add_btn").click(function () {
        //课程id回显列表；
        $.ajax({
            url:"/coach/getCoach_id",
            type:"GET",
            success:function (result) {
                if (result.code == 100){
                    $.each(result.extendInfo.coach_idList, function () {
                        var optEle = $("<option></option>").append(this.coach_name).attr("value", this.coach_id);
                        optEle.appendTo("#add_inputCoach");
                    });
                }
            }
        });
    });
    <!-------------------------------------课程新增操作-------------------------------------->
    //    //=======0 点击 课程新增按钮，弹出模态框，
    //    $(".course_add_btn").click(function () {
    //        $('.course-add-modal').modal({
    //            backdrop:static,
    //            keyboard:true
    //        });
    //    });

    //=========1 当鼠标从课程id输入框移开的时候，判断课程id是否重复 ============
//    $("#add_inputCourse_id").change(function () {
//        var course_id = $("#add_inputCourse_id").val();
////        alert(course_id);
//        $.ajax({
//            url:"/course/checkCourseIdExists",
//            type:"GET",
//            data:"course_id="+course_id,
//            success:function (result) {
//                if (result.code == 100){
//                    $("#add_inputCourse_id").parent().parent().removeClass("has-error");
//                    $("#add_inputCourse_id").parent().parent().addClass("has-success");
//                    $("#helpBlock_add_inputCourse_id").text("课程ID可用！");
//                    $(".course_save_btn").attr("btn_courseId_exists", "success");
//                }else {
//                    $("#add_inputCourse_id").parent().parent().removeClass("has-success");
//                    $("#add_inputCourse_id").parent().parent().addClass("has-error");
//                    $("#helpBlock_add_inputCourse_id").text(result.extendInfo.courseId_reg_error);
//                    $(".course_save_btn").attr("btn_courseId_exists", "error");
//                }
//            }
//        });
//    });

    //3 保存
    $(".course_save_btn").click(function () {
        if($(".course_save_btn").attr("btn_courseId_exists") == "error"){
            return false;
        }

        var max_size = 300;// 300k
        var path = $("#add_inputPic").val();
        if (path.length == 0) {
            alert("请上传课程图片！");
            return false;
        } else {
            var extStart = path.lastIndexOf('.'),
                ext = path.substring(extStart, path.length).toUpperCase();
            if (ext !== '.PNG' && ext !== '.JPG' && ext !== '.JPEG' && ext !== '.GIF') {
                alert("请上传图片！");
                $("#add_inputPic").val("");
                return false;
            }else {
                var pic = document.getElementById("add_inputPic");
                var fileData = pic.files[0];
                var size = fileData.size;
                if (size > max_size * 1024) {
                    alert("图片大小不能超过300k");
                    $("#add_inputPic").val("");
                    return false;
                }
            }
        }

        //================2 对输入的姓名和邮箱格式进行验证===============
        var inputCourseId = $("#add_inputCourse_id").val();
        var inputName = $("#add_inputName").val();
//        var inputEmail = $("#add_inputEmail").val();
        //验证格式。姓名：2-5位中文或6-16位英文和数字组合；
        var regName = /(^[a-zA-Z_-]{1,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regName.test(inputName)){
            alert("输入课程名称格式不正确！");
            //输入框变红
            $("#add_inputName").parent().parent().addClass("has-error");
            //输入框下面显示红色提示信息
            $("#helpBlock_add_inputName").text("请输入2-5位中文或1-16位英文");
            return false;
        }else {
            //移除格式
            $("#add_inputName").parent().parent().removeClass("has-error");
            $("#add_inputName").parent().parent().addClass("has-success");
            $("#helpBlock_add_inputName").hide();
        }
//        if (!regEmail.test(inputEmail)){
//            //输入框变红
//            $("#add_inputEmail").parent().parent().addClass("has-error");
//            //输入框下面显示红色提示信息
//            $("#helpBlock_add_inputEmail").text("输入邮箱格式不正确！");
//            return false;
//        }else {
//            //移除格式
//            $("#add_inputEmail").parent().parent().removeClass("has-error");
//            $("#add_inputName").parent().parent().addClass("has-success");
//            $("#helpBlock_add_inputEmail").hide();
//        }
        //获取表单中包含图片的表单数据
        var formData = new FormData($(".add_course_form")[0]);
        $.ajax({
            url:"/course/addCourse",
            type:"POST",
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success:function (result) {
                if (result.code == 100){
                    alert("课程新增成功");
                    $('#course-add-modal').modal("hide");
                    //跳往最后一页，由于新增记录，所以要重新查询总页数
                    $.ajax({
                        url:"/course/getTotalPages",
                        type:"GET",
                        success:function (result) {
                            var totalPage = result.extendInfo.totalPages;
                            window.location.href="/course/getAllCourse?pageNo="+totalPage;
                        }
                    })
                } else {
                    alert("课程新增失败！");
                }
            }

        });
    });
</script>
</body>
</html>


