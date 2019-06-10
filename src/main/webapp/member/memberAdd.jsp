<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/11
  Time: 22:19
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Member Add Page</title>
</head>
<body>
<div class="modal fade member-add-modal" tabindex="-1" role="dialog" aria-labelledby="member-add-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加会员信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal add_member_form" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="add_inputMember_id" class="col-sm-2 control-label">会员ID</label>
                        <div class="col-sm-8">
                            <input type="text" name="member_id" class="form-control" id="add_inputMember_id" placeholder="如：0001">
                        </div>
                        <span id="helpBlock_add_inputMember_id" class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="add_inputName" class="col-sm-2 control-label">会员姓名</label>
                        <div class="col-sm-8">
                            <input type="text" name="member_name" class="form-control" id="add_inputName" placeholder="如：张三">
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
                        <label for="add_inputPic" class="col-sm-2 control-label">会员头像</label>
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
                <button type="button" class="btn btn-primary member_save_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script type="text/javascript">

    <!-------------------------------------会员新增操作-------------------------------------->
//    //=======0 点击 会员新增按钮，弹出模态框，
//    $(".member_add_btn").click(function () {
//        $('.member-add-modal').modal({
//            backdrop:static,
//            keyboard:true
//        });
//    });

    //=========1 当鼠标从会员id输入框移开的时候，判断会员id是否重复 ============
    $("#add_inputMember_id").change(function () {
        var member_id = $("#add_inputMember_id").val();
//        alert(member_id);
        $.ajax({
            url:"/member/checkMemberIdExists",
            type:"GET",
            data:"member_id="+member_id,
            success:function (result) {
                if (result.code == 100){
                    $("#add_inputMember_id").parent().parent().removeClass("has-error");
                    $("#add_inputMember_id").parent().parent().addClass("has-success");
                    $("#helpBlock_add_inputMember_id").text("会员ID可用！");
                    $(".member_save_btn").attr("btn_memberId_exists", "success");
                }else {
                    $("#add_inputMember_id").parent().parent().removeClass("has-success");
                    $("#add_inputMember_id").parent().parent().addClass("has-error");
                    $("#helpBlock_add_inputMember_id").text(result.extendInfo.memberId_reg_error);
                    $(".member_save_btn").attr("btn_memberId_exists", "error");
                }
            }
        });
    });

    //3 保存
    $(".member_save_btn").click(function () {
        if($(".member_save_btn").attr("btn_memberId_exists") == "error"){
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
        var inputMemberId = $("#add_inputMember_id").val();
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
        var formData = new FormData($(".add_member_form")[0]);
        $.ajax({
            url:"/member/addMember",
            type:"POST",
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success:function (result) {
                if (result.code == 100){
                    alert("会员新增成功");
                    $('#member-add-modal').modal("hide");
                    //跳往最后一页，由于新增记录，所以要重新查询总页数
                    $.ajax({
                        url:"/member/getTotalPages",
                        type:"GET",
                        success:function (result) {
                            var totalPage = result.extendInfo.totalPages;
                            window.location.href="/member/getAllMember?pageNo="+totalPage;
                        }
                    })
                } else {
                    alert("会员新增失败！");
                }
            }

        });
    });
</script>
</body>
</html>

