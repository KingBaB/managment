<%--
  Created by IntelliJ IDEA.
  User: cuizb
  Date: 2019/4/28
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Member Pic Update Page</title>
</head>
<body>
<div class="modal fade pic-update-modal" tabindex="-1" role="dialog" aria-labelledby="pic-update-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">更改会员头像</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal update_pic_form" enctype="multipart/form-data">
                    <div class="form-group">
                        <label  for="update_pic" class="col-sm-2 control-label">课程图片</label>
                        <div class="col-sm-8">
                            <input type="file" name="file" class="form-control" id="update_pic">
                            <span id="helpBlock_update_pic" class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary update_pic_btn">更新</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">
    $(".update_pic_btn").click(function () {
        var member_pic_id = $(".member_id").text();
        var max_size = 300;// 300k
        var path = $("#update_pic").val();
        if (path.length == 0) {
            alert("请上传课程图片！");
            return false;
        } else {
            var extStart = path.lastIndexOf('.'),
                ext = path.substring(extStart, path.length).toUpperCase();
            if (ext !== '.PNG' && ext !== '.JPG' && ext !== '.JPEG' && ext !== '.GIF') {
                alert("请上传图片！");
                $("#update_pic").val("");
                return false;
            }else {
                var pic = document.getElementById("update_pic");
                var fileData = pic.files[0];
                var size = fileData.size;
                if (size > max_size * 1024) {
                    alert("图片大小不能超过300k");
                    $("#update_pic").val("");
                    return false;
                }
            }
        }

        var picFormData = new FormData($(".update_pic_form")[0]);
        $.ajax({
            url: "/member/updateMember/"+member_pic_id,
            type: "POST",
            data: picFormData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (result) {
                if (result.code == 100){
                    alert("图片修改成功！");
                    $(".pic-update-modal").modal("hide");
                    window.location.href="/main/userInfo.jsp?member_id="+member_pic_id;
                }else {
                    alert("图片修改异常！");
                }
            }
        });

    });
</script>
</body>
</html>




