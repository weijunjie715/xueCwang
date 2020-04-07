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
    <title>用户信息</title>

</head>
<body ontouchstart>
<div class="sideBox">

</div>
<div class="containBox">
    <div class="containBox-bg"></div>
    <header class="navbar-wrapper">
        <div class="navbar navbar-black navbar-fixed-top">
            <div class="container cl">
                <a class="logo navbar-logo hidden-xs" href="/aboutHui.shtml">C语言学习网</a>
                <span class="logo navbar-slogan hidden-xs">简单 &middot; 免费 &middot; 适合初学者</span>
                <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs JS-nav-toggle" href="javascript:;">&#xe667;</a>
                <nav class="nav navbar-nav nav-collapse" role="navigation" id="Hui-navbar">
                    <ul class="cl" style="float:right!important;_display:inline">
                        <c:if test="${not empty userInfo}">
                            <li>
                                <a href="#" target="_blank">${userInfo.suName}</a>
                            </li>
                        </c:if>

                        <li class="dropDown dropDown_hover">
                            <a href="javascript:;" class="dropDown_A">控制台 <i class="Hui-iconfont">&#xe6d5;</i></a>
                            <ul class="dropDown-menu menu radius box-shadow">
                                <c:if test="${empty userInfo}">
                                    <li>
                                        <a href="http://www.h-ui.net/bug.shtml" target="_blank">注册</a>
                                    </li>
                                    <li>
                                        <a href="javascritp:;" onClick="modaldemo()">登陆</a>
                                    </li>
                                </c:if>
                                <c:if test="${not empty userInfo}">
                                    <li>
                                        <a href="http://www.h-ui.net/bug.shtml" target="_blank">我的课程</a>
                                    </li>
                                    <li>
                                        <a href="http://www.h-ui.net/bug.shtml" target="_blank">个人信息</a>
                                    </li>
                                    <li>
                                        <a href="http://www.h-ui.net/bug.shtml" target="_blank">作业管理</a>
                                    </li>
                                    <li>
                                        <a href="http://www.h-ui.net/bug.shtml" target="_blank">教师页面</a>
                                    </li>
                                    <li>
                                        <a href="javascritp:;" >注销登陆</a>
                                    </li>
                                </c:if>

                            </ul>
                        </li>

                        <li>
                            <a href="http://h-ui.net/aboutHui.shtml" target="_blank">联系我们</a>
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
                <span class="btn btn-default radius radiusNew">课程学习</span>
                <span class="btn btn-default radius radiusNew">团队简介</span>
                <span class="btn btn-default radius radiusNew">名师风采</span>
                <span class="btn btn-default radius radiusNew">课堂作业</span>
                <span class="btn btn-default radius radiusNew">解惑答疑</span>
                <span class="btn btn-default radius radiusNew">附件下载</span>
            </div>
            <div id="clazzs">
                <div class="mainBody">
                    <h3>课程详情</h3>
                    <div class="themain">
                        <div class="maskWraper" style="width: 20%; height:250px;">
                            <img src="${courseInfo.fileUrl}" width="300" height="250">
                            <div class="maskBar text-c">${courseInfo.cName}</div>
                        </div>
                        <div class="aboutClass" style="width: 70%; height:250px; ">
                            <h4>${courseInfo.cName}</h4>
                            <input type="hidden" id="courseId" value="${courseInfo.cId}">
                            <div style="margin-top: 30px;">
                                讲师：${courseInfo.cAuthor}
                            </div>
                            <div style="margin-top: 30px;">
                                发布时间：${courseInfo.cUptime}
                            </div>
                            <div class="clearfix" style="margin-top: 30px;">
                                <span class="f-l f-14 va-m">课程评分：</span>
                                <div class="star-bar star-bar-show size-S f-l va-m mr-10">
                                    <!-- 修改width的百分比 实现变色 -->
                                    <span class="star" style="width:${courseInfo.cScoure}"></span>
                                </div>
                                <!-- <strong class="f-l f-14 va-m">3.5</strong> -->
                            </div>
                        </div>
                        <div style="clear:both;"></div>
                        <!-- 添加课程详情数据 -->
                        <div>
                            <h5 style="">${courseInfo.cName}</h5>
                            ${courseInfo.courseContent}
                        </div>
                        <!-- 评分 课程评论位置 -->
                        <div id="pingjia" style="margin-top: 50px; ">
                            <div class="clearfix">
                                <span class="f-l f-15 va-m">评分：</span>
                                <div id="star-1" class="star-bar size-M f-l mr-10 va-m"></div>
                                <strong id="result-1" class="f-l va-m"></strong>
                            </div>
                            <div class="row cl">
                                <div class="formControls col-xs-8" >
                                    <textarea cols="" rows="" class="textarea" name="beizhu" id="beizhu"  placeholder="说点什么...最少输入10个字符"></textarea>
                                </div>
                            </div>
                            <div class="row cl">
                                <div class="col-xs-8 col-xs-offset-3">
                                    <input class="btn btn-primary" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
                                </div>
                            </div>
                        </div>
                        <!-- 评论列表位置 -->
                        <div id="pinglunList" class="col-xs-8">
                            <ul class="commentList" id="commentList"></ul>
                        </div>
                        <div id="forPage">
                        </div>
                        <div style="clear:both;"></div>

                    </div>
                </div>
            </div>
        </div>
        <footer class="footer mt-20" style="margin-top: 60px;">
            <div class="container">
                <nav class="footer-nav">
                    <a target="_blank" href="http://www.h-ui.net/aboutHui.shtml">关于我们</a>
                    <span class="pipe">|</span>
                    <a target="_blank" href="http://www.h-ui.net/copyright.shtml">软件著作权</a>
                    <span class="pipe">|</span>
                    <a target="_blank" href="http://www.h-ui.net/juanzeng.shtml">感谢捐赠</a>
                </nav>
                <p>Copyright &copy;2013-2017 H-ui.net All Rights Reserved. <br>
                    <a rel="nofollow" target="_blank" href="http://www.miitbeian.gov.cn/">京ICP备15015336号-1</a>
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
    var courseId = $("#courseId").val();
    $.getJSON('/comment/getCommentByCourseId', {curr: 1,limit:10,courseId:courseId}, function(res){ //从第6页开始请求。返回的json格式可以任意定义
        laypage({
            limit:10,
            cont: 'forPage', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：&lt;div id="page1">&lt;/div>
            pages: res.pages, //通过后台拿到的总页数
            curr: 1, //初始化当前页
            jump: function(e){ //触发分页后的回调
                console.log(e);
                $.getJSON('/comment/getCommentByCourseId', {curr: e.curr,limit:e.limit,courseId:courseId}, function(res){
                    var zz = res.content;
                    var htmllet = "";
                    $("#commentList").html(htmllet);
                    createHtml(htmllet,zz,'commentList');
                });
                $('body,html').animate({
                        scrollTop: 0
                    },
                    500);
            }
        });
        var zz = res.content;
        var htmllet = "";
        $("#commentList").html(htmllet);
        createHtml(htmllet,zz,'commentList');
    });
    function createHtml(htmllet,zz,id) {
        for(var i = 0;i<zz.length;i++){
            console.log(zz[i].ccComment);
            htmllet += '<li class="item cl"> <a href="/showUserInfo?userId='+zz[i].userUId+'"><i class="avatar size-L radius"><img alt="" src="'+zz[i].userFile+'"></i></a>\n' +
                '                                    <div class="comment-main">\n' +
                '                                        <header class="comment-header">\n' +
                '                                            <div class="comment-meta"><a class="comment-author" href="/showUserInfo?userId='+zz[i].userUId+'">'+zz[i].userName+'</a> 评论于\n' +
                '                                                <time title="">'+zz[i].ccTime+'</time>\n' +
                '                                            </div>\n' +
                '                                        </header>\n' +
                '                                        <div class="comment-body">\n' +
                '                                            <p>'+zz[i].ccComment+'</p>\n' +
                '                                        </div>\n' +
                '                                    </div>\n' +
                '                                </li>';
        }
        $("#"+id).html(htmllet);
    }
</script>
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
    $(function() {
        $('.maskWraper').Huihover();
        /* 计算输入域字体数量 */
        $(".textarea").Huitextarealength({
            minlength:10,
            maxlength:200.
        });
    });
    //星星评价效果
    $(function(){
        //星级评价
        $("#star-1").raty({
            hints: ['1','2', '3', '4', '5'],//自定义分数
            starOff: 'iconpic-star-S-default.png',//默认灰色星星
            starOn: 'iconpic-star-S.png',//黄色星星
            path: '${staticPath}/hui/static/h-ui/images/star',//可以是相对路径
            number: 5,//星星数量，要和hints数组对应
            showHalf: true,
            targetKeep : true,
            click: function (score, evt) {//点击事件
                //第一种方式：直接取值
                $("#result-1").html(score+'分');
            }
        });
    });
    //弹窗
    function modaldemo(){
        $("#modal-demo").modal("show");
    }
</script>
</body>
</html>
