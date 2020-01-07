<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>修改书籍</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改书籍</small>
                </h1>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/book/UpdateBook">
        <div class="form-group">
            <input type="hidden" name="bookID" value="${book.bookID}">
            <label>书籍名称:</label>
            <input type="text" class="form-control" name="bookName" value="${book.bookName}" required autocomplete="off">
            <label>书籍数量:</label>
            <input type="text" class="form-control" name="bookCounts" value="${book.bookCounts}" required autocomplete="off">
            <label>书籍详情:</label>
            <input type="text" class="form-control" name="detail" value="${book.detail}" required autocomplete="off">
            <br>
            <button type="submit" class="btn btn-default form-control">修改</button>
        </div>
    </form>

</div>