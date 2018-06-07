<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
	<title>照片墙</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>">
	<style type="text/css">
		#pictureWrap{
			background-image:url(<c:url value='/images/p3.png'/>);
			height:600px;
		}
		#pictureWrap .row{
			width:1140px;
			margin:0 auto;
		}
		.myborder{
			text-align:center;
		}
		img{
			height:250px;
			border:1px solid lightgray;
			border-radius:10px;
			padding:3px;
			background:white;
		}
	</style>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/jquery-1.12.4.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</head>
<body background="<c:url value='/images/loginBackgrund.jpg'/>">
	<div class="container">
		<div id="pictureWrap">
			<div class="row">
				<c:forEach items="${pageInfo.list}" var="photo">
				<div class="myborder col-sm-4">
					<a href="${pageContext.request.contextPath}/download?pno=${photo.pno }"><img src="${pageContext.request.contextPath}${photo.image }" alt="图片"></a>
					<h4 class="text-primary">${photo. pdescribe}</h4>
					<div class="text-success">${photo.pdate }</div>
				</div>
				</c:forEach>
			</div>
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
							<li><a href="${pageContext.request.contextPath}/lookImage?pn=1">首页</a></li>
						</c:when>
					</c:choose>
					
					<c:if test="${pageInfo.hasPreviousPage }">
						<li><a href="${pageContext.request.contextPath}/lookImage?pn=${pageInfo.pageNum-1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>


					<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
						<c:if test="${page_Num == pageInfo.pageNum }">
							<li class="active"><a href="#">${page_Num }</a></li>
						</c:if>
						<c:if test="${page_Num != pageInfo.pageNum }">
							<li><a href="${pageContext.request.contextPath}/lookImage?pn=${page_Num }">${page_Num }</a></li>
						</c:if>

					</c:forEach>
					<c:if test="${pageInfo.hasNextPage }">
						<li><a href="${pageContext.request.contextPath}/lookImage?pn=${pageInfo.pageNum+1 }"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					
					<c:choose>
						<c:when test="${pageInfo.pageNum  eq  pageInfo.pages}">
								<li class="disabled"><a href="#">末页</a></li>
								<!-- <li><a href="#">末页</a></li> -->
						</c:when>
					<c:when test="${pageInfo.pageNum  ne  pageInfo.pages}">
							<li><a href="${pageContext.request.contextPath}/lookImage?pn=${pageInfo.pages}">末页</a></li>
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