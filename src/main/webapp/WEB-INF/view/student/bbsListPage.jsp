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
    <title>问题列表</title>

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
            <div id="others">
                <div class="mainBody">
                    <h3>学习论坛
                        <a class="Hui-iconfont Hui-iconfont-add4" onClick="showDeit()" title="发布问题"></a>
                        <a class="Hui-iconfont Hui-iconfont-order" title="我的问题"></a></h3>
                    <table class="table table-border" id="bbsList">

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
<%--添加问题弹出层--%>
<div id="editorDiv" class="modal fade middle">
    <div class="modal-dialog">
        <div class="modal-content radius">
            <div class="modal-header">
                <h3 class="modal-title">发布问题</h3>
                <a class="close" data-dismiss="modal" aria-hidden="true" href="javascript;">×</a>
            </div>
            <div class="modal-body">
                <div class="row cl">
                    <div>
                        <input type="text" id="courseName" class="input-text" placeholder="输入标题">
                    </div>
                </div>
            </div>
            <div class="modal-body">
                <div id="editor" style=""></div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" onclick="alertMsg()">确定</button>
                <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>

</div>
<script type="text/javascript" charset="utf-8" src="${staticPath}/utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${staticPath}/utf8-jsp/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="${staticPath}/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
<script>
    UE.getEditor('editor').setHide();
    function showDeit() {
        var userId = $("#userHiddenId").val();
        if(userId.length == 0){
            $("#modal-demo").modal("show");
            return;
        }
        clearLocalData();
        var zz = '';
        // UE.getEditor('editor').setContent('');
        UE.getEditor('editor').setContent(zz);
        $("#editorDiv").modal("show");
        // UE.getEditor('editor').setShow();
    }
    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }
    //提交按钮点击操作
    function alertMsg() {
        //判断当前用户是否是已登录的状态，不是的话弹出登陆框
        var userId = $("#userHiddenId").val();
        var cName = $("#courseName").val();
        if(cName.length == 0){
            alert("请输入问题标题！");
            return;
        }
        if(userId.length == 0){
            $("#modal-demo").modal("show");
            return;
        }else{
            // var beizhu = $("#beizhu").val();
            var beizhu = UE.getEditor('editor').getContent();
            $.ajax({
                url : "/course/addBbs",
                type : "post",
                data : {
                    cSuId:userId,
                    courseContent:beizhu,
                    cFlag:'2',
                    cName:cName
                },
                success : function(data) {
                    debugger;
                    var aa = data.msg
                    if(aa == "success"){
                        alert("发布成功");
                        //刷新当前页面
                        location.reload(true);
                    }else{
                        //弹出错误问题
                        alert("发布失败，联系管理员");
                    }
                }
            });
        }

    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
    }
</script>

<%--初始化分页插件数据信息--%>
<script type="text/javascript" src="${staticPath}/hui/lib/laypage/1.2/laypage.js"></script>
<script>
    $.getJSON('/course/getCourseListForPage', {curr: 1,limit:10,type:3,tag:'1'}, function(res){ //从第6页开始请求。返回的json格式可以任意定义
        laypage({
            limit:10,
            cont: 'coursePageDiv', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：&lt;div id="page1">&lt;/div>
            pages: res.pages, //通过后台拿到的总页数
            curr: 1, //初始化当前页
            jump: function(e){ //触发分页后的回调
                console.log(e);
                $.getJSON('/course/getCourseListForPage', {curr: e.curr,limit:e.limit,type:3,tag:'1'}, function(res){
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
        var htmllet = "";
        $("#courseList").html(htmllet);
        createHtml(htmllet,zz,'bbsList');
    });
    function createHtml(htmllet,zz,id) {
        for(var i = 0;i<zz.length;i++){
            var z=i+1;
            htmllet += '<tr class="theTr">\n' +
                '                            <td>\n' +
                '                                '+z+'\n' +
                '                            </td>\n' +
                '                            <td>\n' +
                '                                <a href="/toBbsInfoPage?courseId='+zz[i].cId+'">'+zz[i].cName+'</a>\n' +
                '                                <br/>\n' +
                '                            </td>\n' +
                '                            <td>\n' +
                '                                '+zz[i].cUptime+'\n' +
                '                            </td>\n' +
                '                            <td>\n' +
                '                                <a href="/showUserInfo?userId='+zz[i].userUid+'">'+zz[i].cAuthor+'</a>\n' +
                '                            </td>\n' +
                '                        </tr>';
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
