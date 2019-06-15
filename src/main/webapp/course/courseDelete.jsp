<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/23
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Course Delete Page</title>
</head>
<body>
<div class="modal fade course-del-modal" tabindex="-1" role="dialog" aria-labelledby="course-del-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">删除课程信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal del_course_form">
                    <div class="form-group">
                        <label for="del_courseId" class="col-sm-2 control-label">课程ID</label>
                        <div class="col-sm-8">
                            <div class="checkbox">
                                <select class="form-control" name="course_id" id="del_courseId">
                                    <option selected="selected" value=""></option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_courseName" class="col-sm-2 control-label">课程名称</label>
                        <div class="col-sm-8">
                            <input type="text" name="course_name" readonly="readonly" class="form-control" id="del_courseName">
                        </div>
                        <span id="helpBlock_del_courseName" class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="del_courseCoach" class="col-sm-2 control-label">课程教练</label>
                        <div class="col-sm-8">
                            <input type="text" name="coach_id" readonly="readonly" class="form-control" id="del_courseCoach">
                            <span id="helpBlock_del_courseCoach" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_courseType" class="col-sm-2 control-label">课程类型</label>
                        <div class="col-sm-8">
                            <input type="text" name="type" readonly="readonly" class="form-control" id="del_courseType">
                            <span id="helpBlock_del_courseType" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_coursePic" class="col-sm-2 control-label">课程图片</label>
                        <div class="col-sm-8">
                            <img src="" id="del_coursePic" style="width: 50px;height: 50px;">
                            <%--<input type="date" name="pic" readonly="readonly" class="form-control" id="del_memberPic" placeholder="如：12345678900">--%>
                            <span id="helpBlock_del_coursePic" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_coursePrice" class="col-sm-2 control-label">价格</label>
                        <div class="col-sm-8">
                            <input type="text" name="price" readonly="readonly" class="form-control" id="del_coursePrice">
                            <span id="helpBlock_del_coursePrice" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_courseCreate" class="col-sm-2 control-label">创建日期</label>
                        <div class="col-sm-8">
                            <input type="text" name="create_date" readonly = "readonly" class="form-control" id="del_courseCreate">
                            <span id="helpBlock_del_courseCreate" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_courseUpdate" class="col-sm-2 control-label">修改日期</label>
                        <div class="col-sm-8">
                            <input type="text" name="update_date" readonly="readonly" class="form-control" id="del_courseUpdate">
                            <span id="helpBlock_del_courseUpdate" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_courseIntroduce" class="col-sm-2 control-label">课程介绍</label>
                        <div class="col-sm-8">
                            <textarea rows="3" cols="45" name="introduce" class="form-control" id="del_courseIntroduce"></textarea>
                            <span id="helpBlock_del_courseIntroduce" class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary course_modal_del_btn">删除</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script type="text/javascript">
    $(".course_del_btn").click(function () {
        //课程id回显列表；
        $.ajax({
            url:"/course/getCourse_id",
            type:"GET",
            success:function (result) {
                if (result.code == 100){
                    $.each(result.extendInfo.course_idList, function () {
                        var optEle = $("<option></option>").append(this.course_id).attr("value", this.course_id);
                        optEle.appendTo("#del_courseId");
                    });
                }
            }
        });
    });

    //根据选中的课程id，回显课程信息
    $("#del_courseId").change(function () {
        var course_id = $("#del_courseId").find("option:selected").text();
        $.ajax({
            url:"/course/getInfoByCourse_id",
            type:"GET",
            data:"course_id="+course_id,
            success:function (result) {
                if (result.code == 100){
                    var course = result.extendInfo.course;
                    $("#del_courseName").val(course.course_name);
                    $("#del_courseCoach").val(course.coach.coach_name);
                    $("#del_courseType").val(course.type);
                    $("#del_coursePic").attr("src",course.pic);
                    $("#del_coursePrice").val(course.price);
                    $("#del_courseCreate").val(course.create_date);
                    $("#del_courseUpdate").val(course.update_date);
                    $("#del_courseIntroduce").val(course.introduce);
                }else {
                    $("#del_courseName").val("");
                    $("#del_courseCoach").val("");
                    $("#del_courseType").val("");
                    $("#del_coursePic").attr("src","");
                    $("#del_coursePrice").val("");
                    $("#del_courseCreate").val("");
                    $("#del_courseUpdate").val("");
                    $("#del_courseIntroduce").val("");
                }
            }
        });

    });

    //3 根据课程id删除课程
    $(".course_modal_del_btn").click(function () {
        var course_id = $("#del_courseId").find("option:selected").text();
        var curPage = ${curPage};
        $.ajax({
            url:"/course/deleteCourseById",
            type:"GET",
            data:"course_id="+course_id,
            success:function (result) {
                if (result.code==100){
                    alert("课程删除成功！");
                    $(".course-del-modal").modal("hide");
                    //跳转到当前页
                    var curPage = ${curPage};
                    window.location.href="/course/getAllCourse?pageNo=1";
                }else {
                    alert(result.extendInfo.course_modal_del_error);
                }
            }
        });
    });
</script>
</body>
</html>



