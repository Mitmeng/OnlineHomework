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
<style type="text/css">
	.form-inlie{display:inline-block;*display:inline;margin-bottom:0;vertical-align:middle;*zoom:1}
</style>
</head>
<body>
<div style="padding: 15px;font-size: 14px;">
	<form class="form-inline" action="questiondetial" method="post" onsubmit="return check()">
		<input type="hidden" name ="count" id="count" value="${count }"/>
		<input type="hidden" name="homeworklistid" id="homeworklistid" value="${homeworklistid }"/>
		<div style="display: inline-block;margin-bottom: 0;vertical-align: middle;">
			<label for="customerFrom">请输入关键词</label>
			<input style="display: inline-block;width: auto;vertical-align: middle;margin-bottom: 6px;border-radius: 4px;border: 1px solid #3fdfdf;height: 30px;font-size: 14px;line-height: 1.42857143;" type="text" id="keyword" name="keyword"/>
		</div>
		<div style="display: inline-block;margin-bottom: 0;vertical-align: middle;">
			<label for="customerFrom">请选择题目类型</label>
			<select style="display: inline-block;width: auto;vertical-align: middle;margin-bottom: 6px;border-radius: 4px;border: 1px solid #3fdfdf;height: 34px;padding: 6px 12px;font-size: 14px;line-height: 1.42857143;color: #555;background-color: #fff;" id="homeworktype" name="homeworktype" data-toggle="selectpicker" >
			<option value="">--请选择--</option>
			<option value="1">选择题</option>
			<option value="2">填空题</option>
			<option value="3">编程题</option>
			<option value="4">简答题</option>
			</select>
		</div>
		<button type="submit" style="padding: 6px 12px;background-color: #a978d1;border-color: #a978d1;color: #FFFFFF;border: 1px solid transparent;border-radius: 4px;" >查询</button>
	
	</form>
</div>
<div class="da-panel-widget">
	<div class="da-panel-widget">
		<h4>标题--${homeworkli.title }</h4>
	    <p style="border-left:4px solid #a6d037;font-size:14px;padding:10px">${homeworkli.content }</p>
	</div>
	<c:if test="${homeworklist!=null}">
		<c:forEach items="${homeworklist}" var="item" varStatus="status">
			<div class="da-panel-widget">
				<c:if test="${item['homeworktype']==1 }">
					<p style="font-size:14px;padding:7px">第${status.count}题. ${item['question'].question }</p>
				    <c:if test="${item['question'].answera!=null }">
				    	<c:if test="${item['question'].correctanswer==1 }">
				    		<p style="padding:3px;text-indent:5em;margin-bottom:3px;color:red;">选项A&nbsp;&nbsp; &nbsp;&nbsp;${item['question'].answera }</p>
				    	</c:if>
				    	<c:if test="${item['question'].correctanswer!=1 }">
				    		<p style="padding:3px;text-indent:5em;margin-bottom:3px;">选项A&nbsp;&nbsp; &nbsp;&nbsp;${item['question'].answera }</p>
				    	</c:if>
				    </c:if>
				    <c:if test="${item['question'].answerb!=null }">
				    	<c:if test="${item['question'].correctanswer==2 }">
				    		<p style="padding:3px;text-indent:5em;margin-bottom:3px;color:red;">选项B&nbsp;&nbsp; &nbsp;&nbsp;${item['question'].answerb }</p>
				    	</c:if>
				    	<c:if test="${item['question'].correctanswer!=2 }">
				    		<p style="padding:3px;text-indent:5em;margin-bottom:3px">选项B&nbsp;&nbsp; &nbsp;&nbsp;${item['question'].answerb }</p>
				    	</c:if>
				    	
				    </c:if>
				    <c:if test="${item['question'].answerc!=null }">
				    	<c:if test="${item['question'].correctanswer==3 }">
				    		<p style="padding:3px;text-indent:5em;margin-bottom:3px;color:red;">选项C&nbsp;&nbsp;&nbsp; ${item['question'].answerc }</p>
				    	</c:if>
				    	<c:if test="${item['question'].correctanswer!=3 }">
				    		<p style="padding:3px;text-indent:5em;margin-bottom:3px">选项C&nbsp;&nbsp;&nbsp; ${item['question'].answerc }</p>
				    	</c:if>
				    	
				    </c:if>
				    <c:if test="${item['question'].answerd!=null }">
				    	<c:if test="${item['question'].correctanswer==4 }">
				    		<p style="padding:3px;text-indent:5em;margin-bottom:3px;color:red;">选项D&nbsp;&nbsp;&nbsp; ${item['question'].answerd }</p>
				    	</c:if>
				    	<c:if test="${item['question'].correctanswer!=4 }">
				    		<p style="padding:3px;text-indent:5em;margin-bottom:3px">选项D&nbsp;&nbsp;&nbsp; ${item['question'].answerd }</p>
				    	</c:if>
				    	
				    </c:if>
				    <c:if test="${item['question'].answere!=null}">
				    	<c:if test="${item['question'].correctanswer==5 }">
				    		<p style="padding:3px;text-indent:5em;margin-bottom:3px;color:red;">选项E&nbsp;&nbsp;&nbsp;${item['question'].answere }</p>
				    	</c:if>
				    	<c:if test="${item['question'].correctanswer!=5 }">
				    		<p style="padding:3px;text-indent:5em;margin-bottom:3px">选项E&nbsp;&nbsp;&nbsp;${item['question'].answere }</p>
				    	</c:if>
				    	
				    </c:if>
				    <c:if test="${item['question'].answerf!=null }">
				    	<c:if test="${item['question'].correctanswer==6 }">
				    		<p style="padding:3px;text-indent:5em;margin-bottom:3px;color:red;">选项F&nbsp;&nbsp;&nbsp; ${item['question'].answerf }</p>
				    	</c:if>
				    	<c:if test="${item['question'].correctanswer!=6 }">
				    		<p style="padding:3px;text-indent:5em;margin-bottom:3px">选项F&nbsp;&nbsp;&nbsp; ${item['question'].answerf }</p>
				    	</c:if>
				    	
				    </c:if>
				    <c:if test="${item['question'].answerg!=null }">
				    	<c:if test="${item['question'].correctanswer==7 }">
				    		<p style="padding:3px;text-indent:5em;margin-bottom:3px;color:red;">选项G&nbsp;&nbsp; ${item['question'].answerg }</p>
				    	</c:if>
				    	<c:if test="${item['question'].correctanswer!=7 }">
				    		<p style="padding:3px;text-indent:5em;margin-bottom:3px">选项G&nbsp;&nbsp; ${item['question'].answerg }</p>
				    	</c:if>
				    	
				    </c:if>
				</c:if>
				<c:if test="${item['homeworktype']!=1 }">
					<p style="font-size:14px;padding:7px">第${status.count}题. ${item['question'].content }</p>
				</c:if>
			</div>
		</c:forEach>
	</c:if>
	

</div>
<c:if test="">
	 <div class="panel-body">
		<c:if test="${myhomework.homeworktype!=2 }">
			<div class="da-panel-widget">
		    	<h4>题目--${dohomework.title }</h4>
		        <p style="border-left:4px solid #a6d037;font-size:14px;padding:10px">${dohomework.content }</p>
		    </div>
	    </c:if>
		<form action="" method="post" name="myform" onsubmit="return check()">
			<input type="hidden" id="stuhomeworkid" name="stuhomeworkid" value="${myhomework.id }">
			<input type="hidden" id="content" name="content">
			<c:if test="${myhomework.homeworktype==4 }">
			<div class="summernote">${myhomework.content }</div>
			<input type="submit" class="btn btn-success" onClick="javascript:submits(1)" value="提交"/> 
			<input type="submit" class="btn btn-primary" onClick="javascript:submits(0)" value="保存"/> 
			</c:if>
		</form>
	</div>
</c:if>





<!-- jQuery JavaScript File -->
<script type="text/javascript" src="js/jquery-1.7.2.min.js" ></script>
<!-- DataTables Plugin -->
<script type="text/javascript" src="js/data-table/js/jquery.dataTables.min.js" ></script>
<!-- Demo JavaScript Files -->
<script type="text/javascript" src="js/demo/demo.tables.js" ></script>
<!-- Core JavaScript Files -->
<script type="text/javascript" src="js/core/dandelion.core.js" ></script>
<!-- Demo JavaScript Files -->
<script type="text/javascript" src="js/demo/demo.ui.js" ></script>

<script type="text/javascript">
function check(){
	var count =$("#count").val();
	//var content =$(".note-editable").html();
	var homeworktype =$("#homeworktype").val();
	if(count==5){
		alert("最多只能设置5道题!");
		return false;
	}
	if(homeworktype==''||homeworktype==""){
		alert("请先选择题目类型！");
		return false;
	}
	return true;
};

</script>

</body>
</html>