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
		.myTable{
			width:800px;
			margin:0 auto;
			text-align:center;
		}
		.myTable span{
			font-size:24px;
			font-weight:bold;
			font-family:"楷体";
			color:red;
		}
		.myTable table{
			width:800px;
			border-collapse:collapse;
		}
		.myTable th,.myTable td{
			border:3px solid purple;
			text-align:center;
			font-size:20px;
			color:white;
			height:30px;
			line-height:30px;
		}
		.myTable a:link,.myTable a:visited{
			text-decoration:none;
			color:#009999;
		}
		.myTable a:hover{
			color:#ff6600;
		}
	</style>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/jquery-1.12.4.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</head>
<body style="background:url(<c:url value='/images/teacher3.gif'/>)">
	<div class="container">
		<div class="myTable" id="QueryAll">
			<span>学生信息表</span>
			<table>
				<thead>
					<th>学号</th>
					<th>姓名</th>
					<th>班级</th>
					<th>职务</th>
					<th colspan="2">操作</th>
				</thead>
				<tbody>
					<c:forEach items="${pageInfo.list }" var="student">
					<tr>
						<td>${student.sno }</td>
						<td>${student.sname }</td>
						<td>${student.grade }</td>
						<td>${student.duty }</td>
						<td><a href="${pageContext.request.contextPath}/teacherEdit?sno=${student.sno }&pn=${pageInfo.pageNum }">修改</a></td>
						<td><a href="${pageContext.request.contextPath}/teacherDelete?sno=${student.sno }&pn=${pageInfo.pageNum }">删除</a></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
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
							<li><a href="${pageContext.request.contextPath}/${requestScope.url}&pn=1">首页</a></li>
						</c:when>
					</c:choose>
					
					<c:if test="${pageInfo.hasPreviousPage }">
						<li><a href="${pageContext.request.contextPath}/${requestScope.url}&pn=${pageInfo.pageNum-1}"
							aria-label="Previous">&laquo;
						</a></li>
					</c:if>


					<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
						<c:if test="${page_Num == pageInfo.pageNum }">
							<li class="active"><a href="#">${page_Num }</a></li>
						</c:if>
						<c:if test="${page_Num != pageInfo.pageNum }">
							<li><a href="${pageContext.request.contextPath}/${requestScope.url}&pn=${page_Num }">${page_Num }</a></li>
						</c:if>

					</c:forEach>
					<c:if test="${pageInfo.hasNextPage }">
						<li><a href="${pageContext.request.contextPath}/${requestScope.url}&pn=${pageInfo.pageNum+1 }"
							aria-label="Next">&raquo;
						</a></li>
					</c:if>
					
					<c:choose>
						<c:when test="${pageInfo.pageNum  eq  pageInfo.pages}">
								<li class="disabled"><a href="#">末页</a></li>
								<!-- <li><a href="#">末页</a></li> -->
						</c:when>
					<c:when test="${pageInfo.pageNum  ne  pageInfo.pages}">
							<li><a href="${pageContext.request.contextPath}/${requestScope.url}&pn=${pageInfo.pages}">末页</a></li>
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