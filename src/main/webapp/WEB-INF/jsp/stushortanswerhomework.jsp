<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Stu Homework</title>

<!--  Main Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/dandelion.css"  media="screen" />
<!-- Demo Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/demo.css"  media="screen" />
<link rel="stylesheet" type="text/css" href="js/jui/css/jquery.ui.all.css"  media="screen" />

</head>
<body>

	<div class="da-panel">
       	<div class="da-panel-header">
           	<span class="da-panel-title">
                   <img src="img/icons/ui_saccordion.png"  alt="" /> 学生作业
            </span>
        </div>
        <div id="da-ex-accordion">
        	<c:forEach items="${stuhomeworklist}" var="item">
	            <h3><a href="#">${item.stuid }</a></h3>
	            <div>
	                <p>
	                ${item.content}
	                </p>
	            </div>
            </c:forEach>
        </div>
    </div>
<!-- jQuery JavaScript File -->
<script type="text/javascript" src="js/jquery-1.7.2.min.js" ></script>

<!-- jQuery-UI JavaScript Files -->
<script type="text/javascript" src="js/jui/js/jquery-ui-1.8.20.min.js" ></script>

<!-- Demo JavaScript Files -->
<script type="text/javascript" src="js/demo/demo.ui.js" ></script>

</body>
</html>