<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/18
  Time: 20:49
  Desc: 会员统计
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
<div class="members_container">
    <!-- 导航条 -->
    <%@ include file="../main/common/head.jsp"%>

    <!-- 中间部分（包括左边栏和员工/部门表单显示部分） -->
    <div class="members_body" style="position:relative; top:-15px;">

        <!-- 左侧栏 -->
        <%@ include file="../main/common/leftsidebar.jsp"%>

        <!-- 中间员工表格信息展示内容 -->
        <div class="member_info col-sm-10">

            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li><a href="#">健身会员管理</a></li>
                        <li class="active">会员统计</li>
                    </ol>
                </div>
                <!--body-->
                <div class="btn-group" id="btns" style="padding-left: 10px; padding-top: 10px; margin-left: 10px;">
                    <button type="button" class="btn btn-default" name="AgeStatistics" id="AgeStatistics">年龄</button>
                    <button type="button" class="btn btn-default" name="SexStatistics" id="SexStatistics">性别</button>
                    <button type="button" class="btn btn-default" name="GeoStatistics" id="GeoStatistics">地理位置</button>
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

<%--<%@ include file="memberAdd.jsp"%>--%>
<%--<%@ include file="memberUpdate.jsp"%>--%>
<%--<%@ include file="memberDelete.jsp"%>--%>


<script type="text/javascript">
    $(document).ready(function(){
        $('#AgeStatistics').trigger('click');
    });

    var myChartDT = echarts.init(document.getElementById('myEcharts'));
    $("#AgeStatistics").click(function () {
        $("#AgeStatistics").attr("disabled", true);
        $("#SexStatistics").removeAttr("disabled");
        $.ajax({
            url:"/member/getAgeCount",
            type:"POST",
            success:function (result) {
                setAgeSta(result);
            }
        });
    });
    function setAgeSta(result) {
        $(document).attr("title","会员年龄数据统计");
        var ageCount = result.extendInfo.ageCount;
        var age5 = result.extendInfo.other;
        var ageData = ['10后', '00后', '90后', '80后', '70后', '60后', '未填'];
        var dataAge = [ageCount.age1, ageCount.age0, ageCount.age9, ageCount.age8, ageCount.age7, ageCount.age6, age5];
        var optionDT = {
            color: ['#3398DB'],
            tooltip : {
                trigger: 'axis',
            },
            xAxis: {
                type: 'category',
                data: ageData
            },
            yAxis: {
                type: 'value'
            },
            series: [{
                data: dataAge,
                type: 'bar',
                itemStyle: {
                    normal: {
                        //每根柱子颜色设置
                        color: function(params) {
                            var colorList = [
                                "#c23531",
                                "#2f4554",
                                "#61a0a8",
                                "#d48265",
                                "#91c7ae",
                                "#749f83",
                                "#ca8622",
                                "#bda29a",
                                "#6e7074",
                                "#546570",
                                "#c4ccd3",
                                "#4BABDE",
                                "#FFDE76",
                                "#E43C59",
                                "#37A2DA"
                            ];
                            return colorList[params.dataIndex];
                        }
                    }
                },
                //柱状图上显示数据
                label: {
                    show: "true",
                    position: "top",
                    color: "#FFF",
                    fontWeight: "bolder",
                    backgroundColor: "auto",
                    fontSize: "20"
                },
                //平均值
                markLine: {
                    data: [{ type: "average", name: "平均值" }]
                }
            }]
        };
        myChartDT.setOption(optionDT);
        $("#age1").text(ageCount.age1);
        $("#age0").text(ageCount.age0);
        $("#age9").text(ageCount.age9);
        $("#age8").text(ageCount.age8);
        $("#age7").text(ageCount.age7);
        $("#age6").text(ageCount.age6);
        $("#age5").text(ageCount.age5);
        $("#ageSta").removeAttr("hidden");
        $("#sexSta").attr("hidden", "hidden");
    }
    $("#SexStatistics").click(function () {
        $(document).attr("title","会员性别数据统计");
        $("#SexStatistics").attr("disabled", true);
        $("#AgeStatistics").removeAttr("disabled");
        $.ajax({
            url:"/member/getSexCount",
            type:"POST",
            success:function (result) {
                setSexSta(result);
            }
        });
    });
    function setSexSta(result) {
        var maleCount = result.extendInfo.maleCount;
        var femaleCount = result.extendInfo.femaleCount;
        var other = result.extendInfo.other;
        var data = [maleCount, femaleCount, other];
        var sexData = ['男', '女', '未填'];
        var optionDT = {
            color: ['#3398DB'],
            tooltip : {
                trigger: 'axis',
            },
            xAxis: {
                type: 'category',
                data: sexData
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
        $("#maleCount").text(maleCount);
        $("#femaleCount").text(femaleCount);
        $("#totalCount").text(maleCount+femaleCount+other);
        $("#sexSta").removeAttr("hidden");
        $("#ageSta").attr("hidden", "hidden");
    }
    $("#GeoStatistics").click(function () {
        alert("地理位置统计暂未实现，敬请期待！");
        $("#GeoStatistics").attr("disabled", true);
    });
</script>
</body>
</html>

