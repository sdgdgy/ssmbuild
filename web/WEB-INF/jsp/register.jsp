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
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
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
                    <h1>欢迎注册</h1>
                  </div>
                  <p>注册界面</p>
                </div>
              </div>
            </div>
            <!-- Form Panel    -->
            <div class="col-lg-6 bg-white">
              <div class="form d-flex align-items-center">
                <div class="content">
                    <form action="${pageContext.request.contextPath}/book/register" method="post" id="re_user">
                    <div class="form-group">
                      <input id="register-username" class="input-material" type="text" name="id" placeholder="请输入用户名/姓名" required>
								      <div class="invalid-feedback">
								        	用户名已经存在
								      </div>
                    </div>
                    <div class="form-group">
                      <input id="register-password" class="input-material" type="password" name="password" placeholder="请输入密码"   >
                    	<div class="invalid-feedback">
								        	密码必须在6~10位之间
								      </div>
                    </div>
                    <div class="form-group">
                      <input id="register-passwords" class="input-material" type="password" name="passwords" placeholder="确认密码"   >
                    	<div class="invalid-feedback">
								        	两次密码必须相同 且在6~10位之间
								      </div>
                    </div>
                    <div class="form-group">
                      <button id="regbtn" type="button" name="registerSubmit" class="btn btn-primary">注册</button>
                    </div>
                  <small>已有账号?</small><a href="${pageContext.request.contextPath}/book/toLogin" class="signup">&nbsp;登录</a>
                    </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- JavaScript files-->
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/bootstrap.min.js"></script>
    <script>
    	$(function(){
    		/*错误class  form-control is-invalid
    		正确class  form-control is-valid*/
    		var flagName=false;
    		var flagPas=false;
    		var flagPass=false;
    		/*验证用户名*/
    		var name,passWord,passWords;
    		$("#register-username").change(function(){
              name=$("#register-username").val();
    		  $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/book/ReId",
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                data:{"id":name},
                success:function (data) {
                  if(data.toString()=="true"){
                      $("#register-username").removeClass("form-control is-invalid")
                      $("#register-username").addClass("form-control is-valid");
                    flagName=true;
                  }else{
                      $("#register-username").removeClass("form-control is-valid")
                      $("#register-username").addClass("form-control is-invalid");
                    flagName=false;
                  }
                }
              })
    		/*验证密码*/
    		$("#register-password").change(function(){
    			passWord=$("#register-password").val();
    			if(passWord.length<6||passWord.length>18){
    				$("#register-password").removeClass("form-control is-valid")
    				$("#register-password").addClass("form-control is-invalid");
    				flagPas=false;
    			}else{
    				$("#register-password").removeClass("form-control is-invalid")
    				$("#register-password").addClass("form-control is-valid");
    				flagPas=true;
    			}
    		})
    		/*验证确认密码*/
    		$("#register-passwords").change(function(){
    			passWords=$("#register-passwords").val();
    			if((passWord!=passWords)||(passWords.length<6||passWords.length>18)){
    				$("#register-passwords").removeClass("form-control is-valid")
    				$("#register-passwords").addClass("form-control is-invalid");
    				flagPass=false;
    			}else{
    				$("#register-passwords").removeClass("form-control is-invalid")
    				$("#register-passwords").addClass("form-control is-valid");
    				flagPass=true;
    			}
    		})


    		$("#regbtn").click(function(){
    			if(flagName&&flagPas&&flagPass){
                    $("#re_user").submit();
    			}else{
    				if(!flagName){
    					$("#register-username").addClass("form-control is-invalid");
    				}
    				if(!flagPas){
    					$("#register-password").addClass("form-control is-invalid");
    				}
    				if(!flagPass){
    					$("#register-passwords").addClass("form-control is-invalid");
    				}
    			}
    		})
    	})
        })
    </script>
  </body>
</html>