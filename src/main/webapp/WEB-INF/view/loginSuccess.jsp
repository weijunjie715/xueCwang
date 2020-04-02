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
     <c:if test="${empty userInfo}">
         <h1>失败</h1>
     </c:if>
     <c:if test="${not empty userInfo}">
         <h1>成功，${userInfo.suName}</h1>
     </c:if>
<script>
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
