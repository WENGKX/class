<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
	<title>15级信科</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>">
	<style type="text/css">
		.page-header{
			margin-top:0;
			margin-bottom:0;
			font-size:50px;
			color:#ccffff;
			font-weight:bold;
			text-shadow:2px -3px 5px blue;
			font-style:italic;
			font-family:"微软繁琥珀";
		}
		.welcome{
			position:absolute;
			top:40px;
			right:210px;
			font-size:24px;
			font-weight:bold;
		}
		.welcome a:link,.welcome a:visited{
			text-decoration:none;
		}
		.welcome a:hover{
			background:#ccccff;
		}
		#myTab{
			padding-bottom:83px;
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
<body background="<c:url value='/images/loginBackgrund.jpg'/>">
	<div class="container">
		<div class="welcome">欢迎你，${sessionScope.student.sname }同学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/quit" target="_parent">退出</a></div>
		
		<div style="background:url(<c:url value='/images/p4.png'/>)">
			<div class="page-header">We are family</div>
			<ul class="nav nav-tabs" id="myTab">
				<li><a target="mainFrame" href="${pageContext.request.contextPath}/classNews?pn=1">新闻公告</a></li>
				<li><a target="mainFrame" href="${pageContext.request.contextPath}/lookImage?pn=1">班级照片</a></li>
				<li><a target="mainFrame" href="${pageContext.request.contextPath}/classLookThroughMsg">班级留言</a></li>
				<li class="dropdown">
					<a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">我的留言<span class="caret"></span></a>
				  	<ul class="dropdown-menu" style="min-width:98px;">
					    <li><a target="mainFrame" href="${pageContext.request.contextPath}/classMyMsg" class="myvalue">旧时留言</a></li>
					    <li role="separator" class="divider"></li>
					    <li><a target="mainFrame" href="${pageContext.request.contextPath}/preWriter" class="myvalue">写留言</a></li>
				    </ul>
				</li>
				<li class="dropdown">
					<a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">我的信息<span class="caret"></span></a>
				  	<ul class="dropdown-menu" style="min-width:98px;">
					    <li><a target="mainFrame" href="${pageContext.request.contextPath}/personalMsg?sno=${sessionScope.student.sno}">个人信息</a></li>
					    <li role="separator" class="divider"></li>
					    <li><a target="mainFrame" href="${pageContext.request.contextPath}/changePassword">修改密码</a></li>
				    </ul>
				</li>
				<li><a target="mainFrame" href="${pageContext.request.contextPath}/otherMsg?sno=${sessionScope.student.sno}">其他成员信息</a></li>
			</ul>
		</div>
	</div>
</body>
</html>