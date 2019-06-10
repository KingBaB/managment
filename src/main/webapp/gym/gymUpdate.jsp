<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/28
  Time: 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gym Update Page</title>
</head>
<body>
<div class="modal fade gym-update-modal" tabindex="-1" role="dialog" aria-labelledby="gym-update-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">更改健身房信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal update_gym_form">
                    <div class="form-group">
                        <label  for="update_gym_id" class="col-sm-2 control-label">健身房编号</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="update_gym_id"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  for="update_gymName" class="col-sm-2 control-label">健身房名称</label>
                        <div class="col-sm-8">
                            <input type="text" name="gym_name" class="form-control" id="update_gymName">
                            <span id="helpBlock_update_gymName" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_gymSubjection" class="col-sm-2 control-label">总店</label>
                        <div class="col-sm-8">
                            <input type="text" name="subjection" class="form-control" id="update_gymSubjection">
                            <span id="helpBlock_update_gymSubjection" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_gymManager" class="col-sm-2 control-label">负责人</label>
                        <div class="col-sm-8">
                            <input type="text" name="manager" class="form-control" id="update_gymManager">
                            <span id="helpBlock_update_gymManager" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_gymAddress" class="col-sm-2 control-label">健身房地址</label>
                        <div class="col-sm-8">
                            <input type="text" name="address" class="form-control" id="update_gymAddress">
                            <span id="helpBlock_update_gymAddress" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_gymPhone" class="col-sm-2 control-label">联系电话</label>
                        <div class="col-sm-8">
                            <input type="text" name="phone" class="form-control" id="update_gymPhone">
                            <span id="helpBlock_update_gymPhone" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_gymArea" class="col-sm-2 control-label">健身房面积</label>
                        <div class="col-sm-8">
                            <input type="text" name="area" class="form-control" id="update_gymArea">
                            <span id="helpBlock_update_gymArea" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_gymUpdate" class="col-sm-2 control-label">修改日期</label>
                        <div class="col-sm-8">
                            <input type="text" readonly="readonly" name="update_date" class="form-control" id="update_gymUpdate" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>">
                            <span id="helpBlock_update_gymUpdate" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_gymIntroduce" class="col-sm-2 control-label">健身房介绍</label>
                        <div class="col-sm-8">
                            <textarea rows="3" cols="45" name="introduce" class="form-control" id="update_gymIntroduce"></textarea>
                            <p id="helpBlock_update_gymIntroduce" class="help-block"></p>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary gym_update_btn">更新</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<script type="text/javascript">
    <!-- ==========================健身房修改操作=================================== -->
    $(".gym_edit_btn").click(function () {
        //1 获取点击修改健身房的id与name;
        var updateGymId = $(this).parent().parent().find("td:eq(0)").text();
        $("#update_gym_id").text(updateGymId);
        $("#update_gymName").val(updateGymName);
        $("#update_gymNumber").val(updateGymNumber);
        $("#update_gymIntroduce").val(updateGymIntroduce);
//        $.ajax({
//            url: "/gym/getInfoByGym_id",
//            data: "gym_id="+updateGymId,
//            type: "GET",
//            success:function (result) {
//                var gym = result.extendInfo.gym;
//                updateGymIntroduce = gym.introduce;
//                $("#update_gymIntroduce").val(updateGymIntroduce);
//            }
//        });

        <%--$("#helpBlock_update_date").text("<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>");--%>
        //2 根据id或name查询出对应健身房信息进行回显；
//        $.ajax({
//            url:"/hrms/emp/getEmpById/"+updateGymId,
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

        $(".gym_update_btn").attr("updateGymId", updateGymId);
    });
    //    //校验邮箱地址格式
    //    $("#update_gymEmail").blur(function(){
    //
    //    });

    $(".gym_update_btn").click(function () {
        var updateGymId = $("#update_gym_id").text();
        $.ajax({
            url:"/gym/updateGym/"+updateGymId,
            type:"POST",
            data:$(".update_gym_form").serializeArray(),
            success:function (result) {
                if (result.code==100){
                    alert("健身房修改成功！");
                    $(".gym-update-modal").modal("hide");
                    //跳转到当前页
                    var curPage = ${curPage};
                    window.location.href="/gym/getAllGym?pageNo="+curPage;
                }else {
                    alert(result.extendInfo.gym_update_error);
                }
            }
        });

    });
</script>
</body>
</html>





