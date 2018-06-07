<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>上传照片</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>">
	<style type="text/css">
		form{
			width:600px;
			margin:10px auto;
		}
		label{
			height:35px;
			line-height:35px;
		}
		.bground{
			width:600px;
			margin:150px auto;
			background:#FFFF99;
			padding-top:10px;
			padding-bottom:50px
		}
		.bground>div{
			text-align:center;
			font-size:20px;
			font-weight:bold;
		}
		body{
			background:#CCFF99;
		}
		a:link,a:hover,a:visited{
			color:white;
			text-decoration:none;
		}
	</style>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/jquery-1.12.4.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
	   <script type="text/javascript">
    $(function() {
		$("#mybtnback").on("click",function() {
			location.assign("${pageContext.request.contextPath}/Monitor/monitormain");
		});
		/*alert(new Date().toLocaleString());  */
		$("#sub").on("click",function() {
			$("#pdate").val(new Date().toLocaleString());
		});
		
	});
    </script>
</head>
<body>
	<div class="container">
		<div class="bground">
			<div>上传照片</div>
			<form action="${pageContext.request.contextPath}/upload" method="post" enctype="multipart/form-data">
				<input type="hidden" name="pdate" value="" id="pdate">
				<div class="form-group">
					<div class="row">
						<label class="col-sm-2 text-right" for="describe">描述</label>
						<div class="col-sm-8">
							<input type="text" name="pdescribe" id="describe" class="form-control" placeholder="对照片的描述...">
						</div>
					</div>
				</div>
				<div class="form-group">
				    <div class="row">
				    	<label class="col-sm-2 text-right" for="picture">上传照片</label>
					    <div class="col-sm-5 myinput">
					    	<input type="file" name="file" id="picture">
					    	<p class="help-block">支持jpg、jpeg、png、gif 格式</p>
					    </div>
					    <div class="col-sm-5" style="color:red">${requestScope.msg }</div>
					    
				    </div>
				</div>
				<div class="form-group">
					<div class="col-sm-4 col-sm-push-6">
						<input type="submit" value="上传" class="btn btn-md btn-success" id="sub">
						<input type="button" value="返回" class="btn btn-info" id="mybtnback">
					</div>
				</div>
			</form>
			
		</div>
	</div>
</body>
</html>