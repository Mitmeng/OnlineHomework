<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>饼状图</title>
<!--  Fluid Grid System -->
<link rel="stylesheet" type="text/css" href="css/fluid.css"  media="screen" />
<!--common style-->
<link href="css/style.css" rel="stylesheet">
<!-- Theme Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/dandelion.theme.css"  media="screen" />
<!--  Main Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/dandelion.css"  media="screen" />
<!-- Demo Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/demo.css"  media="screen" />
<style type="text/css">
.chart-toolti {
   position: absolute;
   display: none;
   padding: 5px;
   max-width: 200px;
   font-size: 12px;
   text-align: center;
   color: #fff;
   background-color: #000;
   border-radius: 4px;
   opacity: 0.8;
 }
</style>
</head>
<body style="background: #f3f3f3;min-height: 300px;position: relative;">

<section class="panel">
    <header class="panel-heading">
        作业-${hometitle }-分层人数
    </header>
    <div class="panel-body">
        <div id="donut-chart" class="pie-chart">
            <div id="donut-chart-container" class="f-c-space">
            </div>
            <div id="bathroom-chart-tooltip" class="chart-toolti">
           </div>
        </div>
    </div>
</section>

<!-- jQuery JavaScript File -->
<script type="text/javascript" src="js/jquery-1.10.2.min.js" ></script>

<!-- DataTables Plugin -->
<script type="text/javascript" src="js/data-table/js/jquery.dataTables.min.js" ></script>
<!-- Demo JavaScript Files -->
<script type="text/javascript" src="js/demo/demo.tables.js" ></script>
<!--flot chart -->
<script src="js/flot-chart/jquery.flot.js"></script>
<script src="js/flot-chart/jquery.flot.resize.js"></script>
<script src="js/flot-chart/jquery.flot.pie.js"></script>
<script src="js/flot-chart/jquery.flot.selection.js"></script>
<script src="js/flot-chart/jquery.flot.stack.js"></script>
<script src="js/flot-chart/jquery.flot.crosshair.js"></script>
<script type="text/javascript">

$(function() {
    var data = [{
        label: "90分以上",
        data: parseFloat("${number['great']}")
    }, {
        label: "80-90分",
        data: parseFloat("${number['good']}")
    }, {
        label: "70-80分",
        data: parseFloat("${number['soso']}")
    }, {
        label: "60-70分",
        data: parseFloat("${number['onlypass']}")
    },
        {
        label: "低于60分",
        data: parseFloat("${number['unpass']}")
    }];
    var options = {
        series: {
            pie: {
                show: true,
                innerRadius: 0.5,
                show: true
            }
        },
        legend: {
            show: false
        },
        grid: {
            hoverable: true,
        },
        colors: ["#4EC9B4", "#ffd200", "#FF834D","#868BB8","#81CDEA"],
       
    };
    $.plot($("#donut-chart #donut-chart-container"), data, options);
});

$("#donut-chart-container").bind("plothover", function(event, pos, item) {
    if (item) {
    	//percent = parseFloat(item.series.percent).toFixed(2);
        $("#bathroom-chart-tooltip").html(item.series.label + " :共 " + item.series.data[0][1] + " 人 ")
            .css({ top: item.pageY , left: item.pageX })
            .fadeIn(200);
    } else {
        $("#bathroom-chart-tooltip").hide();
    }
});
</script>
</body>
</html>