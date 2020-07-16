<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程成绩分析</title>
<!--  Fluid Grid System -->
<link rel="stylesheet" type="text/css" href="css/fluid.css"  media="screen" />
<!--common style-->
<link href="css/style.css" rel="stylesheet">
<!--  Main Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/dandelion.css"  media="screen" />

</head>
<body style="background: #f3f3f3;min-height: 400px;position: relative;">
<div id="da-wrapper" class="fluid">
	<!-- Content -->
	<div id="da-content">

		<div class="grid_2">
			<div class="da-panel collapsible">
                 <div class="da-panel-content">
                     <table class="da-table" id="testtable">
                         <thead>
                             <tr>
                             	 <th>课程号</th>
                                 <th>课程名称</th>
                                 <th></th>
                             </tr>
                         </thead>
                       <tbody>
                       	<c:forEach items="${courselist}" var="coulist" varStatus="status">
                       		<tr id = "${status.count }">
                       			<td>${coulist.courseid }</td>
                                <td>${coulist.coursename }</td>
                                <td class="da-icon-column">
                                	<a id="hide" href="analysischildren?courseId=${coulist.courseid }" target="iframes" onclick="pie('${coulist.courseid }')"><img src="img/icons/magnifier.png"  /></a>
                                </td>
                            </tr>
                       	</c:forEach>
                       </tbody>
                   </table>
               </div>
           </div>
		</div>
		<div class="grid_2">
			<iframe src="analysischildren?courseId=xxx" name="iframes"  style="padding-bottom:0px;background: #f3f3f3;min-height: 400px;width: 100%;position: relative;" frameborder="0" scrolling="auto"></iframe>
		     	<!--
		         	作者：offline
		         	时间：2018-04-15
		         	描述：iframe显示的地方
		         -->
	       
         </div>
         <div class="grid_4">
         	<iframe src="scoreanalypie?courseid=xxx" name="myiframes"  style="padding-bottom:0px;background: #f3f3f3;min-height: 400px;width: 100%;position: relative;" frameborder="0" scrolling="auto"></iframe>
         </div>
	</div>
</div>

<!-- jQuery JavaScript File -->
<script type="text/javascript" src="js/jquery-1.10.2.min.js" ></script>
<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
<!--flot chart -->
<script type="text/javascript" src="js/flot-chart/jquery.flot.js"></script>
<script type="text/javascript" src="js/flot-chart/jquery.flot.resize.js"></script>
<script type="text/javascript" src="js/flot-chart/jquery.flot.tooltip.min.js"></script>
<script type="text/javascript" src="js/flot-chart/jquery.flot.pie.js"></script>
<script type="text/javascript" src="js/flot-chart/jquery.flot.selection.js"></script>
<script type="text/javascript" src="js/flot-chart/jquery.flot.stack.js"></script>
<script type="text/javascript" src="js/flot-chart/jquery.flot.crosshair.js"></script>
<script type="text/javascript">
function pie(courseid){
	document.getElementsByName('myiframes')[0].src='scoreanalypie?courseid='+courseid;
};

</script>
</body>
</html>