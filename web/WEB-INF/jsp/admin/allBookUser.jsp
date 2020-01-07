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
        function value(id,bookid,bookcount) {
            document.getElementById("bookid").href="${pageContext.request.contextPath}/userbook/del/?id="+id+"&bookid="+bookid+"&bookcount="+bookcount;
        }
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
<!--模态框-->
<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body">
                <p>是否归还</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
<%--                <a type="button" class="btn btn-primary" id="bookid" href="${pageContext.request.contextPath}/book/del/?id=${book.getBookID()}">确定</a>--%>
                <a type="button" class="btn btn-primary" id="bookid" href="">确定</a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
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

    <div class="row">
        <div class="col-md-12 column">
            <!--查询表单-->
            <form class="form-inline" style="float: right" action="${pageContext.request.contextPath}" method="post">
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
                    <th style="text-align:center">用户</th>
                    <th style="text-align:center">书籍编号</th>
                    <th style="text-align:center">书籍名称</th>
                    <th style="text-align:center">书籍数量</th>
                    <th style="text-align:center">操作</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="userbook" items="${requestScope.get('userbooklist')}">
                    <tr>
                        <td style="text-align:center">${userbook.getId()}</td>
                        <td style="text-align:center">${userbook.getBookid()}</td>
                        <td style="text-align:center">${userbook.getBookname()}</td>
                        <td style="text-align:center">${userbook.getBookcount()}</td>
                        <td style="text-align:center">
                            <a href="#myModal" data-toggle="modal" onclick="value(${userbook.getId()},${userbook.getBookid()},${userbook.getBookcount()})">归还</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>