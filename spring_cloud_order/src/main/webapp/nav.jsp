<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%--导航--%>
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#example-navbar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="./index.jsp">网上购物</a>
        </div>
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="index.jsp">商品列表</a></li>
                <li><a href="cart.jsp">购物车</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <p style="padding-left: 15px" class="navbar-text">你好: <a href="#" class="">小黑</a></p>
                <li><a href="javascript:exit()">退出登录 <span class="glyphicon glyphicon-log-out"></span></a></li>
            </ul>
        </div>
    </div>
</nav>
