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

    </style>
    <title>个人信息修改</title>

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
                                        <a href="http://www.h-ui.net/bug.shtml">我的课程</a>
                                    </li>
                                    <li>
                                        <a href="/showUserInfo?userId=${userInfo.suUuid}">个人信息</a>
                                    </li>
                                    <li>
                                        <a href="http://www.h-ui.net/bug.shtml">作业管理</a>
                                    </li>
                                    <li>
                                        <a href="http://www.h-ui.net/bug.shtml">教师页面</a>
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
                <span class="btn btn-default radius radiusNew">课程学习</span>
                <span class="btn btn-default radius radiusNew">团队简介</span>
                <span class="btn btn-default radius radiusNew">名师风采</span>
                <span class="btn btn-default radius radiusNew">课堂作业</span>
                <span class="btn btn-default radius radiusNew">解惑答疑</span>
                <span class="btn btn-default radius radiusNew">附件下载</span>
            </div>
            <div id="clazzs">
                <div class="mainBody">
                    <h3>账户注册</h3>
                    <div class="panel-body" style="margin-left: -20%;">
                        <form action="" method="post" class="form form-horizontal responsive" id="demoform">

                            <div class="row cl">
                                <label class="form-label col-xs-3">头像：</label>
                                <div class="formControls col-xs-8">
                                    <img src="${userInfoForUpdate.userPhoto}" alt="" class="round" style="width: 60px; height: 50px;">
                                </div>
                            </div>
                            <div class="row cl">
                                <label class="form-label col-xs-3">邮箱：</label>
                                <div class="formControls col-xs-8">
                                    <input type="text" value="${userInfoForUpdate.suEmail}" class="input-text" placeholder="@" name="suEmail" id="email" autocomplete="off">
                                </div>
                            </div>
                            <div class="row cl">
                                <label class="form-label col-xs-3">用户编码：</label>
                                <div class="formControls col-xs-8">
                                    <input type="text" disabled="disabled" value="${userInfoForUpdate.suUuid}" class="input-text" placeholder="4~16个字符，字母/中文/数字/下划线" name="suUuid" id="suUuid">
                                </div>
                            </div>
                            <div class="row cl">
                                <label class="form-label col-xs-3">用户账号：</label>
                                <div class="formControls col-xs-8">
                                    <input type="text" disabled="disabled" value="${userInfoForUpdate.suCode}" class="input-text" placeholder="4~16个字符，字母/中文/数字/下划线" name="suCode" id="username">
                                </div>
                            </div>
                            <div class="row cl">
                                <label class="form-label col-xs-3">手机：</label>
                                <div class="formControls col-xs-8">
                                    <input type="text" value="${userInfoForUpdate.suPhone}" class="input-text" autocomplete="off" placeholder="手机" name="suPhone" id="telephone">
                                </div>
                            </div>
                            <div class="row cl">
                                <label class="form-label col-xs-3">密码：</label>
                                <div class="formControls col-xs-8">
                                    <input type="password" class="input-text" autocomplete="off" placeholder="密码" name="suPwd" id="password">
                                </div>
                            </div>
                            <div class="row cl">
                                <label class="form-label col-xs-3">密码验证：</label>
                                <div class="formControls col-xs-8">
                                    <input type="password" class="input-text" autocomplete="off" placeholder="密码" name="password2" id="password2">
                                </div>
                            </div>
                            <div class="row cl">
                                <label class="form-label col-xs-3">角色：</label>
                                <div class="formControls skin-minimal col-xs-5">
                                    ${userInfoShow.suSex == '1'?'学生':'教师'}
                                </div>
                            </div>
                            <div class="row cl">
                                <label class="form-label col-xs-3">性别：</label>
                                <div class="formControls skin-minimal col-xs-5">
                                    ${userInfoShow.suSex == '1'?'男':'女'}
                                </div>
                            </div>
                            <div class="row cl">
                                <label class="form-label col-xs-3">昵称：</label>
                                <div class="formControls col-xs-8">
                                    <input type="text" value="${userInfoForUpdate.suName}" class="input-text" value="" autocomplete="off" id="realName" name="suName">
                                </div>
                            </div>
                            <div class="row cl">
                                <label class="form-label col-xs-3">出生日期：</label>
                                <div class="formControls col-xs-8">
                                    <input type="text" value="${userInfoForUpdate.suBirthday}" class="input-text" value="" autocomplete="off" id="datetimepicker" name="suBirthday">
                                </div>
                            </div>

                            <div class="row cl">
                                <label class="form-label col-xs-3">头像选择：</label>
                                <div class="formControls col-xs-8">
											<span class="btn-upload form-group">
											<input class="input-text upload-url" type="text" name="uploadfile-2" id="uploadfile-2" readonly style="width:200px">
											<a href="javascript:void(0);" class="btn btn-primary upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
											<input type="file" multiple name="uploadfile" class="input-file">
											</span>
                                </div>
                            </div>
                            <div class="row cl">
                                <label class="form-label col-xs-3">个人描述：</label>
                                <div class="formControls col-xs-8">
                                    <textarea cols="" rows="" class="textarea" name="suReason" id="beizhu"  placeholder="说点什么...最少输入10个字符">
                                        ${userInfoForUpdate.suReason}
                                    </textarea>
                                </div>
                            </div>

                            <div class="row cl">
                                <div class="col-xs-8 col-xs-offset-3">
                                    <input class="btn btn-primary" type="button" onclick="updateImg(this.form)" value="&nbsp;&nbsp;确认修改&nbsp;&nbsp;">
                                </div>
                            </div>
                        </form>
                    </div>
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
    /*修改个人数据提交*/
    function updateImg(x) {
        var form = new FormData(x);
        var url = "/user/updateMyUserInfo";
        $.ajax({
            url:url,
            data:form,
            type:'post',
            processData:false,
            contentType:false,
            success : function(data){
                if(data.status == true){
                    alert("修改成功，返回主页登陆");
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
</script>
</body>
</html>
