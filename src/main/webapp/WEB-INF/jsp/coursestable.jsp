<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Viewport metatags -->
<meta name="HandheldFriendly" content="true" />
<meta name="MobileOptimized" content="320" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<!-- Theme Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/dandelion.theme.css"  media="screen" />
<!--  Main Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/dandelion.css"  media="screen" />
<!-- Demo Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/demo.css"  media="screen" />


<title>Course Table List</title>
</head>
<body>

	<!-- Main Wrapper. Set this to 'fixed' for fixed layout and 'fluid' for fluid layout' -->
	<div id="da-wrapper" class="fluid">

        <!-- Content -->
        <div id="da-content">
            
            <!-- Container -->
            <div class="da-container clearfix">
            
                <!-- Main Content Wrapper -->
                <div id="da-content-wrap" class="clearfix">
                
                	<!-- Content Area -->
                	<div id="da-content-area">
                    
                    	<div class="grid_4">
                        	<div class="da-panel collapsible">
                            	<div class="da-panel-header">
                                	<span class="da-panel-title">
                                        <img src="img/icons/list.png"  alt="" />
                                        我的课程
                                    </span>
                                    
                                </div>
                                <div class="da-panel-content">
                                    <table class="da-table" id="testtable">
                                        <thead>
                                            <tr>
                                            	<th><input type="checkbox" id="select"/></th>
                                                <th>课程号</th>
                                                <th>课程名称</th>
                                                <th>已选课人数</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${courselist}" var="coulist" varStatus="status">
                                        		<tr id = "${status.count }">
	                                            	<td><input type="checkbox" class="selectone" name="selecti" value="${coulist.id }"/></td>
	                                                <td>${coulist.courseid }</td>
	                                                <td>${coulist.coursename }</td>
	                                                <td>${coulist.total }</td>
	                                                <td class="da-icon-column">
	                                                	<a href="javascript:;" onclick="selectmyfile('${coulist.courseid}')"><img src="img/icons/upload.png"  /></a>
	                                                	<a href="courseslist?courseid=${coulist.courseid}" ><img src="img/icons/magnifier.png"  /></a>
	                                                	<a href="javascript:;" onclick="deleteCourse(${coulist.id},'${coulist.courseid}')"><img src="img/icons/cross.png"  /></a>
	                                                </td>
	                                                
                                            </tr>
                                        	</c:forEach>
                                           <form id="addnewform"  method="post">
                                            <tr>
                                            	<td><a href="javascript:" onclick="batchDeletes()"><img src="img/icons/cross.png"  /></a></td>
                                                <td><input type="text" id="courseid" name="courseid" style=" width: 100%; height: 100%;margin:0px;border:none;font-family:Arial;"></td>
                                                <td><input type="text" id="coursename" name="coursename" style="width: 100%; height: 100%; margin:0px;border:none;font-family:Arial;"></td>
                                              
                                                <td class="da-icon-column">
                                                	<a href="javascript:;" colspan="2" onclick='add(check())'><img src="img/icons/add.png"  /></a>
                                                </td>
                                            </tr>
                                            </form>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
						
 <form  id="formm" action="importselectstu" enctype="multipart/form-data" method="post">
	<input type="hidden" id = "courseidd"name = "courseid" />
	<input type="file" name="file" id="excelFile" style="display:none" onchange="fileUpload()"> 
</form>                   	
             
                    	<div class="grid_4">
                        	<div class="da-panel collapsible">
                            	<div class="da-panel-header">
                                	<span class="da-panel-title">
                                        <img src="img/icons/list.png"  alt="" />
                                       选课详情
                                    </span>
                                    
                                </div>
                                <div class="da-panel-content">
                                    <table id="da-ex-datatable-numberpaging" class="da-table">
                                        <thead>
                                            <tr>
                                            	<th><a href="javascript:" onclick="batc()"><img src="img/icons/cross.png"  /></a></th>
                                                <th>学号</th>
                                                <th>选课学生</th>
                                                <th>课程号</th>
                                                <th>课程名称</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tbody-result">
                                        	<c:forEach items="${elecoustulist}" var="stulist" varStatus="status">
	                                            <tr>
	                                            	<td><input type="checkbox" class="selectne" name="seleci" value="${stulist.id }"/></td>
	                                                <td>${stulist.stuid }</td>
	                                                <td>${stulist.stuname }</td>
	                                                <td>${stulist.courseid }</td>
	                                                <td>${stulist.coursename }</td>
	                                                <td class="da-icon-column">
	                                                	<a href="javascript:;" onclick="deleleCourse(${stulist.id })"><img src="img/icons/cross.png"  /></a>
	                                                </td>
	                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                                                
                    </div>
                    
                </div>
                
            </div>
            
        </div>
        
    </div>

<!-- jQuery JavaScript File -->
<script type="text/javascript" src="js/jquery-1.10.2.min.js" ></script>

<!-- DataTables Plugin -->
<script type="text/javascript" src="js/data-table/js/jquery.dataTables.min.js" ></script>

<!-- Demo JavaScript Files -->
<script type="text/javascript" src="js/demo/demo.tables.js" ></script>

<!-- Core JavaScript Files -->
<script type="text/javascript" src="js/core/dandelion.core.js" ></script>


<script type="text/javascript">
$(function(){	
	$("#select").click(function(){
		$(".selectone").attr("checked",this.checked);
	});
});

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
    alert(checkedList.toString());
    $.ajax({  
        type:"POST",  
        url:"deletecourseByIds",  
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
	
	function check(){
		var titlt = $("#courseid").val();
		var content = $("#coursename").val();
		if(titlt==''){
			alert("课程号不能为空！");
			return false;
		}
		if(content==''){
			alert("课程名称不能为空！");
			return false;
		}
		return true;
	};

	function add(check){
	           if(check){
		$.post("addnewcourse",$("#addnewform").serialize(),function(data){

			alert("添加成功！");
			window.location.reload();

		});
	}
	
};	

function deleteCourse(id,courseid) {
	if(confirm('确实要删除吗?')) {
		$.post("delcourseById",{"id":id,"courseid":courseid},function(data){
			alert("删除成功！");
			window.location.reload();
		});
	}
};
			
	function eleCouStu(courseid){
		var tbody=window.document.getElementById("tbody-result");
		$.post("seleCouseStuByCouId",{"courseid":courseid},function(msg){
			alert(msg);
			if(!msg.ret){
				var str ="";
				var data = msg.elecourselist;
				for(i in data){
					str+='<tr>'+
					'<td><input type="checkbox" class="selectonet" name="selectij" value="'+data[i].stuid+'"/></td>'+
					'<td>'+data[i].stuid+'</td>'+
					'<td>'+data[i].stuname+'</td>'+
					'<td>'+data[i].courseid+'</td>'+
					'<td>'+data[i].coursename+'</td>'+
					'<td class="da-icon-column">'+
					'<a href="#"><img src="img/icons/magnifier.png"  /></a>'+
                	'<a href="#"><img src="img/icons/pencil.png"  /></a>'+
                	'<a href="#"><img src="img/icons/cross.png"  /></a></td>'+
					'</tr>';
				}
				tbody.innerHTML = str;
			}
		});
	};
	
  //打开文件选择框  
   function selectmyfile(courseid){
	   $("#courseidd").val(courseid);
	    $("#excelFile").trigger("click");
   };
	//文件上传
	function fileUpload(){
		var f_content = $("#excelFile").val();
		var fileext = f_content.substring(f_content.lastIndexOf("."),f_content.length)
		fileext = fileext.toLowerCase()
		if(fileext=='.xls'||fileext=='.xlsx'){
		var formData = new FormData(document.getElementById("formm"));
		$.ajax({
			url:'importselectstu',
			type:'POST',
			data:formData,
			async:false,
			cache:false,
			contentType:false,
			processData:false,
			//dataType:"application/json;charset=utf-8",
			success:function(result){
				//window.location.href="${pageContext.request.contextPath }/choicelist?homeworkid="+result;
				alert(result);
				window.location.reload();
			}
		});
		//$("#formm").submit();
		}else{
			alert("只支持excel2003或是excel2007文件!");
		}
	};	
	
	function deleleCourse(id) {
		if(confirm('确实要删除吗?')) {
			$.post("delelecourseById",{"id":id},function(data){
				alert("删除成功！");
				window.location.reload();
			});
		}
	};
	
	function batc(){
		 //判断至少写了一项  
	    var checkedNum = $("input[name='seleci']:checked").length;  
	    if(checkedNum==0){  
	        alert("请至少选择一项!");  
	        return false;  
	    }  
	    if(confirm("确定删除所选项目?")){  
	    var checkedList = new Array();  
	    $("input[name='seleci']:checked").each(function(){  
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
	}
	
</script>

</body>
</html>