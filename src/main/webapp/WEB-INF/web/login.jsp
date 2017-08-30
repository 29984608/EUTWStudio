<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../public/tag.jsp" %>

<html lang="en">
<head>
    <title>高职学院信息管理系统</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" href="${baseurl}/images/public/favicon.ico">

    <link rel="stylesheet" type="text/css" href="${baseurl}/public/loginStyle/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/loginStyle/assets/css/form-elements.css">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/loginStyle/assets/css/style.css">
</head>
<body>
<div style="height: 70px;width:100%;position: absolute;z-index: 10000;background: white;text-align: left;opacity: .6" >
    <div style="padding: 15px 0 0 5%;display: inline-block">
        <img src="${baseurl}/public/loginStyle/assets/img/backgrounds/eurasia.png" height="55px">
    </div>
        <span style="color: #21a1a1;font-size: 25px;font-weight: bold;margin: 10px 0 0 20px;display: inline-block">高职学院欢迎您！</span>

</div>

<div style="z-index: -1;width: 100%;height: 100%;position: absolute;background-color: #000; opacity:.25;"></div>
<!-- Top content -->
<div class="top-content" style="z-index: 1000">

    <div class="container">
        <%--<div class="row" style="margin-top: 8%">--%>
            <%--<div class="col-sm-8 col-sm-offset-2 text">--%>
                <%--<h1>高职学生信息管理系统</h1>--%>
                <%--<div class="description">--%>
                    <%--为未来，为你而来--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
        <div class="row" style="margin: 12% 0 0 25%">
            <div class="col-sm-6 col-sm-offset-5 form-box" style="width: 450px">
                <div style="box-shadow: 0 0 3px 3px  seashell">
                    <div class="form-top">
                        <div class="form-top-left">
                            <span style="font-size: 20px;font-weight: bold;color: #21a1a1">高职信息管理系统</span>
                            <span style="font-size: 13px;font-weight:bold;font-style: italic ;float: right">为未来，为你而来</span>
                        </div>
                    </div>
                    <div class="form-bottom">
                        <form role="form" action="" method="post" class="login-form">
                            <div class="form-group">
                                <label class="sr-only" for="userName">帐号</label>
                                <input type="text" name="form-username" placeholder="请输入帐号"
                                       class="form-username form-control" id="userName">
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="password">密码</label>
                                <input type="password" name="form-password" placeholder="请输入密码"
                                       class="form-password form-control" id="password">
                            </div>
                            <button type="submit" class="btn " style="  background: #21a1a1">登录</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<div style="height: 50px;width:100%;position: fixed;bottom: 0;z-index: 10000;background: white;opacity: .6" >
    <span style="font-size: 12px;"> 2017-2018 © Write by Eurasia ThoughtWorks Studio.</span><br>
    <span style="font-size: 12px;display: inline-block;margin-top: -5px"> 推荐使用 Google 、 Firefox 浏览器进行访问</span>

</div>
<script src="${baseurl}/public/loginStyle/assets/js/jquery-1.11.1.min.js"></script>
<script src="${baseurl}/public/loginStyle/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="${baseurl}/public/loginStyle/assets/js/jquery.backstretch.min.js"></script>

<script type="text/javascript">
    layui.use(['jquery', 'layer'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        $(function () {
            /*
             Fullscreen background
             */
            $.backstretch("${baseurl}/public/loginStyle/assets/img/backgrounds/eur.jpg");

            /*
             Form validation
             */
            $('.login-form input[type="text"], .login-form input[type="password"], .login-form textarea').on('focus', function () {
                $(this).removeClass('input-error');
            });

            $('.login-form').on('submit', function (e) {
                e.preventDefault();
                $(this).find('input[type="text"], input[type="password"], textarea').each(function () {
                    if ($(this).val() == "") {

                        $(this).addClass('input-error');
                    }
                    else {
                        $(this).removeClass('input-error');
                    }
                });
                login();
            });
        });
        function login() {
            let userName = $("#userName").val();
            let password = $("#password").val();
            $.ajax({
                url: "${baseurl}/login",
                data: {userName: userName, password: password},
                success: function (data) {
                    if (data.result) {
                        location.href = "${baseurl}/index";
                    } else {
                        layer.msg(data.msg);
                    }
                }
            });
        }
    });


</script>
</body>
</html>