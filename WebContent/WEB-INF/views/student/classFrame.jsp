<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>15级信科</title>
</head>
<frameset rows="206,*" frameborder="no" border="0" framespacing="0">
	<frame src="<c:url value='/student/classTop'/>" name="topFrame" scrolling="No" noresize="noresize" id="topFrame"></frame>
	<frame src="<c:url value='/student/classMain'/>" name="mainFrame"  scrolling="No" noresize="noresize" id="mainFrame"></frame>
</frameset>
</html>