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
            margin-left: 5%;
        }
        .textMargin{
            margin-top: 20px;
            margin-bottom: 20px;
        }
        /* 幻灯片 */
        #slider-1{width:80%;text-align:center;margin-left: 10%;}
        #slider-1 .bd,#slider-1 .bd li,#slider-1 .bd img{width:100%; height:350px}
        #slider-1 .hd{ margin-top:2px;height:60px;width:100%}
        #slider-1 .hd li{ position:relative; display:inline-block; float:left; margin-right:2px;cursor:pointer;width:19%; height:58px}
        #slider-1 .hd li img{ display:block;width:100%; height:58px}
        #slider-1 .hd li i{ position:absolute; display:block; z-index:9; left:0; top:0; right:0; bottom:0; background-color:rgba(0,0,0,0.6)}

    </style>
    <title>学C网首页</title>

</head>
<body ontouchstart>
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
                                        <a href="/toRegister">注册</a>
                                    </li>
                                    <li>
                                        <a href="javascritp:;" onClick="modaldemo()">登陆</a>
                                    </li>
                                </c:if>
                                <c:if test="${not empty userInfo}">
                                    <li>
                                        <a href="http://www.h-ui.net/bug.shtml" >我的课程</a>
                                    </li>
                                    <li>
                                        <a href="/showUserInfo?userId=${userInfo.suUuid}" >个人信息</a>
                                    </li>
                                    <li>
                                        <a href="http://www.h-ui.net/bug.shtml" >作业管理</a>
                                    </li>
                                    <li>
                                        <a href="http://www.h-ui.net/bug.shtml" >教师页面</a>
                                    </li>
                                    <li>
                                        <a href="javascritp:;" onclick="loginOut()" >注销登陆</a>
                                    </li>
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
            <div class="slider">
                <div class="bd bg-fff">
                    <ul>
                        <c:forEach items="${photoList}" var="p" varStatus="i">
                            <li><a href="#" title="${p.srName}" ><img src="${p.file}" ></a></li>
                        </c:forEach>
                    </ul>
                </div>
                <ol class="hd cl">
                    <c:forEach items="${photoList}" var="p" varStatus="i">
                        <li><i></i><img src="${p.file}"></li>
                    </c:forEach>
                </ol>
            </div>
        </div>

        <div class="panel-body">
            <div class="btn-group banner" style="text-align:center;">
                <span class="btn btn-default radius radiusNew" onclick="javascript:window.location.href='/toCourseListPage'">课程学习</span>
                <span class="btn btn-default radius radiusNew" onclick="javascript:window.location.href='/toAboutUsPage'">关于我们</span>
                <span class="btn btn-default radius radiusNew" onclick="javascript:window.location.href='/toTeacherListPage'">名师风采</span>
                <span class="btn btn-default radius radiusNew" onclick="javascript:window.location.href='/tozuoye'">课堂作业</span>
                <span class="btn btn-default radius radiusNew" onclick="javascript:window.location.href='/toBbsListPage'">解惑答疑</span>
                <span class="btn btn-default radius radiusNew" onclick="javascript:window.location.href='/todowFile'">资源下载</span>
            </div>
            <div id="clazzs">
                <div class="mainBody">
                    <h3>课程精选</h3>
                    <div class="themain">
                        <c:forEach items="${courseList}" var="course" varStatus="i">
                            <div class="maskWraper" style="width: 20%; height:250px; margin-top: 30px">
                                <img src="${course.fileUrl}" width="300" height="250">
                                <div class="maskBar text-c">${course.cName}</div>
                            </div>
                            <div class="aboutClass" style="width: 10%; height:250px; margin-top: 30px">
                                <p class="textMargin">${course.cName}</p>
                                <p class="textMargin">讲师：<a href="/showUserInfo?userId=${course.userUid}">${course.cAuthor}</a></p>
                                <div class="clearfix">
                                    <span class="f-l f-14 va-m">课程评分：</span>
                                    <div class="star-bar star-bar-show size-S f-l va-m mr-10">
                                        <span class="star" style="width:${course.cScoure}"></span>
                                    </div>
                                </div>
                                <a style="margin-top: 30px;">进入学习</a>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <a style="margin-left: 10%; float: left;" href="/toCourseListPage">查看更多》》</a>
                <div style="clear:both;"></div>
            </div>
            <div id="teachers">
                <div class="mainBody">
                    <h3>名师风采</h3>
                    <div class="themain">
                        <c:forEach items="${teacherList}" var="t" varStatus="i">
                            <div class="maskWraper" style="width: 20%; height:250px; margin-top: 30px">
                                <img src="${t.userPhoto}" width="300" height="250">
                                <div class="maskBar text-c">${t.suName}</div>
                            </div>
                            <div class="aboutClass" style="width: 10%; height:250px; margin-top: 30px">
                                <p class="textMargin">${t.suName}</p>
                                <p class="textMargin">${t.suBirthday}</p>
                                <p class="textMargin">${t.suSex == '1'?'男':'女'}</p>
                                <a style="margin-top: 30px;" href="/showUserInfo?userId=${t.suUuid}">进入主页</a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <a style="margin-left: 10%; float: left;">查看更多》》</a>
                <div style="clear:both;"></div>
            </div>
            <div id="others">
                <div class="mainBody">
                    <h3>学习伙伴</h3>
                    <div class="themain">
                        <c:forEach items="${userList}" var="u" varStatus="i">
                            <img title="${u.suName}" onclick="toUserInfo('${u.suUuid}')" id="${u.suUuid}" src="${u.userPhoto}" alt="${u.suName}" class="round" style="width: 12%">
                        </c:forEach>
                    </div>
                </div>
                <a style="margin-left: 10%; float: left;">查看更多》》</a>
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
                    <form action="" method="post" class="form form-horizontal responsive" id="demoform">
                        <div class="row cl">
                            <label class="form-label col-xs-3">账号：</label>
                            <div class="formControls col-xs-8">
                                <input type="text" class="input-text" placeholder="4~16个字符，字母/中文/数字/下划线" name="username" id="username">
                            </div>
                        </div>
                        <div class="row cl">
                            <label class="form-label col-xs-3">密码：</label>
                            <div class="formControls col-xs-8">
                                <input type="password" class="input-text" autocomplete="off" placeholder="密码" name="password" id="password">
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
<script>
    /*登陆按钮点击操作*/
    $(function(){
        $("#logSub").click(function () {
            var code = $("#username").val();
            var pwd = $("#password").val();
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
    //hover效果
    $(function() {
        $('.maskWraper').Huihover();
    });
    //轮播图
    $(function(){
        jQuery("#slider-1 .slider").slide({mainCell:".bd ul",titCell:".hd li",trigger:"click",effect:"leftLoop",autoPlay:true,delayTime:850,interTime:7000,pnLoop:false,titOnClassName:"active"})});
    //弹窗
    function modaldemo(){
        $("#modal-demo").modal("show");
    }

    //进入用户信息页面
    function toUserInfo(uid){
        location.href="/showUserInfo?userId="+uid;
    }
</script>
</body>
</html>
