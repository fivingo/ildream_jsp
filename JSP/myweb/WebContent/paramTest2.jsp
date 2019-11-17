<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>paramTest2</title>
</head>
<body>
<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
<h1>paramTest2.jsp</h1>
<form name="param2" action="paramTest3.jsp">
<input type="hidden" name="name" value="<%= name %>">
<input type="hidden" name="age" value="<%= age %>">
아이디: <input type="text" name="id"><br>
주소: <input type="text" name="addr"><br>
<input type="submit" value="넘기기">
</form>
</body>
</html>