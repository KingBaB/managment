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
    <title>Member Pay Page</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
<div class="modal fade member-pay-modal" tabindex="-1" role="dialog" aria-labelledby="member-update-modal" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">支付页面</h4>
            </div>
            <div class="modal-body" align="center">
                <div class="payImg">
                    <img id="alipay" src="/images/pay/alipay.jpg" style="width: 228px;height: 353px;">
                    <img hidden="hidden" id="vxpay" src="/images/pay/vxpay.jpg" style="width: 228px;height: 353px;">
                </div> <br> <br>
                <button type="button" id="alipayBtn" class="btn btn-success">支付宝</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" id="vxpayBtn" class="btn btn-success">微信</button>
            </div>
            <div class="modal-footer">
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<script type="text/javascript">
    $(function () {
        $("#alipayBtn").click(function () {
            $("#alipay").removeAttr("hidden");
            $("#vxpay").attr("hidden", true);
            $("#alipayBtn").addClass("active");
        });
        $("#vxpayBtn").click(function () {
            $("#vxpay").removeAttr("hidden");
            $("#alipay").attr("hidden", true);
            $("#vxpayBtn").addClass("active");
        });
    });//初始化模态框

</script>
</body>
</html>

