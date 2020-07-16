<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Doing Homework</title>


<link rel="stylesheet" type="text/css" href="js/jui/css/jquery.ui.all.css"  media="screen" />
<!--switchery-->
<link href="js/switchery/switchery.min.css" rel="stylesheet" type="text/css" media="screen" />
<!--  summernote -->
<link href="js/summernote/dist/summernote.css" rel="stylesheet">
<!--common style-->
<link href="css/style.css" rel="stylesheet">
<!--  Main Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/dandelion.css"  media="screen" />
<link rel="stylesheet" href="css/plugins/syntaxhighlighter/prettify/prettify.min.css"  media="screen" />
<link rel="stylesheet" href="css/plugins/syntaxhighlighter/styles/style.min.css"  media="screen" />
<link rel="stylesheet" href="css/plugins/syntaxhighlighter/styles/theme-balupton.css"  media="screen" />
<link rel="stylesheet" href="css/plugins/syntaxhighlighter/styles/theme-google.css"  media="screen" />



</head>
<body style="background: #f3f3f3;width: 100%;position: relative;">
<section class="panel">
   <header class="panel-heading">
   <img src="img/page_white_paintbrush.png"  alt="" />
       作业详情:
       <span class="tools pull-right">
         <a class="fa fa-repeat box-refresh" href="javascript:;"></a>
         <a class="t-collapse fa fa-chevron-down" href="javascript:;"></a>
         <a class="t-close fa fa-times" href="javascript:;"></a>
      </span>
   </header>
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
		<c:if test="${myhomework.homeworktype==2 }">
			<c:if test="${myhomework.content==null }">
				<div class="summernote">${dohomework.content }</div>
				<input type="button" class="btn btn-success" onClick="javascript:submits(1)" value="提交"/> 
				<input type="button" class="btn btn-primary" onClick="javascript:submits(0)" value="保存"/> 
			</c:if>
			<c:if test="${myhomework.content!=null }">
				<div class="summernote">${myhomework.content }</div>
				<input type="button" class="btn btn-success" onClick="javascript:submits(1)" value="提交"/> 
				<input type="button" class="btn btn-primary" onClick="javascript:submits(0)" value="保存"/> 
			</c:if>
		</c:if>
		<c:if test="${myhomework.homeworktype==3 }">
		 <!--<div>
			<c:if test="${myhomework.content==null }">
			<pre id="mypre" class="language-javascript" contenteditable="true" style="border-left:4px solid #a6d037;font-size:14px;font-family: "微软雅黑";padding:10px">
			Staring your Codeing
			</pre>
			</c:if>
			<c:if test="${myhomework.content!=null }">
			<pre id="mypre" class="language-javascript" contenteditable="true" style="border-left:4px solid #a6d037;font-size:14px;font-family: "微软雅黑";padding:10px">
			${myhomework.content }
			</pre>
			</c:if>
		</div>-->
		<div>
			<pre id="mypre" contenteditable="true" style="border-left:4px solid #a6d037;font-size:14px;font-family: "微软雅黑";padding:10px">
				${myhomework.content }
			</pre>
		</div>
		 <input type="button" class="btn btn-success" onClick="javascript:codesubmits(1)" value="提交"/> 
		 <input type="button" class="btn btn-primary" onClick="javascript:codesubmits(0)" value="保存"/> 
		</c:if> 
</form>
</div>
</section>



<!-- Placed js at the end of the document so the pages load faster -->
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/jquery-migrate.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>
<!--Nice Scroll-->
<script src="js/jquery.nicescroll.js" type="text/javascript"></script>

<!--right slidebar-->
<script src="js/slidebars.min.js"></script>

<!--summernote-->
<script src="js/summernote/dist/summernote.min.js"></script>
<!-- Demo JavaScript Files -->
<script type="text/javascript" src="js/demo/demo.typography.js" ></script>
<!-- Syntax Highlighter, depends on google prettify -->
<script type="text/javascript" src="css/plugins/syntaxhighlighter/prettify/prettify.min.js" ></script>
<script type="text/javascript" src="css/plugins/syntaxhighlighter/jquery.syntaxhighlighter.min.js" ></script>		
<!--common scripts for all pages-->
<script src="js/scripts.js"></script>

<script type="text/javascript">

jQuery(document).ready(function(){
	
    $('.summernote').summernote({
        height: 200,                 // set editor height

        minHeight: null,             // set minimum height of editor
        maxHeight: null,             // set maximum height of editor

        focus: true                 // set focus to editable area after initializing summernote
    });
});

function submits(flag){
	data1 = $(".note-editable").html();
	$("#content").val(data1);
	$.ajax({
		type:"POST",
		url:"doorupdatestuhomework",
		data:{"content":data1,"stuhomeworkid":$("#stuhomeworkid").val(),"submits":flag},
		success:function(data){
			if("${jump}"==1){
				window.parent.location="studohomework";
			};
			if("${jump}"==2){
				window.parent.location="minehomework";
			};
		},
		error:function(data){
			if("${jump}"==1){
				window.parent.location="studohomework";
			};
			if("${jump}"==2){
				window.parent.location="minehomework";
			};
		}
	});
	//myform.action="doorupdatestuhomework?submits="+flag;
};
function codesubmits(flag){
	data2 = document.getElementById("mypre").innerHTML;
	
	$("#content").val(data2);
	$.ajax({
		type:"POST",
		url:"doorupdatestuhomework?submits="+flag,
		data:{"content":data2,"stuhomeworkid":$("#stuhomeworkid").val(),"submits":flag},
		success:function(data){
			if("${jump}"==1){
				window.parent.location="studohomework";
			};
			if("${jump}"==2){
				window.parent.location="minehomework";
			};
		},
		error:function(data){
			if("${jump}"==1){
				window.parent.location="studohomework";
			};
			if("${jump}"==2){
				window.parent.location="minehomework";
			};
		}
	});
	//myform.action="doorupdatestuhomework?submits="+flag;
};

</script>


</body>
</html>