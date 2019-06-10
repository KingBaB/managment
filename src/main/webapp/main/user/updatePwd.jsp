<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/28
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Member Update Password Page</title>
</head>
<body>
<div class="modal fade password-update-modal" tabindex="-1" role="dialog" aria-labelledby="password-update-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">会员修改密码</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal update_password">
                    <div class="form-group">
                        <label  for="old_password" class="col-sm-2 control-label">原始密码</label>
                        <div class="col-sm-8">
                            <input type="password" name="oldPassword" class="form-control" id="old_password">
                            <span id="helpBlock_old_password" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  for="new_password" class="col-sm-2 control-label">新 密 码</label>
                        <div class="col-sm-8">
                            <input type="password" name="newPassword" class="form-control" id="new_password">
                            <span id="helpBlock_new_password" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  for="renew_password" class="col-sm-2 control-label">确认密码</label>
                        <div class="col-sm-8">
                            <input type="password" name="rePassword" class="form-control" id="renew_password">
                            <span id="helpBlock_renew_password" class="help-block"></span>
                        </div>
                    </div>
                </form>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary update_password_btn">更新</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">
    $("#renew_password").change(function () {
            var newPassword = $("#new_password").val();
            var rePassword = $("#renew_password").val();
            if(rePassword != newPassword){
                $("#new_password").parent().parent().addClass("has-error");
                $("#renew_password").parent().parent().addClass("has-error");
                $("#helpBlock_renew_password").text("两次密码不一致！");
            }else {
                //移除格式
                $("#new_password").parent().parent().removeClass("has-error");
                $("#new_password").parent().parent().addClass("has-success");
                $("#renew_password").parent().parent().removeClass("has-error");
                $("#renew_password").parent().parent().addClass("has-success");
                $("#helpBlock_renew_password").hide();
            }
        });
    $(".update_password_btn").click(function () {
        var oldPassword = $("#old_password").val();
        var newPassword = $("#new_password").val();
        $.ajax({
            url: "/user/updatePassword",
            type: "POST",
            data: "oldPassword="+oldPassword+"&newPassword="+newPassword,
            success: function (result) {
                var status = result.extendInfo.status;
                if(result.code==100){
                    alert(status);
                    window.location.href="/user/logout";
                }else {
                    alert(status);
                }
            }
        });
    });
</script>
</body>
</html>




