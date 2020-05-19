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
    <title>资源发布</title>

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
            <div id="clazzs">
                <div class="mainBody">
                    <h3>资源发布</h3>
                    <div class="panel-body" style="margin-left: -20%;">
                        <form action="" method="post" class="form form-horizontal responsive" id="demoform">

                            <div class="row cl">
                                <label class="form-label col-xs-3">名称：</label>
                                <div class="formControls col-xs-8">
                                    <input type="text" class="input-text" placeholder="输入资源名称" name="fileName" id="username">
                                </div>
                            </div>
                            <div class="row cl">
                                <label class="form-label col-xs-3">类型：</label>
                                <div class="formControls col-xs-8">
                                    <select class="select" size="1" name="fileType">
                                        <option value="1">视频</option>
                                        <option value="2">PPT</option>
                                        <option value="3">文档</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row cl">
                                <label class="form-label col-xs-3">文件选择：</label>
                                <div class="formControls col-xs-8">
											<span class="btn-upload form-group">
											<input class="input-text upload-url" type="text" name="uploadfile-2" id="uploadfile-2" readonly style="width:200px">
											<a href="javascript:void(0);" class="btn btn-primary upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
											<input type="file" multiple name="resourcesFile" class="input-file">
											</span>
                                </div>
                            </div>
                            <div class="row cl">
                                <label class="form-label col-xs-3">描述：</label>
                                <div class="formControls col-xs-8">
                                    <textarea cols="" rows="" class="textarea" name="suReason" id="beizhu"  placeholder="说点什么...最少输入10个字符"></textarea>
                                </div>
                            </div>

                            <div class="row cl">
                                <div class="col-xs-8 col-xs-offset-3">
                                    <input class="btn btn-primary" type="button" onclick="updateImg(this.form)" value="&nbsp;&nbsp;提交学习资源&nbsp;&nbsp;">
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
                <p>Copyright &copy;2013-2017 xueCwang.net All Rights Reserved. <br>
                    <a rel="nofollow"  href="http://www.miitbeian.gov.cn/">京ICP备0000001号-1</a>
                    <br>
                    未经允许，禁止转载、抄袭、镜像<br>
                    用心做站，做不一样的站</p>
            </div>
        </footer>
    </div>
</div>
<script>
    /*注册数据提交*/
    function updateImg(x) {
        var form = new FormData(x);
        var url = "/resources/addResources";
        $.ajax({
            url:url,
            data:form,
            type:'post',
            processData:false,
            contentType:false,
            success : function(data){
                if(data.status == true){
                    alert("发布资源成功，前往资源列表页面");
                    window.location = "/toResourcesListPage";
                }else{
                    alert(data.msg);
                }
            },
            error : function(data){
                alert("系统异常，联系管理员");
            }
        });
    }
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
