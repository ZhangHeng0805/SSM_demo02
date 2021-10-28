<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">

    <title>星曦向荣博客网_用户登录</title>

    <link href="/static/css/style.css" rel="stylesheet">
    <link href="/static/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="/static/js/html5shiv.js"></script>
    <script src="/static/js/respond.min.js"></script>
    <![endif]-->
</head>

<body class="login-body" style="background-image: url('/static/img/b2.jpg')">

<div class="container">

    <form class="form-signin" id="Froms" action="/index" method="post" onsubmit="return submit()">
        <div class="form-signin-heading text-center">
            <h1 class="sign-title">用户登录</h1>
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
            <input type="text" name="phonenum" id="phonenum" class="form-control" placeholder="请输入手机号" autofocus required>
            <input type="password" name="password" id="password" class="form-control" placeholder="请输入密码" required>

            <button class="btn btn-lg btn-login btn-block" type="submit">
                <i class="fa fa-check"></i>
            </button>

            <div class="registration">
                没有账号，
                <a class="" href="/registration">
                    去注册
                </a>
            </div>
            <label class="checkbox">
<%--                <input type="checkbox" value="remember-me"> Remember me--%>
                <span class="pull-right">
                    <a data-toggle="modal" href="#myModal"> 忘记密码?</a>

                </span>
            </label>

        </div>

        <!-- Modal -->
        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">忘记密码 ?</h4>
                    </div>
                    <div class="modal-body">
                    <br>点击下方的邮箱，向我发送账号的信息</br>
                    注意：发送的账号信息需要有以下<br>
                    1.用户名<br>
                    2.登录网址（就是该页面的网址）<br>
                    3.手机号码<br>
                    如果信息验证正确，则会以邮件的形式将密码发送给你<br>
                    </p>
                    <!--                        <input type="text" name="email" placeholder="Email邮箱" autocomplete="off" class="form-control placeholder-no-fix">-->
                    <a target="_blank" href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=wriqo6ylqqespezy_vL3grOz7KGtrw" style="text-decoration:none;"><img src="http://rescdn.qqmail.com/zh_CN/htmledition/images/function/qm_open/ico_mailme_22.png"/></a>
                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
<%--                        <button class="btn btn-primary" type="button">Submit</button>--%>
                    </div>
                </div>
            </div>
        </div>
        <!-- modal -->

    </form>

</div>



<!-- Placed js at the end of the document so the pages load faster -->

<!-- Placed js at the end of the document so the pages load faster -->
<script src="/static/js/jquery-1.10.2.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/modernizr.min.js"></script>
<script src="/js/login.js"></script>

</body>
</html>
