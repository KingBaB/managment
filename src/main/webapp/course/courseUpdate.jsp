<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/23
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Course Update Page</title>
</head>
<body>
<div class="modal fade course-update-modal" tabindex="-1" role="dialog" aria-labelledby="course-update-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">更改课程信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal update_course_form">
                    <div class="form-group">
                        <label  for="update_courseName" class="col-sm-2 control-label">课程名称</label>
                        <div class="col-sm-8">
                            <input type="text" readonly="readonly" name="course_name" class="form-control" id="update_courseName">
                            <span id="helpBlock_update_courseName" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_courseCoach" class="col-sm-2 control-label">教练id</label>
                        <div class="col-sm-8">
                            <input type="text" name="coach_id" class="form-control" id="update_courseCoach">
                            <span id="helpBlock_update_courseCoach" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_courseType" class="col-sm-2 control-label">课程类型</label>
                        <div class="col-sm-8">
                            <input type="text" name="type" class="form-control" id="update_courseType">
                            <span id="helpBlock_update_courseType" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_coursePrice" class="col-sm-2 control-label">价格</label>
                        <div class="col-sm-8">
                            <input type="text" name="price" class="form-control" id="update_coursePrice">
                            <span id="helpBlock_update_coursePrice" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_courseUpdate" class="col-sm-2 control-label">修改日期</label>
                        <div class="col-sm-8">
                            <input type="text" readonly="readonly" name="update_date" class="form-control" id="update_courseUpdate" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>">
                            <span id="helpBlock_update_courseUpdate" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_courseIntroduce" class="col-sm-2 control-label">课程介绍</label>
                        <div class="col-sm-8">
                            <textarea rows="3" cols="45" name="introduce" class="form-control" id="update_courseIntroduce"></textarea>
                            <p id="helpBlock_update_courseIntroduce" class="help-block"></p>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary course_update_btn">更新</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<script type="text/javascript">
    <!-- ==========================课程修改操作=================================== -->
    $(".course_edit_btn").click(function () {
        //1 获取点击修改课程的id与name;
        var updateCourseId = $(this).parent().parent().find("td:eq(0)").text();
        var updateCourseName = $(this).parent().parent().find("td:eq(1)").text();
        var updateCourseCoach = $(this).parent().parent().find("td:eq(2)").text();
        var updateCourseType = $(this).parent().parent().find("td:eq(3)").text();
        var updateCoursePrice = $(this).parent().parent().find("td:eq(4)").text();
        var updateCourseIntroduce = "";
        $("#update_courseName").val(updateCourseName);
        $("#update_courseCoach").val(updateCourseCoach);
        $("#update_courseType").val(updateCourseType);
        $("#update_coursePrice").val(updateCoursePrice);
        $.ajax({
            url: "/course/getInfoByCourse_id",
            data: "course_id="+updateCourseId,
            type: "GET",
            success:function (result) {
                var course = result.extendInfo.course;
                updateCourseIntroduce = course.introduce;
                $("#update_courseIntroduce").val(updateCourseIntroduce);
            }
        });

        $("#helpBlock_update_date").text("<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>");
        //2 根据id或name查询出对应课程信息进行回显；
//        $.ajax({
//            url:"/hrms/emp/getEmpById/"+updateCourseId,
//            type:"GET",
//            success:function (result) {
//                if (result.code == 100){
//                    var emp = result.extendInfo.employee;
//                    $("#update_static_empName").text(emp.empName);
//                    $("#update_empEmail").val(emp.empEmail);
//                    $(".emp-update-modal input[name=gender]").val([emp.gender]);
//                    $("#update_department").val(emp.departmentId);
//                }
//            }
//
//        });

        $(".course_update_btn").attr("updateCourseId", updateCourseId);
    });
    //    //校验邮箱地址格式
    //    $("#update_courseEmail").blur(function(){
    //
    //    });

    $(".course_update_btn").click(function () {
        var updateCourseId = $(this).attr("updateCourseId");
        //4 进行修改，对修改的邮箱格式进行判断；
        //5 点击更新按钮，发送AJAX请求到后台进行保存。
        $.ajax({
            url:"/course/updateCourse/"+updateCourseId,
            type:"POST",
            data:$(".update_course_form").serializeArray(),
            success:function (result) {
                if (result.code==100){
                    alert("课程修改成功！");
                    $(".course-update-modal").modal("hide");
                    //跳转到当前页
                    var curPage = ${curPage};
                    window.location.href="/course/getAllCourse?pageNo="+curPage;
                }else {
                    alert(result.extendInfo.course_update_error);
                }
            }
        });

    });
</script>
</body>
</html>



