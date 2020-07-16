<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改选择题</title>
<!--  Main Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/dandelion.css"  media="screen" />
</head>
<body>
	
	<div class="da-panel-widget">
	<form action="" method="post" name="myform" onsubmit="return check()">
		<label>题目内容</label>
		<textarea style="display: inline-block;width: 100%;vertical-align: middle;margin-bottom: 6px;border-radius: 4px;border: 1px solid #3fdfdf;height: 100px;font-size: 14px;line-height: 1.42857143;" name="question" id="question">${choice.question }</textarea>
	    <c:if test="${choice.answera!=null }">
	    	<div style="padding:10px">
	    		<input name="c1" type="radio" value="1">
	       		<input style="display: inline-block;width: 70%;vertical-align: middle;margin-bottom: 6px;border-radius: 4px;border: 1px solid #3fdfdf;height: 30px;font-size: 14px;line-height: 1.42857143;" type="text" id="answera" name="answera" value="${choice.answera }"/>
	    	</div>
	       
	    </c:if>
	    <c:if test="${choice.answerb!=null }">
	    	<div style="padding:10px">
	    		<input name="correctanswer" type="radio" value="2">
	    		<input style="display: inline-block;width: 70%;vertical-align: middle;margin-bottom: 6px;border-radius: 4px;border: 1px solid #3fdfdf;height: 30px;font-size: 14px;line-height: 1.42857143;"type="text" id="answerb" name="answerb" value="${choice.answerb }"/>
	    	</div>
	    	
	    </c:if>
	    <c:if test="${choice.answerc!=null }">
	    	<div style="padding:10px">
	    		<input name="correctanswer" type="radio" value="3">
	    		<input style="display: inline-block;width: 70%;vertical-align: middle;margin-bottom: 6px;border-radius: 4px;border: 1px solid #3fdfdf;height: 30px;font-size: 14px;line-height: 1.42857143;" type="text" id="answerc" name="answerc" value="${choice.answerc }"/>	
	    	</div>
	    	    	
	    </c:if>
	    <c:if test="${choice.answerd!=null }">
	    	<div style="padding:10px">
	    		<input name="correctanswer" type="radio" value="4">
	    		<input style="display: inline-block;width: 70%;vertical-align: middle;margin-bottom: 6px;border-radius: 4px;border: 1px solid #3fdfdf;height: 30px;font-size: 14px;line-height: 1.42857143;" type="text" id="answerd" name="answerd" value="${choice.answerd }"/>  
	    	</div>
	    	 	
	    </c:if>
	    <c:if test="${choice.answere!=null}">
	    	<div style="padding:10px">
	    		<input name="correctanswer" type="radio" value="5">
	    		<input style="display: inline-block;width: 70%;vertical-align: middle;margin-bottom: 6px;border-radius: 4px;border: 1px solid #3fdfdf;height: 30px;font-size: 14px;line-height: 1.42857143;" type="text" id="answere" name="answere" value="${choice.answere }"/>
	    	</div>
	    	
	    </c:if>
	    <c:if test="${choice.answerf!=null }">
	    	<div style="padding:10px">
	    		<input name="correctanswer" type="radio" value="6">
	    		<input style="display: inline-block;width: 70%;vertical-align: middle;margin-bottom: 6px;border-radius: 4px;border: 1px solid #3fdfdf;height: 30px;font-size: 14px;line-height: 1.42857143;" type="text" id="answerf" name="answerf" value="${choice.answerf }"/>
	    	</div>
	    	
	    </c:if>
	    <c:if test="${choice.answerg!=null }">
	    	<div style="padding:10px">
	    		<input name="correctanswer" type="radio" value="7">
	    		<input style="display: inline-block;width: 70%;vertical-align: middle;margin-bottom: 6px;border-radius: 4px;border: 1px solid #3fdfdf;height: 30px;font-size: 14px;line-height: 1.42857143;" type="text" id="answerg" name="answerg" value="${choice.answerg }"/>
	    	</div>
	    		    	
	    </c:if>
	    <input type="submit" style="padding: 6px 12px;background-color: #a978d1;border-color: #a978d1;color: #FFFFFF;border: 1px solid transparent;border-radius: 4px;" onClick="javascript:submits()" value="确认修改"/>
	 <input type="button" style="padding: 6px 12px;background-color: #a978d1;border-color: #a978d1;color: #FFFFFF;border: 1px solid transparent;border-radius: 4px;" onclick="javascript:history.back(-1);"  value="返回"/>
	 </form>
	 </div>
	 

	
<!-- Placed js at the end of the document so the pages load faster -->
<script src="js/jquery-1.10.2.min.js"></script>
<script>
	function check(){
		var question = $("#question").val();
		var answera = $("#answera").val();
		var inputs = $('input[name="correctanswer"]:checked').val();
		if(inputs==''){
			alert("请设置正确的答案！");
			return false;
		}
		if(question==''){
			alert("问题不能为空！");
			return false;
		}
		if(answera==''){
			alert("选项不能为空！");
			return false;
		}
		return true;
	};
	
	 function submits(){
		 alert("ddjs");
		// myform.action="/updatechoices";
		 window.location.href="${pageContext.request.contextPath }/updatechoicess";
	    };
</script>
</body>
</html>