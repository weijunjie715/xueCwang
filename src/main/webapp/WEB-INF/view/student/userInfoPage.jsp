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
                <a class="logo navbar-logo hidden-xs" href="/toIndex">C语言学习网</a>
                <span class="logo navbar-slogan hidden-xs">简单 &middot; 免费 &middot; 适合初学者</span>
                <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs JS-nav-toggle" href="javascript:;">&#xe667;</a>
                <input type="hidden" id="loginId" value="${userInfo.suId}">
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
                    <h3>用户信息</h3>
                    <table style="border-collapse:separate; border-spacing:0px 30px;">
                        <tr>
                            <td style="width: 20%;">用户ID</td>
                            <td>
                                ${userInfoShow.suUuid}
                                <input type="hidden" value="${userInfoShow.suId}" id="theUserId">
                                <c:if test="${userInfoShow.suUuid != userInfo.suUuid}">
                                    <a class="Hui-iconfont Hui-iconfont-user-add" onclick="addUserRelation()" title="添加好友" style="font-size: 30px!important;"></a>
                                </c:if>
                                <c:if test="${userInfoShow.suUuid == userInfo.suUuid}">
                                    <a class="Hui-iconfont Hui-iconfont-edit2" title="信息修改" href="/toUpdateUserInfoPage" style="font-size: 30px!important;"></a>
                                </c:if>

                            </td>
                        </tr>
                        <tr>
                            <td>头像</td>
                            <td><img src="${userInfoShow.userPhoto}" alt="" class="round" style="width: 60px; height: 50px;"></td>
                        </tr>
                        <tr>
                            <td>昵称</td>
                            <td>${userInfoShow.suName}</td>
                        </tr>
                        <tr>
                            <td>邮箱</td>
                            <td>${userInfoShow.suEmail}</td>
                        </tr>
                        <tr>
                            <td>手机号</td>
                            <td>${userInfoShow.suPhone}</td>
                        </tr>
                        <tr>
                            <td>性别</td>
                            <td>${userInfoShow.suSex == '1'?'男':'女'}</td>
                        </tr>
                        <tr>
                            <td>角色</td>
                            <td>${userInfoShow.suRole == '0'?'教师':'学生'}</td>
                        </tr>
                        <tr>
                            <td>生日</td>
                            <td>${userInfoShow.suBirthday}</td>
                        </tr>
                        <tr>
                            <td>注册时间</td>
                            <td>${userInfoShow.createTime}</td>
                        </tr>
                        <tr>
                            <td>个人描述</td>
                            <td>${userInfoShow.suReason}</td>
                        </tr>
                        <tr>
                            <td>他的课程</td>
                            <td>
                                <ul>
                                    <li><a>第一篇文章</a></li>
                                    <li><a>第一篇文章</a></li>
                                    <li><a>第一篇文章</a></li>
                                    <li><a>第一篇文章</a></li>
                                    <li><a>第一篇文章</a></li>
                                </ul>

                            </td>
                        </tr>
                    </table>
                </div>
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
<script>
    /*注册数据提交*/
    function updateImg(x) {
        var form = new FormData(x);
        var url = "/user/userRegister";
        $.ajax({
            url:url,
            data:form,
            type:'post',
            processData:false,
            contentType:false,
            success : function(data){
                if(data.status == true){
                    alert("注册成功，返回主页登陆");
                    window.location = "/toIndex";
                }else{
                    alert(data.msg);
                }
            },
            error : function(data){
                alert("系统异常，联系管理员");
            }
        });
    }
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
                        //跳转首页
                        window.location = "/toIndex";
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
    //轮播图
    $(function(){
        //邮箱提示
        $("#email").emailsuggest();

        //checkbox 美化
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        //日期插件
        $("#datetimepicker").datetimepicker({
            format: 'yyyy-mm-dd',
            minView: "month",
            todayBtn:  1,
            autoclose: 1,
            endDate : new Date()
        }).on('hide',function(e) {
            //此处可以触发日期校验。
        });

        /*+1 -1效果*/
        $("#spinner-demo").Huispinner({
            value:1,
            minValue:1,
            maxValue:99,
            dis:1
        });

        $(".textarea").Huitextarealength({
            minlength:10,
            maxlength:200.
        });

        $("#demoform").validate({
            rules:{
                email:{
                    required:true,
                    email:true,
                },
                username:{
                    required:true,
                    minlength:4,
                    maxlength:16
                },
                telephone:{
                    required:true,
                    isMobile:true,
                },
                password:{
                    required:true,
                    isPwd:true,
                },
                password2:{
                    required:true,
                    equalTo: "#password"
                },
                sex:{
                    required:true,
                },
                datetimepicker:{
                    required:true,
                },
                checkbox2:{
                    required:true,
                },
                city:{
                    required:true,
                },
                website:{
                    required:true,
                    url:true,
                },
                beizhu:{
                    maxlength:500,
                }
            },
            onkeyup:false,
            focusCleanup:true,
            success:"valid",
            submitHandler:function(form){
                $("#modal-shenqing-success").modal("show");
                $(form).ajaxSubmit();
            }
        });
    });
    //弹窗
    function modaldemo(){
        $("#modal-demo").modal("show");
    }
    //添加用户好友操作
    function addUserRelation(){
        //判断当前用户是否已经登录
        var userId = $("#loginId").val();
        if(userId.length == 0){
            $("#modal-demo").modal("show");
            return;
        }else{
            var relationId = $("#theUserId").val();
            $.ajax({
                url : "/comment/addCourseComment",
                type : "post",
                data : {
                    cId:courseId,
                    ccUserId:userId,
                    ccScoure:score,
                    ccComment:beizhu
                },
                success : function(data) {
                    var aa = data.msg
                    if(aa == "success"){
                        alert("评论成功");
                        //刷新当前页面
                        location.reload(true);
                    }else{
                        //弹出错误问题
                        alert("添加评论失败，联系管理员");
                    }
                }
            });
        }
    }
</script>
</body>
</html>
