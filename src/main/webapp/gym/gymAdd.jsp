<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/28
  Time: 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gym Add Page</title>
    <style>
        .control-label{
            width: 100px;
        }
    </style>
</head>
<body>
<div class="modal fade gym-add-modal" tabindex="-1" role="dialog" aria-labelledby="gym-add-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加健身房信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal add_gym_form" enctype="multipart/form-data">
                    <%--<div class="form-group">--%>
                    <%--<label for="add_inputGym_id" class="col-sm-2 control-label">健身房ID</label>--%>
                    <%--<div class="col-sm-8">--%>
                    <%--<input type="text" name="gym_id" class="form-control" id="add_inputGym_id" placeholder="如：0001">--%>
                    <%--</div>--%>
                    <%--<span id="helpBlock_add_inputGym_id" class="help-block"></span>--%>
                    <%--</div>--%>
                    <div class="form-group">
                        <label for="add_inputName" class="col-sm-2 control-label">健身房名称</label>
                        <div class="col-sm-8">
                            <input type="text" name="gym_name" class="form-control" id="add_inputName">
                        </div>
                        <span id="helpBlock_add_inputName" class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="add_inputSubjection" class="col-sm-2 control-label">总店</label>
                        <div class="col-sm-8">
                            <input type="text" name="subjection" class="form-control" id="add_inputSubjection">
                        </div>
                        <span id="helpBlock_add_inputSubjection" class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="add_inputManager" class="col-sm-2 control-label">负责人</label>
                        <div class="col-sm-8">
                            <input type="text" name="manager" class="form-control" id="add_inputManager">
                        </div>
                        <span id="helpBlock_add_inputManager" class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="add_inputPic" class="col-sm-2 control-label">健身房照片</label>
                        <div class="col-sm-8">
                            <input type="file" name="file" class="form-control" id="add_inputPic">
                            <span id="helpBlock_add_inputPic" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_inputAddress" class="col-sm-2 control-label">健身房地址</label>
                        <div class="col-sm-8">
                            <input type="text" name="address" class="form-control" id="add_inputAddress">
                            <span id="helpBlock_add_inputAddress" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_inputPhone" class="col-sm-2 control-label">联系电话</label>
                        <div class="col-sm-8">
                            <input type="text" name="phone" class="form-control" id="add_inputPhone">
                            <span id="helpBlock_add_inputPhone" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_inputArea" class="col-sm-2 control-label">健身房面积</label>
                        <div class="col-sm-8">
                            <input type="text" name="area" class="form-control" id="add_inputArea">
                            <span id="helpBlock_add_inputArea" class="help-block"></span>
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
                        <label for="add_inputIntroduce" class="col-sm-2 control-label">健身房介绍</label>
                        <div class="col-sm-8">
                            <textarea rows="3" cols="45" name="introduce" class="form-control" id="add_inputIntroduce" placeholder="如：12345678900"></textarea>
                            <span id="helpBlock_add_inputIntroduce" class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary gym_save_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script type="text/javascript">

    <!-------------------------------------健身房新增操作-------------------------------------->
    //    //=======0 点击 健身房新增按钮，弹出模态框，
    //    $(".gym_add_btn").click(function () {
    //        $('.gym-add-modal').modal({
    //            backdrop:static,
    //            keyboard:true
    //        });
    //    });

    //=========1 当鼠标从健身房id输入框移开的时候，判断健身房id是否重复 ============
//    $("#add_inputGym_id").change(function () {
//        var gym_id = $("#add_inputGym_id").val();
//        //        alert(gym_id);
//        $.ajax({
//            url:"/gym/checkGymIdExists",
//            type:"GET",
//            data:"gym_id="+gym_id,
//            success:function (result) {
//                if (result.code == 100){
//                    $("#add_inputGym_id").parent().parent().removeClass("has-error");
//                    $("#add_inputGym_id").parent().parent().addClass("has-success");
//                    $("#helpBlock_add_inputGym_id").text("健身房ID不存在！");
//                    $(".gym_save_btn").attr("btn_gymId_exists", "success");
//                }else {
//                    $("#add_inputGym_id").parent().parent().removeClass("has-success");
//                    $("#add_inputGym_id").parent().parent().addClass("has-error");
//                    $("#helpBlock_add_inputGym_id").text(result.extendInfo.gymId_reg_error);
//                    $(".gym_save_btn").attr("btn_gymId_exists", "error");
//                }
//            }
//        });
//    });

    //3 保存
    $(".gym_save_btn").click(function () {
        if($(".gym_save_btn").attr("btn_gymId_exists") == "error"){
            return false;
        }

        var max_size = 300;// 300k
        var path = $("#add_inputPic").val();
        if (path.length == 0) {
            alert("请上传健身房图片！");
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
//        var inputGymId = $("#add_inputGym_id").val();
//        var inputName = $("#add_inputName").val();
////        var inputEmail = $("#add_inputEmail").val();
//        //验证格式。姓名：2-5位中文或6-16位英文和数字组合；
//        var regName = /(^[a-zA-Z_-]{1,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
//        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
//        if (!regName.test(inputName)){
//            alert("输入健身房名称格式不正确！");
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
        var formData = new FormData($(".add_gym_form")[0]);
        $.ajax({
            url:"/gym/addGym",
            type:"POST",
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success:function (result) {
                if (result.code == 100){
                    alert("健身房新增成功");
                    $('#gym-add-modal').modal("hide");
                    //跳往最后一页，由于新增记录，所以要重新查询总页数
                    $.ajax({
                        url:"/gym/getTotalPages",
                        type:"GET",
                        success:function (result) {
                            var totalPage = result.extendInfo.totalPages;
                            window.location.href="/gym/getAllGym?pageNo="+totalPage;
                        }
                    })
                } else {
                    alert("健身房新增失败！");
                }
            }

        });
    });
</script>
</body>
</html>



