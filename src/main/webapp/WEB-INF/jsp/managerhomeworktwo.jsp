<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>填空题作业管理</title>

<!-- Theme Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/dandelion.theme.css"  media="screen" />
<!-- Demo Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/demo.css"  media="screen" />
<!--  Fluid Grid System -->
<link rel="stylesheet" type="text/css" href="css/fluid.css"  media="screen" />
<!--  Main Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/dandelion.css"  media="screen" />
<link rel="stylesheet" type="text/css" href="js/jui/css/jquery.ui.all.css"  media="screen" />


</head>
<body>
	<div style="padding: 15px;font-size: 14px;">
	<form class="form-inline" action="homeworkmanager?homeworktype=2" method="post">
		<div style="display: inline-block;margin-bottom: 0;vertical-align: middle;">
			<label for="customerFrom">请选择课程</label>
			<select	style="display: inline-block;width: auto;vertical-align: middle;height: 34px;padding: 6px 12px;font-size: 14px;line-height: 1.42857143;color: #555;background-color: #fff;" id="courseid" name="courseid" id="courseid" name="courseid" onchange="changeMe()" data-toggle="selectpicker" >
			<option value="">--请选择--</option>
				<c:forEach items="${courselist}" var="item">
					<option value="${item.courseid}">${item.coursename }</option>
				</c:forEach>
			</select>
		</div>
		<div style="display: inline-block;margin-bottom: 0;vertical-align: middle;">
			<label for="customerFrom">请选择作业</label>
			<select style="display: inline-block;width: auto;vertical-align: middle;height: 34px;padding: 6px 12px;font-size: 14px;line-height: 1.42857143;color: #555;background-color: #fff;" id="homeworkid" name="homeworkid" data-toggle="selectpicker" >
			<option value="">--请选择--</option>
			</select>
		</div>
		<button type="submit" style="padding: 6px 12px;background-color: #a978d1;border-color: #a978d1;color: #FFFFFF;border: 1px solid transparent;border-radius: 4px;" >查询</button>
	</form>
</div>
<div id="da-wrapper" class="fluid">
	<!-- Content -->
	<div id="da-content">
            
	    <!-- Container -->
	    <div class="da-container clearfix">
            
		     <!-- Main Content Wrapper -->
		     <div id="da-content-wrap" class="clearfix">
			 <div id="da-content-area">
				
				<div class="grid_4">
					<div class="da-panel collapsible">
				    	<div class="da-panel-header">
				        	<span class="da-panel-title">
				                <img src="img/icons/list.png"  alt="" />
				                学生作业情况
				            </span>
				        </div>
				        <div class="da-panel-content">
				            <table id="da-ex-datatable-numberpaging" class="da-table">
				                <thead>
				                    <tr>
				                        <th><a href="javascript:;" onclick="batchDeletes()"><img src="img/icons/cross.png"  /></a></th>
				                        <th>学号</th>
				                        <th>提交状态</th>
				                        <th>分数</th>
				                        <th></th>
				                    </tr>
				                </thead>
				                <tbody>
				                	<c:forEach items="${stuhomeworklist}" var="itemt">
				                		<tr>
				                			<td>
						                        <c:if test="${itemt.submits==1 }">
						                       		<input type="checkbox" class="selectone" name="selecti" value="${itemt.id }"/>
						                        </c:if>
					                        </td>
					                        <td>${itemt.stuid }</td>
					                        <td>
					                        	<c:if test="${itemt.submits==0 }">未提交</c:if>
					                        	<c:if test="${itemt.submits==1 }">已提交</c:if>
				                        	</td>
					                        <td>
					                        	<c:if test="${itemt.score=='0' }">未批改</c:if>
					                        	<c:if test="${itemt.score!='0' }">${itemt.score }</c:if>
					                        </td>
					                        <td>
					                        	<c:if test="${itemt.submits==1 }">
					                        		<a href="#${itemt.stuid }" onclick="detail(${itemt.stuid })"><img src="img/icons/magnifier.png"  /></a>
					                        		<a href="javascript:;" onclick="deleteStuHomework(${itemt.id})"><img src="img/icons/cross.png"  /></a>
					                        	</c:if>
	                                        	<c:if test="${itemt.submits==0 }">
						                      		<a href="javascript:;">该同学还未提交</a>
						                      	</c:if>
	                                        </td>
				                    	</tr>
				                	</c:forEach>
				                </tbody>
				            </table>
				        </div>
				    </div>
				</div>				
				                       
				<div class="grid_4">
				   	<div class="da-panel">
				       	<div class="da-panel-header">
				           	<span class="da-panel-title">
				                   <img src="img/icons/ui_saccordion.png"  alt="" /> 已提交作业详情
				            </span>
				        </div>
				        <div id="da-ex-accordion">
				        	<c:forEach items="${stuhomeworklist}" var="ite" varStatus="status">
				        	<c:if test="${ite.submits!=0 }">
					            <h3  id="${ite.stuid }"><a href="#">${ite.stuid }</a></h3>
					            <div>
					                <p>
					                ${ite.content}
					                </p>
					            </div>
				            </c:if>
				            </c:forEach>
				        </div>
				    </div>
				</div>
			</div> 
			</div>
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
<!-- Demo JavaScript Files -->
<script type="text/javascript" src="js/demo/demo.ui.js" ></script>
<!-- jQuery-UI JavaScript Files -->
<script type="text/javascript" src="js/jui/js/jquery-ui-1.8.20.min.js" ></script>


<script type="text/javascript">
function changeMe(){  	  
    var courseid = $("#courseid").val();
    $.post("quickfourcourse",{"courseid":courseid,"homeworktype":2},function(msg){  
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
function detail(stuid){
	$("#"+stuid).trigger("click");
};
function deleteStuHomework(id) {
	if(confirm('确实要删除吗?')) {
		$.post("delStuHomeworkById",{"id":id},function(data){
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
        url:"delStuHomeworkByIds",  
        data:{"delitems":checkedList.toString()},  
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
</script>
</body>
</html>