<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/stylle.css" />

<!--  Main Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/dandelion.css"  media="screen" />


<style>
    .fileinput-button {
        position: relative;
        display: inline-block;
        overflow: hidden;
    }

    .fileinput-button input{
        position:absolute;
        right: 0px;
        top: 0px;
        opacity: 0;
        -ms-filter: 'alpha(opacity=0)';
        font-size: 200px;
    }

*{margin: 0 auto;  
    padding: 0;}  
#overDiv,#overDi {  
    background-color:#000;  
    width: 100%;  
    height: 100%;  
    left: 0;  
    top: 0; /*FF IE7*/  
    filter: alpha(opacity = 65); /*IE*/  
    opacity: 0.65; /*FF*/  
    z-index: 110;  
    position: fixed !important; /*FF IE7*/  
    position: absolute; /*IE6*/  
    _top: expression(eval(document.compatMode &&   
     document.compatMode == 'CSS1Compat')?   
    documentElement.scrollTop+  (document.documentElement.clientHeight-this.offsetHeight  
        )/2: /*IE6*/   
    document.body.scrollTop+  (document.body.clientHeight-  this.clientHeight  
        )/2 ); /*IE5 IE5.5*/  
}  
  
#hsDiv,#hsDi {  
    background:#e7e7e7;  
      
    z-index: 120;  
    width: 450px;  
    height: 380px;  
    left: 43%; /*FF IE7*/  
    top: 37%; /*FF IE7*/  
    margin-left: -150px !important; /*FF IE7 该值为本身宽的一半 */  
    margin-top: -60px !important; /*FF IE7 该值为本身高的一半*/  
    margin-top: 0px;  
    position: fixed !important; /*FF IE7*/  
    position: absolute; /*IE6*/  
    _top: expression(eval(document.compatMode &&   
     document.compatMode == 'CSS1Compat')?   
    documentElement.scrollTop+  (document.documentElement.clientHeight-this.offsetHeight  
        )/2: /*IE6*/   
    document.body.scrollTop+  (document.body.clientHeight-  this.clientHeight  
        )/2 ); /*IE5 IE5.5*/  
}  
  
.lobu {  
    width: 65px;  
    height: 25px;  
    background: #FFFFFF;  
    font-size: 13px;  
    border: #0099CC solid 1px;  
}  
 
 .error{
      color:red;
     }    
</style>
</head>
<body>
          
		<div id="hsDiv" style="display:none;">  
		       <!-- 右上角关闭按钮 --> 
		    <div id="closediv" style="margin-left: 440px; margin-top: -10px;" > 
		        <a href="javascript:void(0);" onclick="closeDiv(1)"><img src="img/icons/cross.png">  
		        </a>  
		    </div>  
		    <!-- 登陆标题 -->  
		    <div id="dlTitle "  style="text-align: center;"><h4>新增用户</h4></div>  
		    <form id="forms"  method="post">
		    <!-- 登陆div -->  
		    <div id="tbdiv" style="margin-left: 50px;">
		    	<input id="usertype" name="usertype" type="hidden" value="${usertype }" />  
		    	<div><label for="oldpassword">请输入账号</label> </div>
		        <div>
		        	<input style="margin-bottom: 6px;border-radius: 4px;border: 1px solid #3fdfdf;background: #ffffdf;width:80%;height: 34px;padding: 6px 12px; font-size: 14px; line-height: 1.42857143;" type="text" name="userid" id="userid" value=""> 			                
		        </div>
		        <div><label for="newpassword">请输入用户名</label> </div>
		        <div>
		            <input style="margin-bottom: 6px;border-radius: 4px;border: 1px solid #3fdfdf;background: #ffffdf;width:80%;height: 34px;padding: 6px 12px; font-size: 14px; line-height: 1.42857143;" type="text" name="username" id="username" value="">  
		        </div> 
		        <div>
		        <label for="renewpassword">密码</label>
		        </div>
		        <div>      
		            <input style="margin-bottom: 6px;border-radius: 4px;border: 1px solid #3fdfdf;background: #ffffdf;width:80%;height: 34px;padding: 6px 12px; font-size: 14px; line-height: 1.42857143;" type="text" name="password" id="password" value="123456">  
		        </div>      
	              <button style="text-align: center;margin-top: 30px;" class="btn btn-success" type="submit" onclick="adduser()">确认添加</button> 			  
		    </div>
		    </form>  
		</div>  
		<div id="overDiv" style="display:none;"></div> 
		
		<div id="hsDi" style="display:none;">  
		       <!-- 右上角关闭按钮 --> 
		    <div id="closedi" style="margin-left: 440px; margin-top: -10px;" > 
		        <a href="javascript:void(0);" onclick="closeDiv(2)"><img src="img/icons/cross.png">  
		        </a>  
		    </div>  
		    <!-- 登陆标题 -->  
		    <div id="dTitle "  style="text-align: center;"><h4>修改信息</h4></div>  
		    <form id="formss"  method="post">
		    <!-- 登陆div -->  
		    <div id="bdiv" style="margin-left: 50px;">
		    	<input type="hidden" id="id" name="id" value=""/>
		    	<div><label for="oldpassword">账号</label> </div>
		        <div>
		        	<input style="margin-bottom: 6px;border-radius: 4px;border: 1px solid #3fdfdf;background: #ffffdf;width:80%;height: 34px;padding: 6px 12px; font-size: 14px; line-height: 1.42857143;" type="text" name="userid" id="useid" value=""> 			                
		        </div>
		        <div><label for="newpassword">用户名</label> </div>
		        <div>
		            <input style="margin-bottom: 6px;border-radius: 4px;border: 1px solid #3fdfdf;background: #ffffdf;width:80%;height: 34px;padding: 6px 12px; font-size: 14px; line-height: 1.42857143;" type="text" name="username" id="usename" value="">  
		        </div> 
		        <div>
		        <label for="renewpassword">密码</label>
		        </div>
		        <div>      
		            <input style="margin-bottom: 6px;border-radius: 4px;border: 1px solid #3fdfdf;background: #ffffdf;width:80%;height: 34px;padding: 6px 12px; font-size: 14px; line-height: 1.42857143;" type="text" name="password" id="usepassword" value="">  
		        </div>
		        <c:if test="${usertype==0 }">
	          	<div class="radio-custom radio-success">
                  <input type="radio" value="0" checked="checked" name="usertype" id="student">
                  <label for="student">学生</label>
                  <input type="radio" value="1" name="usertype" id="teacher" >
                  <label for="teacher">教师</label>
              	</div> 
		        </c:if>
		        <c:if test="${usertype==1 }">
	          	<div class="radio-custom radio-success">
                  <input type="radio" value="0" name="usertype" id="student">
                  <label for="student">学生</label>
                  <input type="radio" value="1" checked="checked" name="usertype" id="teacher" >
                  <label for="teacher">教师</label>
              	</div> 
		        </c:if>
	              <button style="text-align: center;margin-top: 30px;" class="btn btn-success" type="submit" onclick="updateuser()">确认修改</button> 			  
		    </div>
		    </form>  
		</div>  
		<div id="overDi" style="display:none;"></div>  
		 
		<form id="formm" class="form-inline definewidth m20"  enctype="multipart/form-data" method="post">
			   
			 <div align="right">
			 <a><button type="button" class="btn btn-primary" onclick="show()">添加</button></a>&nbsp;&nbsp;
			 <input class="abc input-default" type="hidden" name="usertype" value="${usertype }"></input>&nbsp;&nbsp;
			 <span class="btn btn-success fileinput-button">
			 <span>导入用户</span>
			 <input type="file" name="file" id="excelFile" onchange="fileUpload()"></input>&nbsp;&nbsp;
			 </span>
		     </div>
		     
		</form>
		<table class="da-table" id="da-ex-datatable-numberpaging" >
		    <thead>
			    <tr>

			        <th><a href="javascript:" onclick="batchDeletes()"><img src="img/icons/cross.png"  /></a></th>
			        <th>账号</th>
			        <th>用户名</th>
			        <th>密码</th>
			        <th>操作</th>
			    </tr>
		    </thead>
		    <tbody>
		    <c:forEach items="${userlist }" var="user" varStatus="status">
				<tr>
					<td><input type="checkbox" class="selectone" name="selecti" value="${user.id }"/></td>
					<td>${user.userid }</td>
					<td>${user.username }</td>
					<td>${user.password }</td>
					<td>
						<a href="javascript:" onclick="shows(${user.id },'${user.userid}','${user.username }','${user.password }')">修改</a>  
						<a href="javascript:" onclick="reset(${user.id})">重置</a>              
						<a href="javascript:" onclick="del(${user.id})">删除</a>
					</td>
					
				</tr>
			</c:forEach>
			
				
			</tbody>
		</table>
		              

<!-- jQuery JavaScript File -->
<script type="text/javascript" src="js/jquery-1.10.2.min.js" ></script>
<script src="js/jquery.validate.min.js" type="text/javascript"></script>
<!-- DataTables Plugin -->
<script type="text/javascript" src="js/data-table/js/jquery.dataTables.min.js" ></script>

<!-- Demo JavaScript Files -->
<script type="text/javascript" src="js/demo/demo.tables.js" ></script>




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
    $.ajax({  
        type:"POST",  
        url:"deleteuserByIds",  
        data:{"delitems":checkedList.toString()},  
        datatype:"html",  
        success:function(data){  
        	alert("删除成功!");
            location.reload();//页面刷新  
        },  
        error:function(){  
            alert('删除失败!');  
        }  
    });  
    }  
}; 
function del(userId){
	if(confirm("确定要删除吗？")){
		$.ajax({  
	        type:"POST",  
	        url:"deleteuserById",  
	        data:{"id":userId.toString()},  
	        datatype:"html",  
	        success:function(data){  
	            alert("删除成功!");
	            location.reload();//页面刷新  
	        },  
	        error:function(){  
	            alert('删除失败!');  
	        }  
	    });
}
};

function reset(userid){
	if(confirm("确定要重置该密码吗？")){
		$.ajax({  
	        type:"POST",  
	        url:"updatepasswordById",  
	        data:{"id":userid.toString()},  
	        datatype:"html",  
	        success:function(data){  
	            alert("密码重置成功!");
	            location.reload();//页面刷新  
	        },  
	        error:function(){  
	            alert('密码重置失败!');  
	        }  
	    });
	}
};

//文件上传
function fileUpload(){
	var f_content = $("#excelFile").val();
	var fileext = f_content.substring(f_content.lastIndexOf("."),f_content.length)
	fileext = fileext.toLowerCase()
	if(fileext=='.xls'||fileext=='.xlsx'){
		var formData = new FormData(document.getElementById("formm"));
		$.ajax({
			url:'importUser',
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

function show(){ 
	document.getElementById("overDiv").style.display = "block" ;  
    document.getElementById("hsDiv").style.display = "block" ;    
}; 
function shows(id,userid,username,password){ 
	document.getElementById("overDi").style.display = "block" ;  
   document.getElementById("hsDi").style.display = "block" ; 
   $("#id").val(id);
   $("#useid").val(userid);
   $("#usename").val(username);
   $("#usepassword").val(password);    
};
function closeDiv(flag){
	var id = flag;	
	if(id==1||id=='1'){
		document.getElementById("overDiv").style.display = "none" ;  
	    document.getElementById("hsDiv").style.display = "none" ;
	}else{
		document.getElementById("overDi").style.display = "none" ;  
	    document.getElementById("hsDi").style.display = "none" ;
	}  
};  

$(function(){
	$("#forms").validate({
		rules:{
			"userid":{
				"required":true
			},
			"username":{
				"required":true
			},
			"password":{
				"required":true,
				"rangelength":[6,12]
			}
		},
		messages:{
			"userid":{
				"required":"账号不能为空"
			},
			"username":{
				"required":"用户名不能为空"
			},
			"password":{
				"required":"密码不能为空",
				"rangelength":"密码长度6-12位"
			},
		}
	});
}); 

function adduser() {
    $.ajax({
    //几个参数需要注意一下
        type: "POST",//方法类型
        url: "userregisration" ,//url
        data: $('#forms').serialize(),
        success: function (result) {
            console.log(result);//打印服务端返回的数据(调试用)
            window.location.reload();
        },
        error : function() {
            window.location.reload();
        }
    });
};
function updateuser(){
    $.ajax({
    //几个参数需要注意一下
        type: "POST",//方法类型
        url: "updateuser" ,//url
        data: $('#formss').serialize(),
        success: function (result) {
            console.log("修改成功!");//打印服务端返回的数据(调试用)
            window.location.reload();
        },
        error : function() {
            window.location.reload();
        }
    });
}
</script>
</body>
</html>
