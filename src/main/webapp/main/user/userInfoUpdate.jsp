<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/11
  Time: 22:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Member Update Page</title>
</head>
<body>
<div class="modal fade member-update-modal" tabindex="-1" role="dialog" aria-labelledby="member-update-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">更改会员信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal update_member_form">
                    <%--<div class="form-group">--%>
                        <%--<label  for="update_static_memberName" class="col-sm-2 control-label">姓名</label>--%>
                        <%--<div class="col-sm-8">--%>
                            <%--<p class="form-control-static" id="update_static_memberName"></p>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <div class="form-group">
                        <label for="update_memberName" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-8">
                            <input type="text" name="member_name" class="form-control" id="update_memberName">
                            <span id="helpBlock_update_memberName" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_memberBirthday" class="col-sm-2 control-label">出生年月</label>
                        <div class="col-sm-8">
                            <input type="date" name="birthday" class="form-control" id="update_memberBirthday" placeholder="如：12345678900">
                            <span id="helpBlock_update_memberBirthday" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_memberAddress" class="col-sm-2 control-label">居住地址</label>
                        <div class="col-sm-8">
                            <input type="address" name="address" class="form-control" id="update_memberAddress">
                            <span id="helpBlock_update_memberAddress" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_memberPhone" class="col-sm-2 control-label">联系方式</label>
                        <div class="col-sm-8">
                            <input type="text" name="phone" class="form-control" id="update_memberPhone">
                            <span id="helpBlock_update_memberPhone" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_memberEmail" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-8">
                            <input type="email" name="email" class="form-control" id="update_memberEmail">
                            <span id="helpBlock_update_inputEmail" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="update_memberGender1" value="M"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="update_memberGender2" value="F"> 女
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
                <button type="button" class="btn btn-primary member_update_btn">更新</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<script type="text/javascript">
    $(".member_update_btn").click(function () {
        var updateMemberId = $(this).attr("updateMemberId");
        //4 进行修改，对修改的邮箱格式进行判断；
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        var updateMemberEmail = $("#update_memberEmail").val();
        if (!regEmail.test(updateMemberEmail)){
            $("#update_memberEmail").parent().parent().removeClass("has-success");
            $("#update_memberEmail").parent().parent().addClass("has-error");
            $("#helpBlock_update_inputEmail").text("邮箱格式不正确！");
            return false;
        }else {
            $("#update_memberEmail").parent().parent().removeClass("has-error");
            $("#update_memberEmail").parent().parent().addClass("has-success");
            $("#helpBlock_update_inputEmail").text("");
        }
        //5 点击更新按钮，发送AJAX请求到后台进行保存。
        $.ajax({
            url:"/member/updateMember/"+updateMemberId,
            type:"POST",
            data:$(".update_member_form").serializeArray(),
            success:function (result) {
                if (result.code==100){
                    alert("会员修改成功！");
                    $(".member-update-modal").modal("hide");
                    window.location.href="/main/userInfo.jsp?member_id="+updateMemberId;
                }else {
                    alert(result.extendInfo.member_update_error);
                }
            }
        });

    });
</script>
</body>
</html>
