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
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>书籍借阅列表 —— 显示所有书籍</small>
                </h1>
            </div>
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
                </tr>
                </thead>

                <tbody>
                <c:forEach var="book" items="${requestScope.get('userborrow')}">
                    <tr>
                        <td style="text-align:center">${book.getBookid()}</td>
                        <td style="text-align:center">${book.getBookname()}</td>
                        <td style="text-align:center">${book.getBookcount()}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>