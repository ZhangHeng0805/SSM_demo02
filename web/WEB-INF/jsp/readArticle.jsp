<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 张恒
  Date: 2021/10/20 0020
  Time: 20:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="ThemeBucket">
  <link rel="shortcut icon" href="#" type="image/png">

  <title>《${article.title==null?'出错了，没有内容':article.title}》</title>

  <link href="/static/css/style.css" rel="stylesheet">
  <link href="/static/css/style-responsive.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="/static/js/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="/static/js/html5shiv.js"></script>
  <script src="/static/js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="sticky-header">
<section class="">
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
          <c:if test="${user!=null}">
          <img alt="" src="${user.sex=='男'?'/static/images/photos/boy_user.png':'/static/images/photos/girl_user.png'}" class="media-object">
          <div class="media-body">
            <h4><a href="#">${user.username}</a></h4>
            <span>"${user.introduction}"</span>
          </div>
          </c:if>
        <c:if test="${user==null}">
          <div class="media-body">
            <a href="/">去登录</a>
          </div>
        </c:if>
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
        <li><a href="/addArticle"><i class="fa fa-bullhorn"></i> <span>添加文章</span></a></li>

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
            <c:if test="${user!=null}">
            <img src="${user.sex=='男'?'/static/images/photos/boy_user.png':'/static/images/photos/girl_user.png'}" alt="" />
            <!--                    <img th:src="@{'/downloads/show/'+${session.store.store_image}}"style="height: auto">-->
            ${user.username}
            </c:if>
            <c:if test="${user==null}">
              <a href="/">去登录</a>
            </c:if>
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
  <!--body wrapper start-->
  <div class="wrapper" style="overflow-y: auto">

       <section class="mail-list" >
         <div class="mail-sender">
           <c:if test="${msg!=null}">
             <div class="${msg.code==200?'alert alert-success fade in':'alert alert-danger fade in'}">
               <button type="button" class="close close-sm" data-dismiss="alert">
                 <i class="fa fa-times"></i>
               </button>
               <label color="${msg.code==200?'green':'red'}">${msg.message}</label>
             </div>
           </c:if>
           <c:if test="${article!=null}">
           <div class="row">
             <div class="col-lg-12" style="padding-top: 10px;padding-bottom: 10px;border-radius: 15px;text-align: center">
               <h3><big>${article.title}</big></h3>
               <i><span>${article.introduce}</span></i>
             </div>
             <hr>
             <div class="col-sm-6">
               <p class="date" style="text-align: left">
                 ${article.time.substring(0,16)}
               </p>
             </div>
             <div class="col-sm-6">
               <p class="date">
                   作者：${article.author}
               </p>
             </div>
           </div>
             <hr>
           </c:if>
           <c:if test="${article==null}">
             <div class="alert alert-danger fade in">
               <label color="red">出错了，没有找到文章，你可以从<a href="/main">主页</a>进入。</label>
             </div>
           </c:if>
         </div>
         <div class="view-mail  col-sm-12 col-md-12 col-lg-12" style="overflow-x: auto">
           ${article.content}
         </div>
       </section>
<%--    <footer>--%>
<%--      2021 &copy; <a href="https://github.com/ZhangHeng0805" target="_blank">星曦向荣</a>--%>
<%--    </footer>--%>
    </div>
    <!--footer section start-->
    <footer class="sticky-footer">
      2021 &copy; <a href="https://github.com/ZhangHeng0805" target="_blank">星曦向荣</a>
    </footer>
    <!--footer section end-->
  <!--body wrapper end-->
  </div>
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


</body>
</html>

