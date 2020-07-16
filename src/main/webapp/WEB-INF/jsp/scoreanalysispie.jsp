<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>人数分布饼状图</title>

<!--  Fluid Grid System -->
<link rel="stylesheet" type="text/css" href="css/fluid.css"  media="screen" />
<!--common style-->
<link href="css/style.css" rel="stylesheet">
<!--  Main Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/dandelion.css"  media="screen" />


</head>
<body style="background: #f3f3f3;min-height: 350px;position: relative;">

<div class="grid_2">
	<div class="da-panel collapsible">
         <div class="da-panel-content">
             <table class="da-table" id="testtable">
                 <thead>
                     <tr>
                     	 <th>课程名称</th>
                         <th>作业标题</th>
                         <th></th>
                     </tr>
                 </thead>
               <tbody>
               	<c:forEach items="${homeworklist}" var="coulist" varStatus="status">
               		<tr id = "${status.count }">
               			<td>${coulist.coursename }</td>
                        <td>${coulist.title }</td>
                        <td class="da-icon-column">
                        	<a id="hide" href="analysipiechildren?homeworkid=${coulist.id }" target="iframepie"><img src="img/icons/magnifier.png"  /></a>
                        </td>
                    </tr>
               	</c:forEach>
               </tbody>
           </table>
       </div>
   </div>
</div>
<div class="grid_2">
	<iframe src="analysipiechildren?homeworkid=${homeworkid }" name="iframepie"  style="padding-bottom:0px;background: #f3f3f3;min-height: 400px;width: 100%;position: relative;" frameborder="0" scrolling="auto"></iframe>
	<!--
    	作者：offline
    	时间：2018-04-15
    	描述：iframe显示的地方
    --> 
 </div>


</body>
</html>