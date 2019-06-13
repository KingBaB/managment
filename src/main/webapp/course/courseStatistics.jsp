<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/23
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
    <style type="text/css">
        th {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="coachs_container">
    <!-- 导航条 -->
    <%@ include file="../main/common/head.jsp"%>

    <!-- 中间部分（包括左边栏和员工/部门表单显示部分） -->
    <div class="coachs_body" style="position:relative; top:-15px;">

        <!-- 左侧栏 -->
        <%@ include file="../main/common/leftsidebar.jsp"%>

        <!-- 中间员工表格信息展示内容 -->
        <div class="coach_info col-sm-10">

            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li><a href="#">健身课程管理</a></li>
                        <li class="active">课程统计</li>
                    </ol>
                </div>
                <!--body-->
                <div class="btn-group" id="btns" style="padding-left: 10px; padding-top: 10px; margin-left: 10px;">
                    <button type="button" class="btn btn-default" name="TypeStatistics" id="TypeStatistics">课程类别</button>
                    <%--<button type="button" class="btn btn-default" name="SexStatistics" id="SexStatistics">性别</button>--%>
                    <%--<button type="button" class="btn btn-default" name="GeoStatistics" id="GeoStatistics">地理位置</button>--%>
                </div>
                <div>
                    <p id="sexSta" hidden="hidden" style="padding-top: 25px; padding-left: 580px;">
                        男：<span id="maleCount"></span>个&nbsp;&nbsp;&nbsp;&nbsp;女：<span id="femaleCount"></span>个&nbsp;&nbsp;&nbsp;&nbsp;总人数：<span id="totalCount"></span>个
                    </p>
                    <p id="ageSta" hidden="hidden" style="padding-top: 25px; padding-left: 400px;">
                        10后：<span id="age1"></span>个&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        00后：<span id="age0"></span>个&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        90后：<span id="age9"></span>个&nbsp;&nbsp;&nbsp;&nbsp;
                        80后：<span id="age8"></span>个&nbsp;&nbsp;&nbsp;&nbsp;
                        70后：<span id="age7"></span>个&nbsp;&nbsp;&nbsp;&nbsp;
                        60后：<span id="age6"></span>个&nbsp;&nbsp;&nbsp;&nbsp;
                        未填：<span id="age5"></span>个
                    </p>
                </div>
                <div id="myEcharts" style="width: 1000px; height: 500px; padding-left: 350px; padding-top: 25px"></div>

                <br/><br/><br/>
            </div><!-- /.panel panel-success -->
        </div><!-- /.emp_info -->

        <!-- 尾部 -->
        <%@ include file="../main/common/foot.jsp"%>
    </div>
</div><!-- /.container -->

<%--<%@ include file="coachAdd.jsp"%>--%>
<%--<%@ include file="coachUpdate.jsp"%>--%>
<%--<%@ include file="coachDelete.jsp"%>--%>


<script type="text/javascript">
    $(document).ready(function(){
        $('#TypeStatistics').trigger('click');
    });

    var myChartDT = echarts.init(document.getElementById('myEcharts'));
    $("#TypeStatistics").click(function () {
        $(document).attr("title","健身课程类别数据统计");
        $("#TypeStatistics").attr("disabled", true);
//        $("#AgeStatistics").removeAttr("disabled");
        $.ajax({
            url:"/course/getCourseType",
            type:"GET",
            success:function (result) {
                setTypeSta(result);
            }
        });
    });
    function setTypeSta(result) {
        var typeData = [];
        var data = [];
        $.each(result.extendInfo.courseTypeList, function () {
            typeData.push(this.type);
            data.push(this.sum);
        });
        alert(typeData);
//        var maleCount = result.extendInfo.maleCount;
//        var femaleCount = result.extendInfo.femaleCount;
//        var other = result.extendInfo.other;
//        var data = [maleCount, femaleCount, other];
//        var sexData = ['男', '女', '未填'];
        var optionDT = {
            color: ['#3398DB'],
            tooltip : {
                trigger: 'axis',
            },
            xAxis: {
                type: 'category',
                data: typeData,
            },
            yAxis: {
                type: 'value'
            },
            series: [{
                data: data,
                type: 'bar'
            }]
        };
        myChartDT.setOption(optionDT);
//        $("#maleCount").text(maleCount);
//        $("#femaleCount").text(femaleCount);
//        $("#totalCount").text(maleCount+femaleCount+other);
//        $("#TypeStatistics").removeAttr("hidden");
//        $("#ageSta").attr("hidden", "hidden");
    }
//    $("#GeoStatistics").click(function () {
//        alert("地理位置统计暂未实现，敬请期待！");
//        $("#GeoStatistics").attr("disabled", true);
//    });
</script>
</body>
</html>

