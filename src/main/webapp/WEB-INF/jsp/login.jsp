<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="img/ico/favicon.png">
<title>Login</title>

<!-- Base Styles -->
<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet">

</head>
<body class="login-body">

	<div class="login-logo">
          <img src="img/login_logo.png" alt=""/>
      </div>

      <h2 class="form-heading">login</h2>
      <div class="container log-row">
          <form class="form-signin" action="userlogin" method="post">
              <div class="login-wrap">
                  <input type="text" name="userid" class="form-control" placeholder="User ID" autofocus>
                  <input type="password" name="password" class="form-control" placeholder="Password">
                  <button class="btn btn-lg btn-success btn-block" type="submit">LOGIN</button>
                  <label class="checkbox-custom check-success">
                      <input type="checkbox" value="remember-me" id="checkbox1"> <label for="checkbox1">记住我</label>
                      <a class="pull-right" data-toggle="modal" href="#forgotPass"> 忘记密码</a>
                  </label>

                  <div class="registration">
                      	<h4>还没有账号？
                      <a class="" href="registration">
                         	 注册一个
                      </a></h4>
                  </div>

              </div>

              

          </form>
      </div>

      <!--jquery-1.10.2.min-->
      <script src="js/jquery-1.11.1.min.js"></script>
      <!--Bootstrap Js-->
      <script src="js/bootstrap.min.js"></script>
      <script src="js/jrespond.min.js"></script>
      <!-- 消息弹出框提示 -->
  <script type="text/javascript">
      var msg = "${requestScope.msg}" 
      if (msg=="success"){
          alert("注册成功，请登录" );    
      }else if(msg=="error"){
    	  alert("用户名或密码错误" );
 }
  </script>

</body>
</html>