<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/28
  Time: 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gym Delete Page</title>
</head>
<body>
<div class="modal fade gym-del-modal" tabindex="-1" role="dialog" aria-labelledby="gym-del-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">删除健身房信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal del_gym_form">
                    <div class="form-group">
                        <label for="del_gymId" class="col-sm-2 control-label">健身房ID</label>
                        <div class="col-sm-8">
                            <div class="checkbox">
                                <select class="form-control" name="id" id="del_gymId">
                                    <option selected="selected" value=""></option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_gymName" class="col-sm-2 control-label">健身房名称</label>
                        <div class="col-sm-8">
                            <input type="text" name="gym_name" readonly="readonly" class="form-control" id="del_gymName">
                        </div>
                        <span id="helpBlock_del_gymName" class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="del_gymSubjection" class="col-sm-2 control-label">总店</label>
                        <div class="col-sm-8">
                            <input type="text" name="subjection" readonly="readonly" class="form-control" id="del_gymSubjection">
                            <span id="helpBlock_del_gymSubjection" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_gymManager" class="col-sm-2 control-label">负责人</label>
                        <div class="col-sm-8">
                            <input type="text" name="manager" readonly="readonly" class="form-control" id="del_gymManager">
                            <span id="helpBlock_del_gymManager" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_gymPic" class="col-sm-2 control-label">健身房图片</label>
                        <div class="col-sm-8">
                            <img src="" id="del_gymPic" style="width:150px;height: 100px;">
                            <%--<input type="text" name="pic" readonly="readonly" class="form-control" id="del_gymPic">--%>
                            <span id="helpBlock_del_gymPic" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_gymAddress" class="col-sm-2 control-label">地址</label>
                        <div class="col-sm-8">
                            <input type="text" name="address" readonly="readonly" class="form-control" id="del_gymAddress">
                            <span id="helpBlock_del_gymAddress" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="del_gymIntroduce" class="col-sm-2 control-label">健身房介绍</label>
                        <div class="col-sm-8">
                            <textarea rows="3" cols="45" readonly="readonly" name="introduce" class="form-control" id="del_gymIntroduce"></textarea>
                            <span id="helpBlock_del_gymIntroduce" class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary gym_modal_del_btn">删除</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script type="text/javascript">
    $(".gym_del_btn").click(function () {
        $("#del_gymId").find("option").remove();
        $("#del_gymId").append("<option value='Value'></option>");
        //健身房id回显列表；
        $.ajax({
            url:"/gym/getGym_id",
            type:"GET",
            success:function (result) {
                if (result.code == 100){
                    $.each(result.extendInfo.gym_idList, function () {
                        var optEle = $("<option></option>").append(this.id).attr("value", this.id);
                        optEle.appendTo("#del_gymId");
                    });
                }
            }
        });
    });

    //根据选中的健身房id，回显健身房信息
    $("#del_gymId").change(function () {
        var gym_id = $("#del_gymId").find("option:selected").text();
        if (gym_id.length == 0){
            $("#del_gymName").val("");
            $("#del_gymPic").attr("src", "");
            $("#del_gymSubjection").val("");
            $("#del_gymManager").val("");
            $("#del_gymAddress").val("");
            $("#del_gymIntroduce").val("");
        }else {
            $.ajax({
                url:"/gym/getInfoByGym_id",
                type:"GET",
                data:"gym_id="+gym_id,
                success:function (result) {
                    if (result.code == 100){
                        var gym = result.extendInfo.gym;
                        $("#del_gymName").val(gym.gym_name);
                        $("#del_gymPic").attr("src", ".."+gym.pic);
                        $("#del_gymSubjection").val(gym.subjection);
                        $("#del_gymManager").val(gym.manager);
                        $("#del_gymAddress").val(gym.address);
                        $("#del_gymIntroduce").val(gym.introduce);
                    }else {
                        $("#del_gymName").val("");
                        $("#del_gymPic").attr("src", "");
                        $("#del_gymSubjection").val("");
                        $("#del_gymManager").val("");
                        $("#del_gymAddress").val("");
                        $("#del_gymIntroduce").val("");
                    }
                }
            });
        }

    });

    //3 根据健身房id删除健身房
    $(".gym_modal_del_btn").click(function () {
        var gym_id = $("#del_gymId").find("option:selected").text();
        var curPage = ${curPage};
        $.ajax({
            url:"/gym/deleteGymById",
            type:"GET",
            data:"gym_id="+gym_id,
            success:function (result) {
                if (result.code==100){
                    alert("健身房删除成功！");
                    $(".gym-del-modal").modal("hide");
                    //跳转到当前页
                    window.location.href="/gym/getAllGym?pageNo=1";
                }else {
                    alert(result.extendInfo.gym_modal_del_error);
                }
            }
        });
    });
</script>
</body>
</html>



