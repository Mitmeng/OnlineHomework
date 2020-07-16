<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的作业</title>

<!--right slidebar-->
<link href="css/slidebars.css" rel="stylesheet">
<!--  Fluid Grid System -->
<link rel="stylesheet" type="text/css" href="css/fluid.css"  media="screen" />
<!--  Main Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/dandelion.css"  media="screen" />


</head>
<body>


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
                    <p>您还没有作业，请确保您已经选课了！</p>
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
	                我的作业管理
	            </span>
	        </div>
	        <div class="da-panel-content">
	            <table id="da-ex-datatable-numberpaging" class="da-table">
	                <thead>
	                    <tr>
	                    	<th>课程号</th>
	                        <th>课程名称</th>
	                        <th>作业名称</th>
	                        <th>提交状态</th>
	                        <th>批改状态</th>
	                        <th>操作</th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<c:forEach items="${homeworklist}" var="itemts" varStatus="status">
	                		<tr>
	                			<td>${itemts.courseid }</td>
		                        <td>
		                        	${itemts.coursename }
		                        </td>
		                        <td>
		                        	${itemts.title }
		                        </td>
		                        <c:if test="${stuhomeworklist[status.count-1].submits==0 }">
		                        	<td>
		                        		未提交
		                        	</td>
		                        </c:if>
		                        <c:if test="${stuhomeworklist[status.count-1].submits==1 }">
		                        	<td>
		                        		已提交
		                        	</td>
		                        </c:if>
		                        <c:if test="${stuhomeworklist[status.count-1].score==0 }">
		                        	<td>
		                        		未批改
		                        	</td>
		                        </c:if>
		                        <c:if test="${stuhomeworklist[status.count-1].score!=0 }">
		                        	<td>
		                        		已批改-成绩  ${stuhomeworklist[status.count-1].score }
		                        	</td>
		                        </c:if>
		                        <td>
		                        	<c:if test="${stuhomeworklist[status.count-1].submits==1 }">
		                        		<c:if test="${itemts.homeworktype==1 }">
		                        			<a href="choicedetail?homeworkid=${stuhomeworklist[status.count-1].id }#iframecont" target="iframecont" ><img src="img/icons/magnifier.png"  /></a>
		                        		</c:if>
		                        		<c:if test="${itemts.homeworktype!=1 }">
		                        			<a href="detailcontent?homeworkid=${itemts.id }&stuhomeworkid=${stuhomeworklist[status.count-1].id }#iframecont" target="iframecont" ><img src="img/icons/magnifier.png"  /></a>
		                        		</c:if>
		                        		
		                        	</c:if>
                                	<c:if test="${stuhomeworklist[status.count-1].submits==0 }">
		                        		<a href="homeworkdetails?homeworkid=${itemts.id }&homeworktype=${itemts.homeworktype }&jump=2#iframecont" target="iframecont" ><img src="img/icons/text_signature.png"  /></a>
		                        	</c:if>
                                </td>
	                    	</tr>
	                	</c:forEach>
	                </tbody>
	            </table>
	        </div>
	    </div>
	</div>
</c:if>
<div class="grid_4">
		<iframe src="" name="iframecont" id="iframecont" style="padding-bottom:0px;background: #f3f3f3;min-height: 600px;width: 100%;position: relative;" frameborder="0" scrolling="auto">
		</iframe>

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