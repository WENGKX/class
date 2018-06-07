<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>老师办公管理</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>">
	<style type="text/css">
		#AdvanceQuery{
			width:600px;
			/*height:600px;*/
			margin:0 auto;
			padding-top:50px;
		}
	</style>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/jquery-1.12.4.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
	 <script type="text/javascript">
	    $(function() {
			$("#mybtnback").on("click",function() {
				location.assign("${pageContext.request.contextPath}/teacher/teacherMain");
			});
		});
    </script>
</head>
<body style="background:url(<c:url value='/images/teacher3.gif'/>)">
	<div class="container">
		<div id="AdvanceQuery">
			<form action="${pageContext.request.contextPath}/teacherAdvanceQuery" method="post">
				<div class="form-group">
					<div class="row">
						<label for="stuSno" class="col-sm-2 text-right">学号</label>
						<div class="col-sm-5">
							<input type="text" name="sno" id="stuSno" class="form-control">
							<input type="hidden" name="pn" value="1">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<label for="stuName" class="col-sm-2 text-right">姓名</label>
						<div class="col-sm-5">
							<input type="text" name="sname" id="stuName" class="form-control">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<label for="stuClass" class="col-sm-2 text-right">班级</label>
						<div class="col-sm-5">
							<input type="text" name="grade" id="stuClass" class="form-control">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<label for="stuDuty" class="col-sm-2 text-right">职务</label>
						<div class="col-sm-5">
							<select name="duty" id="stuDuty" class="selectpicker show-tick form-control" data-live-search="false">
								<option value="不选">不选</option>
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
					</div>
				</div>
				<div class="form-group">
	                <div class="row">
	                    <div class="col-sm-6 col-sm-push-1 text-right">
	                        <input type="submit" value="查询" class="btn btn-success queryBtn">
	                        <input type="button" value="返回" class="btn btn-info backBtn" id="mybtnback">
	                    </div>
	                </div>
            	</div>
			</form>
		</div>
	</div>
</body>
</html>