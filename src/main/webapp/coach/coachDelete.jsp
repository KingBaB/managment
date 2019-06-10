<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/23
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Coach Delete Page</title>
</head>
<body>
<div class="modal fade coach-del-modal" tabindex="-1" role="dialog" aria-labelledby="coach-del-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">删除教练信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal del_coach_form">
                    <div class="form-group">
                        <label for="del_coachId" class="col-sm-2 control-label">教练ID</label>
                        <div class="col-sm-8">
                            <div class="checkbox">
                                <select class="form-control" name="coach_id" id="del_coachId">
                                    <option selected="selected" value=""></option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_coachName" class="col-sm-2 control-label">教练姓名</label>
                        <div class="col-sm-8">
                            <input type="text" name="coach_name" readonly="readonly" class="form-control" id="del_coachName">
                        </div>
                        <span id="helpBlock_del_coachName" class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-8">
                            <input type="text" name="sex" readonly="readonly" class="form-control" id = del_coachSex>
                            <span id="helpBlock_del_coachSex" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_coachBirthday" class="col-sm-2 control-label">出生年月</label>
                        <div class="col-sm-8">
                            <input type="date" name="birthday" readonly="readonly" class="form-control" id="del_coachBirthday" placeholder="如：12345678900">
                            <span id="helpBlock_del_coachBirthday" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_coachPhone" class="col-sm-2 control-label">联系方式</label>
                        <div class="col-sm-8">
                            <input type="email" name="phone" readonly="readonly" class="form-control" id="del_coachPhone">
                            <span id="helpBlock_del_coachPhone" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_coachEmail" class="col-sm-2 control-label">邮箱地址</label>
                        <div class="col-sm-8">
                            <input type="email" name="email" readonly="readonly" class="form-control" id="del_coachEmail">
                            <span id="helpBlock_del_coachEmail" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_coachAddress" class="col-sm-2 control-label">居住地</label>
                        <div class="col-sm-8">
                            <input type="text" name="address" readonly="readonly" class="form-control" id="del_coachAddress">
                            <span id="helpBlock_del_coachAddress" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_coachCreate" class="col-sm-2 control-label">创建日期</label>
                        <div class="col-sm-8">
                            <input type="text" name="create_date" readonly = "readonly" class="form-control" id="del_coachCreate">
                            <span id="helpBlock_del_coachCreate" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_coachUpdate" class="col-sm-2 control-label">修改日期</label>
                        <div class="col-sm-8">
                            <input type="text" name="update_date" readonly="readonly" class="form-control" id="del_coachUpdate">
                            <span id="helpBlock_del_coachUpdate" class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary coach_modal_del_btn">删除</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script type="text/javascript">
    $(".coach_del_btn").click(function () {
        //教练id回显列表；
        $.ajax({
            url:"/coach/getCoach_id",
            type:"GET",
            success:function (result) {
                if (result.code == 100){
                    $.each(result.extendInfo.coach_idList, function () {
                        var optEle = $("<option></option>").append(this.coach_id).attr("value", this.coach_id);
                        optEle.appendTo("#del_coachId");
                    });
                }
            }
        });
    });

    //根据选中的教练id，回显教练信息
    $("#del_coachId").change(function () {
        var coach_id = $("#del_coachId").find("option:selected").text();
        $.ajax({
            url:"/coach/getInfoByCoach_id",
            type:"GET",
            data:"coach_id="+coach_id,
            success:function (result) {
                if (result.code == 100){
                    var coach = result.extendInfo.coach;
                    $("#del_coachName").val(coach.coach_name);
                    $("#del_coachSex").val(coach.sex == "F" ? "女" : "男" );
                    $("#del_coachBirthday").val(coach.birthday);
                    $("#del_coachPhone").val(coach.phone);
                    $("#del_coachEmail").val(coach.email);
                    $("#del_coachAddress").val(coach.address);
                    $("#del_coachCreate").val(coach.create_date);
                    $("#del_coachUpdate").val(coach.update_date);
                }else {
                    $("#del_coachName").val("");
                    $("#del_coachSex").val("");
                    $("#del_coachBirthday").val("");
                    $("#del_coachPhone").val("");
                    $("#del_coachEmail").val("");
                    $("#del_coachAddress").val("");
                    $("#del_coachCreate").val("");
                    $("#del_coachUpdate").val("");
                }
            }
        });

    });

    //3 根据教练id删除教练
    $(".coach_modal_del_btn").click(function () {
        var coach_id = $("#del_coachId").find("option:selected").text();
        var curPage = ${curPage};
        $.ajax({
            url:"/coach/deleteCoachById",
            type:"GET",
            data:"coach_id="+coach_id,
            success:function (result) {
                if (result.code==100){
                    alert("教练删除成功！");
                    $(".coach-del-modal").modal("hide");
                    //跳转到当前页
                    var curPage = ${curPage};
                    window.location.href="/coach/getAllCoach?pageNo=1";
                }else {
                    alert(result.extendInfo.coach_modal_del_error);
                }
            }
        });
    });
</script>
</body>
</html>


