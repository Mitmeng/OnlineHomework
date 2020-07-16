<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程管理</title>
<!--right slidebar-->
<link href="css/slidebars.css" rel="stylesheet">

<!--switchery-->
<link href="js/switchery/switchery.min.css" rel="stylesheet" type="text/css" media="screen" />

<!--Morris Chart -->
<link rel="stylesheet" href="js/morris-chart/morris.css">

<!--common style-->
<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet">
</head>
<body style="background: #f3f3f3;min-height: 500px;position: relative;">
<div class="row">
	<c:forEach items="${course}" var="coulist" varStatus="status">		
			<div class="col-md-6">
		         <section class="panel" >
		             <header class="panel-heading">
		                 课程名称：${coulist.coursename }
		                 <span class="tools pull-right">
		                     <a class="fa fa-repeat box-refresh" href="javascript:;"></a>
		                     <a class="t-collapse fa fa-chevron-down" href="javascript:;"></a>
		                     <a class="t-close fa fa-times" href="javascript:;"></a>
		                 </span>
		             </header>
		             <div class="panel-body">
		                 <div id="bar-chart${status.count }"></div>
		             </div>
		         </section>
			</div>		
	</c:forEach>
</div>		
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
<!--Morris Chart-->
<script src="js/morris-chart/morris.js"></script>
<script src="js/morris-chart/raphael-min.js"></script>
<!--common scripts for all pages-->
<script src="js/scripts.js"></script>

<script type="text/javascript">
<c:forEach items="${courselist}" var="items" varStatus="status">
//alert("${items}");
var datas=[];
<c:forEach items="${items}" var="itm" varStatus="tatus">
	var data={
			'x':"${itm['x']}",
			'y':"${itm['y']}",
			'z':"${itm['z']}",
			'a':"${itm['a']}",
	};
	datas.push(data);
</c:forEach>
	new Morris.Bar({
		element: 'bar-chart${status.count }',
	    data: datas,
	    xkey: 'x',
	    ykeys: ['y', 'z', 'a'],
	    labels: ['已提交人数', '可批改人数', '未提交人数'],
	    barColors:['#4EC9B4','#868BB8','#ffe157']
	});
//alert("${items}");
</c:forEach>


</script>

</body>
</html>