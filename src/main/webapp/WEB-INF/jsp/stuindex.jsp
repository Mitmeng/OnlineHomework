<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>StuHOME</title>
<!--right slidebar-->
<link href="css/slidebars.css" rel="stylesheet">
<!--common style-->
<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet">
<!--theme color layout-->
<link href="css/layout-theme-one.css" rel="stylesheet">

<style type="text/css">
*{margin: 0 auto;  
    padding: 0;}  
#overDiv {  
    background-color:#000;  
    width: 100%;  
    height: 100%;  
    left: 0;  
    top: 0; /*FF IE7*/  
    filter: alpha(opacity = 65); /*IE*/  
    opacity: 0.65; /*FF*/  
    z-index: 110;  
    position: fixed !important; /*FF IE7*/  
    position: absolute; /*IE6*/  
    _top: expression(eval(document.compatMode &&   
     document.compatMode == 'CSS1Compat')?   
    documentElement.scrollTop+  (document.documentElement.clientHeight-this.offsetHeight  
        )/2: /*IE6*/   
    document.body.scrollTop+  (document.body.clientHeight-  this.clientHeight  
        )/2 ); /*IE5 IE5.5*/  
}  
  
#hsDiv {  
    background:#e7e7e7;  
      
    z-index: 120;  
    width: 450px;  
    height: 380px;  
    left: 43%; /*FF IE7*/  
    top: 37%; /*FF IE7*/  
    margin-left: -150px !important; /*FF IE7 该值为本身宽的一半 */  
    margin-top: -60px !important; /*FF IE7 该值为本身高的一半*/  
    margin-top: 0px;  
    position: fixed !important; /*FF IE7*/  
    position: absolute; /*IE6*/  
    _top: expression(eval(document.compatMode &&   
     document.compatMode == 'CSS1Compat')?   
    documentElement.scrollTop+  (document.documentElement.clientHeight-this.offsetHeight  
        )/2: /*IE6*/   
    document.body.scrollTop+  (document.body.clientHeight-  this.clientHeight  
        )/2 ); /*IE5 IE5.5*/  
}  
  
.lobu {  
    width: 65px;  
    height: 25px;  
    background: #FFFFFF;  
    font-size: 13px;  
    border: #0099CC solid 1px;  
}  
 
 .error{
      color:red;
     } 
</style>

</head>
<body class="sticky-header">
	
<section>
    <!-- sidebar left start-->
	<div class="sidebar-left">
	    <!--responsive view logo start-->
	    <div class="logo theme-logo-bg visible-xs-* visible-sm-*">
	        <a href="redirect:forstuindex">
	            <img src="img/logo-icon.png" alt="">
	            <!--<i class="fa fa-maxcdn"></i>-->
	            <span class="brand-name">Online Homework</span>
	        </a>
	    </div>
	    <!--responsive view logo end-->
	
	    <div class="sidebar-left-info">
	        <!-- visible small devices start-->
	        <div class=" search-field">  </div>
	        <!-- visible small devices start-->
	
	        <!--sidebar nav start-->
	        <ul class="nav nav-pills nav-stacked side-navigation">
	            <li>
	                <h3 class="navigation-title">导航</h3>
	            </li>
	            <li class="active"><a href="redirect:forstuindex"><i class="fa fa-home"></i> <span>首页</span></a></li>
	            <li class="menu-list">
	                <a href=""><i class="fa fa-book"></i>  <span>我的课程</span></a>
	                <ul class="child-list">
	                    <li><a href="stumycourselist" target="iframecontent"> 我的课程</a></li>
	                    <li><a href="stueleccourse" target="iframecontent"> 选课</a></li>
	                    <!--<li><a href="javascript:;"> Sidebar Collapsed</a></li>
	                    <li><a href="javascript:;"> Horizontal Menu</a></li> -->
	                </ul>
	            </li>
	            <li>
	                <h3 class="navigation-title">作业</h3>
	            </li>
	            <li class="menu-list"><a href=""><i class="fa fa-book"></i> <span>作业管理  </span></a>
	                <ul class="child-list">
	                    <li><a href="studohomework" target="iframecontent"> 写作业</a></li>
	                    <li><a href="minehomework" target="iframecontent"> 我的作业</a></li>
	                </ul>
	            </li>
	
	        </ul>
	        <!--sidebar nav end-->
	
	      
	
	    </div>
	</div>
	<!-- sidebar left end-->
	
	<!-- body content start-->
	<div class="body-content" style="min-height: 1000px;">
	
	    <!-- header section start-->
	    <div class="header-section">
	
	        <!--logo and logo icon start-->
	        <div class="logo theme-logo-bg hidden-xs hidden-sm">
	            <a href="index.html">
	                <img src="img/logo-icon.png" alt="">
	                <!--<i class="fa fa-maxcdn"></i>-->
	                <span class="brand-name">桂电在线作业</span>
	            </a>
	        </div>
	
	        <div class="icon-logo theme-logo-bg hidden-xs hidden-sm">
	            <a href="index.html">
	                <img src="img/logo-icon.png" alt="">
	                <!--<i class="fa fa-maxcdn"></i>-->
	            </a>
	        </div>
	        <!--logo and logo icon end-->
	
	        <!--toggle button start-->
	        <a class="toggle-btn"><i class="fa fa-outdent"></i></a>
	        <!--toggle button end-->	        
	        <div class="notification-wrap">
	        <div class="left-notification">
           		<div class="page-head">
			        <h3>
			            欢迎来到桂林电子科技大学——在线作业系统
			        </h3>
			    </div>
           	</div>
	        <!--right notification start-->
	        <div class="right-notification">
	            <ul class="notification-menu">
	                
	
	                <li>
	                    <a href="javascript:;" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
	                        <img src="img/avatar-mini.jpg" alt="">${loginname}
	                        <span class=" fa fa-angle-down"></span>
	                    </a>
	                    <ul class="dropdown-menu dropdown-usermenu purple pull-right">
	                       
	                        <li>
                                 <a  href="javascript:void(0);" onclick="show()" >
                                     <span class="badge bg-danger pull-right">Exchange</span>
                                     <span>修改密码</span>
                                 </a>
                                
                             </li>
	                        <li><a href="login.html"><i class="fa fa-sign-out pull-right"></i> 退出登录</a></li>
	                    </ul>
	                </li>
	                <li>
	                    <div class="sb-toggle-right">
	                        <i class="fa fa-indent"></i>
	                    </div>
	                </li>
	
	            </ul>
	        </div>
	        <!--right notification end-->
	        </div>
	
	    </div>
	    <!-- header section end-->

	    <!--body wrapper start-->
	    <div class="wrapper">
	    	            <!-- 弹出登录表单开始 -->  
			   <div id="hsDiv" style="display:none;">  
			       <!-- 右上角关闭按钮 --> 
			    <div id="closediv" style="margin-left: 440px; margin-top: -10px;" > 
			        <a href="javascript:void(0);" onclick="closeDiv()"><img src="img/icons/cross.png">  
			        </a>  
			    </div>  
			    <!-- 登陆标题 -->  
			    <div id="dlTitle "  style="text-align: center;"><h4>修改密码</h4></div>  
			    <form id="forms" action="updatepassword"  method="post">
			    <!-- 登陆div -->  
			    <div id="tbdiv" style="margin-left: 50px;">
			    	<input id="hiddenpassword" name="hiddenpassword" type="hidden" value="${sessionScope.loginpassword }" />  
			    	<div><label for="oldpassword">请输入原密码</label> </div>
			        <div>
			        	<input style="margin-bottom: 6px;border-radius: 4px;border: 1px solid #3fdfdf;background: #ffffdf;width:80%;height: 34px;padding: 6px 12px; font-size: 14px; line-height: 1.42857143;" type="password" name="oldpassword" id="oldpassword" value=""> 			                
			        </div>
			        <div><label for="newpassword">请输入新密码</label> </div>
			        <div>
			            <input style="margin-bottom: 6px;border-radius: 4px;border: 1px solid #3fdfdf;background: #ffffdf;width:80%;height: 34px;padding: 6px 12px; font-size: 14px; line-height: 1.42857143;" type="password" name="newpassword" id="newpassword" value="">  
			        </div> 
			        <div>
			        <label for="renewpassword">请确认密码</label>
			        </div>
			        <div>      
			            <input style="margin-bottom: 6px;border-radius: 4px;border: 1px solid #3fdfdf;background: #ffffdf;width:80%;height: 34px;padding: 6px 12px; font-size: 14px; line-height: 1.42857143;" type="password" name="renewpassword" id="renewpassword" value="">  
			        </div>      
		              <button style="text-align: center;margin-top: 30px;" class="btn btn-success" type="submit">确认修改</button> 			  
			    </div>
			    </form>  
			</div>  
				<div id="overDiv" style="display:none;"></div>  
	    
	        <iframe src="stumycourselist" name="iframecontent"  style="padding-bottom:0px;background: #f3f3f3;min-height: 900px;width: 100%;position: relative;" frameborder="0" scrolling="auto"></iframe>
           	<!--
               	作者：offline
               	时间：2018-04-15
               	描述：iframe显示的地方
               -->
	    </div>
	    <!--body wrapper end-->
	    
	    <!--footer section start-->
	    <footer>
	        2018 &copy; OnlineHomework by MengFengming.
	    </footer>
	    <!--footer section end-->
	</div>
	<!-- body content end-->
</section>
	
<!-- Placed js at the end of the document so the pages load faster -->
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.validate.min.js" type="text/javascript"></script>

<!--Nice Scroll-->
<script src="js/jquery.nicescroll.js" type="text/javascript"></script>

<!--right slidebar-->
<script src="js/slidebars.min.js"></script>

<!--Sparkline Chart-->
<script src="js/sparkline/jquery.sparkline.js"></script>
<script src="js/sparkline/sparkline-init.js"></script>

<!--common scripts for all pages-->
<script src="js/scripts.js"></script>	

<script type="text/javascript">
window.onload=function()
{
	$.post("seleCouseStuByCouId",function(msg){});
}

function show(){  
    document.getElementById("overDiv").style.display = "block" ;  
    document.getElementById("hsDiv").style.display = "block" ;  
}  
function closeDiv(){  
    document.getElementById("overDiv").style.display = "none" ;  
    document.getElementById("hsDiv").style.display = "none" ;  
}  

$(function(){
	$("#forms").validate({
		rules:{
			"oldpassword":{
				"required":true,
				"equalTo":"#hiddenpassword"
			},
			"newpassword":{
				"required":true,
				"rangelength":[6,12]
			},
			"renewpassword":{
				"required":true,
				"rangelength":[6,12],
				"equalTo":"#newpassword"
			}
		},
		messages:{
			"oldpassword":{
				"required":"请输入原密码",
				"equalTo":"原密码错误"
			},
			"newpassword":{
				"required":"新密码不能为空",
				"rangelength":"密码长度6-12位"
			},
			"renewpassword":{
				"required":"密码不能为空",
				"rangelength":"密码长度6-12位",
				"equalTo":"两次密码不一致"
			},
		}
	});
});    

</script>


		
</body>
</html>