<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
	<title>写留言</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>">
	<style type="text/css">
		#writeMsg{
			background:url(<c:url value='/images/p3.png'/>);
			height:600px;
		}
		form{
			width:600px;
			margin:0px auto;
			padding-top:50px;
		}
		.alert{
			width:500px;
		}
	</style>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/jquery-1.12.4.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
	<script type="text/javascript">
		$(function() {
			$(".mySend").on("click", function() {
				if($("#myMsg").val().trim() === "") {
					if($(".alert").length != 0) {
						return false;
					}
					else {
						$("<div class='alert alert-danger'>" +
								"<button type='button' class='close' data-dismiss='alert' aria-label='Close'>" +
					  			"<span aria-hidden='true'>&times;</span>" +
								"</button>" +
								"<strong>你还没有输入任何内容</strong>" +
								"</div>").appendTo($("form"));
						return false;
					}
				}
			});
			$("#myMsg").focus(function() {
				if($(".alert")) {
					$(".alert").alert("close");
				}
			});
		});
	</script>
	  <script type="text/javascript">
    $(function() {
		$("#mybtnback").on("click",function() {
			location.assign("${pageContext.request.contextPath}/student/classMain");
		});
		
		$("#sub").on("click",function() {
			$("#mdate").val(new Date().toLocaleString());
		});
	});
    
    </script>
</head>
<body background="<c:url value='/images/loginBackgrund.jpg'/>">
	<div class="container">
		<div id="writeMsg">
			<form action="${pageContext.request.contextPath}/writerMessage" method="post">
				<div class="form-group">
					<label for="myMsg" class="col-sm-2 text-right col-sm-push-4">写留言</label>
					<div class="row">
						<div class="col-sm-10">
							<textarea name="mmessage" id="myMsg" cols="100" rows="10" autofocus="autofocus" placeholder="说点什么吧" class="form-control"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-sm-push-4 text-right">
							<input type="hidden" name="mdate" value="" id="mdate">
		                    <input type="submit" value="发布" class="btn btn-success mySend" id="sub">
		                    <input type="button" value="取消" class="btn btn-info" id="mybtnback">
		                </div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>