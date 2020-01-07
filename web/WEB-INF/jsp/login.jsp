<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <link rel="stylesheet" href="https://ajax.aspnetcdn.com/ajax/bootstrap/4.2.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.default.css" id="theme-stylesheet">
  </head>
  <body>
    <div class="page login-page">
      <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
          <div class="row">
            <!-- Logo & Information Panel-->
            <div class="col-lg-6">
              <div class="info d-flex align-items-center">
                <div class="content">
                  <div class="logo">
                    <h1>欢迎登录</h1>
                  </div>
                  <p>图书管理系统</p>
                </div>
              </div>
            </div>
            <!-- Form Panel    -->
            <div class="col-lg-6 bg-white">
              <div class="form d-flex align-items-center">
                <div class="content">
                  <form method="post" action="${pageContext.request.contextPath}/book/login" class="form-validate">
                    <div class="form-group">
                      <input type="text" name="id" required data-msg="请输入用户名" placeholder="用户名" class="input-material">
                    </div>
                    <div class="form-group">
                      <input type="password" name="password" required data-msg="请输入密码" placeholder="密码" class="input-material">
                    </div>
                    <button type="submit" class="btn btn-primary">登录</button>
                  </form>
                  <br />
                  <small>没有账号?</small><a href="${pageContext.request.contextPath}/book/toRegister" class="signup">&nbsp;注册</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- JavaScript files-->
    <script src="${pageContext.request.contextPath}/statics/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/statics/vendor/jquery-validation/jquery.validate.min.js"></script><!--表单验证-->
    <!-- Main File-->
    <script src="${pageContext.request.contextPath}/statics/js/front.js"></script>
  </body>
</html>