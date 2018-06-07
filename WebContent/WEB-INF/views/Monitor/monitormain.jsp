<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
	<title>班长的后花园</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>">
	<style type="text/css">
		.navbar-header{
			margin-right:20px;
		}
		.myNavBar>li{
			margin-top:18px;
			font-size:24px;
			font-weight:bold;
		}
		.navbar{
			background:#ccff99;
		}
		.welcome{
			font-size:20px;
			color:black;
		}
		.welcome>a:hover{
			text-decoration:none;
			background:#cccccc;
		}
	</style>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/jquery-1.12.4.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</head>
<body background="<c:url value='/images/loginBackgrund.jpg'/>">
	<div class="container">
		<nav class="navbar navbar-default">
			<!--页面的头部-->
			<div class="navbar-header">
				<a href="#"><img src="<c:url value='/images/scautitle.png'/>"></a>
			</div>

			<!--导航链接-->
			<div class="collapse navbar-collapse">
				<!--collapse:折叠导航栏样式的基类 给ul的父元素加，navbar-collapse:折叠导航栏样式 给ul的父元素加-->
				<ul class="nav navbar-nav myNavBar">
					<!--nav:导航栏的链接基类， navbar-nav:导航栏的链接样式-->
					<li><a href="${pageContext.request.contextPath}/prenewAnnouce">新闻公告发布</a></li>
					<li><a href="${pageContext.request.contextPath}/preManageMsg">管理留言</a></li>
					<li><a href="${pageContext.request.contextPath}/preUpload">上传照片</a></li>
					<li><a href="${pageContext.request.contextPath}/preconfirm">注册确认</a></li>
				</ul>
				<div class="navbar-right">
					<span class="welcome">欢迎你，${sessionScope.student.sname }班长|<a href="${pageContext.request.contextPath}/monitorquit">退出</a></span>
				</div>
			</div>
		</nav>
	</div>
</body>
</html>