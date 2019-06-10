<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/23
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Coach Add Page</title>
</head>
<body>
<div class="modal fade coach-add-modal" tabindex="-1" role="dialog" aria-labelledby="coach-add-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加教练信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal add_coach_form" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="add_inputCoach_id" class="col-sm-2 control-label">教练ID</label>
                        <div class="col-sm-8">
                            <input type="text" name="coach_id" class="form-control" id="add_inputCoach_id" placeholder="如：0001">
                        </div>
                        <span id="helpBlock_add_inputCoach_id" class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="add_inputName" class="col-sm-2 control-label">教练姓名</label>
                        <div class="col-sm-8">
                            <input type="text" name="coach_name" class="form-control" id="add_inputName" placeholder="如：张三">
                        </div>
                        <span id="helpBlock_add_inputName" class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="add_inputPassword" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-8">
                            <input type="password" name="password" class="form-control" id="add_inputPassword" placeholder="如：qwe@123..">
                        </div>
                        <span id="helpBlock_add_inputPassword" class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input type="radio" checked="checked" name="sex" id="add_inputGender1" value="M"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="add_inputGender2" value="F"> 女
                            </label>
                            <span id="helpBlock_add_inputGender" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_inputBirthday" class="col-sm-2 control-label">出生年月</label>
                        <div class="col-sm-8">
                            <input type="date" name="birthday" class="form-control" id="add_inputBirthday" placeholder="如：12345678900">
                            <span id="helpBlock_add_inputBirthday" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_inputEmail" class="col-sm-2 control-label">联系方式</label>
                        <div class="col-sm-8">
                            <input type="text" name="phone" class="form-control" id="add_inputPhone" placeholder="如：12345678900">
                            <span id="helpBlock_add_inputPhone" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_inputEmail" class="col-sm-2 control-label">邮箱地址</label>
                        <div class="col-sm-8">
                            <input type="email" name="email" class="form-control" id="add_inputEmail" placeholder="如：zs@qq.com">
                            <span id="helpBlock_add_inputEmail" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_inputAddress" class="col-sm-2 control-label">居住地</label>
                        <div class="col-sm-8">
                            <input type="text" name="address" class="form-control" id="add_inputAddress" placeholder="如：河南省郑州市中原区136号">
                            <span id="helpBlock_add_inputAddress" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_inputPic" class="col-sm-2 control-label">教练头像</label>
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
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary coach_save_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script type="text/javascript">

    <!-------------------------------------教练新增操作-------------------------------------->
    //    //=======0 点击 教练新增按钮，弹出模态框，
    //    $(".coach_add_btn").click(function () {
    //        $('.coach-add-modal').modal({
    //            backdrop:static,
    //            keyboard:true
    //        });
    //    });

    //=========1 当鼠标从教练id输入框移开的时候，判断教练id是否重复 ============
    $("#add_inputCoach_id").change(function () {
        var coach_id = $("#add_inputCoach_id").val();
//        alert(coach_id);
        $.ajax({
            url:"/coach/checkCoachIdExists",
            type:"GET",
            data:"coach_id="+coach_id,
            success:function (result) {
                if (result.code == 100){
                    $("#add_inputCoach_id").parent().parent().removeClass("has-error");
                    $("#add_inputCoach_id").parent().parent().addClass("has-success");
                    $("#helpBlock_add_inputCoach_id").text("教练ID可用！");
                    $(".coach_save_btn").attr("btn_coachId_exists", "success");
                }else {
                    $("#add_inputCoach_id").parent().parent().removeClass("has-success");
                    $("#add_inputCoach_id").parent().parent().addClass("has-error");
                    $("#helpBlock_add_inputCoach_id").text(result.extendInfo.coachId_reg_error);
                    $(".coach_save_btn").attr("btn_coachId_exists", "error");
                }
            }
        });
    });

    //3 保存
    $(".coach_save_btn").click(function () {
        if($(".coach_save_btn").attr("btn_coachId_exists") == "error"){
            return false;
        }

        var max_size = 300;// 300k
        var path = $("#add_inputPic").val();
        if (path.length == 0) {
            alert("请上传头像！");
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
        var inputCoachId = $("#add_inputCoach_id").val();
        var inputName = $("#add_inputName").val();
        var inputEmail = $("#add_inputEmail").val();
        //验证格式。姓名：2-5位中文或6-16位英文和数字组合；
        var regName = /(^[a-zA-Z_-]{1,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regName.test(inputName)){
            alert("输入姓名格式不正确！");
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
        if (!regEmail.test(inputEmail)){
            //输入框变红
            $("#add_inputEmail").parent().parent().addClass("has-error");
            //输入框下面显示红色提示信息
            $("#helpBlock_add_inputEmail").text("输入邮箱格式不正确！");
            return false;
        }else {
            //移除格式
            $("#add_inputEmail").parent().parent().removeClass("has-error");
            $("#add_inputName").parent().parent().addClass("has-success");
            $("#helpBlock_add_inputEmail").hide();
        }
        //获取表单中包含图片的表单数据
        var formData = new FormData($(".add_coach_form")[0]);
        $.ajax({
            url:"/coach/addCoach",
            type:"POST",
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success:function (result) {
                if (result.code == 100){
                    alert("教练新增成功");
                    $('#coach-add-modal').modal("hide");
                    //跳往最后一页，由于新增记录，所以要重新查询总页数
                    $.ajax({
                        url:"/coach/getTotalPages",
                        type:"GET",
                        success:function (result) {
                            var totalPage = result.extendInfo.totalPages;
                            window.location.href="/coach/getAllCoach?pageNo="+totalPage;
                        }
                    })
                } else {
                    alert("教练新增失败！");
                }
            }

        });
    });
</script>
</body>
</html>


