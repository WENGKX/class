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
		h2{
			margin-top:0;
			margin-bottom:30px;
		}
		#otherMsg{
			width:1140px;
			height:600px;
			margin:0 auto;
			padding-top:10px;
			background:url(<c:url value='/images/p3.png'/>);
			text-align:center;
		}
		th{
			text-align:center;
		}
		.mytable{
			width:600px;
			margin:0 auto;
		}
		.mytable td,.mytable th{
			border:1px solid black;
			height:30px;
			line-height:30px;
		}
	</style>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/jquery-1.12.4.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
<body background="<c:url value='/images/loginBackgrund.jpg'/>">
	<div class="container">
		<div id="otherMsg">
			<h2>其他成员信息</h2>
			<table class="mytable  text-center">
				<thead>
					<tr>
						<th>学号</th>
						<th>姓名</th>
						<th>班级</th>
						<th>职务</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pageInfo.list }" var="student">
					<tr>
						<td>${student.sno }</td>
						<td>${student.sname }</td>
						<td>${student.grade }</td>
						<td>${student.duty }</td>
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
							<li><a href="${pageContext.request.contextPath}/otherMsg?pn=1&sno=${sessionScope.student.sno}">首页</a></li>
						</c:when>
					</c:choose>
					
					<c:if test="${pageInfo.hasPreviousPage }">
						<li><a href="${pageContext.request.contextPath}/otherMsg?pn=${pageInfo.pageNum-1}&sno=${sessionScope.student.sno}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>


					<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
						<c:if test="${page_Num == pageInfo.pageNum }">
							<li class="active"><a href="#">${page_Num }</a></li>
						</c:if>
						<c:if test="${page_Num != pageInfo.pageNum }">
							<li><a href="${pageContext.request.contextPath}/otherMsg?pn=${page_Num }&sno=${sessionScope.student.sno}">${page_Num }</a></li>
						</c:if>

					</c:forEach>
					<c:if test="${pageInfo.hasNextPage }">
						<li><a href="${pageContext.request.contextPath}/otherMsg?pn=${pageInfo.pageNum+1 }&sno=${sessionScope.student.sno}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					
					<c:choose>
						<c:when test="${pageInfo.pageNum  eq  pageInfo.pages}">
								<li class="disabled"><a href="#">末页</a></li>
								<!-- <li><a href="#">末页</a></li> -->
						</c:when>
					<c:when test="${pageInfo.pageNum  ne  pageInfo.pages}">
							<li><a href="${pageContext.request.contextPath}/otherMsg?pn=${pageInfo.pages}&sno=${sessionScope.student.sno}">末页</a></li>
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