<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>老师办公管理</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>">
	<style type="text/css">
		.mynavs{
			width:200px;
			padding-top:20px;
			font-size:20px;
		}
		.welTeacher{
			font-size:20px;
			font-weight:bold;
			position:absolute;
			top:20px;
			right:150px;
			color:blue;
		}
		.welTeacher a:hover{
			background:orange;
			text-decoration:none;
		}
	</style>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/jquery-1.12.4.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
	<script type="text/javascript">
		$(function() {
			$("#myTab li").on("click",function() {
				$(this).addClass("active").siblings().removeClass("active");
			});
		});
	</script>
</head>
<body style="background:url(<c:url value='/images/teacher3.gif'/>)">
	<div class="container">
		<div class="welTeacher">欢迎你，${sessionScope.teacher.tname }老师&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/teacherQuit" target="_parent">退出</a></div>
		<div class="mynavs">
			<ul class="nav nav-pills nav-stacked" id="myTab">
				<li><a target="teacherMainFrame" href="${pageContext.request.contextPath}/teacherQueryAll?pn=1">查询所有同学信息</a></li>
				<li><a target="teacherMainFrame" href="${pageContext.request.contextPath}/preteacherAdvanceQuery">高级查询</a></li>
				<li><a target="teacherMainFrame" href="${pageContext.request.contextPath}/preTeacherAddMenber">添加班级成员</a></li>
			</ul>
		</div>
	</div>
</body>
</html>