<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- CDN引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/jquery-ui.css">
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-ui.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function search_box() {
            var availableTags = [];
            var json;
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/book/search",
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                data:{"bookname":$("#search").val()},
                success:function (data) {
                    json=JSON.parse(data.toString());
                    console.log(json);
                    for(var i = 0; i < json.length; i++){
                        availableTags.push(json[i].bookName);
                    }
                    console.log(availableTags);
                    $("#search").autocomplete({
                        source:availableTags
                    });
                }
            });
        }
    </script>
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>书籍列表 —— 显示所有书籍</small>
                </h1>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 column">
<%--            跳转到添加书籍页面--%>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/userbook/userborrow">借阅情况</a>
            <!--查询表单-->
            <form class="form-inline" style="float: right" action="${pageContext.request.contextPath}/book/query" method="post">
                <span style="font-weight:bold;color: red;">${msg}</span>
                <div class="form-group">
                    <input type="text" class="form-control" name="bookName" id="search"  oninput="search_box()" autocomplete="off">
                </div>
                <button type="submit" class="btn btn-primary">查找</button>
            </form>
        </div>
    </div>

<%--    展示所有书籍列表--%>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th style="text-align:center">书籍编号</th>
                    <th style="text-align:center">书籍名字</th>
                    <th style="text-align:center">书籍数量</th>
                    <th style="text-align:center">书籍详情</th>
                    <th style="text-align:center">操作</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="book" items="${requestScope.get('list')}">
                    <tr>
                        <td style="text-align:center">${book.getBookID()}</td>
                        <td style="text-align:center">${book.getBookName()}</td>
                        <td style="text-align:center">${book.getBookCounts()}</td>
                        <td style="text-align:center">${book.getDetail()}</td>
                        <td style="text-align:center">
                            <c:set var="count" value="${book.getBookCounts()}" scope="request" />
                            <c:if test="${count<=0}">
                            <a href="javascript:return false;" style="opacity:0.2">借阅</a>
                            </c:if>
                            <c:if test="${!(count<=0)}">
                                <a href="${pageContext.request.contextPath}/userbook/addUserBook?bookid=${book.getBookID()}&bookname=${book.getBookName()}">借阅</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>