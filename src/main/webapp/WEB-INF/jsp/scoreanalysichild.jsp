<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程作业分析</title>
<!--  Fluid Grid System -->
<link rel="stylesheet" type="text/css" href="css/fluid.css"  media="screen" />
<!--common style-->
<link href="css/style.css" rel="stylesheet">
<!--  Main Stylesheet -->
<link rel="stylesheet" type="text/css" href="css/dandelion.css"  media="screen" />
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
   <img src="img/icons/graph.png"  alt="" />
       作业统计:${courselist.coursename }
   </header>
   <div class="panel-body">
       <div id="multi-sates">
           <div id="multi-states-container" class="f-c-space">
           </div>
           <div id="bathroom-chart-tooltip" class="chart-toolti">
           </div>
       </div>
   </div>
</section>


<!-- jQuery JavaScript File -->
<script type="text/javascript" src="js/jquery-1.10.2.min.js" ></script>
<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
<!--flot chart -->
<script type="text/javascript" src="js/flot-chart/jquery.flot.js"></script>
<script type="text/javascript" src="js/flot-chart/jquery.flot.resize.js"></script>
<script type="text/javascript" src="js/flot-chart/jquery.flot.pie.js"></script>
<script type="text/javascript" src="js/flot-chart/jquery.flot.selection.js"></script>
<script type="text/javascript" src="js/flot-chart/jquery.flot.stack.js"></script>
<script type="text/javascript" src="js/flot-chart/jquery.flot.crosshair.js"></script>
<script type="text/javascript">
var data11=[];
var data21=[];
var data31=[];
var title1=[];
<c:forEach items="${coursescore}" var="itm" varStatus="tatus">
	var arry1 = [parseInt("${tatus.count}"),parseFloat("${itm['counts']}")];
    var arry2 = [parseInt("${tatus.count}"),parseFloat("${itm['great']}")];
    var arry3 = [parseInt("${tatus.count}"),parseFloat("${itm['pass']}")];
    var arry4 = [parseInt("${tatus.count}"),"${itm['homework']}"];
    
	data11.push(arry1);
	data21.push(arry2);
	data31.push(arry3);
	title1.push(arry4);
</c:forEach>    
$(function() {	
    $.plot($("#multi-sates #multi-states-container"), [{
        data: data21,
        label: "优秀率",
        lines: {
            show: true
        }
    }, {
        data: data31,
        label: "及格率",

        points: {
            show: true
        },
        lines: {
            show: true
        }
    },
    {
        data: data11,
        label: "平均分",

        points: {
            show: true
        },
        lines: {
            show: true
        }
    }
    ],
        {
            series: {
                lines: {
                    show: true,
                    fill: false
                },
                points: {
                    show: true,
                    lineWidth: 2,
                    fill: true,
                    fillColor: "#ffffff",
                    symbol: "circle",
                    radius: 5
                },
                shadowSize: 0
            },
            grid: {
                hoverable: true,
               // clickable: true,
                tickColor: "#f9f9f9",
                borderWidth: 1,
                borderColor: "#dddddd"
            },
            colors: ["#53d192", "#ffd200","#77d200"],
           // tooltip: true,
            /*tooltipOpts: {
                defaultTheme: false
            },*/
            xaxis: {
               ticks:title1,
            },
            yaxis: { min: 0, max: 100 },
        }
    );
});

$("#multi-states-container").bind("plothover", function(event, pos, item) {
     if (item) {
         $("#bathroom-chart-tooltip").html(item.series.label + " : " + item.datapoint[1] + " % ")
             .css({ top: item.pageY , left: item.pageX })
             .fadeIn(200);
     } else {
         $("#bathroom-chart-tooltip").hide();
     }
 });



</script>

</body>
</html>