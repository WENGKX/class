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
		h2{
			margin-top:0;
			margin-bottom:30px;
		}
		#personalMsg{
			width:1140px;
			height:600px;
			margin:0 auto;
			padding-top:10px;
			background:url(<c:url value='/images/p3.png'/>);
			text-align:center;
		}
		form{
			width:600px;
			margin:0 auto;
		}
		.btn a:link,.btn a:visited{
			color:white;
			font-size:14px;
		}
		.btn a:hover{
			color:white;
			text-decoration:none;
		}
	</style>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/jquery-1.12.4.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
	<script type="text/javascript">
		$(function() {
			$("#pwd").blur(function() {
				if($("#pwd").val().trim() != "") {
					$(".warningMsg").eq(0).css("display","none");
				}
			});
			$("#newPwd").blur(function() {
				if($("#newPwd").val().trim() != "") {
					$(".warningMsg").eq(1).css("display","none");
				}
			});
			$("#confirmNewPwd").blur(function() {
				if(($("#confirmNewPwd").val().trim() != "") && ($("#newPwd").val().trim() == $("#confirmNewPwd").val().trim())) {
					$(".warningMsg").eq(2).css("display","none");
				}
			});
			$(".myBtn1").on("click",function(){
				if($(".myerror2").parent().css("display") == "block") {
					return false;
				}
				if($("#pwd").val().trim() === "") {
					$(".warningMsg").eq(0).css("display","block");
					$(".warningText").eq(0).text("你还没有输入原密码");
					$("#pwd").focus();
					return false;
				}
				else if($("#newPwd").val().trim() === "") {
					$(".warningMsg").eq(1).css("display","block");
					$(".warningText").eq(1).text("请输入新密码");
					$("#newPwd").focus();
					return false;
				}
				else if($("#confirmNewPwd").val().trim() === "") {
					$(".warningMsg").eq(2).css("display","block");
					$(".warningText").eq(2).text("请确认新密码");
					$("#confirmNewPwd").focus();
					return false;
				}
				else if($("#newPwd").val().trim() != $("#confirmNewPwd").val().trim()) {
					$(".warningMsg").eq(2).css("display","block");
					$(".warningText").eq(2).text("密码不一致");
					$("#confirmNewPwd").focus();
					return false;
				}
			});
		});
	</script>
	<script type="text/javascript">
    	
       $(function(){
   		$("#pwd").blur(function(){
   			
			var val = $(this).val();
			val = $.trim(val);
			/* var duty = ${sessionScope.student.duty };
			alert(duty); */
			if(val !=""){
				var url = "${pageContext.request.contextPath}/validPassword";
				var args = {"password":val, "time": new Date()};
				
				$.post(url, args, function(data){
					var valid = "";
					for(var i = 0; i < data.length; i++) {
						valid+=data[i];
					}
					
					if(valid.trim() == "密码输入错误，请重新输入") {
						
						$(".myerror2").parent().css("display","block"); 
						$(".myerror2").text("密码输入错误，请重新输入");
					}
					else{
						$(".myerror2").parent().css("display","none"); 
						
					}
				})
			}
		})
	})
 </script>
   <script type="text/javascript">
    $(function() {
		$("#mybtnback").on("click",function() {
			location.assign("${pageContext.request.contextPath}/student/classMain");
		});
	});
    </script>
 
</head>
<body background="<c:url value='/images/loginBackgrund.jpg'/>">
	<div class="container">
		<div id="personalMsg">
			<h2>修改密码</h2>
			<form action="${pageContext.request.contextPath}/changePassword" method="post" target="_parent">
				<input type="hidden" name="_method" value="PUT"/>
				<div class="form-group">
					<div class="row">
						<label for="pwd" class="col-sm-3 text-right">请输入原密码</label>
						<div class="col-sm-5">
							<input type="password" name="password" id="pwd" class="form-control" >
						</div>
						<div class="col-sm-4 alert alert-danger warningMsg text-left" role="alert">
						    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						    <span class="sr-only">Error:</span>
						    <span class="warningText myerror2"></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<label for="newPwd" class="col-sm-3 text-right">新密码</label>
						<div class="col-sm-5">
							<input type="password" name="newPwd" id="newPwd" class="form-control">
						</div>
						<div class="col-sm-4 alert alert-danger warningMsg text-left" role="alert">
						    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						    <span class="sr-only">Error:</span>
						    <span class="warningText"></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<label for="confirmNewPwd" class="col-sm-3 text-right">确认密码</label>
						<div class="col-sm-5">
							<input type="password" name="confirmNewPwd" id="confirmNewPwd" class="form-control">
						</div>
						<div class="col-sm-4 alert alert-danger warningMsg text-left" role="alert">
						    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						    <span class="sr-only">Error:</span>
						    <span class="warningText"></span>
						</div>
					</div>
				</div>
				<div class="form-group">
	                <div class="row">
	                    <div class="col-sm-6 col-sm-push-2 text-right">
	                        <input type="submit" value="确认修改" class="btn btn-success myBtn1">
	                         <input type="button" value="返回" class="btn btn-info backBtn" id="mybtnback">
	                    </div>
	                </div>
            	</div>
			</form>
		</div>
	</div>
</body>
</html>