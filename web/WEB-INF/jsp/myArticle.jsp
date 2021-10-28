<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="ThemeBucket">
  <link rel="shortcut icon" href="#" type="image/png">

  <title>我的文章</title>

    <link href="/static/css/style.css" rel="stylesheet">
    <link href="/static/css/style-responsive.css" rel="stylesheet">
    <link href="/static/css/table-responsive.css" rel="stylesheet" />

    <!--data table-->
  <!--[endif]-->

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
                <li class="active"><a href="/myArticlePage/${user.id}/${user.username}"><i class="fa fa-bar-chart-o"></i> <span>我的文章</span></a></li>
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

        <!-- header section start-->
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
                            <!--                    <img th:src="@{'/downloads/show/'+${session.store.store_image}}"style="height: auto">-->
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
        <!-- header section end-->

        <!-- page heading start-->
<!--        <div class="page-heading">-->
<!--            <h3>-->
<!--                Editable Table-->
<!--            </h3>-->
<!--        </div>-->
        <!-- page heading end-->

        <!--body wrapper start-->
        <div class="wrapper">
            <div class="col-sm-12">
                <div class="adv-table editable-table">

                    <section id="no-more-tables">
                        <c:if test="${msg!=null}">
                            <div class="${msg.code==200?'alert alert-success fade in':'alert alert-danger fade in'}">
                                <button type="button" class="close close-sm" data-dismiss="alert">
                                    <i class="fa fa-times"></i>
                                </button>
                                <label color="${msg.code==200?'green':'red'}">${msg.message}</label>
                            </div>
                        </c:if>
                        <!--                                <table class="table table-striped table-hover table-bordered" id="editable-sample" >-->
                        <table class="table table-bordered table-striped table-condensed cf" id="editable-sample">
                            <thead class="cf">
                            <tr>
                                <th style="text-align: center">文章名</th>
                                <th style="text-align: center">状态</th>
                                <th style="text-align: center">时间</th>
                                <th style="text-align: center">阅读量</th>
                                <th style="text-align: center">简介</th>
                                <th style="text-align: center">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${articleByAuthorId}" var="a">
                                <tr class=""style="text-align: center">
                                    <td data-title="文章名" style="text-align: center;color:green;">${a.title}</td>
                                    <td data-title="状态" style="text-align: center ;height: auto;color: ${a.state=='公开'?'blue':'red'}" >${a.state}</td>
                                    <td data-title="时间" style="text-align: center;height: auto;width: auto;margin: auto" >${a.time.substring(0,16)}</td>
                                    <td data-title="阅读量" style="text-align: center">${a.num}</td>
                                    <td data-title="简介" style="text-align: center">${a.introduce}</td>
                                    <td data-title="操作" style="text-align: center">
                                        <a class="btn btn-sm btn-search p1" put_url="/ReadArticle/${a.id}/${a.title}" put_id="${a.id}">查看</a>
                                        <a class="btn btn-sm btn-warning s1" put_url="/modifyArticlePage" put_id="${a.id}">修改</a>
                                        <a class="btn btn-sm btn-danger d1" put_url="/ReadArticle" put_id="${a.id}">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <form id="putEmpRorm" method="post">
<%--                            <input type="hidden" id="p_id" name="id">--%>
                        </form>
                        <form id="setEmpRorm" method="post">
                            <input type="hidden" id="s_id" name="id">
                            <input type="hidden" name="authorId" value="${user.id}">
                        </form>
                    </section>
                </div>
            </div>
        </div>
        <!--body wrapper end-->

        <!--footer section start-->
        <footer class="sticky-footer">
            2021 &copy; <a href="https://github.com/ZhangHeng0805" target="_blank">星曦向荣</a>
        </footer>
        <!--footer section end-->


    </div>
    <!-- main content end-->
</section>

<script src="/static/js/html5shiv.js"></script>
<script src="/static/js/respond.min.js"></script>
<!-- Placed js at the end of the document so the pages load faster -->
<script src="/static/js/jquery-1.10.2.min.js"></script>
<script src="/static/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="/static/js/jquery-migrate-1.2.1.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/modernizr.min.js"></script>
<script src="/static/js/jquery.nicescroll.js"></script>
<script src="/static/js/scripts.js"></script>
<script>
    $(".d1").click(function () {
        $("#p_id").attr("value",$(this).attr("put_id"));
        $("#putEmpRorm").attr("action",$(this).attr("put_url")).submit();
        return false;
    });
    $(".s1").click(function () {
        $("#s_id").attr("value",$(this).attr("put_id"));
        $("#setEmpRorm").attr("action",$(this).attr("put_url")).submit();
        return false;
    });
    $(".p1").click(function () {
        // $("#p_id").attr("value",$(this).attr("put_id"));
        $("#putEmpRorm").attr("action",$(this).attr("put_url")).submit();
        return false;
    });
</script>
<!--<script th:src="@{/static/img/js/jquery-3.2.1.slim.min.js}"></script>-->
<!--data table-->
<script type="text/javascript" src="/static/js/data-tables/jquery.dataTables.js"></script>
<script type="text/javascript" src="/static/js/data-tables/DT_bootstrap.js"></script>

<!--common scripts for all pages-->
<!--<script src="/static/js/scripts.js"></script>-->

<!--script for editable table-->
<script src="/static/js/editable-table.js"></script>

<!-- END JAVASCRIPTS -->
<script>
    jQuery(document).ready(function() {
        EditableTable.init();
    });
</script>

</body>
</html>
