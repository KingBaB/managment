<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/26
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
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
    <title>Equipment Add Page</title>
</head>
<body>
<div class="modal fade equipment-add-modal" tabindex="-1" role="dialog" aria-labelledby="equipment-add-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加设备信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal add_equipment_form" enctype="multipart/form-data">
                    <%--<div class="form-group">--%>
                    <%--<label for="add_inputEquipment_id" class="col-sm-2 control-label">设备ID</label>--%>
                    <%--<div class="col-sm-8">--%>
                    <%--<input type="text" name="equipment_id" class="form-control" id="add_inputEquipment_id" placeholder="如：0001">--%>
                    <%--</div>--%>
                    <%--<span id="helpBlock_add_inputEquipment_id" class="help-block"></span>--%>
                    <%--</div>--%>
                    <div class="form-group">
                        <label for="add_inputEquipment_id" class="col-sm-2 control-label">设备型号</label>
                        <div class="col-sm-8">
                            <input type="text" name="equipment_id" class="form-control" id="add_inputEquipment_id">
                        </div>
                        <span id="helpBlock_add_inputEquipment_id" class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="add_inputName" class="col-sm-2 control-label">设备名称</label>
                        <div class="col-sm-8">
                            <input type="text" name="equipment_name" class="form-control" id="add_inputName">
                        </div>
                        <span id="helpBlock_add_inputName" class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="add_inputPic" class="col-sm-2 control-label">设备照片</label>
                        <div class="col-sm-8">
                            <input type="file" name="file" class="form-control" id="add_inputPic">
                            <span id="helpBlock_add_inputPic" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_inputNumber" class="col-sm-2 control-label">设备数量</label>
                        <div class="col-sm-8">
                            <input type="text" name="number" class="form-control" id="add_inputNumber">
                            <span id="helpBlock_add_inputNumber" class="help-block"></span>
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
                        <label for="add_inputIntroduce" class="col-sm-2 control-label">设备介绍</label>
                        <div class="col-sm-8">
                            <textarea rows="3" cols="45" name="introduce" class="form-control" id="add_inputIntroduce" placeholder="如：12345678900"></textarea>
                            <span id="helpBlock_add_inputIntroduce" class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary equipment_save_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script type="text/javascript">

    <!-------------------------------------设备新增操作-------------------------------------->
    //    //=======0 点击 设备新增按钮，弹出模态框，
    //    $(".equipment_add_btn").click(function () {
    //        $('.equipment-add-modal').modal({
    //            backdrop:static,
    //            keyboard:true
    //        });
    //    });

    //=========1 当鼠标从设备id输入框移开的时候，判断设备id是否重复 ============
        $("#add_inputEquipment_id").change(function () {
            var equipment_id = $("#add_inputEquipment_id").val();
    //        alert(equipment_id);
            $.ajax({
                url:"/equipment/checkEquipmentIdExists",
                type:"GET",
                data:"equipment_id="+equipment_id,
                success:function (result) {
                    if (result.code == 100){
                        $("#add_inputEquipment_id").parent().parent().removeClass("has-error");
                        $("#add_inputEquipment_id").parent().parent().addClass("has-success");
                        $("#helpBlock_add_inputEquipment_id").text("设备ID不存在！");
                        $(".equipment_save_btn").attr("btn_equipmentId_exists", "success");
                    }else {
                        $("#add_inputEquipment_id").parent().parent().removeClass("has-success");
                        $("#add_inputEquipment_id").parent().parent().addClass("has-error");
                        $("#helpBlock_add_inputEquipment_id").text(result.extendInfo.equipmentId_reg_error);
                        $(".equipment_save_btn").attr("btn_equipmentId_exists", "error");
                    }
                }
            });
        });

    //3 保存
    $(".equipment_save_btn").click(function () {
        if($(".equipment_save_btn").attr("btn_equipmentId_exists") == "error"){
            return false;
        }

        var max_size = 300;// 300k
        var path = $("#add_inputPic").val();
        if (path.length == 0) {
            alert("请上传设备图片！");
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

//        //================2 对输入的姓名和邮箱格式进行验证===============
//        var inputEquipmentId = $("#add_inputEquipment_id").val();
//        var inputName = $("#add_inputName").val();
////        var inputEmail = $("#add_inputEmail").val();
//        //验证格式。姓名：2-5位中文或6-16位英文和数字组合；
//        var regName = /(^[a-zA-Z_-]{1,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
//        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
//        if (!regName.test(inputName)){
//            alert("输入设备名称格式不正确！");
//            //输入框变红
//            $("#add_inputName").parent().parent().addClass("has-error");
//            //输入框下面显示红色提示信息
//            $("#helpBlock_add_inputName").text("请输入2-5位中文或1-16位英文");
//            return false;
//        }else {
//            //移除格式
//            $("#add_inputName").parent().parent().removeClass("has-error");
//            $("#add_inputName").parent().parent().addClass("has-success");
//            $("#helpBlock_add_inputName").hide();
//        }
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
        var formData = new FormData($(".add_equipment_form")[0]);
        $.ajax({
            url:"/equipment/addEquipment",
            type:"POST",
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success:function (result) {
                if (result.code == 100){
                    alert("设备新增成功");
                    $('#equipment-add-modal').modal("hide");
                    //跳往最后一页，由于新增记录，所以要重新查询总页数
                    $.ajax({
                        url:"/equipment/getTotalPages",
                        type:"GET",
                        success:function (result) {
                            var totalPage = result.extendInfo.totalPages;
                            window.location.href="/equipment/getAllEquipment?pageNo="+totalPage;
                        }
                    })
                } else {
                    alert("设备新增失败！");
                }
            }

        });
    });
</script>
</body>
</html>



