<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>管理留言</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>">
	<style type="text/css">
		.myTitle{
			text-align:center;
			width:100%;
			height:50px;
			font-size:30px;
			font-weight:bold;
		}
		div[class="row"]{
			position:relative;
			border-top:1px solid lightgray;
			border-bottom:1px solid lightgray;
			width:900px;
			margin:10px auto;
			padding-bottom:70px;
		}
		.mybtn{
			position:absolute;
			bottom:30px;
			right:20px;
		}
		.mybtn1{
			position:absolute;
			bottom:10px;
			right:0;
		}
		.leaveOne{
			font-size:24px;
			font-weight:bold;
			color:blue;
		}
		p{
			margin-left:50px;
			font-size:18px;
			line-height:150%;
		}
		.leaveDate{
			position:absolute;
			bottom:5px;
			right:20px;
			font-size:18px;
		}
		.bg{
			width:900px;
			margin:0 auto;
			background:#ccffff;
			padding-bottom:5px;
		}
		.back{
			position:absolute;
			right:250px;
			top:30px;
		}
		.back a:link,.back a:visited{
			font-size:20px;
		}
		.back a:hover{
			text-decoration:none;
		}
		.replyTextArea{
			position:relative;
			width:400px;
			margin:0 auto;
		}
		.myReply{
			width:400px;
			margin:5px auto;
		}
	</style>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/jquery-1.12.4.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
	<script type="text/javascript">
		$(function() {
			$(".bg").on("click",".monitorReply",function() {
				$(
				"<div class='replyTextArea'>" +
					"<form action='${pageContext.request.contextPath}/replyMessage' method='post'>" +
					 "<input type='hidden' name='mno' class='mno'>"+
						"<div class='form-group'>" +
							"<textarea name='cmessage' class='myReply' cols='100' rows='10' autofocus='autofocus' " + "placeholder='说点什么吧' class='form-control'></textarea>" +
			                "<div class='btn-group mybtn1' role='group'>" +
			                	"<input type='submit' value='发送' class='btn btn-sm btn-success mySend'>" +
			                    "<input type='button' value='取消' class='btn btn-sm btn-info myCancel'>" +
			                    "<input type='hidden' name='cdate' class='cdate'>"+
			                "</div>" +
						"</div>" +
					"</form>" +
				"</div>").insertBefore($(this).parent());
				 $(this).parent().siblings(".replyTextArea").children("form").children(".mno").val($(this).siblings(".myHidden").val());
			});
			$(".bg").on("click",".mySend", function() {
				if($(this).parent().parent().children(".myReply").val().trim() === "") {
					if($(this).parent().siblings(".alert").length != 0) {
						return false;
					}
					else {
						$(
							"<div class='alert alert-danger'>" +
							"<button type='button' class='close' data-dismiss='alert' aria-label='Close'>" +
				  			"<span aria-hidden='true'>&times;</span>" +
							"</button>" +
							"<strong>你还没有回复评论</strong>" +
							"</div>"
						).prependTo($(this).parent().parent());
						return false;
					}
				}
				$(this).siblings(".cdate").val(new Date().toLocaleString());
				 
			});
			$(".bg").on("click",".myCancel",function() {
				$(this).parent().parent().parent().parent().remove();
			});
			$(".bg").on("focus",".myReply",function() {
				$(this).siblings(".alert").alert("close");
			});
			
			
		});
		
	</script>
</head>
<body style="background:black">
	<div class="container">
		<div class="bg">
			<div class="myTitle">管理留言</div>
			<div class="back"><a href="${pageContext.request.contextPath}/Monitor/monitormain">返回</a></div>

			<c:forEach items="${requestScope.messages }" var="message">
			
			<div class="row">
			
				<span class="leaveOne">${message.student.sname }的留言：</span>
				
				<p>${message.mmessage }</p>
				
				<span class="leaveOne">管理员回复${message.student.sname }：</span>
				<c:forEach items="${requestScope.comments }" var="comment">
				<c:forEach items="${requestScope.mcs }" var="mc">
				<c:if test="${comment.cno eq mc.comment.cno &&  message.mno eq mc.message.mno}">
				<p>${comment.cmessage }</p>
				</c:if>
				 </c:forEach>
				</c:forEach>
				<div class="btn-group mybtn" role="group">
					<input type="hidden" name="mno" value="${message.mno}" class="myHidden">
					<input type="button" value="回复留言" class="btn btn-sm btn-success monitorReply">
		  			
		            <button  class="btn btn-sm btn-info"><a href="${pageContext.request.contextPath}/delMesByBz?mno=${message.mno}">删除留言</a></button>
		        </div>
		  
				<span class="leaveDate">${message.mdate }</span>
				     
			</div>
				
			</c:forEach>

			
			
			
		</div>
	</div>
</body>
</html>