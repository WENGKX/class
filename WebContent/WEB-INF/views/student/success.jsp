<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>注册成功</title>
	<style type="text/css">
		#span1{
			font-size:32px;
			color:red;
		}
		div{
			position:absolute;
			top:200px;
			left:350px;
			font-size:30px;
			font-weight:bold;
		}
	</style>
	<script type="text/javascript">
		window.onload = init;
		function init() {
			window.setTimeout("comeback()",5000);
			window.setInterval("countTime()",1000);
		}
		function comeback() {
			location.replace("${pageContext.request.contextPath}/index.jsp");
		}
		function countTime() {
			var obj = document.getElementById("span1");
			var n = obj.innerHTML;
			obj.innerHTML = n - 1;
		}
	</script>
</head>
<body background="<c:url value='/images/balloon.jpg'/>">
	<div>${requestScope.msg}<span id="span1">5</span>秒后自动跳转到首页</div>
</body>
</html>