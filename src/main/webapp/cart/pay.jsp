<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/5/12
  Time: 18:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <br><br><br><br><br><br>
        <div class="col-md-2 column">
        </div>
        <div class="col-md-4 column">
            <img alt="140x140" src="..${cart.course.pic}" style="float:right;width:313px;height:418px;" />
        </div>
        <div class="col-md-4 column">
            <div class="row clearfix">
                <div class="col-md-12 column" style="height:418px;">
                    <h3 align="center">
                        ${cart.course.course_name}
                    </h3><br><br>
                    <span>价格：${cart.course.price}</span><br><br>
                    <span>上课时间：${cart.course.class_time}</span><br><br>
                    <span>教练：${cart.course.coach.coach_name}</span><br><br>
                    <span>简介：${cart.course.introduce}</span><br><br>
                    <span style="position: absolute;bottom: 0px;left: 70px;"><input onclick="pay(${cart.member.member_id}, ${cart.course.course_id});" type="button" value="立即购买" data-toggle="modal" data-target=".member-pay-modal"/></span><br><br>
                </div>
            </div>
        </div>
        <div class="col-md-2 column">
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-6 column">
        </div>
        <div class="col-md-6 column">
        </div>
    </div>
</div>
<%@ include file="payModal.jsp"%>
</body>
<script>
    var c=0;
    var t;
    var timer_is_on=0;
    function timedCount(){//data-backdrop/data-keyboard
        t=setTimeout(
            function(){
                $.ajax({
                    url: "/orders/addOrders",
                    type: "GET",
                    data: "course_id=${cart.course.course_id}&member_id=${cart.member.member_id}",
                    success: function (result) {
                        var status = result.extendInfo.status;
                        if(result.code == 100){
                            alert(status);
                            timer_is_on=0;
                            $(".member-pay-modal").hide();
                            $('.modal-backdrop').remove();
                            $('body').removeClass('modal-open');
                            $.ajax({
                                url: "/cart/delCartById",
                                type: "GET",
                                data: "id=${cart.id}",
                            });
                        }else {
                            alert(status);
                            timer_is_on=0;
                            $(".member-pay-modal").hide();
                            $('.modal-backdrop').remove();
                            $('body').removeClass('modal-open');
                        }
                    }
                });
            },5000);
    }
    function pay(member_id, course_id){
        if (!timer_is_on){
            timer_is_on=0;
            timedCount();
        }
    }
    function stopCount(){
        clearTimeout(t);
        timer_is_on=0;
    }
    $('.member-pay-modal').on('hide.bs.modal', function () {
        stopCount();
    });
</script>
</html>
