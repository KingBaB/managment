<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/26
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Equipment Delete Page</title>
</head>
<body>
<div class="modal fade equipment-del-modal" tabindex="-1" role="dialog" aria-labelledby="equipment-del-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">删除设备信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal del_equipment_form">
                    <div class="form-group">
                        <label for="del_equipmentId" class="col-sm-2 control-label">设备型号</label>
                        <div class="col-sm-8">
                            <div class="checkbox">
                                <select class="form-control" name="equipment_id" id="del_equipmentId">
                                    <option selected="selected" value=""></option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_equipmentName" class="col-sm-2 control-label">设备名称</label>
                        <div class="col-sm-8">
                            <input type="text" name="equipment_name" readonly="readonly" class="form-control" id="del_equipmentName">
                        </div>
                        <span id="helpBlock_del_equipmentName" class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="del_equipmentPic" class="col-sm-2 control-label">设备图片</label>
                        <div class="col-sm-8">
                            <img src="" id="del_equipmentPic">
                            <%--<input type="text" name="pic" readonly="readonly" class="form-control" id="del_equipmentPic">--%>
                            <span id="helpBlock_del_equipmentPic" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_equipmentNumber" class="col-sm-2 control-label">设备数量</label>
                        <div class="col-sm-8">
                            <input type="text" name="number" readonly="readonly" class="form-control" id="del_equipmentNumber">
                            <span id="helpBlock_del_equipmentNumber" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_equipmentCreate" class="col-sm-2 control-label">创建日期</label>
                        <div class="col-sm-8">
                            <input type="text" name="create_date" readonly = "readonly" class="form-control" id="del_equipmentCreate">
                            <span id="helpBlock_del_equipmentCreate" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_equipmentUpdate" class="col-sm-2 control-label">修改日期</label>
                        <div class="col-sm-8">
                            <input type="text" name="update_date" readonly="readonly" class="form-control" id="del_equipmentUpdate">
                            <span id="helpBlock_del_equipmentUpdate" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_equipmentIntroduce" class="col-sm-2 control-label">设备介绍</label>
                        <div class="col-sm-8">
                            <textarea rows="3" cols="45" name="introduce" class="form-control" id="del_equipmentIntroduce"></textarea>
                            <span id="helpBlock_del_equipmentIntroduce" class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary equipment_modal_del_btn">删除</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script type="text/javascript">
    $(".equipment_del_btn").click(function () {
        $("#del_equipmentId").find("option").remove();
        $("#del_equipmentId").append("<option value='Value'></option>");
        //设备id回显列表；
        $.ajax({
            url:"/equipment/getEquipment_id",
            type:"GET",
            success:function (result) {
                if (result.code == 100){
                    $.each(result.extendInfo.equipment_idList, function () {
                        var optEle = $("<option></option>").append(this.equipment_id).attr("value", this.equipment_id);
                        optEle.appendTo("#del_equipmentId");
                    });
                }
            }
        });
    });

    //根据选中的设备id，回显设备信息
    $("#del_equipmentId").change(function () {
        var equipment_id = $("#del_equipmentId").find("option:selected").text();
        if (equipment_id.length == 0){
            $("#del_equipmentName").val("");
            $("#del_equipmentPic").attr("src", "");
            $("#del_equipmentNumber").val("");
            $("#del_equipmentCreate").val("");
            $("#del_equipmentUpdate").val("");
            $("#del_equipmentIntroduce").val("");
        }else {
            $.ajax({
                url:"/equipment/getInfoByEquipment_id",
                type:"GET",
                data:"equipment_id="+equipment_id,
                success:function (result) {
                    if (result.code == 100){
                        var equipment = result.extendInfo.equipment;
                        $("#del_equipmentName").val(equipment.equipment_name);
                        $("#del_equipmentPic").attr("src", ".."+equipment.pic);
                        $("#del_equipmentNumber").val(equipment.number);
                        $("#del_equipmentCreate").val(equipment.create_date);
                        $("#del_equipmentUpdate").val(equipment.update_date);
                        $("#del_equipmentIntroduce").val(equipment.introduce);
                    }else {
                        $("#del_equipmentName").val("");
                        $("#del_equipmentPic").attr("src", "");
                        $("#del_equipmentNumber").val("");
                        $("#del_equipmentCreate").val("");
                        $("#del_equipmentUpdate").val("");
                        $("#del_equipmentIntroduce").val("");
                    }
                }
            });
        }

    });

    //3 根据设备id删除设备
    $(".equipment_modal_del_btn").click(function () {
        var equipment_id = $("#del_equipmentId").find("option:selected").text();
        var curPage = ${curPage};
        $.ajax({
            url:"/equipment/deleteEquipmentById",
            type:"GET",
            data:"equipment_id="+equipment_id,
            success:function (result) {
                if (result.code==100){
                    alert("设备删除成功！");
                    $(".equipment-del-modal").modal("hide");
                    //跳转到当前页
                    window.location.href="/equipment/getAllEquipment?pageNo=1";
                }else {
                    alert(result.extendInfo.equipment_modal_del_error);
                }
            }
        });
    });
</script>
</body>
</html>



