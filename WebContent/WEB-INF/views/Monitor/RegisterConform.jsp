<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>注册确认</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>">
	<script type="text/javascript" src="<c:url value='/bootstrap/js/jquery-1.12.4.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
	<style type="text/css">
		.myTable{
			width:850px;
			margin:50px auto;
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
			color:#ffff99;
		}
		.myTable a:hover{
			color:#ffcc99;
		}
		.welMonitor{
			position:absolute;
			left:15px;
			top:25px;
			font-size:18px;
			color:white;
		}
		.reBack{
			position:absolute;
			right:310px;
			top:45px;
			font-size:18px;
		}
		.reBack a:link,.reBack a:visited{
			color:white;
		}
		.reBack a:hover{
			color:white;
			text-decoration:none;
		}
	</style>
	  <script type="text/javascript">
    $(function() {
		$("#mybtnback").on("click",function() {
			location.assign("${pageContext.request.contextPath}/Monitor/monitormain");
		});
	});
    </script>
</head>
<body background="<c:url value='/images/bg3.png'/>" >

	<div class="welMonitor">欢迎你，${sessionScope.student.sname }班长</div>
	<div class="reBack"><button class="btn btn-success backBtn" id="mybtnback">返回</button></div>
	<div class="myTable">
		<span>学生注册信息表</span>
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
					<td><a href="${pageContext.request.contextPath}/confirm/${student.sno }">确认注册</a></td>
					<td><a href="${pageContext.request.contextPath}/logout/${student.sno }">注销</a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="container">
	<!-- 显示分页信息 -->
		<div class="row">
			<!--分页文字信息  -->
			<div class="col-md-6" style="color:white">当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
				页,总 ${pageInfo.total } 条记录</div>
			<!-- 分页条信息 -->
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				<ul class="pagination">
					<c:choose>
						<c:when test="${pageInfo.pageNum  eq 1}">
								<li class="disabled"><a href="#">首页</a></li>
						</c:when>
					<c:when test="${pageInfo.pageNum  ne  1}">
							<li><a href="${pageContext.request.contextPath}/preconfirm?pn=1">首页</a></li>
						</c:when>
					</c:choose>
					
					<c:if test="${pageInfo.hasPreviousPage }">
						<li><a href="${pageContext.request.contextPath}/preconfirm?pn=${pageInfo.pageNum-1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>


					<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
						<c:if test="${page_Num == pageInfo.pageNum }">
							<li class="active"><a href="#">${page_Num }</a></li>
						</c:if>
						<c:if test="${page_Num != pageInfo.pageNum }">
							<li><a href="${pageContext.request.contextPath}/preconfirm?pn=${page_Num }">${page_Num }</a></li>
						</c:if>

					</c:forEach>
					<c:if test="${pageInfo.hasNextPage }">
						<li><a href="${pageContext.request.contextPath}/preconfirm?pn=${pageInfo.pageNum+1 }"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					
					<c:choose>
						<c:when test="${pageInfo.pageNum  eq  pageInfo.pages}">
								<li class="disabled"><a href="#">末页</a></li>
						</c:when>
					<c:when test="${pageInfo.pageNum  ne  pageInfo.pages}">
							<li><a href="${pageContext.request.contextPath}/preconfirm?pn=${pageInfo.pages}">末页</a></li>
						</c:when>
					</c:choose>
				</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>