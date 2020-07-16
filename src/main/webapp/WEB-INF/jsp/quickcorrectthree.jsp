<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quick Correct</title>

	<!-- Theme Stylesheet -->
	<link rel="stylesheet" type="text/css" href="css/dandelion.theme.css"  media="screen" />
	<!--  Main Stylesheet -->
	<link rel="stylesheet" type="text/css" href="css/dandelion.css"  media="screen" />
	<!-- Demo Stylesheet -->
	<link rel="stylesheet" type="text/css" href="css/demo.css"  media="screen" />
	<!--common style-->
   	<link href="css/style.css" rel="stylesheet">
   	<link href="css/style-responsive.css" rel="stylesheet">
   	<link rel="stylesheet" href="css/plugins/syntaxhighlighter/styles/style.min.css"  media="screen" />
	<link rel="stylesheet" href="css/plugins/syntaxhighlighter/styles/theme-balupton.css"  media="screen" />
	
	

</head>
<body style="background: #f3f3f3;width: 100%;position: relative;">	
<div class="panel panel-default" padding="">
	<div class="panel-body">
		<form class="form-inline" action="quickcorrectfour?homeworktype=3&flag=2" method="post">
			<div class="form-group">
				<label for="customerFrom">请选择课程</label>
				<select	class="form-control" id="courseid" name="courseid" onchange="changeMe()" data-toggle="selectpicker" >
				<option value="">--请选择--</option>
					<c:forEach items="${courselist}" var="item">
						<option value="${item.courseid}">${item.coursename }</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label for="customerFrom">请选择作业</label>
				<select	class="form-control" id="homeworkid" name="homeworkid" data-toggle="selectpicker" >
				<option value="">--请选择--</option>
					<!--<c:forEach items="${homeworklist}" var="items">
						<option value="${items.id}">${items.coursename }</option>
					</c:forEach>-->
				</select>
			</div>
			<button type="submit" class="btn btn-primary">查询</button>
		</form>
	</div>
</div>
<div class="row">
	<c:if test="${flag==2 }">
		<div class="panel-group m-bot20" id="accordion">
		    <div class="panel panel-default">
		        <div class="panel-heading">
		            <h4 class="panel-title">
		                ${homework.title }-题目详情
		            </h4>
		        </div>
		        <div id="collapseOne" class="panel-collapse collapse in">
		            <div class="panel-body">
		               ${homework.content }
		            </div>
		        </div>
		    </div>
		</div>
	  	<c:if test="${stuhomeworklist==null||fn:length(stuhomeworklist)==0 }">
	  	<section class="panel">
	           <div class="panel-body">
	               <div class="alert alert-success alert-block fade in">
	                   <button data-dismiss="alert" class="close close-sm" type="button">
	                       <i class="fa fa-times"></i>
	                   </button>
	                   <h4>
	                       <i class="fa fa-ok-sign"></i>
	                       Kindly Reminder!
	                   </h4>
	                   <p>不要着急!该作业还没有学生提交~</p>
	               </div>
	           </div>
	       </section>
	  	</c:if>
  	</c:if>
  	<c:if test="${flag==1 }">
       <section class="panel">
           <div class="panel-body">
               <div class="alert alert-success alert-block fade in">
                   <button data-dismiss="alert" class="close close-sm" type="button">
                       <i class="fa fa-times"></i>
                   </button>
                   <h4>
                       <i class="fa fa-ok-sign"></i>
                       Kindly Reminder!
                   </h4>
                   <p>不要着急!先选择课程和作业</p>
               </div>
           </div>
       </section>
  	</c:if>
	<c:forEach items="${stuhomeworklist }" var="itemt"  varStatus="status">
		 <div class="col-md-12">
           <div class="panel">
               <div class="panel-heading head-border">
                   ${itemt.homeworktitle }-By-${itemt.stuid }
                   <span class="tools pull-right">
                       <a class="fa fa-repeat box-refresh" href="javascript:;"></a>
                       <a class="t-collapse fa fa-chevron-down" href="javascript:;"></a>
                       <a id="close${status.count }" class="t-close fa fa-times" href="javascript:;"></a>
                   </span>
               </div>
                <div class="panel-body">
                    <pre class="language-javascript">
					${itemt.content }
					</pre>
					<div style="float: left;padding-right:20px">
					<h4>
						<label >成绩打分</label>
						<input type="radio" name="score" value="A">A
						<input type="radio" name="score" value="B">B
						<input type="radio" name="score" value="C">C
						<input type="radio" name="score" value="D">D
						<input type="radio" name="score" value="E">E
					</h4>
					</div>
					<div>
						<span class="tools pull-right">
						<button onClick="javascript:checkgrade(${itemt.id},${status.count })" type="submit" style="padding: 6px 12px;background-color: #a978d1;border-color: #a978d1;color: #FFFFFF;border: 1px solid transparent;border-radius: 4px;" >确定</button>
						</span>
					</div>
                  </div>
                </div>
		</div>

	</c:forEach>
</div>

<!--Nice Scroll-->
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/jquery.nicescroll.js" type="text/javascript"></script>

<!--common scripts for all pages-->
<script src="js/scripts.js"></script>

<!-- jQuery JavaScript File -->
<script type="text/javascript" src="js/jquery-1.7.2.min.js" ></script>
<!-- Syntax Highlighter, depends on google prettify -->
<script type="text/javascript" src="css/plugins/syntaxhighlighter/prettify/prettify.min.js" ></script>
<script type="text/javascript" src="css/plugins/syntaxhighlighter/jquery.syntaxhighlighter.min.js" ></script>
<!-- Demo JavaScript Files -->
<script type="text/javascript" src="js/demo/demo.typography.js" ></script>
	
<!-- Core JavaScript Files -->
<script type="text/javascript" src="js/core/dandelion.core.js" ></script>	
<script type="text/javascript">

	function changeMe(){  
  
        var courseid = $("#courseid").val();
        $.post("quickfourcourse",{"courseid":courseid,"homeworktype":3},function(msg){  
                console.log(msg); 
                var data = msg.homeworklist;
                if(data != null && data.length > 0){ 
                    for(var i=0; i<data.length; i++){  
                       $("#homeworkid").append("<option value='"+data[i].id+"'>"+data[i].title+"</option>");  
                    }  
                }  
                $("#homeworkid").selectpicker('refresh'); 
        });  
};	

function checkgrade(stuhomeworkid,id){
	var val = $('input:radio[name="score"]:checked').val();
	if (val==null){
		alert("请先打分！");
		return false;
	}else{
		document.getElementById("close"+id).click();
		$.post("insertgrade",{"score":val,"id":stuhomeworkid},function(msg){
	
		});
		
	}
};

</script>	
</body>
</html>