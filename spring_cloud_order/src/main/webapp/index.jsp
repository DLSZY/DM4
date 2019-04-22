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
    <title>商品列表</title>
    <script src="static/js/jquery-3.3.1.min.js" ></script>
    <link rel="stylesheet" href="static/css/bootstrap.css">
    <script>
        $(function () {
            $.post("${pageContext.request.contextPath}/product/findAll",function (result) {
                var datas = result.data;
                //console.log(datas);
                for(var i = 0;i<datas.length;i++){
                    var table = $("<table>").addClass("table table-hover table-bordered");
                    var caption = $("<caption>").text(datas[i].name);

                    /*表头*/
                    var titleTdName = $("<th>").text("商品名");
                    var titleTdPrice = $("<th>").text("单价");
                    var titleDesc= $("<th>").text("商品简介");
                    var titleCaption = $("<th>").text("操作");
                    var tr = $("<tr>").append(titleTdName).append(titleTdPrice).append(titleDesc).append(titleCaption);
                    var thead = $("<thead>").append(tr);
                    table.append(caption).append(thead);

                    /*表体*/
                    var tbody = $("<tbody>");
                    var foots = $(datas[i])[0].foots;

                    $(foots).each(function (i,e) {
                        var nameTd = $("<td>").text(e.name);
                        var priceTd = $("<td>").text(e.price);
                        var descTd= $("<td>").text(e.description);
                        var ca = $("<a>").text("添加购物车").attr({"href":"javascript:addcart("+e.id+")"});
                        var captionTd = $("<td>").append(ca);

                        var tr = $("<tr>").append(nameTd).append(priceTd).append(descTd).append(captionTd);
                        tbody.append(tr);
                    })

                    table.append(caption).append(tbody);
                    $("#main").append(table);
                }
            })
        })
        function addcart(id) {
            $.post("${pageContext.request.contextPath}/product/addCart",{"id":id});
        }
    </script>
</head>
<body>
<%--导航--%>
<%@include file="nav.jsp" %>
<div class="container" id="main">

</div>

</body>
</html>