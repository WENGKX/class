<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
	<title>注册</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/SignUp.css'/>">
    <script type="text/javascript" src="<c:url value='/bootstrap/js/jquery-1.12.4.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/SignUp.js'/>"></script>
    
    <script type="text/javascript">
    	
    $(function(){
		$(":input[name='sno']").blur(function(){
			var val = $(this).val();
			val = $.trim(val);
			
			if(val != ""){
				var url = "${pageContext.request.contextPath}/valiateSno";
				var args = {"sno":val, "time": new Date()};
				
				$.post(url, args, function(data){
					var sum="";
					for(var i = 0; i < data.length; i++) {
						sum+=data[i];
					}
					
					if(sum.trim() == "该学号已经被使用") {
						$(".message").parent().css("display","none");
						$(".myerror").parent().css("display","block");
						$(".myerror").text("该学号已经被使用");
					}
					else{
						//$(".myerror").parent().css("display","none");
						/* $(".message").parent().css("display","block");
						$(".message").text("该学号可以使用"); */
					}
				})
			}
		})
	})
   </script>
   
       <script type="text/javascript">
    	
       $(function(){
   		$("#duty").blur(function(){
			
			var val = $(this).val();
			val = $.trim(val);
			
			if(val != ""){
				var url = "${pageContext.request.contextPath}/valiateDuty";
				var args = {"duty":val, "time": new Date()};
				
				$.post(url, args, function(data){
					var valid = "";
					for(var i = 0; i < data.length; i++) {
						valid+=data[i];
					}
					
					if(valid.trim() == "该职务已经被使用") {
						
						$(".myerror2").parent().css("display","block"); 
						$(".myerror2").text("该职务已经被使用");
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
	
		function _change() {
			var img = document.getElementById("vCode");
			img.src = "<c:url value='/VerifyCode?name=registCode'/>" + new Date().getTime();
		}
	 </script>
    
 
    
</head>
<body background="<c:url value='/images/loginBackgrund.jpg'/>">
	<div class="spanFont">注册账户</div>
	<div class="divWrap">
		<div class="signUp">
			<form action="${pageContext.request.contextPath}/register" method="post">
				<div class="form-group">
					<div class="row">
						<label for="studentId" class="col-sm-2 text-right">学号</label>
						<div class="col-sm-5">
							<input type="text" name="sno" id="studentId" placeholder="长度为12为的数字" class="form-control" value="${requestScope.student.sno }" >
						</div>
						<div class="col-sm-4 alert alert-danger warningMsg" role="alert">
						    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						    <span class="sr-only">Error:</span>
						    <span class="warningText myerror"></span>
						    
						</div>
						<div class="col-sm-4 myOk">
							<span class="glyphicon glyphicon-ok-sign"></span>
							<span class="message"></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<label for="userName" class="col-sm-2 text-right">姓名</label>
						<div class="col-sm-5">
							<input type="text" name="sname" id="userName" placeholder="学生姓名" class="form-control" value="${requestScope.student.sname }">
						</div>
						<div class="col-sm-4 alert alert-danger warningMsg" role="alert">
						    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						    <span class="sr-only">Error:</span>
						    <span class="warningText"></span>
						</div>
						<div class="col-sm-1 myOk">
							<span class="glyphicon glyphicon-ok-sign"></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<label for="studentClass" class="col-sm-2 text-right">班级</label>
						<div class="col-sm-5">
							<input type="text" name="grade" id="studentClass" placeholder="示例：2015级信科4班" class="form-control" value="${requestScope.student.grade }">
						</div>
						<div class="col-sm-4 alert alert-danger warningMsg" role="alert">
						    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						    <span class="sr-only">Error:</span>
						    <span class="warningText"></span>
						</div>
						<div class="col-sm-1 myOk">
							<span class="glyphicon glyphicon-ok-sign"></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<label for="duty" class="col-sm-2 text-right">职务</label>
						<div class="col-sm-5">
							<select name="duty" id="duty" class="selectpicker show-tick form-control" data-live-search="false">
									<option value="学生">学生</option>
									<option value="班长">班长</option>
									<option value="团支书">团支书</option>
									<option value="心理委员">心理委员</option>
									<option value="信息委员">信息委员</option>
									<option value="组织委员">组织委员</option>
									<option value="文娱委员">文娱委员</option>
									<option value="生活委员">生活委员</option>
									<option value="体育委员">体育委员</option>
									<option value="学习委员">学习委员</option>
									<option value="宣传委员">宣传委员</option>
							</select>
						</div>
						<div class="col-sm-4 alert alert-danger warningMsg" role="alert">
						    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						    <span class="sr-only">Error:</span>
						    <span class="warningText myerror2"></span>
						</div>
						<span id="c2"></span>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<label for="pwd1" class="col-sm-2 text-right">密码</label>
						<div class="col-sm-5">
							<input type="password" name="password" id="pwd1" placeholder="6-16位数字、字母、下划线" class="form-control" value="${requestScope.student.password }">
						</div>
						<div class="col-sm-4 alert alert-danger warningMsg" role="alert">
						    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						    <span class="sr-only">Error:</span>
						    <span class="warningText"></span>
						</div>
						<div class="col-sm-1 myOk">
							<span class="glyphicon glyphicon-ok-sign"></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<label for="pwd2" class="col-sm-2 text-right">确认密码</label>
						<div class="col-sm-5">
							<input type="password" name="socde1" id="pwd2" class="form-control" value="${requestScope.student.password }">
						</div>
						<div class="col-sm-4 alert alert-danger warningMsg" role="alert">
						    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						    <span class="sr-only">Error:</span>
						    <span class="warningText"></span>
						</div>
						<div class="col-sm-1 myOk">
							<span class="glyphicon glyphicon-ok-sign"></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<label for="loginCode" class="col-sm-2 text-right">验证码</label>
						<div class="col-sm-3">
							<input type="text" name="registCode" id="loginCode" class="form-control">
						</div>
						<div class="col-sm-2">
							<img id="vCode" src="<c:url value='/VerifyCode?name=registCode'/>" alt="验证码">
						</div>
						<div class="col-sm-3">
							<a href="javascript:_change()">看不清，换一张</a>
						</div>
						<div class="col-sm-4 alert alert-danger warningMsg" role="alert">
						    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						    <span class="sr-only">Error:</span>
						    <span class="warningText"></span>
						   
						</div>
						 <span style="color:red">${requestScope.msg}</span>
					</div>
				</div>
				
				<div class="form-group">
	                  <div class="row">
	                        <div class="col-sm-6 col-sm-push-5">
	                              <input type="submit" value="立即注册" class="btn btn-warning myBtn1">
	                        </div>
	                  </div>
	            </div>
			</form>
		</div>
		<div class="fastLogin">
			<span>
				已有账号，
				<a href="<c:url value='/index.jsp'/>">
					直接登录
					<span class="glyphicon glyphicon-hand-right"></span>
				</a>
			</span>
		</div>
	</div>
</body>
</html>