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

    </style>
    <title>我的发布</title>

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
                            <a href="http://h-ui.net/aboutHui.shtml" >联系我们</a>
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
                    <h3>我的发布</h3>
                    <div class="themain" id="courseList"></div>
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
<!--普通弹出层-->
<div id="modal-demo" class="modal fade middle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content radius">
            <div class="modal-header">
                <h3 class="modal-title">登陆窗口</h3>
                <a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void(0);">×</a>
            </div>
            <div class="modal-body">
                <div class="panel-body">
                    <form action="" method="post" class="form form-horizontal responsive" id="demoformLogin">
                        <div class="row cl">
                            <label class="form-label col-xs-3">账号：</label>
                            <div class="formControls col-xs-8">
                                <input type="text" class="input-text" placeholder="4~16个字符，字母/中文/数字/下划线" name="username" id="usernameLogin">
                            </div>
                        </div>
                        <div class="row cl">
                            <label class="form-label col-xs-3">密码：</label>
                            <div class="formControls col-xs-8">
                                <input type="password" class="input-text" autocomplete="off" placeholder="密码" name="password" id="passwordLogin">
                            </div>
                        </div>
                        <div class="row cl">
                            <div class="col-xs-8 col-xs-offset-3">
                                <input class="btn btn-primary" id="logSub" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--初始化分页插件数据信息--%>
<script type="text/javascript" src="${staticPath}/hui/lib/laypage/1.2/laypage.js"></script>
<script>
    $.getJSON('/course/getCourseListForPage', {curr: 1,limit:10,type:2,tag:'1'}, function(res){ //从第6页开始请求。返回的json格式可以任意定义
        laypage({
            limit:10,
            cont: 'coursePageDiv', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：&lt;div id="page1">&lt;/div>
            pages: res.pages, //通过后台拿到的总页数
            curr: 1, //初始化当前页
            jump: function(e){ //触发分页后的回调
                console.log(e);
                $.getJSON('/course/getCourseListForPage', {curr: e.curr,limit:e.limit,type:2,tag:'1'}, function(res){
                    var zz = res.content;
                    var htmllet = "";
                    $("#courseList").html(htmllet);
                    createHtml(htmllet,zz,'courseList');
                });
                $('body,html').animate({
                        scrollTop: 0
                    },
                    500);
            }
        });
        var zz = res.content;
        var htmllet = "";
        $("#courseList").html(htmllet);
        createHtml(htmllet,zz,'courseList');
    });
    function createHtml(htmllet,zz,id) {
        for(var i = 0;i<zz.length;i++){
            htmllet += '<div class="maskWraper" style="width: 20%; height:250px;">\n' +
                '                            <img src="'+zz[i].fileUrl+'" width="300" height="250">\n' +
                '                            <div class="maskBar text-c">'+zz[i].cName+'</div>\n' +
                '                        </div>\n' +
                '                        <div class="aboutClass" style="width: 70%; height:250px; ">\n' +
                '                            <p>'+zz[i].cName+'</p>\n' +
                '                            <div style="margin-top: 30px;">\n' +
                '                                讲师：<a href="/showUserInfo?userId='+zz[i].userUid+'">'+zz[i].cAuthor+'</a>\n' +
                '                            </div>\n' +
                '                            <div style="margin-top: 30px;">\n' +
                '                                发布时间：'+zz[i].cUptime+'\n' +
                '                            </div>\n' +
                '                            <div class="clearfix" style="margin-top: 30px;">\n' +
                '                                <span class="f-l f-14 va-m">课程评分：</span>\n' +
                '                                <div class="star-bar star-bar-show size-S f-l va-m mr-10">\n' +
                '                                    <span class="star" style="width:'+zz[i].cScoure+'"></span>\n' +
                '                                </div>\n' +
                '                            </div>\n' +
                '                            <div style="margin-top: 30px;">\n' +
                '                                <a href="/showCourseInfo?courseId='+zz[i].cId+'">进入学习》</a>\n' +
                '                            </div>\n' +
                '\n' +
                '                        </div>\n' +
                '                        <div style="clear:both;"></div>';
        }
        $("#"+id).html(htmllet);
    }
</script>
<script>
    /*登陆按钮点击操作*/
    $(function(){
        $("#logSub").click(function () {
            var code = $("#usernameLogin").val();
            var pwd = $("#passwordLogin").val();
            debugger;
            $.ajax({
                url : "/user/userLogin",
                type : "post",
                data : {
                    code : code,
                    pwd : pwd
                },
                success : function(data) {
                    var aa = data.msg
                    if(aa == "success"){
                        $("#modal-demo").modal("hide");
                        //刷新当前页面
                        location.reload(true);
                    }else{
                        //弹出错误问题
                        alert("账号密码错误，登陆失败");
                    }
                }
            });
        })
    });
    $(function() {
        $('.maskWraper').Huihover();
    });
    //弹窗
    function modaldemo(){
        $("#modal-demo").modal("show");
    }
</script>
</body>
</html>
