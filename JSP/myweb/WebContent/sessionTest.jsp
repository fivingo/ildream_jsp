<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionTest</title>
</head>
<body>
<h1>sessionTest.jsp</h1>
<%
//세션 가져오기: session.setAttribute(String id);
String name = (String) session.getAttribute("name");
int age = (int) session.getAttribute("age");
%>
<h3>이름: <%= name %></h3>
<h3>나이: <%= age %></h3>
<%
// 세션 저장하기: session.setAttribute(String id, Object value);
session.setAttribute("name", "홍길동");
session.setAttribute("age", 25);
%>
</body>
</html>