<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编程题详情</title>
<!-- Theme Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/dandelion.theme.css"  media="screen" />
<!-- Demo Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/demo.css"  media="screen" />
<!--  Fluid Grid System -->
<link rel="stylesheet" type="text/css" href="css/fluid.css"  media="screen" />
<!--  Main Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/dandelion.css"  media="screen" />
<link rel="stylesheet" href="css/plugins/syntaxhighlighter/prettify/prettify.min.css"  media="screen" />
<link rel="stylesheet" href="css/plugins/syntaxhighlighter/styles/style.min.css"  media="screen" />
<link rel="stylesheet" href="css/plugins/syntaxhighlighter/styles/theme-balupton.css"  media="screen" />
<link rel="stylesheet" href="css/plugins/syntaxhighlighter/styles/theme-google.css"  media="screen" />
</head>
<body>
<div class="grid_4">
  	<div class="da-panel collapsible">
      	<div class="da-panel-header">
          	<span class="da-panel-title">
                  <img src="img/page_white_paintbrush.png"  alt="Panel" />
                  ${stuhomework.stuid }--作业详情
              </span>
              
         </div>
          <div class="da-panel-content with-padding">
	          	<div class="grid_4">
	           	<h3>${stuhomework.homeworktitle }</h3>
				<pre class="language-javascript">
					${stuhomework.content }				    				
				</pre>
	
	          	</div>
          </div>
    </div>
</div>






<!-- jQuery JavaScript File -->
<script type="text/javascript" src="js/jquery-1.7.2.min.js" ></script>
<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
<!-- Core JavaScript Files -->
<script type="text/javascript" src="js/core/dandelion.core.js" ></script>
<!-- Demo JavaScript Files -->
<script type="text/javascript" src="js/demo/demo.typography.js" ></script>
<!-- Syntax Highlighter, depends on google prettify -->
<script type="text/javascript" src="css/plugins/syntaxhighlighter/prettify/prettify.min.js" ></script>
<script type="text/javascript" src="css/plugins/syntaxhighlighter/jquery.syntaxhighlighter.min.js" ></script>
</body>
</html>