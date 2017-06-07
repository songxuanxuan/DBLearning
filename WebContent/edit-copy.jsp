<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>管理</title>
<link href="css/boxAdd.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--添加新闻-->
<div class="addNews">
<h2>请在下方添加信息</h2>
<!--     <form action="doAdd.jsp" method="post" > -->
    		<form action="simpleFileupload" method="post" enctype="multipart/form-data">
        <label>标题</label>
        <input type="text" value="" name="title" />
        <label>内容</label>
        <textarea name="content" class="content" type="text" value=""></textarea>
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
        <!--添加图片-->
		<div class="addPic">
		请选择图片<input id="myfile" name="myfile" type="file" onchange="showPreview(this)"/>
<!-- 		<input type="post"> -->
		<div id="previeImg"></div>
		</div>
        <input type="submit" value="提交"  />
    </form>

</div>
</body>
</html>