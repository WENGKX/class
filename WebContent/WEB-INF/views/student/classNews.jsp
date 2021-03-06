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
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/SignUp.css'/>">
	<style type="text/css">
		.container{
			width:1140px;
			overflow:hidden;
			height:500px;
			padding:0;
		}
		
		h2{
			margin-bottom:30px;
		}
		#news{
			width:1160px;
			height:100%;
			background:url(<c:url value='/images/p3.png'/>);
			overflow-y:auto;
			overflow-x:hidden;
		}

		#news .row{
			width:1140px;
			margin:0;
			border-top:1px solid darkgray;
			border-bottom:1px solid darkgray;
			position:relative;
		}
		#news .row p{
			margin-left:50px;
			font-size:25px;
			font-family:"楷书";
		}
		#news .row span{
			position:absolute;
			bottom:5px;
			right:15px;
			font-size:18px;
		}
	</style>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/jquery-1.12.4.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</head>
<body background="<c:url value='/images/loginBackgrund.jpg'/>">
	<div class="container">
		<div id="news">
			<c:forEach items="${requestScope.informs}" var="inform">
			<div class="row">
				<div class="col-sm-12">
				
					<h4 style="color:blue">公告人：${requestScope.student.sname }班长</h4>
					<h2>
					${inform.imessage }
					</h2>
					<span style="color:purple">${inform.idate}</span>
				</div>
			</div>
			</c:forEach>
			<div class="row">
			<!--分页文字信息  -->
			<div class="col-md-6" style="color:gray;padding-top:15px;font-weight:bold;font-size:120%">当前第 ${pageInfo.pageNum }页,共${pageInfo.pages }
				页,总 ${pageInfo.total } 条记录</div>
			<!-- 分页条信息 -->
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				<ul class="pagination">
					<c:choose>
						<c:when test="${pageInfo.pageNum  eq 1}">
								<!-- <li><a href="#">首页</a></li> -->
								<li class="disabled"><a href="#">首页</a></li>
						</c:when>
					<c:when test="${pageInfo.pageNum  ne  1}">
							<li><a href="${pageContext.request.contextPath}/classNews?pn=1">首页</a></li>
						</c:when>
					</c:choose>
					
					<c:if test="${pageInfo.hasPreviousPage }">
						<li><a href="${pageContext.request.contextPath}/classNews?pn=${pageInfo.pageNum-1}"
							aria-label="Previous">&laquo;</a></li>
					</c:if>


					<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
						<c:if test="${page_Num == pageInfo.pageNum }">
							<li class="active"><a href="#">${page_Num }</a></li>
						</c:if>
						<c:if test="${page_Num != pageInfo.pageNum }">
							<li><a href="${pageContext.request.contextPath}/classNews?pn=${page_Num }">${page_Num }</a></li>
						</c:if>

					</c:forEach>
					<c:if test="${pageInfo.hasNextPage }">
						<li><a href="${pageContext.request.contextPath}/classNews?pn=${pageInfo.pageNum+1 }"
							aria-label="Next">&raquo;
						</a></li>
					</c:if>
					
					<c:choose>
						<c:when test="${pageInfo.pageNum  eq  pageInfo.pages}">
								<li class="disabled"><a href="#">末页</a></li>
								<!-- <li><a href="#">末页</a></li> -->
						</c:when>
					<c:when test="${pageInfo.pageNum  ne  pageInfo.pages}">
							<li><a href="${pageContext.request.contextPath}/classNews?pn=${pageInfo.pages}">末页</a></li>
						</c:when>
					</c:choose>
				</ul>
				</nav>
			</div>
		</div>
			
		</div>
	</div>
</body>
</html>