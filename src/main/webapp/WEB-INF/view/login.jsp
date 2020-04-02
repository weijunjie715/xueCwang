<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/common.jsp"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="${staticPath}/hui/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="${staticPath}/hui/lib/Hui-iconfont/1.0.8/iconfont.min.css" />
    <link rel="stylesheet" type="text/css" href="${staticPath}/h-ui/css/H-ui.ie.css"  />
    <script>DD_belatedPNG.fix('*');</script>
    <title>学C网首页</title>

</head>
<body>
    <%--测试文件上传--%>
    <form id="loginForm" action="">
        <div class="row cl">
            <div class="row cl">
                <label class="form-label col-xs-3">昵称：</label>
                <div class="formControls col-xs-8">
                    <input type="text" class="input-text" value="" autocomplete="off" id="suName" name="suName">
                </div>
            </div>
            <label class="form-label col-xs-3">头像选择：</label>
            <div class="formControls col-xs-8">
                <span class="btn-upload form-group">
                <input class="input-text upload-url" type="text" name="uploadfile-2" id="uploadfile-2" readonly style="width:200px">
                <a href="javascript:void(0);" class="btn btn-primary upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
                <input type="file" multiple name="uploadfile-2" class="input-file">
                </span>
            </div>
        </div>
        <input type="button" onclick="updateImg(this.form)" value="修改头像">
    </form>
<script>
    function updateImg(x) {
        var form = new FormData(x);
        var url = "/upload/stuImg";
        $.ajax({
            url:url,
            data:form,
            type:'post',
            processData:false,
            contentType:false,
            success : function(data){
                if(data.status == true){
                    alert("更新成功");
                    window.location.reload();
                }else{
                    alert(data.msg);
                }
            },
            error : function(data){
                alert("连接超时");
            }
        });
    }
    $(function() {

    })
    function toLogin() {
        alert("123");
        debugger;
        var code = $("#code").val();
        var pwd = $("#pwd").val();
        $.ajax({
            url : "/user/userLogin",
            dataType : "json",
            type : "post",
            data : {
                code : code,
                pwd : pwd
            },
            success : function(data) {

            }
        });
    }

</script>
</body>
</html>
