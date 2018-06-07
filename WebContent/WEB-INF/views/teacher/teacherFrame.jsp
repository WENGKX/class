<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>老师办公管理</title>
</head>
<frameset rows="168,*" frameborder="no" border="0" framespacing="0">
	<frame src="<c:url value='/teacher/teacherTop'/>" name="teacherTopFrame" scrolling="No" noresize="noresize" id="teacherTopFrame"></frame>
	<frame src="<c:url value='/teacher/teacherMain'/>" name="teacherMainFrame" scrolling="No" noresize="noresize" id="teacherMainFrame"></frame>
</frameset>
</html>