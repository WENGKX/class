<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
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
			margin-left:420px;
		}
		.myBtn1{
			margin-left:150px;
		}
		#personalMsg{
			width:1140px;
			height:600px;
			margin:0 auto;
			padding-top:10px;
			
			/* text-align:center; */
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
	<script type="text/javascript" src="<c:url value='/js/SignUp.js'/>"></script>
   
   <script type="text/javascript">
    	
       $(function(){
   		$(".duty").blur(function(){
			
			var val = $(this).val();
			val = $.trim(val);
			/* var duty = ${sessionScope.student.duty };
			alert(duty); */
			if(val !="${sessionScope.student.duty }"){
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
</head>
<body background="<c:url value='/images/teacher3.gif'/>">
	<div class="container">
		<div id="personalMsg">
			<h2>个人信息</h2>
			<form:form modelAttribute="stu" action="${pageContext.request.contextPath}/teacherEdit" method="post">
				<input type="hidden" name="_method" value="PUT"/>
				<input type="hidden" name="pn" value="${pn }"/>
				<div class="form-group">
						<div class="row">
						<label for="studentId" class="col-sm-2 text-right">学号</label>
						<div class="col-sm-5">
						<form:input path="sno" placeholder="长度为12为的数字" id="studentId" class="form-control" disabled="true" readonly="true"/>
						<form:hidden path="sno"/>
						</div>
						<div class="col-sm-4 alert alert-danger warningMsg" role="alert">
						    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						    <span class="sr-only">Error:</span>
						    <span class="warningText myerror"></span>
						</div>
						<div class="col-sm-1 myOk">
							<span class="glyphicon glyphicon-ok-sign"></span>
							<span class="message"></span>
						</div>
				</div>
					
				<div class="form-group">
					<div class="row">
						<label for="userName" class="col-sm-2 text-right">姓名</label>
						<div class="col-sm-5">
						<form:input path="sname" id="userName" placeholder="学生姓名" class="form-control"/>
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
							<form:input path="grade" id="studentClass" placeholder="示例：2015级信科4班" class="form-control"/>
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
							<form:select path="duty" class="selectpicker show-tick form-control duty" data-live-search="false">
									<form:option value="学生">学生</form:option>
									<form:option value="班长">班长</form:option>
									<form:option value="团支书">团支书</form:option>
									<form:option value="心理委员">心理委员</form:option>
									<form:option value="信息委员">信息委员</form:option>
									<form:option value="组织委员">组织委员</form:option>
									<form:option value="文娱委员">文娱委员</form:option>
									<form:option value="生活委员">生活委员</form:option>
									<form:option value="体育委员">体育委员</form:option>
									<form:option value="学习委员">学习委员</form:option>
									<form:option value="宣传委员">宣传委员</form:option>
							</form:select>
						</div>
						<div class="col-sm-4 alert alert-danger warningMsg" role="alert">
						    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						    <span class="sr-only">Error:</span>
						    <span class="warningText myerror2"></span>
						</div>
					</div>
				</div>
				<div class="form-group">
	                <div class="row">
	                    <div class="col-sm-6 col-sm-push-1">
	                    	
	                        <input type="submit" value="确认修改" class="btn btn-primary myBtn1"/>
	                        
	                    </div>
	                </div>
            	</div>
			
				
				</div>
			</form:form>
			
		</div>
	</div>
	
</body>
</html>