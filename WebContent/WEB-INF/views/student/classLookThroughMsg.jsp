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
		#lookThroughMsg{
			width:1160px;
			height:100%;
			background:url(<c:url value='/images/p3.png'/>);
			overflow-y:auto;
			overflow-x:hidden;
		}
		#lookThroughMsg .row{
			width:1140px;
			margin:0;
			border-top:1px solid darkgray;
			border-bottom:1px solid darkgray;
			position:relative;
			padding-bottom:50px;
		}
		#lookThroughMsg .row .MsgOne{
			margin-left:0;
			padding-left:0;
			font-size:20px;
			color:blue;
		}
		#lookThroughMsg .row p{
			margin-left:50px;
			font-size:20px;
			font-family:"楷书";
		}
		#lookThroughMsg .row span{
			position:absolute;
			bottom:5px;
			right:15px;
			font-size:18px;
		}
	</style>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/jquery-1.12.4.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
	<script type="text/javascript">
		$(function() {
			$(".mySend").on("click", function() {
				if($("#mycontent").val().trim() === "") {
					if($(".alert").length != 0) {
						return false;
					}
					else {
						$(
							"<div class='alert alert-danger'>" +
							"<button type='button' class='close' data-dismiss='alert' aria-label='Close'>" +
				  			"<span aria-hidden='true'>&times;</span>" +
							"</button>" +
							"<strong>你还没有写内容</strong>" +
							"</div>"
						).appendTo($("form"));
						return false;
					}
				}
			});
			$("#mycontent").focus(function() {
				if($(".alert")) {
					$(".alert").alert("close");
				}
			});
			$("#lookThroughMsg").on("click",".mydiscuss",function() {
				$("#myModal").modal("show");
				$(".mymessagemno").val($(this).siblings(".mymno").val())
				$(".mycdate").val(new Date().toLocaleString())
			});
			$("#myModal").on("shown.bs.modal",function(){
				$("#mycontent").focus();
			});
			$("#myModal").on("hide.bs.modal",function(){
				if($("#mycontent").val().trim() != "") {
					$("#mycontent").val("");
				}
				if($(".alert")) {
					$(".alert").alert("close");
				}
			});
			
		});
	</script>
</head>
<body background="<c:url value='/images/loginBackgrund.jpg'/>">
	<div class="container">
		<div id="lookThroughMsg">
			<c:forEach items="${requestScope.messages }" var="message">
			<div class="row">
				<div class="MsgOne">留言者${message.student.sname }:</div>
				<input type="hidden" name="hidden" value="${message.mno}" class="mymno">
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
				<p>
					${comment.cmessage }
				</p>
				</c:if>
				 </c:forEach>
				</c:forEach>
				<span class="myDate">${message.mdate }</span>
			</div>
			</c:forEach>

		</div>
	</div>

	<!-- Modal -->
<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
	        <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	            <h4 class="modal-title" id="myModalLabel">评论</h4>
	        </div>

	        <div class="modal-body">
	            <form action="${pageContext.request.contextPath}/communicate" method="post">
	            	<input type="hidden" name="mno" value="" class="mymessagemno">
	            	<input type="hidden" name="cdate" class="mycdate">
					<div class="form-group">
						<div class="row">
							<div class="col-sm-10">
								<textarea name="cmessage" id="mycontent" cols="100" rows="10" autofocus="autofocus" placeholder="说点什么吧" class="form-control"></textarea>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6 col-sm-push-4 text-right">
			                    <input type="submit" value="发送" class="btn btn-success mySend">
			                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			                </div>
						</div>
					</div>
				</form>
	        </div>
        </div>
  	</div>
</div>


</body>
</html>