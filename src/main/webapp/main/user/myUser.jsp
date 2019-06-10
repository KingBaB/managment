<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>cuizb健身系统后台</title>
</head>
<body>
<div class="members_container">
    <!-- 导航条 -->
    <%@ include file="../common/userHead.jsp"%>

    <!-- 中间部分 -->
    <div class="members_body" style="position:relative; top:-15px;">

        <!-- 左侧栏 -->
        <%@ include file="../common/userLeft.jsp"%>

        <!-- 中间轮播图内容 -->
        <div class="members_main_ad col-sm-10">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 style="text-align: center;">欢迎进入cuizb健身管理系统后台！</h3>
                </div>
                <div class="panel-body" style="position:relative; top:-15px;">
                    <div id="members_carousel_1" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#members_carousel_1" data-slide-to="0" class="active"></li>
                            <li data-target="#members_carousel_1" data-slide-to="1"></li>
                            <li data-target="#members_carousel_1" data-slide-to="2"></li>
                            <li data-target="#members_carousel_1" data-slide-to="3"></li>
                            <li data-target="#members_carousel_1" data-slide-to="4"></li>
                        </ol>

                        <div class="carousel-inner" role="listbox">
                            <div class="item active" style="text-align: center;">
                                <img class="img-responsive center-block" src="/images/home/home_1.jpg" alt="company1">
                                <div class="carousel-caption">
                                    <h3>OFFERS SUPPERT</h3>
                                </div>
                            </div>
                            <div class="item" style="text-align: center;">
                                <img class="img-responsive center-block" src="/images/home/home_2.jpg" alt="company1">
                                <div class="carousel-caption">
                                    <h3>OFFERS SUPPERT</h3>
                                </div>
                            </div>
                            <div class="item" style="text-align: center;">
                                <img class="img-responsive center-block" src="/images/home/home_3.jpg" alt="company1">
                                <div class="carousel-caption">
                                    <h3>OFFERS SUPPERT</h3>
                                </div>
                            </div>
                            <div class="item">
                                <img class="img-responsive center-block" src="/images/home/home_4.jpg" alt="company2">
                                <div class="carousel-caption">
                                    <h3>美女</h3>
                                </div>
                            </div>
                            <div class="item">
                                <img class="img-responsive center-block" src="/images/home/home_5.jpg" alt="company3">
                                <div class="carousel-caption">
                                    <h3>美女女</h3>
                                </div>
                            </div>
                        </div>

                        <!-- Controls -->
                        <a class="left carousel-control" href="#members_carousel_1" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#members_carousel_1" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>

                </div><!-- /.panel-body -->
            </div><!-- /.panel -->
        </div>
    </div>

    <!-- 尾部 -->
</div>
<script>
    $(document).ready(function() {
        $("#collapse_member").removeAttr("hidden");
    });
</script>
</body>
</html>
