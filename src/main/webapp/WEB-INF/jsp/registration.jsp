<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="img/ico/favicon.png">
<title>Registration</title>

	 <!-- Base Styles -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet">
    
     <!--jquery-1.10.2.min-->
    <script src="js/jquery-1.10.2.min.js"></script>
    <!--Bootstrap Js-->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jrespond.min.js"></script>
    <script src="js/jquery.validate.min.js" type="text/javascript"></script>


<script type="text/javascript">

	$(function(){
		$("#myform").validate({
			rules:{
				"userid":{
					"required":true
				},
				"username":{
					"required":true
				},
				"password":{
					"required":true,
					"rangelength":[6,12]
				},
				"repassword":{
					"required":true,
					"rangelength":[6,12],
					"equalTo":"#password"
				}
			},
			messages:{
				"userid":{
					"required":"学号/职工号 不能为空"
				},
				"username":{
					"required":"用户名不能为空"
				},
				"password":{
					"required":"密码不能为空",
					"rangelength":"密码长度6-12位"
				},
				"repassword":{
					"required":"密码不能为空",
					"rangelength":"密码长度6-12位",
					"equalTo":"两次密码不一致"
				},
			}
		});
	});

</script>


</head>
<body class="login-body">

	<div class="login-logo">
          <img src="img/login_logo.png" alt=""/>
      </div>

      <h2 class="form-heading">现 在 注 册</h2>
      <div class="container log-row">
          <form id="myform" class="form-signin" action="userregisration" method="post">
              <p>在下面输入您的帐户详细信息 </p>
              <input type="text" id="userid" name="userid" class="form-control"  placeholder="学号 / 教职工号" autofocus>
              <div id="errorAccount" style="color:red;display:inline;"></div>
              <input type="text" id="username" name="username"class="form-control" placeholder="用户名" autofocus>
              <input type="password" id="password" name="password" class="form-control" placeholder="密码">
              <input type="password" id="repassword" name="repassword" class="form-control" placeholder="确认密码">
              <div class="radio-custom radio-success">
                  <input type="radio" value="0" checked="checked" name="usertype" id="student">
                  <label for="student">学生</label>
                  <input type="radio" value="1" name="usertype" id="teacher" >
                  <label for="teacher">教师</label>
              </div>

              
              <button class="btn btn-lg btn-success btn-block" type="submit">提交</button>

              <div class="registration m-t-20 m-b-20">
                  	<h4>已经注册
                  <a class="" href="login">
                      	登录
                  </a></h4>
              </div>
          </form>
      </div>

  
	

</body>
</html>
<script type="text/javascript">
      var msg = "${requestScope.msg}" 
      if (msg=="success"){
          alert("注册成功，请登录" );    
      }else if(msg=="error"){
    	  alert("该用户已存在" );
 }
  </script>