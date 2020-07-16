<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>作业详情</title>

<!--  Fluid Grid System -->
<link rel="stylesheet" type="text/css" href="css/fluid.css"  media="screen" />
<!--common style-->
<link href="css/style.css" rel="stylesheet">
<!--  Main Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/dandelion.css"  media="screen" />
<link rel="stylesheet" href="css/plugins/syntaxhighlighter/prettify/prettify.min.css"  media="screen" />
<link rel="stylesheet" href="css/plugins/syntaxhighlighter/styles/style.min.css"  media="screen" />
<link rel="stylesheet" href="css/plugins/syntaxhighlighter/styles/theme-balupton.css"  media="screen" />
<link rel="stylesheet" href="css/plugins/syntaxhighlighter/styles/theme-google.css"  media="screen" />
</head>
<body style="background: #f3f3f3;width: 100%;position: relative;">

<section class="panel">
   <header class="panel-heading">
   <img src="img/book_open.png"  alt="" />
       作业详情:
       <span class="tools pull-right">
         <a class="fa fa-repeat box-refresh" href="javascript:;"></a>
         <a class="t-collapse fa fa-chevron-down" href="javascript:;"></a>
         <a class="t-close fa fa-times" href="javascript:;"></a>
      </span>
   </header>
   <div class="panel-body">
   		<c:if test="${homework.homeworktype!=2}">
   		<div class="da-panel-widget">
	    	<h4>题目--${homework.title }</h4>
	        <p style="border-left:4px solid #a6d037;font-size:14px;padding:10px">${homework.content }</p>
	    </div>
	    </c:if>
      <div class="da-panel-widget">
	   	<h4></h4>
	       <c:if test="${homework.homeworktype==2||homework.homeworktype==4 }">
			<p>${stuhomework.content }</p>
			</c:if>
	       <c:if test="${homework.homeworktype==3 }">
			<pre id="mypre" class="language-javascript"  style="border-left:4px solid #a6d037;font-size:24px;font-family: "微软雅黑";padding:10px">
			${stuhomework.content }
			</pre>
			</c:if>
	   </div>
   </div>
</section>



<!-- Placed js at the end of the document so the pages load faster -->
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/jquery-migrate.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>
<!--Nice Scroll-->
<script src="js/jquery.nicescroll.js" type="text/javascript"></script>

<!--right slidebar-->
<script src="js/slidebars.min.js"></script>

<!--summernote-->
<script src="js/summernote/dist/summernote.min.js"></script>
<!-- Demo JavaScript Files -->
<script type="text/javascript" src="js/demo/demo.typography.js" ></script>
<!-- Syntax Highlighter, depends on google prettify -->
<script type="text/javascript" src="css/plugins/syntaxhighlighter/prettify/prettify.min.js" ></script>
<script type="text/javascript" src="css/plugins/syntaxhighlighter/jquery.syntaxhighlighter.min.js" ></script>		
<!--common scripts for all pages-->
<script src="js/scripts.js"></script>
</body>
</html>