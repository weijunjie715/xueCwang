<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/common.jsp"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <script>DD_belatedPNG.fix('*');</script>
    <style type="text/css">
        .ui-sortable .panel-header {
            cursor: move
        }

        /* 菜单按钮样式 */
        .radiusNew {
            width: 16.66666667%;
            height: 50px;
            font-size: 25px;
            vertical-align: middle;
        }
        .maskWraper {
            float: left;
        }
        .aboutClass {
            float: left;
        }
        /* 星星评分大小 */
        .size-S img{width:16px;height:16px}
        .mainBody {
            margin-left: 10%;
        }
        .theTr{
            height: 150px;
        }
    </style>
    <title>我的问题</title>

</head>
<body ontouchstart>
<c:import url="backLoli.jsp"></c:import>
<div class="sideBox">

</div>
<div class="containBox">
    <div class="containBox-bg"></div>
    <header class="navbar-wrapper">
        <div class="navbar navbar-black navbar-fixed-top">
            <div class="container cl">
                <a class="logo navbar-logo hidden-xs" href="/toIndex">C语言学习网</a>
                <span class="logo navbar-slogan hidden-xs">简单 &middot; 免费 &middot; 适合初学者</span>
                <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs JS-nav-toggle" href="javascript:;">&#xe667;</a>
                <input type="hidden" value="${userInfo.suId}" id="userHiddenId">
                <nav class="nav navbar-nav nav-collapse" role="navigation" id="Hui-navbar">
                    <ul class="cl" style="float:right!important;_display:inline">
                        <c:if test="${not empty userInfo}">
                            <li>
                                <a href="#" >${userInfo.suName}</a>
                            </li>
                        </c:if>

                        <li class="dropDown dropDown_hover">
                            <a href="javascript:;" class="dropDown_A">控制台 <i class="Hui-iconfont">&#xe6d5;</i></a>
                            <ul class="dropDown-menu menu radius box-shadow">
                                <c:if test="${empty userInfo}">
                                    <li>
                                        <a href="/toRegister" >注册</a>
                                    </li>
                                    <li>
                                        <a href="javascritp:;" onClick="modaldemo()">登陆</a>
                                    </li>
                                </c:if>
                                <c:if test="${not empty userInfo}">
                                    <c:import url="userChoose.jsp"></c:import>
                                </c:if>

                            </ul>
                        </li>

                        <li>
                            <a href="http://h-ui.net/aboutHui.shtml" >技术支持</a>
                        </li>
                    </ul>
                </nav>
                <nav class="navbar-userbar hidden-xs"></nav>
            </div>
        </div>
    </header>
    <div class="wap-container">
        <div id="slider-1" class="bg-fff box-shadow radius">

        </div>

        <div class="panel-body">
            <div class="btn-group banner" style="text-align:center;">
                <c:import url="butArray.jsp"></c:import>
            </div>
            <div id="others">
                <div class="mainBody">
                    <h3>资源列表</h3>
                    <%--<form id="fileToUp">
                        <span class="btn-upload form-group">
                          <input class="input-text upload-url radius" type="text" name="uploadfile-1" id="uploadfile-1" readonly><a href="javascript:;" class="btn btn-primary radius"><i class="iconfont">&#xf0020;</i> 浏览文件</a>
                          <input type="file" multiple name="workFile" class="input-file">
                        </span>
                        <input type="hidden" id="toUpId" name="mwId"/>
                    </form>--%>
                    <table class="table table-border table-bordered table-hover" id="bbsList">

                    </table>
                    <div class="themain" id="coursePageDiv"></div>
                </div>
                <div style="clear:both;"></div>
            </div>
        </div>
        <footer class="footer mt-20" style="margin-top: 60px;">
            <div class="container">
                <nav class="footer-nav">
                    <a  href="http://www.h-ui.net/aboutHui.shtml">关于我们</a>
                    <span class="pipe">|</span>
                    <a  href="http://www.h-ui.net/copyright.shtml">软件著作权</a>
                    <span class="pipe">|</span>
                    <a  href="http://www.h-ui.net/juanzeng.shtml">感谢捐赠</a>
                </nav>
                <p>Copyright &copy;2013-2017 H-ui.net All Rights Reserved. <br>
                    <a rel="nofollow"  href="http://www.miitbeian.gov.cn/">京ICP备15015336号-1</a>
                    <br>
                    未经允许，禁止转载、抄袭、镜像<br>
                    用心做站，做不一样的站</p>
            </div>
        </footer>
    </div>
</div>
<%--初始化分页插件数据信息--%>
<script type="text/javascript" src="${staticPath}/hui/lib/laypage/1.2/laypage.js"></script>
<script>
    //获取当前课程ID
    $.getJSON('/resources/showResourcesList', {curr: 1,limit:10}, function(res){ //从第6页开始请求。返回的json格式可以任意定义
        laypage({
            limit:10,
            cont: 'coursePageDiv', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：&lt;div id="page1">&lt;/div>
            pages: res.pages, //通过后台拿到的总页数
            curr: 1, //初始化当前页
            jump: function(e){ //触发分页后的回调
                console.log(e);
                $.getJSON('/resources/showResourcesList', {curr: e.curr,limit:e.limit}, function(res){
                    var zz = res.content;
                    var htmllet = "";
                    $("#courseList").html(htmllet);
                    createHtml(htmllet,zz,'bbsList');
                });
                $('body,html').animate({
                        scrollTop: 0
                    },
                    500);
            }
        });
        var zz = res.content;
        var htmllet = '';
        $("#courseList").html(htmllet);
        createHtml(htmllet,zz,'bbsList');
    });
    function createHtml(htmllet,zz,id) {
        htmllet += '<tr>\n' +
            '                            <td>资源名</td>\n' +
            '                            <td>资源描述</td>\n' +
            '                            <td>发布时间</td>\n' +
            '                            <td>发布人</td>\n' +
            '                            <td>操作</td>\n' +
            '                        </tr>';
        for(var i = 0;i<zz.length;i++){
            var z=i+1;
            //设置状态展示样式
            var showStatus = '';
            //设置操作按钮
            var upBtn = '';
            if(zz[i].url == "3"){
                //下载
                upBtn = '<form action="/resources/toDowResources" method="GET" id="dowForm'+zz[i].id+'" >' +
                    '  <input type="hidden" value="'+zz[i].id+'" name="rId"/>\n' +
                    ' <a href="javascript:void();" class="btn btn-primary radius" onclick="dowMyWork('+zz[i].id+')"> 下载资源</a>\n' +
                    '</form>';
            }else{
                if(zz[i].url == "1"){
                    //视频
                    upBtn = '<form action="/toShowVideoPage" method="GET" id="dowForm'+zz[i].id+'" >' +
                        '  <input type="hidden" value="'+zz[i].id+'" name="rId"/>\n' +
                        ' <a href="javascript:void();" class="btn btn-primary radius" onclick="dowMyWork('+zz[i].id+')"> 视频播放</a>\n' +
                        '</form>';
                }else{
                    //图片
                    upBtn = '<form action="/toShowImgPage" method="GET" id="dowForm'+zz[i].id+'" >' +
                        '  <input type="hidden" value="'+zz[i].id+'" name="rId"/>\n' +
                        ' <a href="javascript:void();" class="btn btn-primary radius" onclick="dowMyWork('+zz[i].id+')"> 图片查看</a>\n' +
                        '</form>';
                }
            }
            htmllet += '<tr>\n' +
                '                            <td>'+zz[i].srName+'</td>\n' +
                '                            <td>'+zz[i].remarks+'</td>\n' +
                '                            <td>'+zz[i].upTime+'</td>\n' +
                '                            <td><a href="/showUserInfo?userId='+zz[i].userUuId+'">'+zz[i].userName+'</a></td>\n' +
                '                            <td>'+upBtn+'</td>\n' +
                '                        </tr>';
        }
        $("#"+id).html(htmllet);
    }
</script>
<script>
    $(function() {
        $('.maskWraper').Huihover();
    });
    //下载查看我的作业
    function setSC(id){
        var form = new FormData(document.getElementById("setScForm"+id));
        var url = "/work/setSc";
        $.ajax({
            url:url,
            data:form,
            type:'post',
            processData:false,
            contentType:false,
            success : function(data){
                if(data.status == true){
                    alert("打分成功");
                    //刷新当前页面
                    location.reload(true);
                }else{
                    alert(data.msg);
                }
            },
            error : function(data){
                alert("系统异常，联系管理员");
            }
        });
    }
    //下载查看我的作业
    function dowMyWork(id){
        $("#dowForm"+id).submit();
    }
    //上传提交作业
    function uploadMyWork(x) {
        var form = new FormData(document.getElementById("upFrom"+x));
        var url = "/work/subMyWork";
        $.ajax({
            url:url,
            data:form,
            type:'post',
            processData:false,
            contentType:false,
            success : function(data){
                if(data.status == true){
                    alert("作业提交成功");
                    //刷新当前页面
                    location.reload(true);
                }else{
                    alert(data.msg);
                }
            },
            error : function(data){
                alert("系统异常，联系管理员");
            }
        });
    }
</script>
</body>
</html>
