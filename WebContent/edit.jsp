<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>管理</title>
<link href="css/boxAdd.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="switch">
	<button>添加信息</button>
	<button>修改人员</button>
</div>
<!--添加新闻-->
<div class="addNews">
<h2>请在下方添加信息</h2>
<!--     <form action="doAdd.jsp" method="post"> -->
    <form action="doUpload.jsp"enctype="multipart/form-data" method="POST" onsubmit="return checkValid()">       
         标题:<input type="text" value="" name="title" /><br/>
        <label>内容</label>
        <textarea name="content" class="content" type="text" value=""></textarea><br/>
        <label>选择类别</label>
        <select name="kinds">
            <option value="1">大数据要问</option>
            <option value="2">大数据动态</option>
            <option value="3">通知通告</option>	
            <option value="4">大数据知识</option>
            <option value="5">工作简报</option>
            <option value="6">大数据资讯</option>
            <option value="7">调研文章</option>
        </select>
        <h4>请至少选择一张图片</h4>
        <br>选择图片: <input type="file"name="myfile"/>
        <br>选择图片: <input class="sub"  type="file"name="myfile"/>
        <br>选择图片: <input class="sub"  type="file"name="myfile"/>
        <br>选择图片: <input class="sub" type="file"name="myfile"/>
        <input class="sub" type="submit" value="提交"  />
    </form>

</div>
<!--修改人员-->
<div class="addGrounp">
<h2>请填写工作小组</h2>
<form action="updateGrounp.jsp" enctype="application/x-www-form-urlencoded" method="POST" onsubmit="return checkValid()">
	<table>
	<p id="attention"></p>
	<tr><td>组长：</td><td><input type="text" name="leader"></td></tr>
	<tr><td>副组长：</td><td><input type="text" name="deputy"></td></tr>
	<tr><td>成员：</td><td><input type="text" name="staff"></td></tr>
	<tr><td>组长：</td><td><input type="text" name="commander"></td></tr>
	<tr><td>副组长：</td><td><input type="text" name="deputy_comm"></td></tr>
	<tr><td>成员：</td><td><input type="text" name="staff2"></td></tr>
	<tr><td><button id="grounpsub"type="submit">提交</button></td></tr>
	</table>
</form>
</div>
	<script language="javascript" src="js/jquery.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		checkValid(".addGrounp input","#grounpsub");
		checkValid(".addNews input",".sub");
		$(".switch button:first").click(function() {
			ne();
			console.log("1");
		});
		$(".switch button:last").click(function() {
			gro();
			console.log("2");
		});
	});
		function gro() {
			$(".addNews").slideUp(500);
			$(".addGrounp").slideDown(500);
		}
		
		function ne() {
			$(".addNews").slideDown(500);
			$(".addGrounp").slideUp(500);
		}
		
		
		function checkValid(elem,but){
			//点击输入的效果
			var b=false;
			$("input").not(".sub").focus(function(){
				$(this).val(null);
			});
		var $inp=$(elem).not(".sub");
		$inp.each(function(index, domEle) {
				$(but).click(function() {
					if (domEle.value.length<2) {
						$("#attention").replaceWith("<p style='color:red'>输入过长或太短</P>");
						$(domEle).css({
							"border" : "1px solid red",
						});
						return false;
					}
					
				});	
				});
				
			}
	
	</script>
</body>
</html>