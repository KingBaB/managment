<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/5/9
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
</head>
<link href="../../css/fontawesome-all.min.css" rel="stylesheet" type="text/css" media="all">
<link href="../../css/info.css" rel='stylesheet' type='text/css'/>
<style>
    table{
        width:320px;
        padding-left: 55px;
        margin-left: 55px;
    }
    th{
        font-family: "Microsoft YaHei UI";
        font-size: 15px;
    }
    td{
        padding-left: 5px;
        font-family: "Microsoft YaHei UI";
        font-size: 15px;
    }
</style>
<body >
<div class="members_container">
    <!-- 导航条 -->
    <%@ include file="../common/userHead.jsp" %>

    <!-- 中间部分（包括左边栏和员工/部门表单显示部分） -->
    <div class="members_body" style="position:relative; top:-15px;">

        <!-- 左侧栏 -->
        <%--<%@ include file="../main/common/userLeft.jsp" %>--%>

        <!-- 中间员工表格信息展示内容 -->
        <div class="member_info col-sm-10" style="position: absolute;left: 150px">

            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li><a href="#">个人信息</a></li>
                        <li class="active" id="selfInfo"></li>
                    </ol>
                </div>
                <!-- Table -->

                <div class="profile" style="background-color: #6dd5ed">
                    <div class="wrap">
                        <div class="profile-main">
                            <div class="profile-pic wthree">
                                <a href="#" class="pic_update_btn" data-toggle="modal" data-target=".pic-update-modal"><img class="img-circle" src="" id="pic" alt=""></a>
                                <h4 class="member_name"></h4>
                                <div class="member" style="height: 350px">
                                    <table style="border-spacing: 10px 15px;">
                                        <tr>
                                            <td>会员编号：</td>
                                            <td><span class="member_id"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
                                            <td><span class="member_sex"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>居住地址：</td>
                                            <td><span class="member_address"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>联系方式：</td>
                                            <td><span class="member_phone"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>邮箱地址：</td>
                                            <td><span class="member_email"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>创建日期：</td>
                                            <td><span class="member_create"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>更新日期：</td>
                                            <td><span class="member_update"></span></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td>最后登录时间：</td>
                                            <td><span class="member_lastTime"></span></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div><!-- /.panel panel-success -->
        </div><!-- /.emp_info -->

        <!-- 尾部 -->
        <%--<%@ include file="../main/common/foot.jsp" %>--%>
    </div>
</div><!-- /.container -->
<%@ include file="userPicUpdate.jsp" %>
<%@ include file="userInfoUpdate.jsp" %>
<%@ include file="updatePwd.jsp" %>
<script>
    $(document).ready(function(){
        var url = window.location.href;
//        //展开导航栏
//        var str = new RegExp('member');
//        if (str.test(url)){
//            $("#collapse_member").removeAttr("hidden");
//        }

        var index=url.lastIndexOf("=");
        var member_id = url.substring(index+1,url.length);
        $.ajax({
            url: "/user/getUserInfo",
            type: "GET",
            data: "loginid="+member_id,
            success: function (result) {
                if(result.code == 100){
                    var lastTime = result.extendInfo.user;
                    $(".member_lastTime").text(lastTime.last_time);
                }
            }
//            success:function (result) {
//                if (result.code == 100) {
//                    var lastTime = result.extendInfo.user;
//                    alert(lastTime);
//                    $(".member_lastTime").text(user.last_time);
//                }
//            }
        });
        $.ajax({
            url: "/member/getInfoByMember_id",
            type: "GET",
            data: "member_id="+member_id,
            success:function (result) {
                if (result.code == 100){
                    var member = result.extendInfo.member;
                    $(".member_id").text(member.member_id);
                    $(".member_sex").text(member.sex == "F" ? "女" : "男");
                    $(".member_address").text(member.address);
                    $(".member_birth").text(member.birthday);
                    $(".member_email").text(member.email);
                    $(".member_phone").text(member.phone);
                    $(".member_create").text(member.create_date);
                    $(".member_update").text(member.update_date);
                    $(".member_name").text(member.member_name);
                    $("#pic").attr("src", member.pic);
                    $("#pic").attr("alt",""+member.member_name);
                    $("#selfInfo").text("会员【"+member.member_name+"】的详细信息");
                    $(document).attr("title",member.member_name);
//                    $(".dropdown-toggle").append("<img id=\"userPic\" src=\""+member.pic+"\" style=\"width: 35px; height: 35px;\" alt=\"管理员\">&nbsp;&nbsp;"+member.member_name+"<span class=\"caret\"></span>");
//                    $(".update_userInfo").attr("id", member.member_id);
                }
            }
        });
    });
    $(".update_userInfo").click(function () {
        //1 获取点击修改员工的id与name;
        var member_id = $(".update_userInfo").attr("id");
        $.ajax({
            url: "/member/getInfoByMember_id",
            type: "get",
            data: "member_id="+member_id,
            success: function (result) {
                var member = result.extendInfo.member;
                var updateMemberId = member.member_id;
                var updateMemberName = member.member_name;
                var updateMemberAddress = member.address;
                var updateMemberPhone = member.phone;
                var updateMemberEmail = member.email;
                var updateMemberSex = member.sex;
                var updateMemberBirthday = member.birthday;
                $("#update_memberName").val(updateMemberName);
                $("#update_memberAddress").val(updateMemberAddress);
                $("#update_memberPhone").val(updateMemberPhone);
                $("#update_memberEmail").val(updateMemberEmail);
                $("#update_memberBirthday").val(updateMemberBirthday);
                $(".member_update_btn").attr("updateMemberId", updateMemberId);
                $("#helpBlock_update_date").text("<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>");
                if (updateMemberSex == '男'){
                    $(".member-update-modal input[name=sex][value='M']").attr("checked",true);
                }else {
                    $(".member-update-modal input[name=sex][value='F']").attr("checked",true);
                }
            }
        });
    });
</script>
</body>
</html>
