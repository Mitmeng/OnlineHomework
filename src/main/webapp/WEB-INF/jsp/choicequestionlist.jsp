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
                        <th>题目内容</th>
                        <th>选项A</th>
                        <th>选项B</th>
                        <th>选项C</th>
                        <th>选项D</th>
                        
                    </tr>
                </thead>
                <tbody>
                	<c:forEach items="${homeworklist}" var="itemt" varStatus="status">
                		<tr>
	                        <td>
                                <a href="javascript:;"onclick='add(${itemt.id })'>添加</a>
                            </td>
	                        <td>${itemt.question }</td>
	                        <td>
	                        	${itemt.answera }
                        	</td>
	                        <td>
	                        	${itemt.answerb }
	                        </td>
	                        <td>
	                        	${itemt.answerc }
                        	</td>
	                        <td>
	                        	${itemt.answerd }
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
$('.da-table').colResizable();

function add(homeworkid){
	homeworklistid = ${homeworklistid};
	$.post("addquestion",{"homeworkid":homeworkid,"homeworktype":1,"homeworklistid":homeworklistid},function(data){
		if(data["msg"]=="success"){
			alert("添加成功！");
			var id = data["homeworklistid"];
			window.location.href="${pageContext.request.contextPath }/questionslist?homeworklistid="+id;
		}else if(data["msg"]=="havaone"){
			alert("您已添加过本题!");
		}else{
			alert("题目数量已达上限！");
		}
		
	});
};

</script>
</body>
</html>