<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">

    <title>星曦向荣博客网_用户注册</title>

    <link href="/static/css/style.css" rel="stylesheet">
    <link href="/static/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="/static/js/html5shiv.js"></script>
    <script src="/static/js/respond.min.js"></script>
    <![endif]-->
</head>

<body class="login-body" style="background-image: url('/static/img/b1.jpg')">

<div class="container">

    <form class="form-signin" name="regist" action="/registrationForm" method="post" onsubmit="return submit()">
        <div class="form-signin-heading text-center">
            <h1 class="sign-title">用户注册</h1>
            <img src="/static/images/login-logo.png" alt=""/>
        </div>
        <div class="login-wrap">
            <c:if test="${msg!=null}">
                <div class="${msg.code==200?'alert alert-success fade in':'alert alert-danger fade in'}">
                    <button type="button" class="close close-sm" data-dismiss="alert">
                        <i class="fa fa-times"></i>
                    </button>
                    <label color="${msg.code==200?'green':'red'}">${msg.message}</label>
                </div>
            </c:if>
            <p>在下面输入您的个人详细信息</p>
            <input type="text" autofocus="" placeholder="请输入用户名" class="form-control" name="username" required>
            <div class="radios">
                <label for="radio-01" class="label_radio col-lg-6 col-sm-6">
                    <input type="radio" checked="" value="男" id="radio-01" name="sex"> 男
                </label>
                <label for="radio-02" class="label_radio col-lg-6 col-sm-6">
                    <input type="radio" value="女" id="radio-02" name="sex"> 女
                </label>
            </div>
            <textarea class="form-control"name="introduction" rows="3"id="inputEmail" required placeholder="请输入您的个人简介"></textarea>
            <hr>
            <p> 在下面输入您的帐户详细信息</p>
            <input type="text" autofocus="" placeholder="请输入手机号" class="form-control" name="phonenum" required>
            <input type="password" placeholder="请输入密码" class="form-control" name="password0" required>
            <input type="password" placeholder="请再次输入密码" class="form-control" name="password" required>
<%--            <label class="checkbox">--%>
<%--                <input type="checkbox" value="同意服务"> 我同意服务条款和隐私政策--%>
<%--            </label>--%>
            <button type="submit" class="btn btn-lg btn-login btn-block">
                <i class="fa fa-check"></i>
            </button>

            <div class="registration">
                已经注册了，
                <a href="/">去登录</a>
            </div>

        </div>

    </form>

</div>



<!-- Placed js at the end of the document so the pages load faster -->

<!-- Placed js at the end of the document so the pages load faster -->
<script src="/static/js/jquery-1.10.2.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/modernizr.min.js"></script>
<script src="/js/registration.js"></script>
</body>
</html>
