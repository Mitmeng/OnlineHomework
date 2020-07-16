<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Querstion Editor</title>

	<!--right slidebar-->
    <link href="css/slidebars.css" rel="stylesheet">
    <!--switchery-->
    <link href="js/switchery/switchery.min.css" rel="stylesheet" type="text/css" media="screen" />
    <!--  summernote -->
    <link href="js/summernote/dist/summernote.css" rel="stylesheet">
    <!--common style-->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet">

</head>
<body  style="background: #f3f3f3;min-height: 600px;width: 100%;position: relative;">

     <!--body wrapper start-->
     <div class="wrapper">

		<div class="col-md-10">
             <section class="panel">
                 <header class="panel-heading head-border">
                 	<input type="hidden" />
                     <span class="tools pull-right">
                         <a class="fa fa-repeat box-refresh" href="javascript:;"></a>
                         <a class="t-collapse fa fa-chevron-down" href="javascript:;"></a>
                         <a class="t-close fa fa-times" href="javascript:;"></a>
                     </span>
                 </header>
                 <div class="panel-body">
                 <form action="" method="post" name="myform" onsubmit="return check()">
                 	
                 	<div class="form-group">

						<label for="customerFrom">课程名称</label>

						<select	class="form-control" id="courseid" name="courseid">

						<option value="">--请选择--</option>

							<c:forEach items="${courselist}" var="item">

								<option value="${item.courseid}">${item.coursename }</option>

							</c:forEach>

						</select>

					</div>
                 
                 	<input class="form-control" type="text" id="title" name="title" placeholder="请输入标题"/>
                 	<input type="hidden" id="content" name="content">
                    <div class="summernote"></div>
                    <input type="submit" class="btn btn-success" onClick="javascript:submits()" value="添加"/> 
                    <input type="submit" class="btn btn-primary" onClick="javascript:resets()" value="重置"/> 
                 </form>
                 </div>
             </section>
		</div>
	
       </div>
        
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
		<!--common scripts for all pages-->
		<script src="js/scripts.js"></script>				
		<script>

		    jQuery(document).ready(function(){
		
		        $('.summernote').summernote({
		            height: 200,                 // set editor height
		
		            minHeight: null,             // set minimum height of editor
		            maxHeight: null,             // set maximum height of editor
		
		            focus: true                 // set focus to editable area after initializing summernote
		        });
		    });

		    function submits(){
	    		data1 = $(".note-editable").html();
		    	$("#content").val(data1);
		    	myform.action="foraddquerstionlist";
		    };
		    
		    function resets(){
		    	document.getElementById("myform").reset(); 
		    }
		    
		    function check(){
		    	
				var title =$("#title").val();
				var content =$(".note-editable").html();
				var course =$("#courseid").val();
				if(course==''){
					alert("请先选择课程！");
					return false;
				}
				if(title==''){
					alert("标题不能为空！");
					return false;
				}
				if(content==''){
					alert("题目内容不能为空！");
					return false;
				}
				return true;
			};

		    
		</script>
		
</body>
</html>