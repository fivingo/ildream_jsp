<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>paramTest3</title>
</head>
<body>
<h1>paramTest3.jsp</h1>
<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String id = request.getParameter("id");
	String addr = request.getParameter("addr");
%>
<h3>이름: <%= name %></h3>
<h3>나이: <%= age %></h3>
<h3>아이디: <%= id %></h3>
<h3>주소: <%= addr %></h3>
</body>
</html>