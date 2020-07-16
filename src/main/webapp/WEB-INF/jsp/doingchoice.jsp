<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Doing Choice</title>
<link rel="stylesheet" type="text/css" href="css/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="css/styles.css" />
<style type="text/css">
.demo{width:760px; margin:60px auto 10px auto}
.tools {
    margin: -5px;
}
.tools a {
    border-radius: 2px;
    color: #C5C5CA;
    float: left;
    padding: 10px;
    text-decoration: none;
    font-size: 11px;
}

.tools a:hover {
    background: #7cd8a9;
    color: #fff;
}

</style>
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/jquery.nicescroll.js" type="text/javascript"></script>

<script type="text/javascript" src="js/quiz.js"></script>
<script type="text/javascript">
$(function(){
	var homeworkid =$("#homeworkid").val();
	$.ajax({
		type:'POST',
		url:'pakegechoice',
		data:{"homeworkid":homeworkid},
		async : false, 
		dataType:"json",
		//contentType:"application/json;charset=utf-8",
		success:function(data){
			$('#quiz-container').jquizzy({
		        questions: data
		    });
		}
	});


});
$(function() {
$('.panel .tools .t-collapse').click(function () {
    var el = $(this).parents(".panel").children(".panel-body");
    if ($(this).hasClass("fa-chevron-down")) {
        $(this).removeClass("fa-chevron-down").addClass("fa-chevron-up");
        el.slideUp(200);
    } else {
        $(this).removeClass("fa-chevron-up").addClass("fa-chevron-down");
        el.slideDown(200); }
});


// close panel 
$('.panel .tools .t-close').click(function () {
    $(this).parents(".panel").parent().remove();
});

$('.box-refresh').on('click', function(br) {
    br.preventDefault();
    $("<div class='refresh-block'><span class='refresh-loader'><i class='fa fa-spinner fa-spin'></i></span></div>").appendTo($(this).parents('.tools').parents('.panel-heading').parents('.panel'));

    setTimeout(function() {
        $('.refresh-block').remove();
    }, 1000);

});
})(jQuery);
</script>
</head>
<body style="background: #fff;position: relative;">
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
			<input type="hidden" id= "homeworkid" name="homeworkid" value="${dohomework.id }">		
			<div class="demo">
				<div id='quiz-container'></div>
			</div>
	  </div>
	</section>

</body>
</html>
