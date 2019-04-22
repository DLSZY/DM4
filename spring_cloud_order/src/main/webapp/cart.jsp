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
    <title>购物车列表</title>
    <script src="static/js/jquery-3.3.1.min.js" ></script>
    <script src="static/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" href="static/css/bootstrap.css">
    <script>
        $(function () {
            $.post("${pageContext.request.contextPath}/product/findCart",function (result) {
                var table = $("#table").addClass("table table-hover table-bordered");
                var thead = $("<thead>");
                var caption = $("<caption>").text("购物车");
                var titleTdName = $("<th>").text("商品名");
                var titleTdPrice = $("<th>").text("单价");
                var titleCount= $("<th>").text("数量");
                var titleMoney= $("<th>").text("价格");
                var titleCaption = $("<th>").text("操作");
                var titleTr = $("<tr>").append(titleTdName).append(titleTdPrice).append(titleCount).append(titleMoney).append(titleCaption);
                thead.append(titleTr)
                table.append(caption).append(thead);

                var allMoney = 0;
                var tbody = $("<tbody>");
                $.each(result,function (key,value) {
                    var itemTr = $("<tr>");
                    var item = value.productInfo;
                    var nameTd = $("<td>").text(item.productName);
                    var priceTd = $("<td>").text(item.productPrice);
                    var countTd = $("<td>").text(value.count);
                    var moneyTd = $("<td>").text(value.count*item.productPrice);
                    allMoney += value.count*item.productPrice;
                    var captionTd = $("<td>");
                    var ca = $("<a>").text("删除").attr({"href":"javascript:addcart("+key+")"});
                    captionTd.append(ca);
                    itemTr.append(nameTd).append(priceTd).append(countTd).append(moneyTd).append(captionTd);
                    tbody.append(itemTr);
                })
                $("#all").text(allMoney+"元");
                table.append(tbody);
            })
        })
    </script>
</head>
<body>
<%--导航--%>
<%@include file="nav.jsp" %>
<div class="container" id="main">
    <table id="table">
    </table>

    <lable><span style="color: red;font-weight: bold">总价格：</span><span id="all"></span></lable>
    <button class="btn btn-primary pull-right" data-toggle="modal" data-target="#myModal">结算</button>
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">填写个人信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">名字</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="name" placeholder="请输入名字">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address" class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="phone" placeholder="请输入电话">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address" class="col-sm-2 control-label">地址</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="address" placeholder="请输入地址">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address" class="col-sm-2 control-label">微信</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="openid" placeholder="请输入微信">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">提交更改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>