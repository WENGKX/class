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
		.container{
			width:1140px;
			overflow:hidden;
			height:500px;
			padding:0;
		}
		#lookMyMsg{
			width:1160px;
			height:100%;
			background:url(<c:url value='/images/p3.png'/>);
			overflow-y:auto;
			overflow-x:hidden;
		}
		#lookMyMsg .row{
			width:1140px;
			margin:0;
			border-top:1px solid darkgray;
			border-bottom:1px solid darkgray;
			position:relative;
			padding-bottom:50px;
		}
		#lookMyMsg .row .MsgOne{
			margin-left:0;
			padding-left:0;
			font-size:20px;
			color:blue;
		}
		#lookMyMsg .row p{
			margin-left:50px;
			font-size:20px;
			font-family:"楷书";
		}
		#lookMyMsg .row span{
			position:absolute;
			bottom:5px;
			right:15px;
			font-size:18px;
		}
		.delMyMsg{
			position:absolute;
			top:0;
			right:0;
		}
	</style>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/jquery-1.12.4.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
	
</head>
<body background="<c:url value='/images/loginBackgrund.jpg'/>">
	<div class="container">
		<div id="lookMyMsg">

			<c:forEach items="${requestScope.messages }" var="message">
			<div class="row">
				<div class="MsgOne">我的留言:</div>
				<p class="mydiscuss">
					${message.mmessage }
				</p>
				
				<c:forEach items="${requestScope.comments }" var="comment">
				<c:forEach items="${requestScope.mcs }" var="mc">
				<c:if test="${comment.cno eq mc.comment.cno &&  message.mno eq mc.message.mno}">
				<div class="MsgOne">
				<c:if test="${comment.student.duty eq '班长'}">管理员回复${message.student.sname }:</c:if>
				<c:if test="${comment.student.duty != '班长'}">${comment.student.sname }回复 ${message.student.sname }</c:if>
				</div>
				<p class="mydiscuss">
					${comment.cmessage }
				</p>
				</c:if>
				 </c:forEach>
				</c:forEach>
				
				<span class="myDate">${message.mdate }</span>
				<!-- <input type="button" value="删除" class="btn btn-xs btn-default delMyMsg"> -->
				<button  class="btn btn-sm btn-success delMyMsg"><a href="${pageContext.request.contextPath}/delMesBySelf?mno=${message.mno }">删除留言</a></button>
			</div>
		</c:forEach>



			
		</div>
	</div>

</body>
</html>