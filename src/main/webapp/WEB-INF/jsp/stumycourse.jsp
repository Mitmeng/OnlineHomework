<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Stu Course</title>
<!--  Main Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/dandelion.css"  media="screen" />
<!--right slidebar-->
<link href="css/slidebars.css" rel="stylesheet">


</head>
<body style="background: #f3f3f3;min-height: 600px;position: relative;">
	
     <div class="grid_4">
      	<div class="da-panel collapsible">
          	<div class="da-panel-header">
              	<span class="da-panel-title">
                      <img src="img/icons/list.png"  alt="" />
                     我的课程
                  </span>
                  
              </div>
              <div class="da-panel-content">
                  <table id="da-ex-datatable-numberpaging" class="da-table">
                      <thead>
                          <tr>
                              <th>课程号</th>
                              <th>课程名称</th>
                              <th>教师</th>
                              <th>选课人数</th>
                          </tr>
                      </thead>
                      <tbody id="tbody-result">
                      	<c:forEach items="${courselist}" var="coulist" varStatus="status">
					        <tr>
					          <td>${coulist.courseid }</td>
					          <td>${coulist.coursename }</td>
					          <td>${coulist.teachername }</td>
					          <td>${coulist.id }</td>
							</tr>                
					    </c:forEach>
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
	

<!-- Placed js at the end of the document so the pages load faster -->
<script src="js/jquery-1.10.2.min.js"></script>
<!--Nice Scroll-->
<script src="js/jquery.nicescroll.js" type="text/javascript"></script>


<!--Data Table-->
<script src="js/data-table/js/jquery.dataTables.min.js"></script>
<!-- Demo JavaScript Files -->
<script type="text/javascript" src="js/demo/demo.tables.js" ></script>





</body>
</html>