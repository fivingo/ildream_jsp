<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp:inclue sub</title>
</head>
<body>
<h1>sub.jsp</h1>
<%
String str2 = "jsp";
String str = request.getParameter("str");
%>
<h3 style="color: blue;">sub.jsp에서 출력한 문장 A</h3>
<h3 style="color: blue;">sub.jsp의 str의 값: <%= str2 %></h3>
<h3 style="color: pink;">super.jsp의 str의 값: <%= str %></h3>
<h3 style="color: pink;">super.jsp에게 넘긴 str 값: <%= str %></h3>
<h3 style="color: blue;">sub.jsp에서 출력한 문장 B</h3>
</body>
</html>