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

  <title>星曦向荣博客网_个人主页</title>

  <!--icheck-->
  <link th:href="@{/static/js/iCheck/skins/minimal/minimal.css}" rel="stylesheet">
  <link th:href="@{/static/js/iCheck/skins/square/square.css}" rel="stylesheet">
  <link th:href="@{/static/js/iCheck/skins/square/red.css}" rel="stylesheet">
  <link th:href="@{/static/js/iCheck/skins/square/blue.css}" rel="stylesheet">

  <link href="/static/css/style.css" rel="stylesheet">
  <link href="/static/css/style-responsive.css" rel="stylesheet">
  <link href="/static/css/table-responsive.css" rel="stylesheet" />
  <link href="/static/css/clndr.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="/static/js/html5shiv.js"></script>
  <script src="/static/js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="horizontal-menu-page">

<section>

  <nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/main">
          <img src="/static/images/logo.png" alt="">
        </a>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
          <li class="active"><a href="/main">首页</a></li>
          <li><a href="/addArticle">添加文章</a></li>
          <li><a href="/myArticlePage/${user.id}/${user.username}">我的文章</a></li>
        </ul>

        <ul class="nav navbar-nav navbar-right">
<%--          <li>--%>
<%--            <form class="navbar-form navbar-left" role="search">--%>
<%--              <div class="form-group">--%>
<%--                <input type="text" class="form-control" placeholder="Search">--%>
<%--              </div>--%>
<%--            </form>--%>
<%--          </li>--%>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <img alt="" src="${user.sex=='男'?'/static/images/photos/boy_user.png':'/static/images/photos/girl_user.png'}"> ${user.username} <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="#">账户</a></li>
              <li><a href="#">设置</a></li>
              <li><a href="/exit">注销</a></li>
            </ul>
          </li>
        </ul>
      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </nav>


  <!--body wrapper start-->
  <!--body wrapper start-->
  <div class="wrapper" style="overflow-y: auto">

    <div class="row">
      <div class="col-md-12">
        <!--statistics start-->
        <div class="row state-overview">
          <div class="col-md-3 col-xs-12 col-sm-6">
            <div class="panel green">
              <div class="symbol">
                <i class="fa fa-eye"></i>
              </div>
              <div class="state-value">
                <div class="value">${articleAll.size()}</div>
                <div class="title"> 全部类型的文章数</div>
              </div>
            </div>
          </div>
          <div class="col-md-3 col-xs-12 col-sm-6">
            <div class="panel purple">
              <div class="symbol">
                <i class="fa fa-gavel"></i>
              </div>
              <div class="state-value">
                <div class="value">${publicArticleLis.size()}</div>
                <div class="title">全部公开类型文章数</div>
              </div>
            </div>
          </div>
          <div class="col-md-3 col-xs-12 col-sm-6">
            <div class="panel red">
              <div class="symbol">
                <i class="fa fa-tags"></i>
              </div>
              <div class="state-value">
                <div class="value">${myArticleNum}</div>
                <div class="title">我的全部类型文章数</div>
              </div>
            </div>
          </div>
          <div class="col-md-3 col-xs-12 col-sm-6">
            <div class="panel blue">
              <div class="symbol">
                <i class="fa fa-money"></i>
              </div>
              <div class="state-value">
                <div class="value">${myPublicArticleNum}</div>
                <div class="title"> 我的公开类型文章数</div>
              </div>
            </div>
          </div>

        </div>
        <!--statistics end-->
      </div>
      <div class="col-sm-12">
        <div class="adv-table editable-table">
          <section id="no-more-tables">
            <!--                                <table class="table table-striped table-hover table-bordered" id="editable-sample" >-->
            <table class="table table-bordered table-striped table-condensed cf" id="editable-sample">
              <thead class="cf">
              <tr>
                  <th style="text-align: center">文章名</th>
                  <th style="text-align: center">时间</th>
                <th style="text-align: center">作者</th>
                  <th style="text-align: center">简介</th>
                <th style="text-align: center">阅读量</th>
                <th style="text-align: center">操作</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${publicArticleLis}" var="a">
                <tr class=""style="text-align: center">
                    <td data-title="文章名" style="text-align: center;color: #1CAF9A">${a.title}</td>
                    <td data-title="时间" style="text-align: center;height: auto;width: auto;margin: auto" >${a.time.substring(0,16)}</td>
                  <td data-title="作者" style="text-align: center ;height: auto" >${a.author}</td>
                    <td data-title="简介" style="text-align: center">${a.introduce}</td>
                  <td data-title="阅读量" style="text-align: center">${a.num}</td>
                  <td data-title="操作" style="text-align: center"><a class="btn btn-sm btn-search e1" put_url="/ReadArticle/${a.id}/${a.title} " put_id="${a.id}">查看</a></td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </section>
        </div>
      </div>
    </div>


    <form id="putEmpRorm" method="post">
<%--      <input type="hidden" id="id" name="id">--%>
    </form>

  </div>
  <!--body wrapper end-->

  <!--footer section start-->
  <footer class="sticky-footer">
    2021 &copy; <a href="https://github.com/ZhangHeng0805" target="_blank">星曦向荣</a>
  </footer>
  <!--footer section end-->

</section>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="/static/js/jquery-1.10.2.min.js"></script>
<script src="/static/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="/static/js/jquery-migrate-1.2.1.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/modernizr.min.js"></script>
<script src="/static/js/jquery.nicescroll.js"></script>
<script type="text/javascript" src="/static/js/data-tables/jquery.dataTables.js"></script>
<script type="text/javascript" src="/static/js/data-tables/DT_bootstrap.js"></script>
<!--script for editable table-->
<script src="/static/js/editable-table.js"></script>
<!--common scripts for all pages-->
<script src="/static/js/scripts.js"></script>
<script>
  // $(".d1").click(function () {
  //   var d=window.confirm("确定拒绝此订单商品？");
  //   if (d) {
  //     $("#delEmpRorm").attr("action", $(this).attr("del_url")).submit();
  //     return false;
  //   }
  // });
  // var e=document.getElementsByClassName("e1");
  // e.click(function Onclick() {
  //   document.getElementById("putEmpRorm").setAttribute("action",e1.attr("put_url")).submit();
  // });
  $(".e1").click(function () {
    // alert($(this).attr("put_url"));
    // $("#id").attr("value",$(this).attr("put_id"));
    $("#putEmpRorm").attr("action",$(this).attr("put_url")).submit();
    return false;
  });
</script>
<script>
  jQuery(document).ready(function() {
    EditableTable.init();
  });
</script>
</body>
</html>

