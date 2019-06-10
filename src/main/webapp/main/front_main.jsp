<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" xmlns="http://java.sun.com/jsf/facelets">
<head>
    <title>cuizb健身系统</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //for-mobile-apps -->
    <%--<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">--%>
    <%--<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>--%>
    <%--<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
    <link type="text/css" rel="stylesheet" href="../css/cm-overlay.css" /><!-- //overlay-->
    <link rel="stylesheet" href="../css/owl.carousel.css" type="text/css" media="all"/> <!-- Owl-Carousel-CSS -->
    <link href="../css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!--fonts-->
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,900" rel="stylesheet">
    <!--//fonts-->
    <link rel="icon" href="../images/logo/cuizb.jpg" type="image/x-icon" />
    <link rel="shortcut icon" href="../images/logo/cuizb.jpg" type="image/x-icon" />
    <link rel="bookmark" href="../images/logo/cuizb.jpg" type="image/x-icon" />
    <style>
        .white{
            overflow: hidden;
            text-overflow:ellipsis;
            white-space: nowrap;
        }
        .black{
            overflow: hidden;
            text-overflow:ellipsis;
            white-space: nowrap;
        }
        /*图片遮罩层*/
        .demo{padding: 2em 0;}
        .box{
            text-align: center;
            overflow: hidden;
            position: relative;
        }
        .box:before{
            content: "";
            width: 0;
            height: 100%;
            background: #000;
            padding: 14px 18px;
            position: absolute;
            top: 0;
            left: 50%;
            opacity: 0;
            transition: all 500ms cubic-bezier(0.47, 0, 0.745, 0.715) 0s;
        }
        .box:hover:before{
            width: 100%;
            left: 0;
            opacity: 0.5;
        }
        .box img{
            width: 100%;
            height: auto;
        }
        .box .box-content{
            width: 100%;
            padding: 14px 18px;
            color: #fff;
            position: absolute;
            top: 38%;
            left: 0;
        }
        .box .title{
            line-height: 30px;
            text-transform: uppercase;
            margin: 0;
            opacity: 0;
            transition: all 0.5s ease 0s;
        }
        .box .post{
            font-size: 15px;
            text-transform: capitalize;
            opacity: 0;
            transition: all 0.5s ease 0s;
        }
        .box:hover .title,
        .box:hover .post{
            opacity: 1;
            transition-delay: 0.7s;
        }
        .box .icon{
            padding: 0;
            margin: 0;
            list-style: none;
            margin-top: 15px;
        }
        .box .icon li{
            display: inline-block;
        }
        .box .icon li a{
            display: block;
            width: 40px;
            height: 40px;
            line-height: 40px;
            border-radius: 50%;
            background: #f74e55;
            font-size: 20px;
            font-weight: 700;
            color: #fff;
            margin-right: 5px;
            opacity: 0;
            transform: translateY(50px);
            transition: all 0.5s ease 0s;
        }
        .box:hover .icon li a{
            opacity: 1;
            transform: translateY(0px);
            transition-delay: 0.5s;
        }
        /*  .box:hover .icon li:last-child a{
            transition-delay: 0.8s;
          }*/
        @media only screen and (max-width:990px){
            .box{ margin-bottom: 30px; }
        }
    </style>
</head>
<body>
<div id="single">
    <!--home-->
    <div data-target="home" class="banner-w3ls" id="home">
        <!-- header -->
        <div class="header-inner">
            <h1 class="logo">
                <a id="logo_id" href="front_main.jsp"><span>czb</span>CuiZBao</a>
            </h1>
            <h4 class="dropdown">
                <a class="login_info dropdown-toggle" id="" href="#" style="color:red;position: absolute;left: 230px;top: 35px;">亲,请登录</a>
                <div class="dropdown-menu" style="position: absolute;left:230px;top:55px;width: 266px;height: 100px">
                    <img src="../images/head/admin_test.jpg" style="position:absolute;left:21px;top:20px;width:50px;height:50px;" class="img-circle">
                    <span style="position: absolute;left: 100px;top:40px;font-size: 10px"><a id="userManage" href="#" target="_blank">账号信息</a></span>
                    <span style="position: absolute;left: 150px;top:40px;font-size: 10px"><a id="userCart" href="#" target="_blank">我的收藏夹</a></span>
                    <span style="position: absolute;left: 210px;top:40px;font-size: 10px"><a href="/user/logout">账号退出</a></span>
                    <span id="role" style="position: absolute;left: 21px;top:80px;font-size: 10px">会员等级</span>
                </div>
            </h4>
            <nav class="navbar navbar-default">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">切换导航</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <!-- navbar-header -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="index.html" data-anchor="active">首页</a></li>
                        <li><a href="#" data-anchor="about">关于</a></li>
                        <li><a href="#" data-anchor="classes">课程</a></li>
                        <li><a href="#" data-anchor="clients">用户</a></li>
                        <li><a href="#" data-anchor="gallery">健身器材</a></li>
                        <li><a href="#" data-anchor="contact" >成为会员</a></li>
                    </ul>
                </div>
                <div class="clearfix"> </div>
            </nav>
            <div class="clearfix"></div>
        </div>
        <!-- //header -->
        <div class="container">
            <!-- banner-slider -->
            <div class="w3l_banner_info" >
                <div class="slider">
                    <div class="callbacks_container">
                        <ul class="rslides" id="slider3">
                            <li>
                                <div class="w3ls-info">
                                    <h4>
                                        完美的身体需要大量的训练
                                    </h4>
                                    <p>
                                        通过我们个性化的健身系统，开始您的健康生活之路。
                                    </p>
                                </div>

                            </li>
                            <li>
                                <div class="w3ls-info">
                                    <h4>
                                        改善你身体的形态
                                    </h4>
                                    <p>通过我们个性化的健身系统，开始您的健康生活之路。</p>
                                </div>

                            </li>
                            <li>
                                <div class="w3ls-info">
                                    <h4>专业的指导，专业的建议。</h4>
                                    <p>通过我们个性化的健身系统，开始您的健康生活之路。</p>
                                </div>

                            </li>

                        </ul>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <!-- //banner-slider -->
            <p> <a href="#" data-anchor="about" class="btn-normal">更多关于我们</a> </p>
        </div>
        <div class="agileits-social">
            <ul>
                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                <li><a href="#"><i class="fa fa-rss"></i></a></li>
                <li><a href="#"><i class="fa fa-vk"></i></a></li>
            </ul>
        </div>
    </div>
    <!--//home-->
    <!--about-->
    <div data-target="about" class="about" id="about">
        <div class="container">
            <h3 class="title-w3-agile">关于我们</h3>
            <div class="about-main">
                <div class="col-md-5 about-bgcolr-agileinfo">
                    <div class="about-img-agileinfo">
                    </div>
                </div>
                <div class="col-md-7 about-info-agileits">
                    <h3 class="title-w3-agile-sub">关于 <span>健身房</span> 锻炼</h3>
                    <p class="para-agileits-w3layouts">最好选择地理位置方便的健身中心，如选择离家近的健身房，运动完便可回家休息。若选择离公司近的，下班后就可免去塞车之苦，先到健身房健身，然后再从容回家。若需经常出公差，就选分店多又可就近利用的健身房，这样比较容易能坚持下来更好的有助于我们的运动。另外，教练重要吗？这个问题几年前可能还不会引起健身者的注意，因为那时大家还停留在自己练自己的情况下，这个问题已经成了健身爱好者非常注意的一个问题，很多过来人都这样告诉记者，有时一个合格的教练会让自己的健身效果事半功倍。</p>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="about-btm-wthree">
                <div class="col-md-3 about-w3-grids">
                    <h4>宽敞的健身房</h4>
                    <p class="para-agileits-w3layouts">宽敞的健身房宽敞的健身房宽敞的健身房宽敞的健身房宽敞的健身房</p>
                </div>
                <div class="col-md-3 about-w3-grids">
                    <h4>友好的健身教练</h4>
                    <p class="para-agileits-w3layouts">友好的健身教练，友好的健身教练，友好的健身教练，友好的健身教练，友好的健身教练。</p>
                </div>
                <div class="col-md-3 about-w3-grids">
                    <h4>免费锻炼</h4>
                    <p class="para-agileits-w3layouts">免费锻炼，免费锻炼，免费锻炼，免费锻炼，免费锻炼，免费锻炼，免费锻炼，免费锻炼。</p>
                </div>
                <div class="col-md-3 about-w3-grids">
                    <h4>个人建议</h4>
                    <p class="para-agileits-w3layouts">个人建议，个人建议，个人建议，个人建议，个人建议，个人建议，个人建议，个人建议。</p>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <!--//about-->
    <!--section3-->
    <div data-target="classes" class="classes" id="classes">
        <div class="container">
            <h3 class="title-w3-agile">健身课程</h3>
            <div class="classes_wrapper">
                <div class="row class_box">
                    <div class="col-md-6 classes-grid-w3ls client-last-agileits">
                        <div class="class_right1 black">
                            <h3 id="type1"></h3>
                            <p id="introduce1"></p>
                            <div class="class_img">
                                <img id="coach_pic1" src="" alt=""/>
                                <div class="class_desc1">
                                    <h5 id="coach_name1">名字1</h5>
                                    <h4 id="role1">教练</h4>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="timings-agileits-w3layouts">
                                <h6 class="clr-w3ls">训练时间</h6>
                                <p id="class_time1"></p>
                                <span id="class_time_span1"></span>
                            </div>
                        </div>
                        <div class="class_left img2 box">
                            <img id="course_train_pic1" src="" style="width:253px;height: 272px">
                            <div class="box-content">
                                <span class="title"> <a onclick="cart(id)" id="signUp1" class="btn btn-danger">添加购物车</a> </span>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <span class="title"> <a onclick="collections(id)" id="cart1" class="btn btn-danger">收藏</a> </span>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="col-md-6 classes-grid-w3ls client-last-agileits">
                        <div class="class_right1 white">
                            <h3 id="type2"></h3>
                            <p id="introduce2"></p>
                            <div class="class_img">
                                <img id="coach_pic2" src="" alt=""/>
                                <div class="class_desc1">
                                    <h5 id="coach_name2">名字1</h5>
                                    <h4 id="role2">教练</h4>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="timings-agileits-w3layouts">
                                <h6>训练时间</h6>
                                <p id="class_time2"></p>
                                <span id="class_time_span2"></span>
                            </div>
                        </div>
                        <div class="class_left img2 box">
                            <img id="course_train_pic2" src="" style="width:253px;height: 272px">
                            <div class="box-content">
                                <span class="title"> <a onclick="cart(id)" id="signUp2" class="btn btn-danger">添加购物车</a> </span>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <span class="title"> <a onclick="collections(id)" id="cart2" class="btn btn-danger">收藏</a> </span>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="row class_box">
                    <div class="col-md-6 classes-grid-w3ls client-last-agileits">
                        <div class="class_right1 white">
                            <h3 id="type3"></h3>
                            <p id="introduce3"></p>
                            <div class="class_img">
                                <img id="coach_pic3" src="" alt=""/>
                                <div class="class_desc1">
                                    <h5 id="coach_name3">名字1</h5>
                                    <h4 id="role3">教练</h4>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="timings-agileits-w3layouts">
                                <h6>训练时间</h6>
                                <p id="class_time3"></p>
                                <span id="class_time_span3"></span>
                            </div>
                        </div>
                        <div class="class_left img3 box">
                            <img id="course_train_pic3" src="" style="width:253px;height: 272px;">
                            <div class="box-content">
                                <span class="title"> <a onclick="cart(id)" id="signUp3" class="btn btn-danger">添加购物车</a> </span>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <span class="title"> <a onclick="collections(id)" id="cart3" class="btn btn-danger">收藏</a> </span>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="col-md-6 classes-grid-w3ls client-last-agileits">
                        <div class="class_right1 black">
                            <h3 id="type4"></h3>
                            <p id="introduce4"></p>
                            <div class="class_img">
                                <img id="coach_pic4" src="" alt=""/>
                                <div class="class_desc1">
                                    <h5 id="coach_name4"></h5>
                                    <h4 id="role4">教练</h4>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="timings-agileits-w3layouts">
                                <h6 class="clr-w3ls">训练时间</h6>
                                <p id="class_time4"></p>
                                <span id="class_time_span4"></span>
                            </div>
                        </div>
                        <div class="class_left img4 box">
                            <img id="course_train_pic4" src="" style="width:253px;height: 272px">
                            <div class="box-content">
                                <span class="title"> <a onclick="cart(id)" id="signUp4" class="btn btn-danger">添加购物车</a> </span>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <span class="title"> <a onclick="collections(id)" id="cart4" class="btn btn-danger">收藏</a> </span>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix-fix"></div>
            </div>
            <div id="more" align="center" style="padding-top: 0px">
                <a id="more_course" href="#" target="_blank">
                    <h4 style="color: white;width: 100px;height: 35px;border:5px solid #000;border-color: white;padding-top: 3px;">
                        更多课程
                    </h4>
                </a>

            </div>
        </div>
    </div>
    <!--//section3-->
    <div class="tlinks">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>
    <!--section4-->
    <div data-target="clients" class="clients" id="clients">
        <!-- dishes -->
        <div class="w3agile-spldishes">
            <div class="container">
                <h3 class="title-w3-agile">用户评论</h3>
                <p class="para-agileits-w3layouts">来，让我们看看会员们都在说些什么呢！<a href="#" id="more_message" target="_blank">查看更多用户留言</a></p>
                <div class="spldishes-agileinfo">
                    <div class="spldishes-grids">
                        <!-- Owl-Carousel -->
                        <div id="owl-demo" class="owl-carousel text-center agileinfo-gallery-row">
                            <div class="item g1">
                                <img id="1" class="lazyOwl" src="" style="height: 314px;" title="" alt=""/>
                                <div class="agile-dish-caption">
                                    <h4 id="h41"></h4>
                                    <span id="span01"></span>
                                </div>
                            </div>
                            <div class="item g1">
                                <img id="2" class="lazyOwl" src="" style="height: 314px;" title="" alt=""/>
                                <div class="agile-dish-caption">
                                    <h4 id="h42"></h4>
                                    <span id="span02"></span>
                                </div>
                            </div>
                            <div class="item g1">
                                <img id="3" class="lazyOwl" src="" style="height: 314px;" title="" alt=""/>
                                <div class="agile-dish-caption">
                                    <h4 id="h43"></h4>
                                    <span id="span03"></span>
                                </div>
                            </div>
                            <div class="item g1">
                                <img id="4" class="lazyOwl" src="" style="height: 314px;" title="" alt=""/>
                                <div class="agile-dish-caption">
                                    <h4 id="h44"></h4>
                                    <span id="span04"></span>
                                </div>
                            </div>
                            <div class="item g1">
                                <img id="5" class="lazyOwl" src="" style="height: 314px;" title="" alt=""/>
                                <div class="agile-dish-caption">
                                    <h4 id="h45"></h4>
                                    <span id="span05"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <!-- //dishes -->
    </div>
    <!--//section4-->
    <!--section5-->
    <div data-target="gallery" class="gallery" id="gallery">
        <!-- gallery -->
        <div class="container">
            <h3 class="title-w3-agile">健身器材</h3>
            <div class="agileits_portfolio_grids">
                <div class="col-md-3 agileits_portfolio_grid">
                    <div class="agileinfo_portfolio_grid hovereffect">
                        <a id="a1" id="a1" class="cm-overlay" href="../images/main/3.jpg">
                            <img id="img1" src="../images/main/3.jpg" alt=" " class="img-responsive" style="width: 255px;height: 321px;">
                            <%--<div class="overlay">--%>
                                <h4 id="h1"><span>Gym</span> Workout</h4>
                                <p id="p1">Aliquam in dolor.</p>
                            <%--</div>--%>
                        </a>
                    </div>
                </div>
                <div class="col-md-3 agileits_portfolio_grid">
                    <div class="agileinfo_portfolio_grid hovereffect">
                        <a id="a2" class="cm-overlay" href="../images/main/6.jpg">
                            <img id="img2" src="../images/main/6.jpg" alt=" " class="img-responsive" style="width: 255px;height: 321px;">
                            <%--<div class="overlay">--%>
                                <h4 id="h2"><span>Gym</span> Workout</h4>
                                <p id="p2">Aliquam in dolor.</p>
                            <%--</div>--%>
                        </a>
                    </div>
                </div>
                <div class="col-md-3 agileits_portfolio_grid">
                    <div class="agileinfo_portfolio_grid hovereffect">
                        <a id="a3" class="cm-overlay" href="../images/main/9.jpg">
                            <img id="img3" src="../images/main/9.jpg" alt=" " class="img-responsive" style="width: 255px;height: 321px;">
                            <%--<div class="overlay">--%>
                                <h4 id="h3"><span>Gym</span> Workout</h4>
                                <p id="p3">Aliquam in dolor.</p>
                            <%--</div>--%>
                        </a>
                    </div>
                </div>
                <div class="col-md-3 agileits_portfolio_grid">
                    <div class="agileinfo_portfolio_grid hovereffect">
                        <a id="a4" class="cm-overlay" href="../images/main/12.jpg">
                            <img id="img4" src="../images/main/12.jpg" alt=" " class="img-responsive" style="width: 255px;height: 321px;">
                            <%--<div class="overlay">--%>
                                <h4 id="h4"><span>Gym</span> Workout</h4>
                                <p id="p4">Aliquam in dolor.</p>
                            <%--</div>--%>
                        </a>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!-- //gallery -->
    </div>
    <!--//section5-->
    <!--section6-->
    <div data-target="contact" class="contact" id="contact">
        <!--membership-->
        <div class="plan">
            <h3 class="title-w3-agile">成为我们其中的一员</h3>
            <h2>立即加入我们</h2>
            <div class="read-w3ls">
                <a class="member-btn-agileits page-scroll" href="#myModal2" data-toggle="modal" data-hover="LOGIN">成为会员</a>
            </div>
        </div>
        <!-- modal -->
        <div class="modal about-modal w3-agileits fade" id="myModal2" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body login-page "><!-- login-page -->
                        <div class="login-top sign-top">
                            <div class="agileits-login">
                                <h5>会员信息表</h5>
                                <form action="" id="addMemeber_form" method="post">
                                    <h6>会员详细</h6>
                                    <input type="text" name="member_id" placeholder="会员编号如：00001" id="add_inputMember_id" required=""/>
                                    <input type="text" name="member_name" placeholder="Name" required=""/>
                                    <input type="password" name="password" placeholder="password" id="add_inputPassword" required=""/>
                                    <input type="email" name="email" placeholder="Email" required=""/>
                                    <div style="float:left">
                                        <label class="radio-inline">
                                            <input type="radio" checked="checked" name="sex" id="add_inputGender1" value="M"> 男
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="sex" id="add_inputGender2" value="F"> 女
                                        </label>
                                    </div>
                                    <input type="date" name="birthday" placeholder="男，女" required=""/>
                                    <input type="text" name="phone" placeholder="Phone" required=""/>
                                    <input type="text" name="address" placeholder="address" required=""/>
                                    <input type="text" name="create_date" readonly = "readonly" class="form-control" id="add_inputCreate" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>">
                                    <input type="text" name="update_date" readonly = "readonly" class="form-control" id="add_inputUpdate" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>">
                                    <%--<textarea name="your message" placeholder="Any queries /suggesstion" required></textarea>--%>
                                    <div class="w3ls-submit">
                                        <input type="submit" id="addMember_btn" value="立即加入">
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div> <!-- //login-page -->
            </div>
        </div>
        <!-- //modal -->
        <!--//membership-->
        <!--contact-->
        <div class="contact-w3layouts">
            <div class="container">
                <div class="col-md-6 contact-agileits-w3layouts-left">
                    <h3 class="title-w3-agile-sub">联系<span>我们</span></h3>
                    <p class="para-agileits-w3layouts">联系我们！！！！！！！！！！！！！！！！！！！</p>
                    <p class="sub">cuizb健身房<span class="glyphicon glyphicon-map-marker icon" aria-hidden="true"></span></p>
                    <p class="sub">周一至周日：9am——23pm<span class="glyphicon glyphicon-time icon" aria-hidden="true"></span></p>
                    <p class="add"><span>Tel :</span> 13781103997<span class="glyphicon glyphicon glyphicon-earphone icon" aria-hidden="true"></span></p>
                    <p class="add"><span>Email :</span> <a class="mail" href="mailto:mail@example.com">cu1zb@qq.com</a><span class="glyphicon glyphicon-envelope icon" aria-hidden="true"></span></p>

                </div>
                <div class="col-md-6 mail-grid1-form ">
                    <h3 class="title-w3-agile-sub">发送消息 <span>给我们</span></h3>
                    <form method="post" id="addSuggestion_form">
                        <input type="text" name="name" placeholder="您的称呼" required="" />
                        <input type="email" name="email" placeholder="您的邮箱" required="" />
                        <textarea name="suggestion" placeholder="您的留言或者建议" required></textarea>
                        <input type="submit" value="Submit" id="addSuggestion_btn" />
                    </form>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!--//contact-->
        <!-- //footer -->
        <div class="footer-w3layouts" align="center">
            <div class="container">
                <div class="agile-copy">
                    <p>Copyright &copy; 2019.Personal name All rights reserved. <a href="#" title="cuizb">cuizb</a></p>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- //footer -->
    </div>
    <!--//section4-->
    <!--fonts-->
    <!-- vertical nav -->
    <div id="fp-nav" class="right" style="margin-top: -43.5px;">
        <ul>
            <li><a href="#" class="active" data-anchor="home"><span></span></a>
                <div class="fp-tooltip right">首页</div>
            </li>
            <li><a href="#"  data-anchor="about"><span></span></a>
                <div class="fp-tooltip right">关于</div>
            </li>
            <li><a href="#"  data-anchor="classes"><span></span></a>
                <div class="fp-tooltip right">课程</div>
            </li>
            <li><a href="#"  data-anchor="clients"><span></span></a>
                <div class="fp-tooltip right">留言</div>
            </li>
            <li><a href="#"  data-anchor="gallery"><span></span></a>
                <div class="fp-tooltip right">器材</div>
            </li>
            <li><a href="#"  data-anchor="contact"><span></span></a>
                <div class="fp-tooltip right">会员</div>
            </li>
        </ul>
    </div>
</div>
<div id="test"></div>
<!-- Page loads faster -->
<script type="text/javascript" src="../js/jquery-2.1.4.min.js"></script>

<script src="../js/responsiveslides.min.js"></script>
<script>
    // You can also use "$(window).load(function() {"
    $(function () {
        // Slideshow 3
        $("#slider3").responsiveSlides({
            auto: true,
            pager:false,
            nav:true,
            speed: 500,
            namespace: "callbacks",
            before: function () {
                $('.events').append("<li>before event fired.</li>");
            },
            after: function () {
                $('.events').append("<li>after event fired.</li>");
            }
        });

    });
</script>
<!-- Owl-Carousel-JavaScript -->
<script src="../js/owl.carousel.js"></script>
<script>
    $(function () {
        $("#owl-demo").owlCarousel ({
            items : 4,
            lazyLoad : true,
            autoPlay : true,
            pagination : true,
        });
    });
</script>
<!-- //Owl-Carousel-JavaScript -->
<!-- //galley-effect-JavaScript -->
<script src="../js/jquery.tools.min.js"></script>
<script src="../js/jquery.mobile.custom.min.js"></script>

<script src="../js/jquery.cm-overlay.js"></script>
<script>
    $(document).ready(function(){
        //登录信息
        var logined = '<%= session.getAttribute("logined")%>';
        if (logined == "success") {
            var userid = '<%= session.getAttribute("username")%>';
            $.ajax({
               url: "/user/getUserInfo",
               type: "get",
               data: "loginid="+userid,
               success: function (result) {
                   if (result.code == 100){
                       var role = result.extendInfo.user.role;
                       var member = result.extendInfo.member;
                       if(role == "普通用户"){
                           $("#userManage").attr("href","/main/user/userInfo.jsp?member_id="+userid);
                           $("#userCart").attr("href","/collections/getCollectionsByMember_id?member_id="+userid);
                           $("#more_course").attr("href","/course/getallCourse?member_id="+userid);
                           $(".login_info").text("欢迎，"+member.member_name);
                       }
                       if(role == "教练"){
                           $("#userManage").attr("href","/main/userInfo.jsp?coach_id="+userid);
                       }
                       $("#role").text(role);
                   }
               }
            });
            $(".login_info").append("<span class=\"caret\"></span>");
            $(".login_info").addClass("dropdown-toggle");
            $(".login_info").hover(function(){
                $(".dropdown").addClass("open");

            },function(){
                $(".dropdown").removeClass("open");
            });
            $(".dropdown-menu").hover(function(){
                $(".dropdown").addClass("open");
            },function () {
                $(".dropdown").removeClass("open");
            });
            $(".login_info").attr("id", userid);
            $(".login_info").attr("href", "/user/myUser");
            $(".login_info").attr("target", "_blank");
        }else{
            $(".login_info").attr("href", "/login/login.jsp");
        }
        //健身器材
        $.ajax({
            url: "/equipment/getEquipment",
            type: "GET",
            success: function (result) {
                if(result.code==100){
                    var i = 1;
                    $.each(result.extendInfo.equipmentList, function () {
                        var pic = this.pic;
                        var name = this.equipment_name;
                        var introduce = this.introduce;
                        $("#a"+i).attr("href", ".."+pic);
                        $("#img"+i).attr("src", ".."+pic);
                        $("#h"+i).text(name);
                        $("#p"+i).text(introduce);
                        i++;
                    });
                }
            }
        });
        //课程信息
        $.ajax({
            url: "/course/getCourse",
            type: "GET",
            success: function (result) {
                if (result.code == 100){
                    var i = 1;
                    $.each(result.extendInfo.courseList, function () {
                        var course_name = this.course_name;
                        var coach_name = this.coach.coach_name;
                        var course_pic = this.pic;
                        var coach_pic = this.coach.pic;
                        var introduce = this.introduce;
                        var type = this.type;
                        var class_time = this.class_time;
//                        $(".owl-wrapper").append("<div class=\"owl-item\" style=\"width: 470px;\"><div class=\"item g1\"><img class=\"lazyOwl\" src=\".."+pic+"\" title=\""+name+"\" alt=\""+name+"\"/><div class=\"agile-dish-caption\"><h4>"+name+"</h4><span>"+message+"</span></div></div></div>");
                        $("#type"+i).text(type+"——"+course_name);
                        $("#introduce"+i).text(introduce);
                        $("#introduce"+i).attr("title",introduce);
                        $("#coach_name"+i).text(coach_name);
                        $("#class_time"+i).text(class_time);
                        $("#coach_pic"+i).attr("src", ".."+coach_pic);
                        $("#course_train_pic"+i).attr("src", ".."+course_pic);
//                        $("#cart"+i).attr("href", "/collections/addCollections?course_id="+this.course_id+"&member_id=");
                        $("#cart"+i).attr("id", this.course_id);
                        $("#signUp"+i).attr("id", "signUp"+this.course_id);
                        i++;
                    });
                }
            }
        });
        //用户评论
        $.ajax({
            url: "/message/findMessage",
            type: "GET",
            success: function (result) {
                if (result.code == 100){
                    var i = 1;
                    $.each(result.extendInfo.messageList, function () {
                        var id = this.member.id;
                        var member_id = this.member.member_id;
                        var pic = this.member.pic;
                        var name = this.member.member_name;
                        var message = this.message;
//                        $(".owl-wrapper").append("<div class=\"owl-item\" style=\"width: 470px;\"><div class=\"item g1\"><img class=\"lazyOwl\" src=\".."+pic+"\" title=\""+name+"\" alt=\""+name+"\"/><div class=\"agile-dish-caption\"><h4>"+name+"</h4><span>"+message+"</span></div></div></div>");
                        $("#"+i).attr("src", ".."+pic);
                        $("#"+i).attr("title", name);
                        $("#h4"+i).text(name);
                        $("#span0"+i).text(message);
                        i++;
                    });
                }
            }

        });
        $('.cm-overlay').cmOverlay();

    });
    //注册会员
    $("#addMember_btn").click(function () {
        if($("#add_inputMember_id").val() == null || $("#add_inputMember_id").val() == ""){
            alert("会员编号不能为空！");
        }
        else if($("#add_inputPassword").val() == null || $("#add_inputPassword").val() == ""){
            alert("密码不能为空！");
        }else{
            $.ajax({
                url:"/member/addMember",
                type:"POST",
                data:$("#addMemeber_form").serializeArray(),
                success:function (result) {
                    if(result.code==100){
                        alert("注册成功！");
                        window.onload.href="/login/login.jsp";
                    }else{
                        alert("注册失败！");
                    }
                }
            });
        }
    });
    //发送建议
    $("#addSuggestion_btn").click(function () {
        $.ajax({
            url:"/suggestion/addSuggestion",
            type:"GET",
            data:$("#addSuggestion_form").serializeArray(),
            success:function (result) {
                var status = result.extendInfo.status;
                if(result.code==100){
                    alert(status);
                }else{
                    alert(status);
                }
            }
        });
    });
    //更多留言
    $("#more_message").click(function () {
        var userid = '<%= session.getAttribute("username")%>';
        $("#more_message").attr("href","/message/getAllMessage?member_id="+userid);
    });
    //=========1 当鼠标从会员id输入框移开的时候，判断会员id是否重复 ============
    $("#add_inputMember_id").change(function () {
        var member_id = $("#add_inputMember_id").val();
        $.ajax({
            url:"/member/checkMemberIdExists",
            type:"GET",
            data:"member_id="+member_id,
            success:function (result) {
                if (result.code == 100){
                    $("#addMember_btn").attr("disabled", false);
                }else {
                    $("#addMember_btn").attr("disabled", true);
                    $("#add_inputMember_id").val("");
                    alert("会员ID已存在！");

                }
            }
        });
    });
    //点击添加购物车
    function cart(e){
        var logined = '<%= session.getAttribute("logined")%>';
        var username = '<%= session.getAttribute("username")%>';
        if (logined != "success") {
            alert("没有登录，请登录后再来！");
            window.location.href = "/login/login.jsp";
        }
        $.ajax({
            url: "/cart/addCart",
            type: "POST",
            data: "course_id="+e+"&member_id="+username,
            success: function (result) {
                var status = result.extendInfo.status;
                if (result.code == 100){
                    var status = result.extendInfo.status;
                    alert(status);
                    $("#signUp"+e).addClass("disabled");
                }else{
                    alert(status);
                }
            }
        });
    }
    //点击收藏判断是否登录
    function collections(e) {
        var logined = '<%= session.getAttribute("logined")%>';
        var username = '<%= session.getAttribute("username")%>';
        if (logined != "success") {
            alert("没有登录，请登录后再来！");
            window.location.href = "/login/login.jsp";
        }
            $.ajax({
               url: "/collections/addCollections",
               type: "GET",
               data: "course_id="+e+"&member_id="+username,
               success: function (result) {
                   var status = result.extendInfo.status;
                   if (result.code == 100){
                       alert(status);
                       $("#"+e).addClass("disabled");
                   }else{
                       alert(status);
                   }
               }
            });

    };
    function checkLogin() {
        var logined = '<%= session.getAttribute("logined")%>';
        var username = '<%= session.getAttribute("username")%>';
        if (logined != "success") {
            alert("没有登录，请登录后再来！");
            window.location.href = "/login/login.jsp";
        }
    }
</script>
<script type="text/javascript" src="../js/jquery.easing.min.js"></script>
<script src="../js/jquery.singlefull.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $("#single").singlefull({
            speed: 1000,
            loopScroll:true,
            loopTop:false,
            loopBottom:true
        });
        // Just a javascript alignment to the content
        function alignContent() {
            var windowHeight = $(window).height();

            $('.content-resizer').each(function() {
                contentHeight = $(this).height();
                $(this).css('top', (windowHeight / 2) - (contentHeight / 2));
            });

            $('.alt-img').html($("#img-example").attr('src'));
        }

        // Execute the function
        alignContent();

        // Bind the function to the window.onresize
        $(window).bind("resize", function() {
            alignContent();
        });
//        <!--<div class="item g1">-->
//              <!--<img class="lazyOwl" src="../images/main/g1.jpg" title="Our latest gallery" alt=""/>-->
//              <!--<div class="agile-dish-caption">-->
        //              <h4>John Smith</h4>-->
                //      <span>Neque porro quisquam est qui dolorem Lorem ipsum dolor sit amet. </span>-->
        //      <!--</div>-->
//        <!--</div>-->
    });
</script>
<script type="text/javascript" src="../js/bootstrap-3.1.1.min.js"></script>
</body>
</html>