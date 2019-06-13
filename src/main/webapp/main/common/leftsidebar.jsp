<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    .dropdown-header {
        display: block;
    }
</style>

<div class="panel-group col-sm-2" id="fitness_sidebar_left" role="tablist" aria-multiselectable="true">
    <ul class="nav nav-pills nav-stacked member_sidebar">
        <li role="presentation" class="dropdown-menu">
            <a href="#" data-toggle="collapse" data-target="#collapse_member">
                <span class="glyphicon glyphicon-user" aria-hidden="true">健身会员管理<b class="caret"></b></span>
            </a>
            <ul class="nav nav-pills nav-stacked" id="collapse_member" hidden="hidden">
                <li role="presentation" class="dropdown-header"><a href="#" class="member_info">会员信息</a></li>
                <li role="presentation" class="dropdown-header"><a href="#" class="member_add_btn" data-toggle="modal" data-target=".member-add-modal">会员新增</a></li>
                <li role="presentation" class="dropdown-header"><a href="#" class="member_del_btn" data-toggle="modal" data-target=".member-del-modal">删除会员</a></li>
                <li role="presentation" class="dropdown-header"><a href="#" class="member_total_btn">会员统计</a></li>
            </ul>
        </li>
    </ul>
    <ul class="nav nav-pills nav-stacked coach_sidebar">
        <li role="presentation" class="dropdown-menu">
            <a href="#" data-toggle="collapse" data-target="#collapse_coach">
                <span class="glyphicon glyphicon-user" aria-hidden="true">健身教练管理<b class="caret"></b></span>
            </a>
            <ul class="nav nav-pills nav-stacked"id="collapse_coach" hidden="hidden">
                <li role="presentation" class="dropdown-header"><a href="#" class="coach_info">教练信息</a></li>
                <li role="presentation" class="dropdown-header"><a href="#" class="coach_add_btn" data-toggle="modal" data-target=".coach-add-modal">教练新增</a></li>
                <li role="presentation" class="dropdown-header"><a href="#" class="coach_del_btn" data-toggle="modal" data-target=".coach-del-modal">教练删除</a></li>
                <li role="presentation" class="dropdown-header"><a href="#" class="coach_total_btn">教练统计</a></li>
            </ul>
        </li>
    </ul>
    <ul class="nav nav-pills nav-stacked course_sidebar">
        <li role="presentation" class="dropdown-menu">
            <a href="#" data-toggle="collapse" data-target="#collapse_course">
                <span class="glyphicon glyphicon-cloud" aria-hidden="true">健身课程管理<b class="caret"></b></span>
            </a>
            <ul class="nav nav-pills nav-stacked" id="collapse_course" hidden="hidden">
                <li role="presentation" class="dropdown-header"><a href="#" class="course_info">课程信息</a></li>
                <li role="presentation" class="dropdown-header"><a href="#" class="course_add_btn" data-toggle="modal" data-target=".course-add-modal">课程新增</a></li>
                <li role="presentation" class="dropdown-header"><a href="#" class="course_del_btn" data-toggle="modal" data-target=".course-del-modal">课程删除</a></li>
                <li role="presentation" class="dropdown-header"><a href="#" class="course_total_btn">课程统计</a></li>
            </ul>
        </li>
    </ul>
    <ul class="nav nav-pills nav-stacked equipment_sidebar">
        <li role="presentation" class="dropdown-menu">
            <a href="#" data-toggle="collapse" data-target="#collapse_equipment">
                <span class="glyphicon glyphicon-road" aria-hidden="true">健身器材管理<b class="caret"></b></span>
            </a>
            <ul class="nav nav-pills nav-stacked" id="collapse_equipment" hidden="hidden">
                <li role="presentation" class="dropdown-header"><a href="#" class="equipment_info">设备信息</a></li>
                <li role="presentation" class="dropdown-header"><a href="#" class="equipment_add_btn" data-toggle="modal" data-target=".equipment-add-modal">设备新增</a></li>
                <li role="presentation" class="dropdown-header"><a href="#" class="equipment_del_btn" data-toggle="modal" data-target=".equipment-del-modal">设备删除</a></li>
                <%--<li role="presentation" class="dropdown-header"><a href="#" class="equipment_total_btn">设备统计</a></li>--%>
            </ul>
        </li>
    </ul>
    <ul class="nav nav-pills nav-stacked gym_sidebar">
        <li role="presentation" class="dropdown-menu">
            <a href="#" data-toggle="collapse" data-target="#collapse_gym">
                <span class="glyphicon glyphicon-home" aria-hidden="true">健身房管理<b class="caret"></b></span>
            </a>
            <ul class="nav nav-pills nav-stacked" id="collapse_gym" hidden="hidden">
                <li role="presentation" class="dropdown-header"><a href="#" class="gym_info">健身房信息</a></li>
                <li role="presentation" class="dropdown-header"><a href="#" class="gym_add_btn" data-toggle="modal" data-target=".gym-add-modal">健身房新增</a></li>
                <li role="presentation" class="dropdown-header"><a href="#" class="gym_del_btn" data-toggle="modal" data-target=".gym-del-modal">健身房删除</a></li>
                <%--<li role="presentation" class="dropdown-header"><a href="#" class="gym_total_btn">健身房统计</a></li>--%>
            </ul>
        </li>
    </ul>
    <ul class="nav nav-pills nav-stacked front_sidebar">
        <li role="presentation" class="dropdown-menu">
            <a href="#" data-toggle="collapse" data-target="#collapse_front">
                <span class="glyphicon glyphicon-home" aria-hidden="true">前台管理<b class="caret"></b></span>
            </a>
            <ul class="nav nav-pills nav-stacked" id="collapse_front" hidden="hidden">
                <li role="presentation" class="dropdown-header"><a href="#" class="message_info">留言信息管理</a></li>
                <li role="presentation" class="dropdown-header"><a href="#" class="home_pic__btn">首页照片管理</a></li>
                <li role="presentation" class="dropdown-header"><a href="#" class="suggestion_info">建议查看</a></li>
                <%--<li role="presentation" class="dropdown-header"><a href="#" class="gym_total_btn">健身房统计</a></li>--%>
            </ul>
        </li>
    </ul>

</div><!-- /.panel-group， -->

<script type="text/javascript">
    //跳转到会员信息页面
    $(".member_info").click(function () {
        $(this).attr("href", "/member/getAllMember");
    });
    //跳转到教练信息页面
    $(".coach_info").click(function () {
        $(this).attr("href", "/coach/getAllCoach");
    });
    //跳转到课程信息页面
    $(".course_info").click(function () {
        $(this).attr("href", "/course/getAllCourse");
    });
    //跳转到设备信息页面
    $(".equipment_info").click(function () {
        $(this).attr("href", "/equipment/getAllEquipment");
    });
    //跳转到健身房信息页面
    $(".gym_info").click(function () {
        $(this).attr("href", "/gym/getAllGym");
    });
    $(".message_info").click(function () {
        $(this).attr("href", "/message/getAllMessage2");
    });
    $(".home_pic__btn").click(function () {
        $(this).attr("href", "/home/homePic.jsp");
    });
    $(".suggestion_info").click(function () {
        $(this).attr("href", "/suggestion/getAllSuggestion");
    });
    //跳转到会员统计页面
    $(".member_total_btn").click(function () {
        $(this).attr("href", "/member/memberStatistics.jsp");
    });
    //跳转到教练统计页面
    $(".coach_total_btn").click(function () {
        $(this).attr("href", "/coach/coachStatistics.jsp");
    });
    //跳转到教练统计页面
    $(".course_total_btn").click(function () {
        $(this).attr("href", "/course/courseStatistics.jsp");
    });
    $(document).ready(function() {
        var url = window.location.href;
        //展开导航栏
        var member = new RegExp('member');
        var coach = new RegExp('coach');
        var course = new RegExp('course');
        var equipment = new RegExp('equipment');
        var gym = new RegExp('gym');
        if (member.test(url)) {
            $("#collapse_member").removeAttr("hidden");
        }
        if (coach.test(url)) {
            $("#collapse_coach").removeAttr("hidden");
        }
        if (equipment.test(url)) {
            $("#collapse_equipment").removeAttr("hidden");
        }
        if (gym.test(url)) {
            $("#collapse_gym").removeAttr("hidden");
        }
        if (course.test(url)) {
            $("#collapse_course").removeAttr("hidden");
        }
    });
</script>
</body>
</html>
