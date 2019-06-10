<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/26
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Equipment Update Page</title>
</head>
<body>
<div class="modal fade equipment-update-modal" tabindex="-1" role="dialog" aria-labelledby="equipment-update-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">更改设备信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal update_equipment_form">
                    <div class="form-group">
                        <label  for="update_equipment_id" class="col-sm-2 control-label">设备型号</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="update_equipment_id"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  for="update_equipmentName" class="col-sm-2 control-label">设备名称</label>
                        <div class="col-sm-8">
                            <input type="text" name="equipment_name" class="form-control" id="update_equipmentName">
                            <span id="helpBlock_update_equipmentName" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_equipmentNumber" class="col-sm-2 control-label">设备类型</label>
                        <div class="col-sm-8">
                            <input type="text" name="number" class="form-control" id="update_equipmentNumber">
                            <span id="helpBlock_update_equipmentNumber" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_equipmentUpdate" class="col-sm-2 control-label">修改日期</label>
                        <div class="col-sm-8">
                            <input type="text" readonly="readonly" name="update_date" class="form-control" id="update_equipmentUpdate" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>">
                            <span id="helpBlock_update_equipmentUpdate" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_equipmentIntroduce" class="col-sm-2 control-label">设备介绍</label>
                        <div class="col-sm-8">
                            <textarea rows="3" cols="45" name="introduce" class="form-control" id="update_equipmentIntroduce"></textarea>
                            <p id="helpBlock_update_equipmentIntroduce" class="help-block"></p>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary equipment_update_btn">更新</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<script type="text/javascript">
    <!-- ==========================设备修改操作=================================== -->
    $(".equipment_edit_btn").click(function () {
        //1 获取点击修改设备的id与name;
        var updateEquipmentId = $(this).parent().parent().find("td:eq(0)").text();
        var updateEquipmentName = $(this).parent().parent().find("td:eq(1)").text();
        var updateEquipmentNumber = $(this).parent().parent().find("td:eq(2)").text();
        var updateEquipmentIntroduce = $(this).parent().parent().find("td:eq(5)").text();
        $("#update_equipment_id").text(updateEquipmentId);
        $("#update_equipmentName").val(updateEquipmentName);
        $("#update_equipmentNumber").val(updateEquipmentNumber);
        $("#update_equipmentIntroduce").val(updateEquipmentIntroduce);
//        $.ajax({
//            url: "/equipment/getInfoByEquipment_id",
//            data: "equipment_id="+updateEquipmentId,
//            type: "GET",
//            success:function (result) {
//                var equipment = result.extendInfo.equipment;
//                updateEquipmentIntroduce = equipment.introduce;
//                $("#update_equipmentIntroduce").val(updateEquipmentIntroduce);
//            }
//        });

        <%--$("#helpBlock_update_date").text("<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>");--%>
        //2 根据id或name查询出对应设备信息进行回显；
//        $.ajax({
//            url:"/hrms/emp/getEmpById/"+updateEquipmentId,
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

        $(".equipment_update_btn").attr("updateEquipmentId", updateEquipmentId);
    });
    //    //校验邮箱地址格式
    //    $("#update_equipmentEmail").blur(function(){
    //
    //    });

    $(".equipment_update_btn").click(function () {
        var updateEquipmentId = $("#update_equipment_id").text();
        $.ajax({
            url:"/equipment/updateEquipment/"+updateEquipmentId,
            type:"POST",
            data:$(".update_equipment_form").serializeArray(),
            success:function (result) {
                if (result.code==100){
                    alert("设备修改成功！");
                    $(".equipment-update-modal").modal("hide");
                    //跳转到当前页
                    var curPage = ${curPage};
                    window.location.href="/equipment/getAllEquipment?pageNo="+curPage;
                }else {
                    alert(result.extendInfo.equipment_update_error);
                }
            }
        });

    });
</script>
</body>
</html>




