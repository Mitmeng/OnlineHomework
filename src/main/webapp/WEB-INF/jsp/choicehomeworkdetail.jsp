<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>选择题详情</title>
<!--  Main Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/dandelion.css"  media="screen" />
</head>
<body>
<div class="da-panel-widget">
	<h4>标题--${title }</h4>
	<c:forEach items="${choicehomework}" var="itemt" varStatus="status">
	<div class="da-panel-widget">
		<c:if test="${flag==2 }">
			<input type="button" style="padding: 6px 12px;background-color: #a978d1;border-color: #a978d1;color: #FFFFFF;border: 1px solid transparent;border-radius: 4px;" onclick="update(${itemt.id },1)"  value="修改"/>
			<input type="button" style="padding: 6px 12px;background-color: #a978d1;border-color: #a978d1;color: #FFFFFF;border: 1px solid transparent;border-radius: 4px;" onclick="del(${itemt.id })"  value="删除"/>
		</c:if>
	    <p style="font-size:14px;padding:7px">第${status.count}题. ${itemt.question }</p>
	    <c:if test="${itemt.answera!=null }">
	    	<c:if test="${itemt.correctanswer==1 }">
	    		<p style="padding:3px;text-indent:5em;margin-bottom:3px;color:red;">选项A&nbsp;&nbsp; &nbsp;&nbsp;${itemt.answera }</p>
	    	</c:if>
	    	<c:if test="${itemt.correctanswer!=1 }">
	    		<p style="padding:3px;text-indent:5em;margin-bottom:3px;">选项A&nbsp;&nbsp; &nbsp;&nbsp;${itemt.answera }</p>
	    	</c:if>
	    </c:if>
	    <c:if test="${itemt.answerb!=null }">
	    	<c:if test="${itemt.correctanswer==2 }">
	    		<p style="padding:3px;text-indent:5em;margin-bottom:3px;color:red;">选项B&nbsp;&nbsp; &nbsp;&nbsp;${itemt.answerb }</p>
	    	</c:if>
	    	<c:if test="${itemt.correctanswer!=2 }">
	    		<p style="padding:3px;text-indent:5em;margin-bottom:3px">选项B&nbsp;&nbsp; &nbsp;&nbsp;${itemt.answerb }</p>
	    	</c:if>
	    	
	    </c:if>
	    <c:if test="${itemt.answerc!=null }">
	    	<c:if test="${itemt.correctanswer==3 }">
	    		<p style="padding:3px;text-indent:5em;margin-bottom:3px;color:red;">选项C&nbsp;&nbsp;&nbsp; ${itemt.answerc }</p>
	    	</c:if>
	    	<c:if test="${itemt.correctanswer!=3 }">
	    		<p style="padding:3px;text-indent:5em;margin-bottom:3px">选项C&nbsp;&nbsp;&nbsp; ${itemt.answerc }</p>
	    	</c:if>
	    	
	    </c:if>
	    <c:if test="${itemt.answerd!=null }">
	    	<c:if test="${itemt.correctanswer==4 }">
	    		<p style="padding:3px;text-indent:5em;margin-bottom:3px;color:red;">选项D&nbsp;&nbsp;&nbsp; ${itemt.answerd }</p>
	    	</c:if>
	    	<c:if test="${itemt.correctanswer!=4 }">
	    		<p style="padding:3px;text-indent:5em;margin-bottom:3px">选项D&nbsp;&nbsp;&nbsp; ${itemt.answerd }</p>
	    	</c:if>
	    	
	    </c:if>
	    <c:if test="${itemt.answere!=null}">
	    	<c:if test="${itemt.correctanswer==5 }">
	    		<p style="padding:3px;text-indent:5em;margin-bottom:3px;color:red;">选项E&nbsp;&nbsp;&nbsp;${itemt.answere }</p>
	    	</c:if>
	    	<c:if test="${itemt.correctanswer!=5 }">
	    		<p style="padding:3px;text-indent:5em;margin-bottom:3px">选项E&nbsp;&nbsp;&nbsp;${itemt.answere }</p>
	    	</c:if>
	    	
	    </c:if>
	    <c:if test="${itemt.answerf!=null }">
	    	<c:if test="${itemt.correctanswer==6 }">
	    		<p style="padding:3px;text-indent:5em;margin-bottom:3px;color:red;">选项F&nbsp;&nbsp;&nbsp; ${itemt.answerf }</p>
	    	</c:if>
	    	<c:if test="${itemt.correctanswer!=6 }">
	    		<p style="padding:3px;text-indent:5em;margin-bottom:3px">选项F&nbsp;&nbsp;&nbsp; ${itemt.answerf }</p>
	    	</c:if>
	    	
	    </c:if>
	    <c:if test="${itemt.answerg!=null }">
	    	<c:if test="${itemt.correctanswer==7 }">
	    		<p style="padding:3px;text-indent:5em;margin-bottom:3px;color:red;">选项G&nbsp;&nbsp; ${itemt.answerg }</p>
	    	</c:if>
	    	<c:if test="${itemt.correctanswer!=7 }">
	    		<p style="padding:3px;text-indent:5em;margin-bottom:3px">选项G&nbsp;&nbsp; ${itemt.answerg }</p>
	    	</c:if>
	    	
	    </c:if>
	 </div>
	</c:forEach>
</div>
	
<!-- Placed js at the end of the document so the pages load faster -->
<script src="js/jquery-1.10.2.min.js"></script>
<script>
function del(id){
	if(confirm("确定删除所选项目?")){
	 $.ajax({  
	        type:"POST",  
	        url:"delChoice",  
	        data:{"id":id},  
	        datatype:"html",  
	        success:function(data){  
	        	alert('删除成功!'); 
	            location.reload();//页面刷新  
	        },  
	        error:function(){  
	            alert('删除失败!');  
	        }  
	    });
	}
};
function update(id,flag){
	window.location.href="${pageContext.request.contextPath }/forupdatechoice?id="+id+"&flag="+flag;
}
</script>
</body>
</html>