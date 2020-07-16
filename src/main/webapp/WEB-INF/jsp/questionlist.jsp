<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Theme Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/dandelion.theme.css"  media="screen" />
<!-- Demo Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/demo.css"  media="screen" />
<!--  Fluid Grid System -->
<link rel="stylesheet" type="text/css" href="css/fluid.css"  media="screen" />
<!--  Main Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/dandelion.css"  media="screen" />

</head>
<body >
<div class="grid_4">
	<div class="da-panel collapsible">
    	<div class="da-panel-header">
        	<span class="da-panel-title">
                <input type="button" style="padding: 6px 12px;background-color: #a978d1;border-color: #a978d1;color: #FFFFFF;border: 1px solid transparent;border-radius: 4px;" onclick="javascript:history.back(-1);"  value="返回"/>
                题库列表
            </span>
        </div>
        <div class="da-panel-content">
            <table id="da-ex-datatable-numberpaging" class="da-table">
                <thead>
                    <tr>
                    	<th></th>
                        <th>所属课程</th>
                        <th>知识点</th>
                        <th>题目内容</th>
                        
                    </tr>
                </thead>
                <tbody>
                	<c:forEach items="${homeworklist}" var="itemt" varStatus="status">
                		<tr>
                			<td>
                                <a href="javascript:;"onclick='add(${itemt.id },${itemt.homeworktype })'>添加</a>
                            </td>
	                        <td>${itemt.coursename }</td>
	                        <td>
	                        	${itemt.title }
                        	</td>
	                        <td>
	                        	${itemt.content }
	                        </td>
	                        
                    	</tr>
                	</c:forEach>
                </tbody>
            </table>
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

<script type="text/javascript">

function add(homeworkid,homeworktype){
	var homeworklistid = ${homeworklistid};
	$.ajax({
		type:"POST",
		url:"addquestion",
		data:{"homeworkid":homeworkid,"homeworktype":homeworktype,"homeworklistid":homeworklistid},
		dataType:"json",
		success:function(data){
			if(data["msg"]=="success"){
				alert("添加成功！");
				var id = data["homeworklistid"];
				window.location.href="${pageContext.request.contextPath }/questionslist?homeworklistid="+id;
			}else if(data["msg"]=="havaone"){
				alert("您已添加过本题!");
			}else{
				alert("题目数量已达上限！");
			}
		},
		error:function(){
			alert("添加失败！");
		}
	});
};

</script>

</body>
</html>