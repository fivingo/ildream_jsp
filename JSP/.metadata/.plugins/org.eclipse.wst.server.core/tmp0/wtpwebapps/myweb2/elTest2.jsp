<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>elTest2</title>
</head>
<body>
<%
request.setAttribute("id", "Hong");
request.setAttribute("addr", "서울");
%>
<jsp:forward page="elTest3.jsp"/>
</body>
</html>