<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>学生选课</title>
	<!--Data Table-->
    <link href="js/data-table/css/jquery.dataTables.css" rel="stylesheet">
    <link href="js/data-table/css/dataTables.tableTools.css" rel="stylesheet">
    <link href="js/data-table/css/dataTables.colVis.min.css" rel="stylesheet">
    <link href="js/data-table/css/dataTables.responsive.css" rel="stylesheet">
    <link href="js/data-table/css/dataTables.scroller.css" rel="stylesheet">
    	
   	<!--common style-->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet">
</head>
<body  style="background: #f3f3f3;min-height: 600px;width: 100%;position: relative;" >

		<div class="panel panel-default" padding="">

				<div class="panel-body">

					<form class="form-inline" action="elecoustulist" method="post">
						<div class="form-group">

							<label for="customerFrom">课程名称</label>
 
							<select	class="form-control" id="courseid" name="courseid">
	
							<option value="">--请选择--</option>

								<c:forEach items="${courselist}" var="item">

									<option value="${item.courseid}">${item.coursename }</option>

								</c:forEach>

							</select>

						</div>
						<button type="submit" class="btn btn-primary">查询</button>

					</form>

				</div>

		</div>
		

	<div class="row">
        <div class="col-sm-12">
            <section class="panel">
                <header class="panel-heading ">
                    学生选课
                    <span class="tools pull-right">
                        <a class="fa fa-repeat box-refresh" href="javascript:;"></a>
                        <a class="t-close fa fa-times" href="javascript:;"></a>
                    </span>
               	</header>
                <table class="table convert-data-table data-table">
	                 <thead>
	                  <tr>
	                  	  <th><a href="javascript:" onclick="batchDeletes()"><img src="img/icons/cross.png"  /></a></th>
	                  	 
	                      <th>
	                          学号
	                      </th>
	                      <th>
	                          姓名
	                      </th>
	                      <th>
	                          课程号
	                      </th>
	                      <th>
	                          课程名称
	                      </th>
	                      <th class="hidden-xs"> 操作</th>
	                  </tr>
	                 </thead>
	                 <tbody>
		                  <c:forEach items="${elecourseslist}" var="stulist" varStatus="student">
		                  	<tr>
			                 	 <td><input type="checkbox" class="selectone" name="selecti" value="${stulist.id }"/></td> 
			                     <td>${stulist.stuid }</td>
			                     <td>${stulist.stuname }</td>
			                     <td>${stulist.courseid }</td>
			                     <td>${stulist.coursename }</td>
			                     <td class="hidden-xs">
				                   <button class="btn btn-danger btn-xs" onclick="deleleCourse(${stulist.id})"><i class="fa fa-trash-o "></i></button>
			               		</td>
		                 	</tr>
		                 </c:forEach> 
	                 </tbody>
                </table>
            </section>
         </div>
    </div>
    <div class ="row"></div>
    <!-- Placed js at the end of the document so the pages load faster -->
	<script src="js/jquery-1.10.2.min.js"></script>
	<script src="js/jquery-migrate.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/modernizr.min.js"></script>
	
	<!--Nice Scroll-->
	<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
	
	<!--Data Table-->
	<script src="js/data-table/js/jquery.dataTables.min.js"></script>
	<script src="js/data-table/js/dataTables.tableTools.min.js"></script>
	<script src="js/data-table/js/bootstrap-dataTable.js"></script>
	<script src="js/data-table/js/dataTables.colVis.min.js"></script>
	<script src="js/data-table/js/dataTables.responsive.min.js"></script>
	<script src="js/data-table/js/dataTables.scroller.min.js"></script>
	<!--data table init-->
	<script src="js/data-table-init.js"></script>
	
	<!--common scripts for all pages-->
	<script src="js/scripts.js"></script>
	<script type="text/javascript">
	
	$(function(){
		
		$("#select").click(function(){
			$(".selectone").prop("checked",this.checked);
		});
	});

	function deleleCourse(id) {
		if(confirm('确实要删除吗?')) {
			$.post("delelecourseById",{"id":id},function(data){
				alert("删除成功！");
				window.location.reload();
			});
		}
	};
	
	function batchDeletes(){  
	    //判断至少写了一项  
	    var checkedNum = $("input[name='selecti']:checked").length;  
	    if(checkedNum==0){  
	        alert("请至少选择一项!");  
	        return false;  
	    }  
	    if(confirm("确定删除所选项目?")){  
	    var checkedList = new Array();  
	    $("input[name='selecti']:checked").each(function(){  
	        checkedList.push($(this).val());  
	    }); 

	    $.ajax({  
	        type:"POST",  
	        url:"delelecourseByIds",  
	        data:{"delitems":checkedList.toString()},  
	        datatype:"html",  
	        success:function(data){  
	           
	            location.reload();//页面刷新  
	        },  
	        error:function(){  
	            alert('删除失败!');  
	        }  
	    });  
	    }  
	}; 
	
	</script>
	
</body>
</html>