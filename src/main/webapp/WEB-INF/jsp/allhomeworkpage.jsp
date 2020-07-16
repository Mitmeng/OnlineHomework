<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!--right slidebar-->
<link href="css/slidebars.css" rel="stylesheet">
<!--  Fluid Grid System -->
<link rel="stylesheet" type="text/css" href="css/fluid.css"  media="screen" />
<!--  Main Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/dandelion.css"  media="screen" />

</head>

<body>

<c:if test="${allhomework==null||fn:length(allhomework)==0 }">
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
                    <p>您还没有添加任何作业，请确保您已经添加作业了！</p>
               </div>
               <div class="da-message info">
               </div>
           </div>
       </div>
</c:if>
<c:if test="${allhomework!=null||fn:length(allhomework)!=0 }">
	<div class="grid_4">
		<div class="da-panel collapsible">
	    	<div class="da-panel-header">
	        	<span class="da-panel-title">
	                <img src="img/icons/list.png"  alt="" />
	                作业管理
	            </span>
	        </div>
	        <div class="da-panel-content">
	            <table id="da-ex-datatable-numberpaging" class="da-table">
	                <thead>
	                    <tr>
	                    	<th>课程号</th>
	                        <th>课程名称</th>
	                        <th>作业类型</th>
	                        <th>作业标题</th>
	                        <th>已提交人数</th>
	                        <th>操作</th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<c:forEach items="${allhomework}" var="itemts" varStatus="status">
	                		<tr>
	                			<td>${itemts.courseid }</td>
		                        <td>
		                        	${itemts.coursename }
		                        </td>
		                        <c:if test="${itemts.homeworktype==1 }">
		                        	<td>
		                        		选择题
		                        	</td>
		                        </c:if>
		                         <c:if test="${itemts.homeworktype==2 }">
		                        	<td>
		                        		填空题
		                        	</td>
		                        </c:if>
		                         <c:if test="${itemts.homeworktype==3 }">
		                        	<td>
		                        		编程题
		                        	</td>
		                        </c:if>
		                         <c:if test="${itemts.homeworktype==4 }">
		                        	<td>
		                        		小论文题
		                        	</td>
		                        </c:if>
		                        <td>
		                        	${itemts.title }
		                        </td>
		                       	<td>
		                        	${itemts.content }
		                        </td>
		                        <td>
	                        		<a href="homeworkdetail?id=${itemts.id }&homeworktype=${itemts.homeworktype }&flag=1#ifracont"  target="ifracont" ><img src="img/icons/magnifier.png"  /></a>                      	
	                        		<a href="homeworkdetail?id=${itemts.id }&homeworktype=${itemts.homeworktype }&flag=2#ifracont" target="ifracont" ><img src="img/icons/text_signature.png"  /></a>
	                        		<a href="javascript:;" onclick="deleteCourse(${itemts.id })"><img src="img/icons/cross.png"  /></a>	                        	
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
	<iframe src="" name="ifracont" id="ifracont" style="padding-bottom:0px;background: #f3f3f3;min-height: 600px;width: 100%;position: relative;" frameborder="0" scrolling="auto">
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


<script type="text/javascript">
function deleteCourse(id) {
	if(confirm('确实要删除吗?')) {
		$.post("delhomeworkById",{"id":id},function(data){
			alert("删除成功！");
			window.location.reload();
		});
	}
};
</script>
</body>
</html>