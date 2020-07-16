<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Multiple-choice Question Homework</title>

<link rel="stylesheet" type="text/css" href="css/wenjuan_ht.css">
<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/index.js"></script>

</head>
<body>
	<div style="padding: 15px;font-size: 14px;">
		<div style="display: inline-block;margin-bottom: 0;vertical-align: middle;">
			<label for="customerFrom">请选择课程</label>
			<select	style="display: inline-block;width: auto;vertical-align: middle;height: 34px;padding: 6px 12px;font-size: 14px;line-height: 1.42857143;color: #555;background-color: #fff;" id="courseid" name="courseid" >
			<option value="">--请选择--</option>
				<c:forEach items="${courselist}" var="item">
					<option value="${item.courseid}">${item.coursename }</option>
				</c:forEach>
			</select>
			<label for="titles">请输入作业标题</label>
			<input type="text" id="titles" name="titles" placeholder="请输入标题" style="display: inline-block;width: auto;vertical-align: middle;padding: 6px 12px;font-size: 14px;line-height: 1.42857143;color: #555;background-color: #fff;"/>
			
		</div>
		
		<!--<button type="submit" style="padding: 6px 12px;background-color: #a978d1;border-color: #a978d1;color: #FFFFFF;border: 1px solid transparent;border-radius: 4px;" >查询</button> -->			
	</div>


	<div class=" all_660">
        <div class="yd_box"></div>
        <div class="but" style="padding-top: 20px">
        	<label for="addquerstions">添加问题</label>
            <select id="addquerstions" class="addquerstions" style="display: inline-block;width: auto;vertical-align: middle;height: 34px;padding: 6px 12px;font-size: 14px;line-height: 1.42857143;color: #555;background-color: #fff;"  >
            	<option value="-1">--请选择--</option>
                <option value="0">单选</option>
            </select>
            <input type="submit" onclick="sub(check())" class="btn btn-primary" value="确认添加" style="padding: 6px 12px;background-color: #a978d1;border-color: #a978d1;color: #FFFFFF;border: 1px solid transparent;border-radius: 4px;"/>
        </div>
        <!--选项卡区域  模板区域---------------------------------------------------------------------------------------------------------------------------------------->
        <div class="xxk_box">
            <div class="xxk_conn hide">
                <!--单选----------------------------------------------------------------------------------------------------------------------------------------->
                <div class="xxk_xzqh_box dxuan ">
                    <textarea name="" cols="" rows="" class="input_wenbk btwen_text btwen_text_dx" placeholder="单选题目"></textarea>
                    <div class="title_itram">
                        <div class="kzjxx_iteam">
                            <input name="" type="radio" value="" class="dxk">
                            <input name="" type="text" class="input_wenbk" value="" placeholder="选项">
                            <a href="javascript:void(0);" class="del_xm">删除</a>
                        </div>
                    </div>
                    <a href="javascript:void(0)" class="zjxx">增加选项</a>
                    <!--完成编辑-->
                    <div class="bjqxwc_box">
                        <a href="javascript:void(0);" class="qxbj_but">取消编辑</a>
                        <a href="javascript:void(0);" class="swcbj_but"> 完成编辑</a>
                    </div>
                </div>
                <!--多选----------------------------------------------------------------------------------------------------------------------------------------->
                <div class="xxk_xzqh_box duoxuan hide">
                    <textarea name="" cols="" rows="" class="input_wenbk btwen_text btwen_text_duox" placeholder="多选题目"></textarea>
                    <div class="title_itram">
                        <div class="kzjxx_iteam">
                            <input name="" type="checkbox" value="" class="dxk">
                            <input name="" type="text" class="input_wenbk" value="选项" placeholder="选项">
                            <label>
                                <input name="" type="checkbox" value="" class="fxk"> <span>可填空</span></label>
                            <a href="javascript:void(0);" class="del_xm">删除</a>
                        </div>
                    </div>
                    <a href="javascript:void(0)" class="zjxx">增加选项</a>
                    <!--完成编辑-->
                    <div class="bjqxwc_box">
                        <a href="javascript:void(0);" class="qxbj_but">取消编辑</a>
                        <a href="javascript:void(0);" class="swcbj_but"> 完成编辑</a>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
<!--  </form>  -->
 <script type="text/javascript">
 var myDataArray=[];
 var empty;
 var checknum;
 function check(){ 
	var title =$("#titles").val();
	//var content =$(".note-editable").html();
	var course =$("#courseid").val();
	if(course==''){
		alert("请先选择课程！");
		return false;
	}
	if(title==''){
		alert("请先输入作业标题！");
		return false;
	}
	return true;
};
 function sub(check){
	 $(".swcbj_but").trigger("click");
	  myDataArray=[];
	  empty = false;
	  checknum= false;
	var titles =$("#titles").val();
	var courseid =$("#courseid").val();
	$(".wjdc_list").each(function(){
		var mydata=[];
		var ul = $(this);
		var self = ul.children("li").children(".tm_btitlt").children(".btwenzi");
		ul.children("li:not(:first)").each(function(){
			var li = $(this);
			var selfs = li.children(".optionclass").children("span");
			if(selfs.text()==''||selfs.text()==""||selfs.text()==null){
				empty=true;
			}
			mydata.push({'option':selfs.text()});
		});
		if(self.text()==""||self.text()==''||self.text()==null){
			empty=true;
		}
		var data={
			'question':self.text(),
			'answer':mydata,
		};
		myDataArray.push(data);
		
	});
	//还没添加问题
	if(myDataArray==''||myDataArray==null){
		alert("请确保添加了问题！");
		check = false;
	}
	//添加问题但还没有编写任何问题
	if(empty){
		alert("请确保添加了问题！");
		check = false;
	}
	
	var len = $(".movie_box").length,count = 0;
    for(var i = 0; i < len; i++){
        var inputs = document.getElementsByName('a'+(i+1)),ilen= inputs.length;
         
        for(var j = 0; j < ilen; j++){
            if(inputs[j].checked){
                count++;   
            }   
        }   
    }
    if(count == len){
    	checknum=true;
    }else{
        alert('您还有题目尚未选择！');
        checknum=false;
    }
	
	if(check&&!empty&&checknum){
		var checkedList = new Array(); 
		var len = $(".movie_box").length;
        for(var i = 0; i < len; i++){
            var inputs = document.getElementsByName('a'+(i+1)),ilen= inputs.length;
             
            for(var j = 0; j < ilen; j++){
                if(inputs[j].checked){
                	checkedList.push(inputs[j].value);
                }   
            }   
        }
    	alert(checkedList);
		$.ajax({
			type:'POST',
			url:'addchoicehomework',
			data:JSON.stringify({"courseid":courseid,"titles":titles,"listMap":myDataArray,"correctanswer":checkedList}),
			async : false, 
			contentType:"application/json;charset=utf-8",
			success:function(data){
				window.location.href="${pageContext.request.contextPath }/allhomework";
			},
		});
	}	
 }
 </script>   
    
</body>
</html>