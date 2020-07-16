<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>写作业</title>
<!--right slidebar-->
<link href="css/slidebars.css" rel="stylesheet">
<!--  Fluid Grid System -->
<link rel="stylesheet" type="text/css" href="css/fluid.css"  media="screen" />
<!--  Main Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/dandelion.css"  media="screen" />

</head>
<body>
<div style="background: #f3f3f3;min-height: 800px;position: relative;">
	<c:if test="${homeworklist==null||fn:length(homeworklist)==0 }">
	  	<div class="da-panel">
         	<div class="da-panel-header">
             	<span class="da-panel-title">
                     <img src="img/icons/exclamation.png"  alt="" />
                   温馨提示:
                 </span>
             </div>
             <div class="da-panel-content">
             	<div class="da-message info">
                 </div>
                 <div class="da-message info">
                      <p>GOOD BOY! 您已经做完全部作业，目前还没有新的作业可以做！</p>
                 </div>
                 <div class="da-message info">
                 </div>
             </div>
         </div>
	</c:if>
	<c:if test="${homeworklist!=null||fn:length(stuhomeworklist)!=0 }">
	<div class="grid_4">
		<div class="da-panel collapsible">
	    	<div class="da-panel-header">
	        	<span class="da-panel-title">
	                <img src="img/icons/list.png"  alt="" />
	                我的课程&作业
	            </span>
	        </div>
	        <div class="da-panel-content">
	            <table id="da-ex-datatable-numberpaging" class="da-table">
	                <thead>
	                    <tr>
	                    	<th>课程号</th>
	                        <th>课程名称</th>
	                        <th>作业名称</th>
	                        <th>已提交人数</th>
	                        <th></th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<c:forEach items="${homeworklist}" var="itemt">
	                		<tr>
	                			<td>${itemt.courseid }</td>
		                        <td>
		                        	${itemt.coursename }
		                        </td>
		                        <td>
		                        	${itemt.title }
		                        </td>
		                        <td>
		                        	${itemt.content }
		                        </td>
		                        <td>
                                	<a href="homeworkdetails?homeworkid=${itemt.id }&homeworktype=${itemt.homeworktype }&jump=1#iframecontents" target="iframecontents" ><img src="img/icons/text_signature.png"  /></a>
                                </td>
	                    	</tr>
	                	</c:forEach>
	                </tbody>
	            </table>
	        </div>
	    </div>
	</div>
	</c:if>
	<div class="grid_4" id="colseiframe">
		<iframe src="" name="iframecontents" id="iframecontents" style="padding-bottom:0px;background: #f3f3f3;min-height: 600px;width: 100%;position: relative;" frameborder="0" scrolling="auto">
		</iframe>

	</div>
</div>
<!-- Placed js at the end of the document so the pages load faster -->
<script src="js/jquery-1.10.2.min.js"></script>
<!--Nice Scroll-->
<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
<!-- DataTables Plugin -->
<script type="text/javascript" src="js/data-table/js/jquery.dataTables.min.js" ></script>
<!-- Demo JavaScript Files -->
<script type="text/javascript" src="js/demo/demo.tables.js" ></script>
<!--right slidebar-->
<script src="js/slidebars.min.js"></script>	
<!--common scripts for all pages-->
<script src="js/scripts.js"></script>

</body>
</html>