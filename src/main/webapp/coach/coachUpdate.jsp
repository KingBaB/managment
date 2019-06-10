<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/23
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Coach Update Page</title>
</head>
<body>
<div class="modal fade coach-update-modal" tabindex="-1" role="dialog" aria-labelledby="coach-update-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">更改教练信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal update_coach_form">
                    <div class="form-group">
                        <label  for="update_static_coachName" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="update_static_coachName"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_coachBirthday" class="col-sm-2 control-label">出生年月</label>
                        <div class="col-sm-8">
                            <input type="date" name="birthday" class="form-control" id="update_coachBirthday" placeholder="如：12345678900">
                            <span id="helpBlock_update_coachBirthday" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_coachAddress" class="col-sm-2 control-label">居住地址</label>
                        <div class="col-sm-8">
                            <input type="address" name="address" class="form-control" id="update_coachAddress">
                            <span id="helpBlock_update_coachAddress" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_coachPhone" class="col-sm-2 control-label">联系方式</label>
                        <div class="col-sm-8">
                            <input type="text" name="phone" class="form-control" id="update_coachPhone">
                            <span id="helpBlock_update_coachPhone" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_coachEmail" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-8">
                            <input type="email" name="email" class="form-control" id="update_coachEmail">
                            <span id="helpBlock_update_inputEmail" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="update_coachGender1" value="M"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="update_coachGender2" value="F"> 女
                            </label>
                            <span id="helpBlock_update_inputSex" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_date" class="col-sm-2 control-label">修改日期</label>
                        <div class="col-sm-8">
                            <input type="hidden" name="update_date" class="form-control" id="update_date" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>">
                            <p id="helpBlock_update_date" class="help-block"></p>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary coach_update_btn">更新</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<script type="text/javascript">
    <!-- ==========================员工修改操作=================================== -->
    $(".coach_edit_btn").click(function () {
        //1 获取点击修改员工的id与name;
        var updateCoachId = $(this).parent().parent().find("td:eq(0)").text();
        var updateCoachName = $(this).parent().parent().find("td:eq(1)").text();
        var updateCoachAddress = $(this).parent().parent().find("td:eq(6)").text();
        var updateCoachPhone = $(this).parent().parent().find("td:eq(4)").text();
        var updateCoachEmail = $(this).parent().parent().find("td:eq(5)").text();
        var updateCoachSex = $(this).parent().parent().find("td:eq(2)").text();
        var updateCoachBirthday = $(this).parent().parent().find("td:eq(3)").text();
        $("#update_static_coachName").text(updateCoachName);
        $("#update_coachAddress").val(updateCoachAddress);
        $("#update_coachPhone").val(updateCoachPhone);
        $("#update_coachEmail").val(updateCoachEmail);
        $("#update_coachBirthday").val(updateCoachBirthday);
        $("#helpBlock_update_date").text("<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>");
        if (updateCoachSex == '男'){
            $(".coach-update-modal input[name=sex][value='M']").attr("checked",true);
        }else {
            $(".coach-update-modal input[name=sex][value='F']").attr("checked",true);
        }

        //2 根据id或name查询出对应员工信息进行回显；
//        $.ajax({
//            url:"/hrms/emp/getEmpById/"+updateCoachId,
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

        $(".coach_update_btn").attr("updateCoachId", updateCoachId);
    });
    //    //校验邮箱地址格式
    //    $("#update_coachEmail").blur(function(){
    //
    //    });

    $(".coach_update_btn").click(function () {
        var updateCoachId = $(this).attr("updateCoachId");
        //4 进行修改，对修改的邮箱格式进行判断；
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        var updateCoachEmail = $("#update_coachEmail").val();
        if (!regEmail.test(updateCoachEmail)){
            $("#update_coachEmail").parent().parent().removeClass("has-success");
            $("#update_coachEmail").parent().parent().addClass("has-error");
            $("#helpBlock_update_inputEmail").text("邮箱格式不正确！");
            return false;
        }else {
            $("#update_coachEmail").parent().parent().removeClass("has-error");
            $("#update_coachEmail").parent().parent().addClass("has-success");
            $("#helpBlock_update_inputEmail").text("");
        }
        //5 点击更新按钮，发送AJAX请求到后台进行保存。
        $.ajax({
            url:"/coach/updateCoach/"+updateCoachId,
            type:"POST",
            data:$(".update_coach_form").serializeArray(),
            success:function (result) {
                if (result.code==100){
                    alert("教练修改成功！");
                    $(".coach-update-modal").modal("hide");
                    //跳转到当前页
                    var curPage = ${curPage};
                    window.location.href="/coach/getAllCoach?pageNo="+curPage;
                }else {
                    alert(result.extendInfo.coach_update_error);
                }
            }
        });

    });
</script>
</body>
</html>


