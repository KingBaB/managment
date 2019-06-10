<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
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
    <title>Member Delete Page</title>
</head>
<body>
<div class="modal fade member-del-modal" tabindex="-1" role="dialog" aria-labelledby="member-del-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">删除会员信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal del_member_form">
                    <div class="form-group">
                        <label for="del_memberId" class="col-sm-2 control-label">会员ID</label>
                        <div class="col-sm-8">
                            <div class="checkbox">
                                <select class="form-control" name="member_id" id="del_memberId">
                                     <option selected="selected" value=""></option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_memberName" class="col-sm-2 control-label">会员姓名</label>
                        <div class="col-sm-8">
                            <input type="text" name="member_name" readonly="readonly" class="form-control" id="del_memberName">
                        </div>
                        <span id="helpBlock_del_memberName" class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-8">
                            <input type="text" name="sex" readonly="readonly" class="form-control" id = del_memberSex>
                            <span id="helpBlock_del_memberSex" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_memberBirthday" class="col-sm-2 control-label">出生年月</label>
                        <div class="col-sm-8">
                            <input type="date" name="birthday" readonly="readonly" class="form-control" id="del_memberBirthday" placeholder="如：12345678900">
                            <span id="helpBlock_del_memberBirthday" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_memberPhone" class="col-sm-2 control-label">联系方式</label>
                        <div class="col-sm-8">
                            <input type="email" name="phone" readonly="readonly" class="form-control" id="del_memberPhone">
                            <span id="helpBlock_del_memberPhone" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_memberEmail" class="col-sm-2 control-label">邮箱地址</label>
                        <div class="col-sm-8">
                            <input type="email" name="email" readonly="readonly" class="form-control" id="del_memberEmail">
                            <span id="helpBlock_del_memberEmail" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_memberAddress" class="col-sm-2 control-label">居住地</label>
                        <div class="col-sm-8">
                            <input type="text" name="address" readonly="readonly" class="form-control" id="del_memberAddress">
                            <span id="helpBlock_del_memberAddress" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_memberCreate" class="col-sm-2 control-label">创建日期</label>
                        <div class="col-sm-8">
                            <input type="text" name="create_date" readonly = "readonly" class="form-control" id="del_memberCreate">
                            <span id="helpBlock_del_memberCreate" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_memberUpdate" class="col-sm-2 control-label">修改日期</label>
                        <div class="col-sm-8">
                            <input type="text" name="update_date" readonly="readonly" class="form-control" id="del_memberUpdate">
                            <span id="helpBlock_del_memberUpdate" class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary member_modal_del_btn">删除</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script type="text/javascript">
    $(".member_del_btn").click(function () {
        $("#del_memberId").find("option").remove();
        $("#del_memberId").append("<option value='Value'></option>");
        //会员id回显列表；
        $.ajax({
            url:"/member/getMember_id",
            type:"GET",
            success:function (result) {
                if (result.code == 100){
                    $.each(result.extendInfo.member_idList, function () {
                        var optEle = $("<option></option>").append(this.member_id).attr("value", this.member_id);
                        optEle.appendTo("#del_memberId");
                    });
                }
            }
        });
    });

    //根据选中的会员id，回显会员信息
    $("#del_memberId").change(function () {
        var member_id = $("#del_memberId").find("option:selected").text();
        $.ajax({
            url:"/member/getInfoByMember_id",
            type:"GET",
            data:"member_id="+member_id,
            success:function (result) {
                if (result.code == 100){
                    var member = result.extendInfo.member;
                    $("#del_memberName").val(member.member_name);
                    $("#del_memberSex").val(member.sex == "F" ? "女" : "男" );
                    $("#del_memberBirthday").val(member.birthday);
                    $("#del_memberPhone").val(member.phone);
                    $("#del_memberEmail").val(member.email);
                    $("#del_memberAddress").val(member.address);
                    $("#del_memberCreate").val(member.create_date);
                    $("#del_memberUpdate").val(member.update_date);
                }else {
                    $("#del_memberName").val("");
                    $("#del_memberSex").val("");
                    $("#del_memberBirthday").val("");
                    $("#del_memberPhone").val("");
                    $("#del_memberEmail").val("");
                    $("#del_memberAddress").val("");
                    $("#del_memberCreate").val("");
                    $("#del_memberUpdate").val("");
                }
            }
        });

    });

    //3 根据会员id删除会员
    $(".member_modal_del_btn").click(function () {
        var member_id = $("#del_memberId").find("option:selected").text();
        var curPage = ${curPage};
        $.ajax({
            url:"/member/deleteMemberById",
            type:"GET",
            data:"member_id="+member_id,
            success:function (result) {
                if (result.code==100){
                    alert("会员删除成功！");
                    $(".member-update-modal").modal("hide");
                    //跳转到当前页
                    var curPage = ${curPage};
                    window.location.href="/member/getAllMember?pageNo=1";
                }else {
                    alert(result.extendInfo.member_modal_del_error);
                }
            }
        });
    });
</script>
</body>
</html>


