<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/common.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div id="test"></div>
    <div id="test1"></div>

<script type="text/javascript" src="${staticPath}/hui/lib/laypage/1.2/laypage.js"></script>
<script>
    $.getJSON('/upload/testPages', {curr: 1,limit:10}, function(res){ //从第6页开始请求。返回的json格式可以任意定义
        laypage({
            limit:10,
            cont: 'test1', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：&lt;div id="page1">&lt;/div>
            pages: res.pages, //通过后台拿到的总页数
            curr: 1, //初始化当前页
            jump: function(e){ //触发分页后的回调
                console.log(e);
                $.getJSON('/upload/testPages', {curr: e.curr,limit:e.limit}, function(res){
                    var zz = res.content;
                    var htmllet = "";
                    $("#test").html(htmllet);
                    for(var i = 0;i<zz.length;i++){
                        htmllet += '<h3>'+zz[i].aaa+'<h3>';
                    }
                    $("#test").html(htmllet);
                });
            }
        });
        var zz = res.content;
        var htmllet = "";
        for(var i = 0;i<zz.length;i++){
            htmllet += '<h3>'+zz[i].aaa+'<h3>';
        }
        $("#test").html(htmllet);
    });
</script>
</body>
</html>
