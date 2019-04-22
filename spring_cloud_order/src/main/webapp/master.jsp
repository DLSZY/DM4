<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>个人地址信息</title>
    <script src="static/js/jquery-3.3.1.min.js" ></script>
    <link rel="stylesheet" href="static/css/bootstrap.css">
    <script>

    </script>
</head>
<body>
<%--导航--%>
<%@include file="nav.jsp" %>
<div class="container" id="main">
    <form class="form-horizontal" role="form">
        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">名字</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="firstname" placeholder="请输入名字">
            </div>
        </div>
        <div class="form-group">
            <label for="address" class="col-sm-2 control-label">电话</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="phone" placeholder="请输入电话">
            </div>
        </div>
        <div class="form-group">
            <label for="address" class="col-sm-2 control-label">地址</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="address" placeholder="请输入地址">
            </div>
        </div>
        <div class="form-group">
            <label for="address" class="col-sm-2 control-label">微信</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="openid" placeholder="请输入微信">
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">提交订单</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>