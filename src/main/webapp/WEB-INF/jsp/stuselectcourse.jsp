<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Stu Select Course</title>
<!-- Theme Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/dandelion.theme.css"  media="screen" />
<!--  Main Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/dandelion.css"  media="screen" />
<!-- Demo Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/demo.css"  media="screen" />

</head>
<body>
	
	<div id="da-content-area">
	<div class="grid_4">
   		<div class="da-panel collapsible">
       		<div class="da-panel-header">
           		<span class="da-panel-title">
                   <img src="img/icons/list.png"  alt="" />
                  	选课
               </span>
               
           </div>
           <div class="da-panel-content">
               <table id="da-ex-datatable-numberpaging" class="da-table">
                   <thead>
                       <tr>
                           <th>课程号</th>
                           <th>课程名称</th>
                           <th>教师</th>
                           <th>选课</th>
                       </tr>
                   </thead>
                   <tbody id="tbody-result">
                   	<c:forEach items="${allcourselist}" var="stulist">
                        <tr>
                            <td>${stulist.courseid }</td>
                            <td>${stulist.coursename }</td>
                            <td>${stulist.teacherid }</td>
                            <td class="da-icon-column">
                            	<a href="addcourse?courseid=${stulist.courseid }&coursename=${stulist.coursename }&teachername=${stulist.teacherid }"><img src="img/icons/add.png"  /></a>
                            </td>
                        </tr>
                       </c:forEach>
                   </tbody>
               </table>
           </div>
       </div>
   </div>
</div>
<!-- jQuery JavaScript File -->
<script type="text/javascript" src="js/jquery-1.7.2.min.js" ></script>

<!-- DataTables Plugin -->
<script type="text/javascript" src="js/data-table/js/jquery.dataTables.min.js" ></script>

<!-- Demo JavaScript Files -->
<script type="text/javascript" src="js/demo/demo.tables.js" ></script>

<!-- Core JavaScript Files -->
<script type="text/javascript" src="js/core/dandelion.core.js" ></script>
	
</body>
</html>