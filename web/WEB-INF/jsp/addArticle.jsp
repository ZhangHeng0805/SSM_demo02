
<%--
  Created by IntelliJ IDEA.
  User: 张恒
  Date: 2021/10/20 0020
  Time: 20:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="ThemeBucket">
  <link rel="shortcut icon" href="#" type="image/png">

  <title>添加文章</title>

  <link href="/static/css/style.css" rel="stylesheet">
  <link href="/static/css/style-responsive.css" rel="stylesheet">
  <link href="/static/css/table-responsive.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="/static/js/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="/static/js/html5shiv.js"></script>
  <script src="/static/js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="sticky-header">
<section>
  <!-- left side start-->
  <div id="com_leftmenu" class="left-side sticky-left-side">
    <!--logo and iconic logo start-->
    <div class="logo">
      <a href="/main"><img src="/static/images/logo.png" alt=""></a>
    </div>

    <div class="logo-icon text-center">
      <a href="/main"><img src="/static/images/logo_icon.png" alt=""></a>
    </div>
    <!--logo and iconic logo end-->

    <div class="left-side-inner">
      <!-- visible to small devices only -->
      <div class="visible-xs hidden-sm hidden-md hidden-lg">
        <div class="media logged-user">
          <img alt="" src="${user.sex=='男'?'/static/images/photos/boy_user.png':'/static/images/photos/girl_user.png'}" class="media-object">
          <div class="media-body">
            <h4><a href="#">${user.username}</a></h4>
            <span>"${user.introduction}"</span>
          </div>
        </div>
        <h5 class="left-nav-title">账户信息</h5>
        <ul class="nav nav-pills nav-stacked custom-nav">
          <li><a href="#"><i class="fa fa-cog"></i> <span>账户设置</span></a></li>
          <!--                <li><a th:href="@{/exit}"><i class="fa fa-sign-out"></i> <span>退出登录</span></a></li>-->
        </ul>
      </div>
      <!--左菜单-->
      <ul class="nav nav-pills nav-stacked custom-nav">
        <li><a href="/main"><i class="fa fa-home"></i> <span>主页详情</span></a></li>
        <li><a href="/myArticlePage/${user.id}/${user.username}"><i class="fa fa-bar-chart-o"></i> <span>我的文章</span></a></li>
        <li class="active"><a href="/addArticle"><i class="fa fa-bullhorn"></i> <span>添加文章</span></a></li>

<%--        <li th:class="${active}=='4'?'active':''"><a th:href="@{/goodsfromstore_table}"><i class="fa fa-th-list"></i><span>商品信息</span></a></li>--%>

        <li><a href="/exit"><i class="fa fa-sign-in"></i> <span>重新登录</span></a></li>

      </ul>
      <!--sidebar nav end-->
    </div>
  </div>
  <!-- left side end-->
  <!-- main content start-->
  <div class="main-content" >
  <!-- 顶部菜单-->
  <div id="com_headermenu" class="header-section">
    <!--toggle button start-->
    <a class="toggle-btn"><i class="fa fa-bars"></i></a>
    <!--toggle button end-->
    <!--search start-->
    <!--    <form class="searchform" action="index.html" method="post">
            <input type="text" class="form-control" name="keyword" placeholder="Search here..." />
        </form>-->
    <!--search end-->

    <!--notification menu start -->
    <div class="menu-right">
      <ul class="notification-menu">
        <li>
          <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
            <img src="${user.sex=='男'?'/static/images/photos/boy_user.png':'/static/images/photos/girl_user.png'}" alt="" />
                 ${user.username}
            <span class="caret"></span>
          </a>
          <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
            <li><a href="#"><i class="fa fa-cog"></i>  账户设置</a></li>
<%--            <li><a data-toggle="modal" href="#myModal"><i class="fa fa-unlock-alt"></i>  修改密码</a></li>--%>
            <li><a href="/exit"><i class="fa fa-sign-out"></i> 退出登录</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
    <!--notification menu end -->

  <!--body wrapper start-->
  <div class="wrapper">
    <div class="row">
        <section class="panel">
          <header class="panel-heading">
            添加文章
            <span class="tools pull-right">
                                <a class="fa fa-chevron-down" href="javascript:;"></a>
<%--                                <a class="fa fa-times" href="javascript:;"></a>--%>
                             </span>
          </header>
          <div class="panel-body">
            <c:if test="${msg!=null}">
              <div class="${msg.code==200?'alert alert-success fade in':'alert alert-danger fade in'}">
                <button type="button" class="close close-sm" data-dismiss="alert">
                  <i class="fa fa-times"></i>
                </button>
                <label color="${msg.code==200?'green':'red'}">${msg.message}</label>
              </div>
            </c:if>
              <form action="/addArticle" class="form-horizontal" method="post">
                <div class="form-group">
                  <input type="hidden" name="author" value="${user.username}">
                  <input type="hidden" name="authorId" value="${user.id}">
                  <div class="col-md-12">
                    <label for="title" class="control-label">文章标题:</label>
                    <input type="text"name="title" class="form-control" id="title" required placeholder="请输入文章标题" oninput="titleInput('title','h_title',50)">
<%--                    <p id="h_title">请输入文章标题（字数限制30字）</p>--%>
                    <p id="h_title" class="help-block">请输入文章标题（字数限制50字）</p>
                   </div>
                </div>
                <div class="form-group">
                  <div class="col-md-12">
                  <div class="radios">
                    <label class="label_radio col-lg-4 col-sm-4">文章状态：</label>
                    <label for="radio-01" class="label_radio col-lg-4 col-sm-4">
                      <input type="radio" checked="" value="公开" id="radio-01" name="state"> 公开
                    </label>
                    <label for="radio-02" class="label_radio col-lg-4 col-sm-4">
                      <input type="radio" value="私密" id="radio-02" name="state"> 私密
                    </label>
                    <p class="help-block" style="text-align: center">公开:表示该文章所有人可见||私密:表示仅自己可见</p>
                  </div>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-md-12">
                  <label for="introduce" class="control-label">文章简介:</label>
                    <textarea name="introduce" rows="3" class="form-control" id="introduce" oninput="titleInput('introduce','h_introduce',100)" required placeholder="请输入文章简介"></textarea>
                    <p id="h_introduce" class="help-block">请输入文章简介（字数限制100字）</p>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-md-12">
                    <label for="introduce" class="control-label">文章内容:</label>
                    <textarea class="form-control ckeditor" id="content" oninput="titleInput('content','h_content',20000)" name="content" rows="6" placeholder="请输入文章内容"></textarea>
                    <p id="h_content" class="help-block">请输入文章内容（字数限制20000字）</p>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-md-12">
                    <input type="submit" class="btn btn-success btn-lg" value="发布文章">
                  </div>
                </div>
              </form>
            </div>
          <!--footer section start-->
          <footer>
            2021 &copy; <a href="https://github.com/ZhangHeng0805" target="_blank">星曦向荣</a>
          </footer>
          <!--footer section end-->
        </section>
    </div>
  </div>
  <!--body wrapper end-->
  </div>
  <!-- main content end-->
</section>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="/static/js/jquery-1.10.2.min.js"></script>
<script src="/static/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="/static/js/jquery-migrate-1.2.1.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/modernizr.min.js"></script>
<script src="/static/js/jquery.nicescroll.js"></script>

<script type="text/javascript" src="/static/js/ckeditor/ckeditor.js"></script>

<script type="text/javascript" src="/static/js/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
<script type="text/javascript" src="/static/js/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>

<!--common scripts for all pages-->
<script src="/static/js/scripts.js"></script>
<script>
  function titleInput(input,h_title,max) {
    // alert($("#title").val().length);
    var i=$("#"+input).val().length;
    var h_t=document.getElementById(h_title);
    h_t.innerText="字数限制"+max+"字,已输入："+i+"字";
    if (i>max){
      h_t.style.color="red";
    }else {
      h_t.style.color="#4e4f6b";
    }
  }
</script>

</body>
</html>

