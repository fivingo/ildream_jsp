<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request 객체</title>
</head>
<body>
<h1>requestTest.jsp</h1>
<h3>사용자 IP: <%= request.getRemoteHost() %></h3>
<h3>사용자 접속 포트: <%= request.getRemotePort() %></h3>
<h3>접속방식: <%= request.getMethod() %></h3>
<h3>서버의 이름(ip): <%= request.getServerName() %></h3>
<h3>서버의 포트번호: <%= request.getServerPort() %></h3>
</body>
</html>