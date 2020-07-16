<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Correct Answer</title>
<!--  Fluid Grid System -->
<link rel="stylesheet" type="text/css" href="css/fluid.css"  media="screen" />
<link rel="stylesheet" type="text/css" href="css/demo.css"  media="screen" />
<!-- jQuery JavaScript File -->
<script type="text/javascript" src="js/jquery-1.7.2.min.js" ></script>
<style type="text/css">  
list-style:none;  
</style>
</head>
<body>
	<div class="grid_3">
		<div class="da-panel-widget">
			<form action="" method="post" name="myform" onsubmit="return check()"> 
			<input type="hidden" name="homeworkid" id ="homeworkid" value="${homeworkid }">
			<h2>请设置正确的答案</h2>
			<p>
				<c:forEach items="${choicehomeworklist}" var="item" varStatus="status">
			  		<h4> ${status.count }.${item.question }</h4>
			  		<ul >
			  			<c:if test="${item.answera!=null}">
			  				<li style="list-style-type:none">
				  			 	 <input type="radio" value="1" name="t${status.count }" /> 
				  			 	 <label for="t${status.count }">${item.answera }</label>
			  			 	</li>
			  			 </c:if>
			  			 <c:if test="${item.answerb!=null}">
			  				<li style="list-style-type:none">
				  			 	 <input type="radio" value="2" name="t${status.count }" /> 
				  			 	 <label for="t${status.count }">${item.answerb }</label>
			  			 	</li>
			  			 </c:if>
			  			 <c:if test="${item.answerc!=null}">
			  				<li style="list-style-type:none">
				  			 	 <input type="radio" value="3" name="t${status.count }" /> 
				  			 	 <label for="t${status.count }">${item.answerc }</label>
			  			 	</li>
			  			 </c:if>
			  			 <c:if test="${item.answerd!=null}">
			  				<li style="list-style-type:none">
				  			 	 <input type="radio" value="4" name="t${status.count }" /> 
				  			 	 <label for="t${status.count }">${item.answerd }</label>
			  			 	</li>
			  			 </c:if>
			  			 <c:if test="${item.answere!=null}">
			  				<li style="list-style-type:none">
				  			 	 <input type="radio" value="5" name="t${status.count }" /> 
				  			 	 <label for="t${status.count }">${item.answere }</label>
			  			 	</li>
			  			 </c:if>
			  			 <c:if test="${item.answerf!=null}">
			  				<li style="list-style-type:none">
				  			 	 <input type="radio" value="6" name="t${status.count }" /> 
				  			 	 <label for="t${status.count }">${item.answerf }</label>
			  			 	</li>
			  			 </c:if>
			  			 <c:if test="${item.answerg!=null}">
			  				<li style="list-style-type:none">
				  			 	 <input type="radio" value="7" name="t${status.count }" /> 
				  			 	 <label for="t${status.count }">${item.answerg }</label>
			  			 	</li>
			  			 </c:if>
			  		</ul>
			  	</c:forEach>
			</p>
			 <input type="submit" style="display: inline-block;padding: 6px 12px;margin-bottom: 0;font-size: 14px;font-weight: 400;line-height: 1.42857143;text-align: center;white-space: nowrap;vertical-align: middle;" class="btn btn-success" onClick="javascript:submits()" value="确定"/>
			</form>
		</div>
	</div>
	
<script>
function check(){
    var trs = document.getElementsByTagName('ul'),
    len = trs.length,count = 0;
    for(var i = 0; i < len; i++){
        var inputs = document.getElementsByName('t'+(i+1)),ilen= inputs.length;
         
        for(var j = 0; j < ilen; j++){
            if(inputs[j].checked){
                count++;   
            }   
        }   
    }
     
    if(count == len){
        return true;
    }else{
        alert('您还有题目尚未选择！');
        return false;
    }
   return false;
 };
    function submits(){
    	var checkedList = new Array(); 
    	var trs = document.getElementsByTagName('ul'),
        len = trs.length;
        for(var i = 0; i < len; i++){
            var inputs = document.getElementsByName('t'+(i+1)),ilen= inputs.length;
             
            for(var j = 0; j < ilen; j++){
                if(inputs[j].checked){
                	checkedList.push(inputs[j].value);
                }   
            }   
        }
    	alert(checkedList);
    	myform.action="insertcorrectanswer?correctanswer="+checkedList.toString();
    }
</script>
	
</body>
</html>