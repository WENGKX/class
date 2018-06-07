<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
      <title>班长登录</title>
      <link rel="stylesheet" type="text/css" href="<c:url value='/bootstrap/css/bootstrap.min.css'/>">
      <link rel="stylesheet" type="text/css" href="<c:url value='/css/index.css'/>">
      <script type="text/javascript" src="<c:url value='/bootstrap/js/jquery-1.12.4.min.js'/>"></script>
      <script type="text/javascript" src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
      <script type="text/javascript" src="<c:url value='/js/index.js'/>"></script>
</head>
<body background="<c:url value='/images/airplane.png'/>">
      <div class="myBorder" style="background:url(<c:url value='/images/bg1.png'/>)">
            <div class="login">
               <div class="row">
                  <div class="col-sm-1 myImage">
                        <img src="<c:url value='/images/monitorLogin.png'/>" width="600" alt="班长登录">
                  </div>
               </div>
               <form action="${pageContext.request.contextPath}/monitorLogin" method="post">
                  <div class="form-group">
                        <div class="row">
                              <label for="userName" class="col-sm-2 text-right">账号:</label>
                              <!--输入框不能直接用栅格系统-->
                              <div class="col-sm-5">
                                    <input type="text" name="sno" id="studentId" placeholder="长度为12位的学号" class="form-control" value="${requestScope.student.sno }">
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
                              <label for="pwd" class="col-sm-2 text-right">密码:</label>
                              <div class="col-sm-5">
                                    <input type="password" name="password" id="pwd" class="form-control" value="${requestScope.student.password }">
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
                              <div class="col-sm-4 col-sm-push-4">
                                    <input type="submit" value="登录" class="judge btn btn-info">
                              </div>
                              <div class="col-sm-5 col-sm-push-2">
                              		<span style="color:red">${requestScope.msg }</span>
                              </div>
                        </div>
                  </div>
               </form>
          </div>
      </div>
</body>
</html>
